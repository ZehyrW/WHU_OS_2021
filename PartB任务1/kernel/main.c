
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
main.c
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#include "type.h"
#include "stdio.h"
#include "const.h"
#include "protect.h"
#include "string.h"
#include "fs.h"
#include "proc.h"
#include "tty.h"
#include "console.h"
#include "global.h"
#include "proto.h"

#define	MAX_USER	10
#define	MAX_USER_FILE	100
#define MAX_USER_DIR	5
#define	MAX_PSWD_LEN	12

#define	MAX_FILES	80
#define	MAX_DIRS	50
#define MAX_TASKS	2


char location[MAX_FILENAME_LEN] = "root";
char files[MAX_FILES][MAX_FILENAME_LEN];
int  filequeue[MAX_FILES];
int  filecount = 0;
char dirs[MAX_DIRS][MAX_FILENAME_LEN];
int  dirqueue[MAX_FILES];
int  dircount = 0;

void shabby_shell(const char * tty_name);

int isDir(const char * filepath);

void getFilepath(char *filepath, char * filename);
void getDirFilepath(char *filepath, char * filename);
void getDirpathAndFilename(char * dirpath, char * filename, char * filepath);

int getFreeFilePos();
int getFreeDirPos();
int getPosInDirQueue(char * filepath);


void addFileIntoDir(const char * dirpath, char * filename);
void deleteFileFromDir(const char * dirpath, char * filename);

void initFS();
void welcome();
void clear();
void showProcess();
void killProcess();
void makeProcess();
void help();
void colorful();
void createFile(char * filepath, char *filename, char * buf);
void createDir(char * filepath, char *filename);
void readFile(char * filename);
void editAppand(const char * filepath, char * str);
void editCover(const char * filepath, char * str);
void deleteFile(char * filepath);
void deleteDir(char * filepath);
void cd(char * dirname);
void cdback();



/*****************************************************************************
*                               kernel_main
*****************************************************************************/
/**
* jmp from kernel.asm::_start.
*
*****************************************************************************/
PUBLIC int kernel_main()

{

	disp_str("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
		"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");


	int i, j, eflags, prio;
	u8  rpl;
	u8  priv; /* privilege */

	struct task * t;
	struct proc * p = proc_table;

	char * stk = task_stack + STACK_SIZE_TOTAL;

	for (i = 0; i < NR_TASKS + NR_PROCS; i++, p++, t++) {
		if (i >= NR_TASKS + NR_NATIVE_PROCS) {
			p->p_flags = FREE_SLOT;
			continue;
		}

		if (i < NR_TASKS) {     /* TASK */
			t = task_table + i;
			priv = PRIVILEGE_TASK;
			rpl = RPL_TASK;
			eflags = 0x1202;/* IF=1, IOPL=1, bit 2 is always 1 */
			prio = 15;
		}
		else {                  /* USER PROC */
			t = user_proc_table + (i - NR_TASKS);
			priv = PRIVILEGE_USER;
			rpl = RPL_USER;
			eflags = 0x202;	/* IF=1, bit 2 is always 1 */
			prio = 5;
		}

		strcpy(p->name, t->name);	/* name of the process */
		p->p_parent = NO_TASK;

		if (strcmp(t->name, "INIT") != 0) {
			p->ldts[INDEX_LDT_C] = gdt[SELECTOR_KERNEL_CS >> 3];
			p->ldts[INDEX_LDT_RW] = gdt[SELECTOR_KERNEL_DS >> 3];

			/* change the DPLs */
			p->ldts[INDEX_LDT_C].attr1 = DA_C | priv << 5;
			p->ldts[INDEX_LDT_RW].attr1 = DA_DRW | priv << 5;
		}
		else {		/* INIT process */
			unsigned int k_base;
			unsigned int k_limit;
			int ret = get_kernel_map(&k_base, &k_limit);
			assert(ret == 0);
			init_desc(&p->ldts[INDEX_LDT_C],
				0, /* bytes before the entry point
				   * are useless (wasted) for the
				   * INIT process, doesn't matter
				   */
				(k_base + k_limit) >> LIMIT_4K_SHIFT,
				DA_32 | DA_LIMIT_4K | DA_C | priv << 5);

			init_desc(&p->ldts[INDEX_LDT_RW],
				0, /* bytes before the entry point
				   * are useless (wasted) for the
				   * INIT process, doesn't matter
				   */
				(k_base + k_limit) >> LIMIT_4K_SHIFT,
				DA_32 | DA_LIMIT_4K | DA_DRW | priv << 5);
		}

		p->regs.cs = INDEX_LDT_C << 3 | SA_TIL | rpl;
		p->regs.ds =
			p->regs.es =
			p->regs.fs =
			p->regs.ss = INDEX_LDT_RW << 3 | SA_TIL | rpl;
		p->regs.gs = (SELECTOR_KERNEL_GS & SA_RPL_MASK) | rpl;
		p->regs.eip = (u32)t->initial_eip;
		p->regs.esp = (u32)stk;
		p->regs.eflags = eflags;

		p->ticks = p->priority = prio;
		p->p_flags = 0;
		p->p_msg = 0;
		p->p_recvfrom = NO_TASK;
		p->p_sendto = NO_TASK;
		p->has_int_msg = 0;
		p->q_sending = 0;
		p->next_sending = 0;

		for (j = 0; j < NR_FILES; j++)
			p->filp[j] = 0;

		stk -= t->stacksize;
	}

	k_reenter = 0;
	ticks = 0;

	p_proc_ready = proc_table;

	init_clock();
	init_keyboard();

	restart();

	while (1) {}
}


