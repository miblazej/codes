#include <iostream>

using namespace std;


double calculate(double var1, double var2, double(*pf)(double, double));
double add(double x, double y);
double power(double x, double y);
double substract(double x, double y);


int main(void)
{
	double(*pf[3])(double, double);
	(pf[0]) = add;
	(pf[1]) = power;
	(pf[2]) = substract;
	while (1)
	{
		for (int i = 0; i < 3; i++)
			cout << calculate(10, 10, pf[i]) << endl;
	}
	getchar();
	getchar();

}

double calculate(double var1, double var2, double(*pf)(double, double))
{
	return (*pf)(var1, var2);
}

double add(double x, double y)
{
	return x + y;
}

double power(double x, double y)
{
	return pow(x, y);
}

double substract(double x, double y)
{
	return x - y;
}
