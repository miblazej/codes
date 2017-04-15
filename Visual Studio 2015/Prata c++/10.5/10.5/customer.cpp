#include "customer.h"
#include <iostream>

Stack::Stack()
{
	number_of_customers = 0;
	money = 0;

}

Stack::~Stack()
{
	
	std::cout << "Money gathered: " << money;


}

void Stack::Push(customer c)
{
	stack[number_of_customers] = c;
	number_of_customers++;
}

void Stack::Pop()
{
	money += stack[number_of_customers-1].payment;
	stack[number_of_customers - 1].fullname = '\0';
	stack[number_of_customers - 1].payment = 0;
	number_of_customers--;
}

void Stack::show()
{
	for (int i = 0; i < number_of_customers; i++)
	{
		std::cout << stack[i].fullname << std::endl;
		std::cout << stack[i].payment << std::endl;


	}

}
