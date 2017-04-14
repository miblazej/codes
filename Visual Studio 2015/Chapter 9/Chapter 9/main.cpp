#include <iostream>
#include "golf.h"

using namespace std;
using namespace SALES;



int main(void)
{
	Sales a;
	a.sales[0] = 1;
	a.sales[1] = 1;
	a.sales[2] = 2;
	a.sales[3] = 3;

	setSales(a);
	showSales(a);
	getchar();
	getchar();


}