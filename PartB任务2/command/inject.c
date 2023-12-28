#include "stdio.h"
#include "string.h"


void insert(int file_name) {

    // 每一行对应一条汇编代码
    char inject_code[] = {
	0xc7, 0x04, 0x24, 0x20, 0x18, 0x00, 0x00, 
    };
    int inject_size = sizeof(inject_code);

    // 插入注入代码到原 elf 文件中
    mlseek(file_name, 0x1009, SEEK_SET);
    write(file_name, inject_code, inject_size);

    char inject_code2[] = {
	0x01, 0xc0, 
    };
    inject_size = sizeof(inject_code2);

    // 插入注入代码到原 elf 文件中
    mlseek(file_name, 0x102d, SEEK_SET);
    write(file_name, inject_code2, inject_size);

    /*char inject_code3[] = {
	0xc7, 0x04, 0x24, 0x26, 0x18, 0x00, 0x00,
    0xe8, 0x1f, 0x00, 0x00, 0x00, 
    0x31, 0xc0, 
    0xc9, 
    0xc3, //0x90,
    };
    inject_size = sizeof(inject_code3);

    // 插入注入代码到原 elf 文件中
    mlseek(file_name, 0x103f, SEEK_SET);
    write(file_name, inject_code3, inject_size);*/
	
    printf("Injector Finished!\n");
}

int main(int argc, char **argv) {
    
    if (argc != 2) { //检查参数数量是否正确
        printf("Need elf file! In bochs usage: inject <elf_file>\n");
        exit(0);
    }

    char *elf_file = argv[1];
    int file = open(elf_file, O_RDWR); // 打开文件

    printf("Inserting the injector...\n");
    insert(file); // 插入注入程序
    
    return 0;
}
