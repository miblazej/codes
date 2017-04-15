#include <iostream>
#include "Move.h"
using namespace std;

int main(void)
{
	Move a(12,12);
	Move b(10, 20);
	Move c;
	c = a.add(b);
	c.showmove();
	getchar();
	

}