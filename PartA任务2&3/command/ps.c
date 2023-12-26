#include "type.h"
#include "stdio.h"
#include "string.h"
#include "sys/const.h"
#include "sys/protect.h"
#include "sys/fs.h"
#include "sys/proc.h"
#include "sys/tty.h"
#include "sys/console.h"
#include "sys/global.h"
#include "sys/proto.h"

int main(int argc, char* argv[]) {
    MESSAGE msg;
    struct proc p;
    printf("PID  NAME  FLAGS\n");
    int i=0;
    for (i = 0; i < NR_TASKS + NR_PROCS; i++) {
        msg.PID = i;
        msg.type = GET_PROC_INFO;
        msg.BUF = &p;
        send_recv(BOTH, TASK_SYS, &msg);
        if (p.p_flags != FREE_SLOT) {
            printf("%d    %s    ", i, p.name);
            if (p.p_flags == SENDING) {
                printf("SENDING\n");
            } else if (p.p_flags == RECEIVING) {
                printf("RECEIVING\n");
            } else if (p.p_flags == WAITING) {
                printf("WAITING\n");
            } else if (p.p_flags == HANGING) {
                printf("HANGING\n");
            } else {
                printf("Unknown\n");
            }
        }
    }

}