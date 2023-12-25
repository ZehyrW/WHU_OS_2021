
/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                               clock.c
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                                                    Forrest Yu, 2005
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

#include "type.h"
#include "const.h"
#include "protect.h"
#include "proto.h"
#include "string.h"
#include "proc.h"
#include "global.h"


/*======================================================================*
                           clock_handler
 *======================================================================*/
PUBLIC void clock_handler(int irq)
{
	//ticks++;
	//disp_str("!!!!");
	if (k_reenter != 0) {
		return;
	}
	if(queue_1.len == 0 && queue_2.len == 0 && queue_4.len == 0 && flag == 0 && pronum == 5){
		disp_str("\npro_A wait time: ");
		disp_int(timeA);
		disp_str("\n");

		disp_str("pro_B wait time: ");
		disp_int(timeB);
		disp_str("\n");

		disp_str("pro_C wait time: ");
		disp_int(timeC);
		disp_str("\n");

		disp_str("pro_D wait time: ");
		disp_int(timeD);
		disp_str("\n");

		disp_str("pro_E wait time: ");
		disp_int(timeE);
		disp_str("\n");
		flag = 1;
	}
	schedule();

}

/*======================================================================*
                              milli_delay
 *======================================================================*/
PUBLIC void milli_delay(int milli_sec)
{
        int t = get_ticks();

        while(((get_ticks() - t) * 1000 / HZ) < milli_sec) {}
}

