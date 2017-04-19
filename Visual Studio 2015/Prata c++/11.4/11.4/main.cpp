#include <iostream>
#include "mytime3.h"

using namespace std;

int main(void)
{
	Time time1(10, 10);
	Time time2(20, 20);
	Time time3;
	time3 = time1 + time2;
	time3.show();
	time3 = time3 - time2;
	cout << time3;
	time3 = time3 * 10;
	cout << time3;		
	getchar();
	getchar();








}