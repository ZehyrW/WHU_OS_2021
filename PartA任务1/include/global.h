
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                            global.h
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                                                    Forrest Yu, 2005
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

/* EXTERN is defined as extern except in global.c */
#ifdef	GLOBAL_VARIABLES_HERE
#undef	EXTERN
#define	EXTERN
#endif

EXTERN	int		ticks;
EXTERN  int		flag;//标记是否需要打印进程等待信息，只打印1次
EXTERN  int		timeA;
EXTERN  int		timeB;
EXTERN  int		timeC;
EXTERN  int		timeD;
EXTERN  int		timeE;
EXTERN	int		pronum;

EXTERN	int		disp_pos;
EXTERN	u8		gdt_ptr[6];	// 0~15:Limit  16~47:Base
EXTERN	DESCRIPTOR	gdt[GDT_SIZE];
EXTERN	u8		idt_ptr[6];	// 0~15:Limit  16~47:Base
EXTERN	GATE		idt[IDT_SIZE];

EXTERN	u32		k_reenter;

EXTERN	TSS		tss;
EXTERN	PROCESS*	p_proc_ready;
EXTERN  int 	now_process_timep;
EXTERN  int 	now_process_runtime;

extern	PROCESS		proc_table[];
extern	char		task_stack[];
extern  TASK            task_table[];
extern	irq_handler	irq_table[];

extern  S_QUEUE		queue_1;
extern 	S_QUEUE		queue_2;
extern 	S_QUEUE		queue_4;

extern  int 		resource[];
