#include "stdio.h"

int main(int args, char* argv[]) {
    if (args != 2) {
        printf("please use the rm in right format\n");
    } else {
        if (unlink(argv[1]) == -1) {
            printf("rm file failed\n");
            return -1;
        }
        printf("%s is successfully removed\n", argv[1]);
    }
    return 0;
}