/*****************************************************************************
*                                get_ticks
*****************************************************************************/
PUBLIC int get_ticks()
{
	MESSAGE msg;
	reset_msg(&msg);
	msg.type = GET_TICKS;
	send_recv(BOTH, TASK_SYS, &msg);
	return msg.RETVAL;
}


/**
* @struct posix_tar_header
* Borrowed from GNU `tar'
*/
struct posix_tar_header
{				/* byte offset */
	char name[100];		/*   0 */
	char mode[8];		/* 100 */
	char uid[8];		/* 108 */
	char gid[8];		/* 116 */
	char size[12];		/* 124 */
	char mtime[12];		/* 136 */
	char chksum[8];		/* 148 */
	char typeflag;		/* 156 */
	char linkname[100];	/* 157 */
	char magic[6];		/* 257 */
	char version[2];	/* 263 */
	char uname[32];		/* 265 */
	char gname[32];		/* 297 */
	char devmajor[8];	/* 329 */
	char devminor[8];	/* 337 */
	char prefix[155];	/* 345 */
						/* 500 */
};

/*****************************************************************************
*                                untar
*****************************************************************************/
/**
* Extract the tar file and store them.
*
* @param filename The tar file.
*****************************************************************************/
void untar(const char * filename)
{
	printf("[extract `%s'\n", filename);
	int fd = open(filename, O_RDWR);
	assert(fd != -1);

	char buf[SECTOR_SIZE * 16];
	int chunk = sizeof(buf);

	while (1) {
		read(fd, buf, SECTOR_SIZE);
		if (buf[0] == 0)
			break;

		struct posix_tar_header * phdr = (struct posix_tar_header *)buf;

		/* calculate the file size */
		char * p = phdr->size;
		int f_len = 0;
		while (*p)
			f_len = (f_len * 8) + (*p++ - '0'); /* octal */

		int bytes_left = f_len;
		int fdout = open(phdr->name, O_CREAT | O_RDWR);
		if (fdout == -1) {
			printf("    failed to extract file: %s\n", phdr->name);
			printf(" aborted]\n");
			return;
		}
		printf("    %s (%d bytes)\n", phdr->name, f_len);
		while (bytes_left) {
			int iobytes = min(chunk, bytes_left);
			read(fd, buf,
				((iobytes - 1) / SECTOR_SIZE + 1) * SECTOR_SIZE);
			write(fdout, buf, iobytes);
			bytes_left -= iobytes;
		}
		close(fdout);
	}

	close(fd);

	printf(" done]\n");
}


/*****************************************************************************
*                                Init
*****************************************************************************/
/**
* The hen.
*
*****************************************************************************/
void Init()
{
	int fd_stdin = open("/dev_tty0", O_RDWR);
	assert(fd_stdin == 0);
	int fd_stdout = open("/dev_tty0", O_RDWR);
	assert(fd_stdout == 1);

	//printf("Init() is running ...\n");

	/* extract `cmd.tar' */
	untar("/cmd.tar");


	char * tty_list[] = { "/dev_tty0", "/dev_tty1", "/dev_tty2" };
	//char * tty_list[] = { "/dev_tty0" };

	int i;
	for (i = 0; i < sizeof(tty_list) / sizeof(tty_list[0]); i++) {
		int pid = fork();
		if (pid != 0) { /* parent process */
		}
		else {	/* child process */
			close(fd_stdin);
			close(fd_stdout);

			shabby_shell(tty_list[i]);
			assert(0);
		}
	}

	while (1) {
		int s;
		int child = wait(&s);
		printf("child (%d) exited with status: %d.\n", child, s);
	}

	assert(0);
}


