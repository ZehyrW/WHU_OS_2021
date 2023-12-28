#include <stdio.h>

int i;
int *addr;

unsigned char shellcode_dump[] = {
	0x55, 0x89, 0xe5, 0xeb, 0xfe};

void testat()
{
	char buff[72] = {0};
	for (i = 0; i < 72; i++)
	{
		if (0 == shellcode_dump[i])
			break;
		buff[i] = shellcode_dump[i];
	}

	for (; i < 72; i++)
	{
		buff[i] = 0;
	}

	addr = &buff[72];

	for (i = 0; i < 6; i++)
	{
		addr[i] = buff;
	}
}

void main(int argc, char *argv[])
{
	testat();
}