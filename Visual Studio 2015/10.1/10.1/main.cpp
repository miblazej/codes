#include<iostream>
#include<string>
using namespace std;

class Acc {
private:
	string name;
	string acc_number;
	double money;
public:
	// default contructor
	Acc()
	{
		name = "null";
		acc_number = "null";
		money = 0;


	}
	Acc(string name1, string acc_number1, double money1)
	{
		name = name1;
		acc_number = acc_number1;
		money = money1;
	}
	//Destructor
	~Acc()
	{
		cout << "Account is closed" << endl;
	}
	void Print()
	{
		cout << "Name " << name << endl;
		cout << "Account number " << acc_number << endl;
		cout << "Money " << money << endl;
	}
	void TransferIn(double money_in)
	{
		money += money_in;
	}
	void TransferOut(double money_out)
	{
		money -= money_out;
	}
};

int main(void)
{
	// Default construction
	Acc Michala;
	Michala.Print();
	Michala.~Acc();
	// Construction with parameters
	Acc Michal("Michal", "12345567", 1000);
	Michal.Print();
	Michal.TransferIn(150);
	Michal.Print();
	Michal.TransferOut(300);
	Michal.Print();
	// Object destruction
	Michal.~Acc();
	getchar();
	
}