/*======================================================================*
TestA
*======================================================================*/
void TestA()
{
	for (;;);
}

/*======================================================================*
TestB
*======================================================================*/
void TestB()
{
	for (;;);
}

/*======================================================================*
TestB
*======================================================================*/
void TestC()
{
	for (;;);
}

/*****************************************************************************
*                                panic
*****************************************************************************/
PUBLIC void panic(const char *fmt, ...)
{
	char buf[256];

	/* 4 is the size of fmt in the stack */
	va_list arg = (va_list)((char*)&fmt + 4);

	vsprintf(buf, fmt, arg);

	printl("%c !!panic!! %s", MAG_CH_PANIC, buf);

	/* should never arrive here */
	__asm__ __volatile__("ud2");
}

/*****************************************************************************
*                                shabby_shell
*****************************************************************************/
/**
* A very powerful shell.
*
* @param tty_name  TTY file name.
*****************************************************************************/
void shabby_shell(const char * tty_name)
{	
	int fd_stdin = open(tty_name, O_RDWR);
	assert(fd_stdin == 0);
	int fd_stdout = open(tty_name, O_RDWR);
	assert(fd_stdout == 1);

	char rdbuf[128];
	char filepath[MAX_FILENAME_LEN];
	
	colorful();
	clear();
	welcome();

	initFS();

	while (1) {
		write(1, "$ ", 2);
		int r = read(0, rdbuf, 70);
		rdbuf[r] = 0;

		int argc = 0;
		char * argv[PROC_ORIGIN_STACK];
		char * p = rdbuf;
		char * s;
		int word = 0;
		char ch;
		do {
			ch = *p;
			if (*p != ' ' && *p != 0 && !word) {
				s = p;
				word = 1;
			}
			if ((*p == ' ' || *p == 0) && word) {
				word = 0;
				argv[argc++] = s;
				*p = 0;
			}
			p++;
		} while(ch);
		argv[argc] = 0;
		
		int argv1[PROC_ORIGIN_STACK];
		int argv2[PROC_ORIGIN_STACK];
		int argc1 = 0;
		int argc2 = 0;
		int mul_task = 0;
		int i;
		for (i = 0; i < argc; i++) {
			if (!mul_task) {
				argv1[i] = argv[i];
				argc1++;
				if(strcmp(argv[i], "&") == 0) {
					argc1--;
					mul_task = 1;
				}
			} else {
				argc2++;
				argv2[i - 1 - argc1] = argv[i];
			}
		}
		
		argv1[argc1] = 0;
		argv2[argc2] = 0;
		
		
		int fd1 = open(argv1[0], O_RDWR);
		int fd2 = 1;
		
		if (mul_task) {
			fd2 = open(argv2[0], O_RDWR);
		}

		if (fd1 == -1 || fd2 == -1) {
			if (rdbuf[0]) {
				write(1, "{", 1);
				write(1, rdbuf, r);
				write(1, "}\n", 2);
			}
		} else {
			close(fd1);
			if (mul_task) {
				close(fd2);
			}

			int pid1 = fork();
			int pid2 = -1;		
			if(pid1 != 0 && mul_task) {
				pid2 = fork();
			}
	
			if(pid1 != 0 && pid2 !=0) {
				int s1;
				wait(&s1);
			} else if (pid1 == 0) {
				if(mul_task) {
					printf("[pid: %d]command: %s\n", getpid(), argv1[0]);
				}
				execv(argv1[0], argv1);
			} else if (pid2 != -1) {
				printf("[pid: %d]command: %s\n", getpid(), argv2[0]);
				execv(argv2[0], argv2);
			}
		}
		
	}

	close(1);
	close(0);
}

