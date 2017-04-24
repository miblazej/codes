#include "cow.h"

int main(void)
{

	Cow a;
	Cow b("Baska", "Trawa", 1000);
	b.ShowCow();
	a.ShowCow();
	a = b;
	a.ShowCow();
	Cow * c;
	c = &a;
	cout << c << endl;
	c = &b;
	cout << c << endl;
	getchar();
	getchar();






}