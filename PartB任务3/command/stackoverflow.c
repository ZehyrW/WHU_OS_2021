//#include "type.h"
//#include "stdio.h"
//#include "const.h"
//#include "protect.h"
//#include "string.h"
//#include "fs.h"
//#include "proc.h"
//#include "tty.h"
//#include "console.h"
//#include "global.h"
//#include "proto.h"
void payload() {
	printf("Atttack!\n");
}

unsigned char maldata[24];

void overflow_retaddr() {
	unsigned char testbuf[8];
	unsigned long dwPayLoad = (unsigned long)payload;
	memcpy(maldata + 20, &dwPayLoad, 4);
	memcpy(testbuf, maldata, 24);	
}

int main(int argc, char* argv[]) {
	overflow_retaddr();
}



