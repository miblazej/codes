#include <iostream>

class Stonewt
{
public:
	enum Mode { STONES, POUND_WITH, POUND_WITHOUT };
	Mode type = STONES;
private:
	int stone;
	double pdf_left;
	double pound;
public:
	Stonewt(double lbs,Mode en);
	Stonewt(int stn, double lbs);
	Stonewt();
	~Stonewt();
	Stonewt operator+(const Stonewt & s) const;
	Stonewt operator-(const Stonewt & s) const;
	Stonewt operator*(const double n);
	bool operator>(const Stonewt & s) const;
	bool operator<(const Stonewt & s) const;
	bool operator>=(const Stonewt & s) const;
	bool operator<=(const Stonewt & s) const;
	bool operator==(const Stonewt & s) const;
	bool operator!=(const Stonewt & s) const;
	friend std::ostream & operator<<(std::ostream & os, const Stonewt & s);
};

Stonewt::Stonewt(double lbs, Mode en)
{
	if (en == STONES)
		stone = lbs / 14;
	else if (en == POUND_WITH)
	{
		pound = int(lbs) / 14;
		pdf_left = int(lbs) % 14;
	}
	else
		pound = int(lbs) / 14;
}

Stonewt::Stonewt(int stn, double lbs)
{
	stone = stn;
	pound = lbs;
	type = STONES;

}

Stonewt::Stonewt()
{
	stone = pound = pdf_left = 0;
	type = STONES;
}

Stonewt::~Stonewt()
{
	
}

Stonewt Stonewt::operator+(const Stonewt & s) const
{
	Stonewt sum;
	sum.pound = pound + s.pound;
	sum.stone = stone + s.stone;
	sum.pdf_left = pdf_left + s.pdf_left;
	return sum;
}

Stonewt Stonewt::operator-(const Stonewt & s) const
{
	Stonewt sum;
	sum.pound = pound - s.pound;
	sum.stone = stone - s.stone;
	sum.pdf_left = pdf_left - s.pdf_left;
	return sum;
}

Stonewt Stonewt::operator*(const double n)
{
	Stonewt sum;
	sum.pound = pound *n;
	sum.stone = stone *n;
	sum.stone += ((int)sum.pound % 14);
	sum.pdf_left = pdf_left *n;
	return sum;
}

bool Stonewt::operator>(const Stonewt & s) const
{
	int lbs_sum1, lbs_sum2;
	lbs_sum1 = lbs_sum2 = 0;
	lbs_sum1 = stone * 14 + pound;
	lbs_sum2 = s.stone * 14 + s.pound;
	if (lbs_sum1 > lbs_sum2)
		return true;
	else
		return false;
}

bool Stonewt::operator<(const Stonewt & s) const
{
	int lbs_sum1, lbs_sum2;
	lbs_sum1 = lbs_sum2 = 0;
	lbs_sum1 = stone * 14 + pound;
	lbs_sum2 = s.stone * 14 + s.pound;
	if (lbs_sum1 < lbs_sum2)
		return true;
	else
		return false;
}

bool Stonewt::operator>=(const Stonewt & s) const
{
	int lbs_sum1, lbs_sum2;
	lbs_sum1 = lbs_sum2 = 0;
	lbs_sum1 = stone * 14 + pound;
	lbs_sum2 = s.stone * 14 + s.pound;
	if (lbs_sum1 >= lbs_sum2)
		return true;
	else
		return false;
}

bool Stonewt::operator<=(const Stonewt & s) const
{
	int lbs_sum1, lbs_sum2;
	lbs_sum1 = lbs_sum2 = 0;
	lbs_sum1 = stone * 14 + pound;
	lbs_sum2 = s.stone * 14 + s.pound;
	if (lbs_sum1 <= lbs_sum2)
		return true;
	else
		return false;
}

bool Stonewt::operator==(const Stonewt & s) const
{
	int lbs_sum1, lbs_sum2;
	lbs_sum1 = lbs_sum2 = 0;
	lbs_sum1 = stone * 14 + pound;
	lbs_sum2 = s.stone * 14 + s.pound;
	if (lbs_sum1 == lbs_sum2)
		return true;
	else
		return false;
}

bool Stonewt::operator!=(const Stonewt & s) const
{
	int lbs_sum1, lbs_sum2;
	lbs_sum1 = lbs_sum2 = 0;
	lbs_sum1 = stone * 14 + pound;
	lbs_sum2 = s.stone * 14 + s.pound;
	if (lbs_sum1 != lbs_sum2)
		return true;
	else
		return false;
}

std::ostream & operator<<(std::ostream & os, const Stonewt & s)
{
	
	if (s.type == s.STONES)
		os << "Number of stone is equal to " << s.stone << " ,number of pound is equal to " << s.pound << std::endl;
	else if (s.type == s.POUND_WITH)
	{
		os << "Pounds: " << s.pound << " Rest " << s.pdf_left << std::endl;
	}
	else
		os << "Pound: " << s.pound << std::endl;

	return os;
}


int main(void)
{

	Stonewt a(10, 20);
	Stonewt b(10, 20);
	Stonewt c;
	c = a + b;
	std::cout << c;
	c = a * 2;
	std::cout << c;
	if (a == b)
	{
		std::cout << "True" << std::endl;
	}
	else
		std::cout << "False" << std::endl;
	if (a != b)
	{
		std::cout << "Not equal" << std::endl;
	}
	else
		std::cout << "Equal" << std::endl;

	getchar();
	





}