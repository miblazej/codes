#include "List.h"

void add(int & part, int value);

using namespace std;

int main(void)
{

	int ar[3] = { 1,2,3 };
	Lista abc(ar, 3);
	abc.show();
	abc.visit(abc.return_element(0), 10, add);
	abc.show();
	getchar();
	getchar();
	
	
}

void add(int &part, int value)
{
	part += value;
}