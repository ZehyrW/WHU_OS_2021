#include "type.h"
#include "stdio.h"

int main(int argc, char *argv[]) {
    int i = 3;
    int f1 = 1; 
    int f2 = 1; 
    int f3;
    printf("%d %d ", f1, f2);
    for (i = 3; i <= 10; i++) 
    {
	    f3 = f2 + f1;
	    f1 = f2;
	    f2 = f3;
        printf("%d ", f3);
    }
    printf("\n");
    return 0;
}
