#include "Sales.h"

Sales::Sales::Sales(const double ar[], int n)
{
	for (int i = 0; i < n && i < 4; i++)
		sales[i] = *(ar +i);

	double sum = 0;
	double min_, max_;
	min_ = ar[0];
	max_ = ar[0];
	for (int i = 0; i < n; i++)
	{
		min_ = min_ > ar[i] ? ar[i] : min_;
		max_ = max_ > ar[i] ? max_ : ar[i];
		sum += ar[i];
	}
	average = sum / n;
	min = min_;
	max = max_;
}

Sales::Sales::Sales(Sales & s)
{
	for (int i = 0; i < 4; i++)
		sales[i] = s.sales[i];
	min = s.min;
	max = s.max;
	average = s.average;
}

Sales::Sales::~Sales()
{
	cout << "Object is destroyed" << endl;
}

void Sales::Sales::showSales()
{
	for (int i = 0; i < QUARTERS; i++)
		cout << "Quearter " << i + 1 << " sales value: " << sales[i] << endl;
	cout << "min: " << min << endl;
	cout << "average: " << average << endl;
	cout << "max: " << max << endl;
}
