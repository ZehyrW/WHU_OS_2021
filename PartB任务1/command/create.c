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

  
int main(int argc, char * argv[])
{
	
	const char* a = "vul";
	char add[4] = {0x81, 0x45, 0xf4, 0x32};
	int fd = open(a, O_RDWR);
	mlseek(fd, 0x102e, SEEK_SET);
	write(fd, add, sizeof(add));

	char inject_code[] = {
	0xc7, 0x04, 0x24, 0x98, 0x18, 0x00, 0x00,
    };

    	// 插入注入代码到原 elf 文件中
    	mlseek(fd, 0x101b, SEEK_SET);
   	write(fd, inject_code, sizeof(inject_code));	

	close(fd);



	return 0;

}
