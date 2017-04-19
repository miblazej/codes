#include "mytime3.h"

Time::Time()
{
	hours = minutes = 0;
}

Time::Time(int h, int m)
{
	hours = h;
	minutes = m;
}

void Time::AddMin(int m)
{
	minutes += m;
	hours += minutes / 60;
	minutes %= 60;
}

void Time::AddHr(int h)
{
	hours += h;
}

void Time::Reset(int h, int m)
{
	hours = h;
	minutes = m;
}

void Time::show()
{
	std::cout << minutes << hours << std::endl;
}


Time operator+(const Time & t, const Time & t1) 
{
	Time sum;
	sum.minutes = t.minutes + t1.minutes;
	sum.hours = t.hours + t1.hours;
	return sum;
}

Time operator-(const Time & t, const Time & t1)
{
	Time sum;
	sum.minutes = t.minutes - t1.minutes;
	sum.hours = t.hours - t1.hours;
	return sum;
}

Time operator*(const Time & t, const double m)
{
	Time sum;
	int minutes_dummy;
	minutes_dummy = t.minutes * m;
	sum.hours += minutes_dummy / 60;
	sum.minutes += (minutes_dummy % 60);
	sum.hours = t.hours * m;
	return sum;
}

ostream & operator<<(ostream & os, const Time & t)
{

	os << t.hours << " hours " << t.minutes << " minutes " << std::endl;
	return os;
}
