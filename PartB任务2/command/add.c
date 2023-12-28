#include "type.h"
#include "stdio.h"

int main(int argc, char * argv[])
{
    printf("%d\n", argc);
    if ((argc != 3) || (argv[1][1] != '\0') || (argv[2][1] != '\0'))
    {
        printf("Input error! Exit.\n");
        return 1;
    }
    else
    {
        int a = argv[1][0] - 0x30;
        int b = argv[2][0] - 0x30;
        int c = a + b;
        printf("%d\n", c);
        return 0;
    }
}


