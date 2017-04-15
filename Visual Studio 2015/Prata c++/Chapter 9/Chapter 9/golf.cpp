#include <iostream>
#include "golf.h"


void SALES::setSales(Sales & s, const double ar[], int n)
{
	double max, min;
	double sum = 0;
	for (int i = 0; i < n; i++)
	{
		max = ar[i];
		min = ar[i];
		sum += ar[i];
		max = max > ar[i] ? max : ar[i];
		min = min < ar[i] ? min : ar[i];
	}
	s.average = sum / n;
	s.max = max;
	s.min = min;
}

void SALES::setSales(Sales & s)
{
	double max, min;
	max = s.sales[0];
	min = s.sales[0];
	double sum = 0;
	for (int i = 0; i < 4; i++)
	{
		
		sum += s.sales[i];
		max = max > s.sales[i] ? max : s.sales[i];
		min = min < s.sales[i] ? min : s.sales[i];
	}
	s.average = sum / 4;
	s.max = max;
	s.min = min;
}

void SALES::showSales(const Sales & s)
{
	for (int i = 0; i < 4; i++)
		std::cout << "Kwartal numer " << i << " " <<s.sales[i] << std::endl;
	std::cout << "Max " << s.max << std::endl;
	std::cout << "Min " << s.min << std::endl;
	std::cout << "Average " << s.average << std::endl;


}