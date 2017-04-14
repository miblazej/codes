#include "person.h"

int main(void)
{


	Person one;
	Person two("Staszek");
	Person three("Jacek", "Placek");
	
	one.Show();

	two.FormalShow();
	two.Show();

	three.FormalShow();
	three.Show();

	getchar();




}