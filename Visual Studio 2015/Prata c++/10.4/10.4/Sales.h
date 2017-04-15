#pragma once

#include <iostream>
using namespace std;

namespace Sales
{
	const int QUARTERS = 4;
	class Sales
	{
	private:
		double sales[QUARTERS];
		double average;
		double max;
		double min;
	public:
		Sales(const double ar[], int n);
		Sales(Sales & s);
		~Sales();
		void showSales();
	};






}
