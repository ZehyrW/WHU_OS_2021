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
#include "elf.h"

PUBLIC int mlseek(int fd, int offset, int whence)
{
    MESSAGE msg;
    msg.type = LSEEK;
    msg.FD   = fd;
    msg.OFFSET = offset;
    msg.WHENCE = whence;

    send_recv(BOTH, TASK_FS, &msg);
    assert(msg.type == SYSCALL_RET);
    return msg.CNT;
}
