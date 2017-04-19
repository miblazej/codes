#pragma once
#include <iostream>

using namespace std;

class complex {
private:
	double real;
	double imag;
public:
	complex(double real_ = 0, double imag_ = 0);
	~complex();
	complex operator+(const complex & n);
	complex operator-(const complex & n);
	complex operator*(const complex & n);
	complex operator*(const double real_number);
	complex operator~();
	friend ostream & operator<<(ostream & os, const complex & n);
	friend istream & operator>>(istream & in, complex & n);
};

int main(void)
{
	complex c;
	cin >> c;
	cout << c;
	getchar();
	getchar();




}