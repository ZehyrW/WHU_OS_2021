#include <stdio.h>
#include <string.h>

void insert() {
	char original[4] = {"1234"};
    char addr[4] = {0x68, 0x10, 0x00, 0x00};
	char inject[16] = {"ABCDEFGHIJKLMNOP"};
	memcpy(original, inject, 20);
    printf("Now return address is: %d\n", original + 20);
	return;
}


void hack() {
    printf("Ops! You have been hacked!\n");
    exit(1);
}


int main() {
	insert();
    printf("Attack failed!");
	return 1;
}
