#include "h1.h"

using namespace std;

void VECTOR::Vector::set_mag()
{
	mag = sqrt(x*x + y*y);
}

void VECTOR::Vector::set_ang()
{
	if (x == 0.0 && y == 0.0)
		ang = 0;
	else ang = atan2(y, x);
}

void VECTOR::Vector::set_x()
{
	x = cos(ang)*mag;
}

void VECTOR::Vector::set_y()
{
	y = sin(ang) * mag;
}

VECTOR::Vector::Vector()
{
	x = y = ang = mag = 0;
	mode = POL;
	
}

VECTOR::Vector::Vector(double n1, double n2, Mode form)
{
	if (form == RECT)
	{
		x = n1;
		y = n2;
		set_ang();
		set_mag();
	}
	else if (form == POL)
	{
		mag = n1;
		ang = n2 / Rad_to_deg;
		set_x();
		set_y();

	}
	else
	{
		cout << "Non aproprieate value of third element, vector will be equal to zero" << endl;
		x = y = mag = ang = 0;
		mode = RECT;
	}


}

void VECTOR::Vector::reset(double n1, double n2, Mode form)
{
	if (form == RECT)
	{
		x = n1;
		y = n2;
		set_ang();
		set_mag();
	}
	else if (form == POL)
	{
		mag = n1;
		ang = n2 / Rad_to_deg;
		set_x();
		set_y();

	}
	else
	{
		cout << "Non aproprieate value of third element, vector will be equal to zero" << endl;
		x = y = mag = ang = 0;
		mode = RECT;
	}

}

VECTOR::Vector::~Vector()
{
}

void VECTOR::Vector::polar_mode()
{
	mode = POL;
}

void VECTOR::Vector::rect_mode()
{
	mode = RECT;
}

VECTOR::Vector VECTOR::Vector::operator+(const Vector & b) const
{
	return Vector(x + b.x, y + b.y);
}

VECTOR::Vector VECTOR::Vector::operator-(const Vector & b) const
{
	return Vector(x - b.x, y-b.y);
}

VECTOR::Vector VECTOR::Vector::operator-() const
{
	return Vector(-x, -y);
}

VECTOR::Vector VECTOR::Vector::operator*(double n) const
{
	return Vector( n*x,x*y);
}

void VECTOR::Vector::operator=(const Vector & b)
{
	Vector( x = b.x, y = b.y);
}

void VECTOR::Vector::calc()
{
	set_mag();
	set_ang();
}

VECTOR::Vector VECTOR::operator*(double n, const Vector & a)
{
	return a*n;
}

std::ostream & VECTOR::operator<<(std::ostream & os, const Vector & v)
{
	if (v.mode == Vector::RECT)
		os << "(x,y) = (" << v.x << "," << v.y << ")" << endl;
	else if (v.mode == Vector::POL)
		os << "(m,a) = (" << v.mag << "," << v.ang << ")" << endl;
	return os;
}
