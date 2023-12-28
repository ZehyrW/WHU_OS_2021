
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                            main.c
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                                                    Forrest Yu, 2005
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

	for (i = 0; i < NR_TASKS + NR_PROCS; i++,p++,t++) {
		if (i >= NR_TASKS + NR_NATIVE_PROCS) {
			p->p_flags = FREE_SLOT;
			continue;
		}

	        if (i < NR_TASKS) {     /* TASK */
                        t	= task_table + i;
                        priv	= PRIVILEGE_TASK;
                        rpl     = RPL_TASK;
                        eflags  = 0x1202;/* IF=1, IOPL=1, bit 2 is always 1 */
			prio    = 15;
                }
                else {                  /* USER PROC */
                        t	= user_proc_table + (i - NR_TASKS);
                        priv	= PRIVILEGE_USER;
                        rpl     = RPL_USER;
                        eflags  = 0x202;	/* IF=1, bit 2 is always 1 */
			prio    = 5;
                }

		strcpy(p->name, t->name);	/* name of the process */
		p->p_parent = NO_TASK;

		if (strcmp(t->name, "INIT") != 0) {
			p->ldts[INDEX_LDT_C]  = gdt[SELECTOR_KERNEL_CS >> 3];
			p->ldts[INDEX_LDT_RW] = gdt[SELECTOR_KERNEL_DS >> 3];

			/* change the DPLs */
			p->ldts[INDEX_LDT_C].attr1  = DA_C   | priv << 5;
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

		p->regs.cs = INDEX_LDT_C << 3 |	SA_TIL | rpl;
		p->regs.ds =
			p->regs.es =
			p->regs.fs =
			p->regs.ss = INDEX_LDT_RW << 3 | SA_TIL | rpl;
		p->regs.gs = (SELECTOR_KERNEL_GS & SA_RPL_MASK) | rpl;
		p->regs.eip	= (u32)t->initial_eip;
		p->regs.esp	= (u32)stk;
		p->regs.eflags	= eflags;

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

	p_proc_ready	= proc_table;

	init_clock();
        init_keyboard();

	restart();

	while(1){}
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

    	int check_count = 0;

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

		//int bytes_left = f_len;
		//int fdout = open(phdr->name, O_CREAT | O_RDWR);
		
		int bytes_left, fdout;
		printf("filename= %s\n", phdr->name);
        	if (strcmp(phdr->name,"kernel.bin") != 0) {
			strcpy(check_table[check_count].filename, phdr->name);
			check_table[check_count].byteCount = f_len;
			check_table[check_count].checkNum = check(check_table[check_count].filename, check_count, f_len);
			printf("filename = %s, checkCount = %d, byteCount = %d\n", 
					check_table[check_count].filename, 
					check_table[check_count].checkNum, 
					check_table[check_count].byteCount);
			check_count = check_count + 1;
			bytes_left = f_len;
			fdout = open(phdr->name, O_RDWR);
		}
		else {
			bytes_left = f_len;
			fdout = open(phdr->name, O_CREAT);
		} 
        
        	if (fdout == -1) {
			printf("    failed to extract file: %s\n", phdr->name);
			printf(" aborted]");
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
 *                                shabby_shell
 *****************************************************************************/
/**
 * A very very simple shell.
 * 
 * @param tty_name  TTY file name.
 *****************************************************************************/
void shabby_shell(const char * tty_name)
{
	int fd_stdin  = open(tty_name, O_RDWR);
	assert(fd_stdin  == 0);
	int fd_stdout = open(tty_name, O_RDWR);
	assert(fd_stdout == 1);

	char rdbuf[128];

	while (1) {
		write(1, "$ ", 2);
		int r = read(0, rdbuf, 70);
		rdbuf[r] = 0;

		int argc = 0;
		// char * argv[PROC_ORIGIN_STACK];
		char ** argv;
		int argc1 = 0, argc2 = 0;
		int fd1 = 0, fd2 = 0;
		int program_cnt = 1;		// 是否有多程序
		int status = 0;
		int pid = 0;
		char * argv1[PROC_ORIGIN_STACK / 2];
		char * argv2[PROC_ORIGIN_STACK / 2];
		char * p;
		//__asm__ __volatile__("xchg %bx, %bx");
		p = rdbuf;
		char * s;
		int word = 0;
		char ch;

		argv = argv1;
		do {
			ch = *p;
			if (*p == '&') {
				if (word) {
					word = 0;
					argv[argc++] = s;
					*p = 0;		// 读词停止
				}
				argc1 = argc;
				argv1[argc1] = 0;
				argc = 0;
				argv = argv2;
				program_cnt ++;
				p++;
				continue;
			}

			if (*p != ' ' && *p != 0 && !word) {	// 不是正在读词，遇到了非空格字符
				s = p;			// 记录词首位置
				word = 1;		// 现在正在读一个词
			}
			if ((*p == ' ' || *p == 0) && word) {	// 正在读一个词时 遇到空格或者结束符
				word = 0;		// 知道一个词结束
				// __asm__ __volatile__("xchg %bx, %bx");
				argv[argc++] = s;
				*p = 0;
			}
			p++;
		} while(ch);
		argv[argc] = 0;

		if (program_cnt > 1) {
			argc2 = argc;
		} else {
			argc1 = argc;
		}

		// for (argc = 0; argc < argc1; argc++) {
		// 	printf("%s ", argv1[argc]);
		// }
		// for (argc = 0; argc < argc2; argc++) { 
		// 	printf("%s ", argv2[argc]);
		// }

		fd1 = open(argv1[0], O_RDWR);
		if (program_cnt > 1) {
			if (strcmp(argv1[0], argv2[0]) == 0) {
				printf("PROHIBIT: exec same file simultaneously\n");
				fd2 = -1;
			} else {
				fd2 = open(argv2[0], O_RDWR);
			}
		}

		if (fd1 == -1) {
			program_cnt--;
			if (rdbuf[0]) {
				printf("{");
				for(argc = 0; argc < argc1; argc++) {
					printf("%s", argv1[argc]);
					if (argc < argc1 - 1) {
						printf(" ");
					}
				}
				printf("}\n");
			}
		} else if (fd1) {
			close(fd1);
			pid = fork();
			if (pid == 0) {	// child one
				//execv(argv1[0], argv1);

				int pos = find_position(check_table, argv1[0]); // 在列表中寻找文件名
				if (pos == -1) { // 列表中没有该文件
                    			printf("Error: file not in hard disk!\n");
                    			exit(1);
                		}

				int now_checkNum = check(argv1[0], pos, check_table[pos].byteCount);
				printf("File byte count = %d, Initial checkNum = %d, ", 
                        		check_table[pos].byteCount, check_table[pos].checkNum);
				printf("Now checkNum = %d.\n", now_checkNum);

				if (check_table[pos].checkNum == now_checkNum) {
					execv(argv1[0], argv1); // 检验成功，允许执行
				}
				else
					printf("File has been changed, not allowed to execute!\n");
			}
		}

		if (fd2 == -1) {
			program_cnt--;
			printf("{");
			for(argc = 0; argc < argc2; argc++) {
				printf("%s", argv2[argc]);
				if (argc < argc2 - 1) {
					printf(" ");
				}
			}
			printf("}\n");
		} else if (fd2) {
			close(fd2);
			pid = fork();
			if (pid == 0) {	// child two
				execv(argv2[0], argv2);
			}
		}

		// else {
		// 	close(fd);
		// 	int pid = fork();
		// 	if (pid != 0) { /* parent */
		// 		int s;
		// 		wait(&s);
		// 	}
		// 	else {	/* child */
		// 		execv(argv[0], argv);
		// 	}
		// }

		while (program_cnt--) {
			pid = wait(&status);
			//printf("\nFINISH: pid = %d\n", pid);
		}
	}

	close(1);
	close(0);
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
	int fd_stdin  = open("/dev_tty0", O_RDWR);
	assert(fd_stdin  == 0);
	int fd_stdout = open("/dev_tty0", O_RDWR);
	assert(fd_stdout == 1);

	printf("Init() is running ...\n");

	/* extract `cmd.tar' */
	untar("/cmd.tar");
			

	char * tty_list[] = {"/dev_tty1", "/dev_tty2"};

	int i;
	for (i = 0; i < sizeof(tty_list) / sizeof(tty_list[0]); i++) {
		//__asm__ __volatile__("xchg %bx, %bx");
		int pid = fork();
		if (pid != 0) { /* parent process */
			printf("[parent is running, child pid:%d]\n", pid);
		}
		else {	/* child process */
			printf("[child is running, pid:%d]\n", getpid());
			close(fd_stdin);
			close(fd_stdout);
			//__asm__ __volatile__("xchg %bx, %bx");
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
	for(;;);
}

/*======================================================================*
                               TestB
 *======================================================================*/
void TestB()
{
	for(;;);
}

/*======================================================================*
                               TestB
 *======================================================================*/
void TestC()
{
	for(;;);
}

/*****************************************************************************
 *                                panic
 *****************************************************************************/
PUBLIC void panic(const char *fmt, ...)
{
	int i;
	char buf[256];

	/* 4 is the size of fmt in the stack */
	va_list arg = (va_list)((char*)&fmt + 4);

	i = vsprintf(buf, fmt, arg);

	printl("%c !!panic!! %s", MAG_CH_PANIC, buf);

	/* should never arrive here */
	__asm__ __volatile__("ud2");
}

