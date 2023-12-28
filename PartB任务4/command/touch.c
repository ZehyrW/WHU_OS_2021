#include "stdio.h"

int main(int args, char* argv[]) {
    // create文件需要使用open函数
    int fd = open(argv[1], O_CREAT);
    if (fd != -1) {
        printf("create %s successfully\n", argv[1]);
    } else {
        printf("faile to create %s\n", argv[1]);
    }
    return 0;
}

