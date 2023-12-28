//#include "type.h"
#include "stdio.h"
//#include "const.h"
//#include "protect.h"
//#include "string.h"
//#include "fs.h"
//#include "proc.h"
//#include "tty.h"
//#include "console.h"
//#include "global.h"
//#include "proto.h"

void test();
void main(){
	test();
	return 0;
}

void test() {
	const char * const hack[] = {"Ops!\n"};
    	printf("Hello, os!\n");	

	int i = 0;
	i = i + 250;
	printf("Your input is :%d\n", i);
	return 0;
}

