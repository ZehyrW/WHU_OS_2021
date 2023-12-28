# include <stdio.h>
# include <type.h>

int i;
int *addr;

u32 canary;

#define LCG_A 1664525
#define LCG_C 1013904223
#define LCG_M 0xffffffff

u32 lcg_seed = 42;

u32 myrand() {
    lcg_seed = (LCG_A * lcg_seed + LCG_C) & LCG_M;
    return lcg_seed;
}

u32 generateCanary()
{
    return myrand();
}

void test()
{
    printf("you are attacked!\n");
}

void testat() {
     char buff[72] = {0};
     
    canary = generateCanary();

    addr = &buff[72];

    for (i = 0; i < 3; i++) {
         addr[i] = 0x1000;
     }

     if(canary != generateCanary()){
         printf("canary not match!\nstack overflow occured!\n");
         exit(1);
     }
 }

 void main(int argc, char* argv[]) {
     testat();
     return 0;
 }
