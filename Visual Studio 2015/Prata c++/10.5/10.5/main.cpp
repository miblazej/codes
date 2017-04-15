#include "customer.h"

using namespace std;


int main(void)
{
	customer a;
	a.fullname = 'a';
	a.payment = 1;

	customer b;
	b.fullname = 'b';
	b.payment = 2;

	customer c;
	c.fullname = 'c';
	c.payment = 3;

	Stack stack;
	stack.Push(a);
	stack.Push(b);
	stack.Push(c);

	stack.show();

	stack.Pop();
	stack.Pop();
	stack.Pop();

	stack.~Stack();

	getchar();
	getchar();


}