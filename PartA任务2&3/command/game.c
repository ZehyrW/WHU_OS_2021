#include <stdio.h>
#include <stdlib.h>
#define chartonumber(x) (x-'0')

int main(int argc, char * argv[]){
	int quit = 0;
	while(1) {  
		printf("    ______         __       ____    ____  _________   _______\n");
		printf("  .' ___  |       /  \\     |_   \\  /   _||_   ___  | /  ___  |\n");
		printf(" / .'   \\_|      / /\\ \\      |   \\/   |    | |_  \\_||  (__ \\_|\n");
		printf(" | |    ____    / ____ \\     | |\\  /| |    |  _|  _  '.___`-.\n");
		printf(" \\ `.___]  _| _/ /    \\ \\_  _| |_\\/_| |_  _| |___/ ||`\\____) |\n");
		printf("  `._____.'  |____|  |____||_____||_____||_________||_______.'\n");
		
		printf("==============================================================\n");
		printf("                           1. Guess Number\n");
		printf("                           2. Every 3 Passes\n");
		printf("                           q. quit\n");
		printf("==============================================================\n");
	
		char bur[128];
		read(0, bur, 128);
		switch(bur[0]) {
		case '1':
			guess();
			break;
		case '2':
			three();
			break;
		case 'q':
			printf("Thanks for playing!\n");
			quit = 1;
			break;
		default:
			printf("Uh-oh! Error command!\n");
		}
		printf("\n");
		if(quit)
			break;
	}
	return 0;
}
/****************************Every 2 Passes game*******************************/

int hasThreeOrIsMultipleOfThree(int num) {
	return (num % 3 == 0) || (num % 10 == 3) || (num / 10 ==3);
}

void three()
{
	printf("==============================================================\n");
	printf("                Welcome to 'Every 3 Passes'!\n");
	printf("--------------------------------------------------------------\n");
	printf("  You can input a number with a planty of chances.\n");
	printf("  If your number has 3 or is nultiple of three,\n");
	printf("  You will get 'pass!', or you will get 'wrong!'.\n " );
	printf(" You should input 'enter' to the next round.\n");
	printf(" You can input 'q' to quit the game.\n");
	printf("  Good luck!\n");
	printf("==============================================================\n\n");
	char input[128];
	int round = 1;

	int number;

	while (1) {
		printf("the %d round, please input a number, or iuput 'q' to quit\n", round);
		read(0, input, 128);
		number = my_atoi(input);
		if (input[0] == 'q')
		{
			return;
		}

		if (hasThreeOrIsMultipleOfThree(number))
		{
			printf("pass!\n");
			read(0, input, 128);
			number = my_atoi(input);
		} else
		{
			printf("wrong!\n");
			read(0, input, 128);
			number = my_atoi(input);
		}
		// return;
		round++;
	}
	return;
}


/***************************guess number********************************/
int my_atoi(const char *s)
{
	int num = 0;
	int i = 0;
	char ch;
	while(s[i]) {
		ch = s[i];
		i++;
		if (ch < '0' || ch > '9')
			break;
		num = num * 10 + (ch - '0');
	}
	return num;
}

void guess()
{
	printf("==============================================================\n");
	printf("                Welcome to 'Guess Number'!\n");
	printf("--------------------------------------------------------------\n");
	printf("  I have a number between 1 and 999,\n");
	printf("  and you have 8 chances to guess what is it.\n");
	printf("  If you guess that number, you win.\n");
	printf("  You can input 'q' to quit the game.\n");
	printf("  Good luck!\n");
	printf("==============================================================\n\n");
	int stop = 0;
	
	int a,b;
	char c;
	a = 678;
	int flag = 0;
	printf("  First try:");
	char bufr[128];
	read(0, bufr, 128);
	b = my_atoi(bufr);
	if(bufr[0] == 'q') {
		return;
	}
	int chances;
	for(chances = 7; chances > 0; chances--) {
		if (b == a) {
			printf("  Excellent! You guessed the number!\n");
			flag = 1;
			return;
		}
		else if (b < a) {
			printf("  Too small. You still have %d chances:", chances);
			read(0, bufr, 128);
			b = my_atoi(bufr);
		}
		else if (b > a) {
			printf("  Too big. You still have %d chances:", chances);
			read(0, bufr, 128);
			b=my_atoi(bufr);
		}
		if(bufr[0] == 'q')
			return;
	}
	if(!flag) {
		printf("  Game over! The number is %d.\n", a);
	}
	return;
}

