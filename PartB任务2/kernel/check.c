#include "stdio.h"
#include "type.h"
#include "const.h"
#include "protect.h"
#include "string.h"
#include "fs.h"
#include "proc.h"
#include "tty.h"
#include "console.h"
#include "global.h"
#include "proto.h"


PUBLIC int check(char* filename, int pos, int byteCount) {
	int hFile = open(filename, O_RDWR); //以读写方式打开文件
	if (hFile < 0)  // 打开失败，创建文件 
	   	hFile = open(filename, O_CREAT | O_RDWR);
	
	if (hFile < 0)  // 创建失败 返回
		return hFile;
	
	int i = 0;
	char temp[1]; // read函数要求必须传入char*
	unsigned int intTemp, tempCheck;
    	int checked = 0;
	for (i = 0; i < byteCount; i++) {
		mlseek(hFile, i, SEEK_SET); // 指针移动到文件第i位
		read(hFile, temp, 1); // 每次读1字节
		intTemp = (unsigned int)temp[0];
		intTemp = intTemp & 0x0FF; // 取低8bit
		tempCheck = 0x00;
		while (intTemp != 0x0) { // 检查1个字节
			tempCheck ^= intTemp;
			intTemp = intTemp >> 1;
		} 
		tempCheck = tempCheck & 0x1;
		checked = checked ^ tempCheck;
		checked = checked & 0x1;
		if (i % 1000 == 0) // 每1000字节输出一下
			printf("check[%d] = %d ", i/1000, checked);
	}
	printf("\n");
	mlseek(hFile, 0, SEEK_SET);
	close(hFile);
	return checked;
}

PUBLIC int find_position(struct check check_table[], char* filename) {
	int i = 0;
	printf("filename = %s\n", filename);
	for (i = 0; i < NR_CHECKFILES; i++) {
		if (!strcmp(check_table[i].filename, filename))
			return i;
	}
	return -1; // 没找到该文件
}
