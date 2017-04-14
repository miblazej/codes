#include<stdio.h>
#include <time.h>
#include <stdlib.h>


int main(void)
{
	int a, b, c, d;
	srand(time(NULL));
	for (int i = 0; i < 32000; i++)
	{
		
		a = rand();
		b = rand();
		c = a;
		d = b;
		a = a + b;
		b = a - b;
		a = a - b;
		if (!((a == d) && (c == b)))
		{
			printf("%d    %d\n", a, b);
			printf("incorrect\n");
			

			
		}
	}
	printf("done");
	getchar();





}