
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                               proc.c
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                                                   
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#include "type.h"
#include "const.h"
#include "protect.h"
#include "proto.h"
#include "string.h"
#include "proc.h"
#include "global.h"



/*======================================================================*
                              schedule
 *======================================================================*/
PUBLIC void schedule()
{
	PROCESS* p = p_proc_ready;
	char need_schedule = 0;

	if(p->state == running){
		p->ticks--;
		if(p->ticks == 0) {
			p->state = abort;
			need_schedule = 1;
		} else {
			now_process_runtime++;
			if(now_process_runtime == now_process_timep) {
				p->state = ready;
				now_process_runtime = 0;
				need_schedule = 1;
			} else {
				need_schedule = 0;
			}
		}
	}

	if(p->state == super) {
		need_schedule = 1;
	}

	int i;
	for(i = 1; i < NR_TASKS; i++) {
		if(ticks >= task_table[i].arrive_time && proc_table[i].state == unarrive) {
			proc_table[i].state = arrive;
			pronum = pronum + 1;
		}
	}
	
	for(i = 1; i < NR_TASKS; i++) {
		if(resource[i] == 1) {
			if(proc_table[i].state == arrive) {
				proc_table[i].state = ready;
				queue_1.queue[queue_1.rear] = &proc_table[i];
				queue_1.rear = (queue_1.rear + 1) % NR_TASKS;
				queue_1.len++;
			} else if (proc_table[i].state == block) {
				proc_table[i].state = ready;
			}
		} else {
			if(proc_table[i].state == ready) {
				proc_table[i].state = block;
			} else if(proc_table[i].state == running) {
				proc_table[i].state = block;
				need_schedule = 1;
			}
		}
	}

	if(need_schedule) {
		if(now_process_timep == queue_1.timep) {
			queue_1.front = (queue_1.front + 1) % NR_TASKS;
			queue_1.len--;
		} else if(now_process_timep == queue_2.timep) {
			queue_2.front = (queue_2.front + 1) % NR_TASKS;
			queue_2.len--;
		} else if(now_process_timep == queue_4.timep){
			queue_4.front = (queue_4.front + 1) % NR_TASKS;
			queue_4.len--;
		}
		if(p->state == abort) {
			//do nothing
		} else if(p->state == ready) {
			if(now_process_timep == queue_1.timep) {
				queue_2.queue[queue_2.rear] = p;
				queue_2.rear = (queue_2.rear + 1) % NR_TASKS; 
				queue_2.len++;
			} else {
				queue_4.queue[queue_4.rear] = p;
				queue_4.rear = (queue_4.rear + 1) % NR_TASKS;
				queue_4.len++;
			}
		} else if(p->state == block) {
			queue_4.queue[queue_4.rear] = p;
			queue_4.rear = (queue_4.rear + 1) % NR_TASKS;
			queue_4.len++;
		}

		while(queue_1.len > 0) {
			p = queue_1.queue[queue_1.front];
			if(p->state == block) {
				queue_1.front = (queue_1.front + 1) % NR_TASKS;
				queue_1.len--;
				queue_4.queue[queue_4.rear] = p;
				queue_4.rear = (queue_4.rear + 1) % NR_TASKS;
				queue_4.len++;
				continue;
			} else {
				now_process_timep = queue_1.timep;
				now_process_runtime = 0;
				break;
			}
		}

		while(queue_1.len == 0 && queue_2.len > 0) {
			p = queue_2.queue[queue_2.front];
			if(p->state == block) {
				queue_2.front = (queue_2.front + 1) % NR_TASKS;
				queue_2.len--;
				queue_4.queue[queue_4.rear] = p;
				queue_4.rear = (queue_4.rear + 1) % NR_TASKS;
				queue_4.len++;
				continue;
			} else {
				now_process_timep = queue_2.timep;
				now_process_runtime = 0;
				break;
			}
		}

		int maxsearch = NR_TASKS;
		while(queue_1.len == 0 && queue_2.len == 0 && queue_4.len > 0) {
			p = queue_4.queue[queue_4.front];
			if(p->state == block) {
				queue_4.front = (queue_4.front + 1) % NR_TASKS;
				queue_4.queue[queue_4.rear] = p;
				queue_4.rear = (queue_4.rear + 1) % NR_TASKS;
				continue;
			} else {
				now_process_timep = queue_4.timep;
				now_process_runtime = 0;
				break;
			}
			//avoid the dead-loop
			if(--maxsearch == 0) {
				p = &proc_table[0];
				now_process_timep = -1;
				now_process_runtime = -1;
				break;
			}
		}

		if(queue_1.len == 0 && queue_2.len == 0 && queue_4.len == 0) {
			p = &proc_table[0];
			now_process_timep = -1;
			now_process_runtime = -1;
		}
	}
	
	p_proc_ready = p;
	if(p != proc_table) {
		p->state = running;
	}
	for(i = 1; i < NR_TASKS; i++) {
		if(ticks >= task_table[i].arrive_time && proc_table[i].state != abort && proc_table[i].state != running){
			if(i == 1){
				timeA = timeA+1;
			}
			else if(i == 2){
				timeB = timeB+1;
			}
			else if(i == 3){
				timeC = timeC+1;
			}
			else if(i == 4){
				timeD = timeD+1;
			}
			else if(i == 5){
				timeE = timeE+1;
			}
		}
	}
	ticks++;
}

/*======================================================================*
                           sys_get_ticks
 *======================================================================*/
PUBLIC int sys_get_ticks()
{
	return ticks;
}

