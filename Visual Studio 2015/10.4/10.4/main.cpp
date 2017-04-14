#include <iostream>
#include "Sales.h"



int main(void)
{
	double ab[4] = { 1,2,3,4 };
	Sales::Sales sklep(ab, 4);
	sklep.showSales();
	sklep.~Sales();
	getchar();
	getchar();




}