#include<iostream>
#include <string>

using namespace std;

class Stock
{
private:
	char * company;
	int shares;
	double share_val;
	double total_val;
	void set_tot() { total_val = shares * share_val; }
public:
	Stock(); // default constructor
	Stock(char * co, long n = 0, double pr = 0.0);
	~Stock(); // do-nothing destructor
	void buy(long num, double price);
	void sell(long num, double price);
	void update(double price);
	const Stock & topval(const Stock & s) const;
	friend ostream & operator<<(ostream & os, const Stock & s);
};