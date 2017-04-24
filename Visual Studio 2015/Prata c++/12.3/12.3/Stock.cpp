#include "Stock.h"

Stock::Stock()
{
	company = new char[1];
	company = '\0';
	share_val = 0;
	total_val = 0;

}

Stock::Stock(char * co, long n, double pr)
{
	int len;
	len = strlen(co);
	delete[] company;
	strcpy(company, co);
	share_val = pr;
	shares = n;
}

Stock::~Stock()
{
	delete[] company;
}

void Stock::buy(long num, double price)
{
	shares += num;
	share_val = price;
}

void Stock::sell(long num, double price)
{
	shares -= num;
	share_val = price;
}

void Stock::update(double price)
{
	share_val = price;
}


const Stock & Stock::topval(const Stock & s) const
{
	if (s.total_val > total_val)
		return s;
	else
		return *this;

	// TODO: insert return statement here
}

ostream & operator<<(ostream & os, const Stock & s)
{
	os << s.topval << endl;
	return os;
}
