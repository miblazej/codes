#pragma once
#include<string>

struct customer {
	std::string fullname;
	double payment;
};

class Stack {
private:
	customer stack[20];
	int number_of_customers;
	double money;
public:
	Stack();
	~Stack();
	void Push(customer c);
	void Pop();
	void show();
};
