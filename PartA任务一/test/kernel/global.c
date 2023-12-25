
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                            global.c
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                                                    Forrest Yu, 2005
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#define GLOBAL_VARIABLES_HERE

#include "type.h"
#include "const.h"
#include "protect.h"
#include "proto.h"
#include "proc.h"
#include "global.h"



PUBLIC	PROCESS			proc_table[NR_TASKS];

PUBLIC	char			task_stack[STACK_SIZE_TOTAL];

PUBLIC	TASK	task_table[NR_TASKS] = {{Test0, STACK_SIZE_TEST0, 666, 666, "Test0"},
					{TestA, STACK_SIZE_TESTA, 3, 0, "TestA"},
					{TestB, STACK_SIZE_TESTB, 8, 1, "TestB"},
					{TestC, STACK_SIZE_TESTC, 4, 3, "TestC"},
					{TestD, STACK_SIZE_TESTD, 5, 4, "TestD"},
					{TestE, STACK_SIZE_TESTE, 7, 5, "TestE"}
				};

PUBLIC	irq_handler		irq_table[NR_IRQ];

PUBLIC	system_call		sys_call_table[NR_SYS_CALL] = {sys_get_ticks};

PUBLIC	S_QUEUE	queue_1 = {{0,0,0,0,0,0}, 0,0,0,1};
PUBLIC	S_QUEUE	queue_2 = {{0,0,0,0,0,0}, 0,0,0,2};
PUBLIC	S_QUEUE	queue_4 = {{0,0,0,0,0,0}, 0,0,0,4};

PUBLIC  int resource[NR_TASKS] = {1,1,1,1,1,1};
PUBLIC  int now_process_timep = -1;
PUBLIC  int now_process_runtime = -1;