/*****************************************************************************
*				Welcome
*****************************************************************************/
void welcome()
{

	printl("=============================================================================\n");             
	printl("                          ,--,                                ____\n");
	printl("                        ,--.\'|                              ,\'  , \`.\n");
	printl("         .---.          |  | :               ,---.       ,-+-,.\' _ |\n");
	printl("        /. ./|          :  : \'              \'   ,\'\\   ,-+-. ;   , ||\n");
	printl("     .-\'-. \' |   ,---.  |  \' |      ,---.  /   /   | ,--.\'|\'   |  || ,---.\n");
	printl("    /___/ \\: |  /     \\ \'  | |     /     \\.   ; ,. :|   |  ,\', |  |,/     \\\n");
	printl(" .-\'.. \'   \' . /    /  ||  | :    /    / \'\'   | |: :|   | /  | |--\'/    /  |\n");
	printl("/___/ \\:     \'.    \' / |\'  : |__ .    \' / \'   | .; :|   : |  | ,  .    \' / |\n");
	printl(".   \\  \' .\\   \'   ;   /||  | \'.\'|\'   ; :__|   :    ||   : |  |/   \'   ;   /|\n");
	printl(" \\   \\   \' \\ |\'   |  / |;  :    ;\'   | \'.\'|\\   \\  / |   | |`-\'    '   |  / |\n");
	printl("  \\   \\  |--\" |   :    ||  ,   / |   :    : `----\'  |   ;/        |   :    |\n");
	printl("   \\   \\ |     \\   \\  /  ---`-\'   \\   \\  /          \'---\'          \\   \\  /\n");
	printl("   \'---\"       `----\'             `----\'                           `----\'\n");

	printl("=============================================================================\n");
	printl("\n\n\n");
	printl("Press 'SHift + F1~F3' to change console...");
	printl("\n\n\n");
}

/*****************************************************************************
*				Clear
*****************************************************************************/
void clear()
{
	int i = 0;
	for (i = 0; i < 20; i++){
		printl("\n");
	}
}

/*****************************************************************************
*				Quit
*****************************************************************************/
void off()
{
	return 0;
}




/*****************************************************************************
*				Colorful
*****************************************************************************/
void colorful()
{
	int j = 0;
	for (j = 0; j < 2800; j++) { disp_str(" "); }
	disp_color_str("============================================================================\n", BLUE);
	disp_color_str("    ,----..                                      ,--.\n", GREEN);
	disp_color_str("   /   /   \\  ,-.----.      ,---,              ,--.\'|  ,----..       ,---,.\n", GREEN);
	disp_color_str("  /   .     : \\    /  \\    \'  .\' \\         ,--,:  : | /   /   \\    ,\'  .\' |\n", GREEN);
	disp_color_str(" .   /   ;.  \\;   :    \\  /  ;    \'.    ,`--.\'`|  \' :|   :     : ,---.\'   |\n", GREEN);
	disp_color_str(".   ;   /  ` ;|   | .\\ : :  :       \   |   :  :  | |.   |  ;. / |   |   .\'\n", GREEN);
	disp_color_str(";   |  ; \\ ; |.   : |: | :  |   /\   \  :   |   \\ | :.   ; /--`  :   :  |-,\n", GREEN);
	disp_color_str("|   :  | ; | \'|   |  \\ : |  :  \' ;.   : |   : \'  \'; |;   | ;  __ :   |  ;/|\n", GREEN);
	disp_color_str(".   |  \' \' \' :|   : .  / |  |  ;/  \\   \'   \' ;.    ;|   : |.\' .\'|   :   .\'\n", GREEN);
	disp_color_str("'   ;  \\; /  |;   | |  \\ '  :  | \\  \\ ,\'|   | | \\   |.   | \'_.\' :|   |  |-,\n", GREEN);
	disp_color_str(" \\   \\  \',  / |   | ;\\  \\|  |  \'  \'--\'  \'   : |  ; .\'\'   ; : \\  |\'   :  ;/|\n", GREEN);
	disp_color_str("  ;   :    /  :   \' | \\.\'|  :  :        |   | \'`--\'  \'   | \'/  .\'|   |    \\\n", GREEN);
	disp_color_str("   \\   \\ .\'   :   : :-\'  |  | ,\'        \'   : |      |   :    /  |   :   .\'\n", GREEN);
	disp_color_str("    `---`\n", GREEN);
	disp_color_str("===========================================================================\n", BLUE);
	for (j = 0; j < 300; j++)
		disp_str(" ");
	milli_delay(2000);

}

/*****************************************************************************
*				File System
*****************************************************************************/

/*****************************************************************************
*				Init FS
*****************************************************************************/
void initFS()
{
	int fd = -1, n = 0;
	char bufr[1024];
	char filepath[MAX_FILENAME_LEN];
	char dirpath[MAX_FILENAME_LEN];
	char filename[MAX_FILENAME_LEN];

	memset(filequeue, 0, MAX_FILES);
	memset(dirqueue, 0, MAX_DIRS);
	
	fd = open("root", O_RDWR);
	if (fd < 0){
		fd = open("root", O_CREAT | O_RDWR);
	}
	close(fd);

	fd = open("root", O_RDWR);
	write(fd, bufr, 1024);
	close(fd);

}


