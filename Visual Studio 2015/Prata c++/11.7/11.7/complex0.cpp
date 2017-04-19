#include "complex0.h"


complex::complex(double real_, double imag_)
{
	real = real_;
	imag = imag_;
}

complex::~complex()
{
	cout << "Object is destroyed" << endl;
}

complex complex::operator+(const complex & n)
{
	complex num;
	num.real = real + n.real;
	num.imag = imag + n.imag;
	return num;
}

complex complex::operator-(const complex & n)
{
	complex num;
	num.real = real - n.real;
	num.imag = imag - n.imag;
	return num;
}

complex complex::operator*(const complex & n)
{
	complex num;
	num.real = real * n.real - imag * n.imag;
	num.imag = real * n.imag + imag * n.real;
	return num;
}

complex complex::operator*(const double real_number)
{
	complex num;
	num.real = real * real_number;
	num.imag = imag * real_number;
	return num;
}

complex complex::operator~()
{
	complex num;
	num.real = real;
	num.imag = -imag;
	return num;
}

ostream & operator<<(ostream & os, const complex & n)
{
	os << "(" << n.real << "," << n.imag << "i)" << endl;
	return os;

	// TODO: insert return statement here
}

istream & operator >> (istream & in, complex & n)
{
	int real, imag;
	cout << "Real part:" << endl;
	cin >> real;
	n.real = real;
	cout << "Imaginary part:" << endl;
	cin >> imag;
	n.imag = imag;
	return in;
	
}
