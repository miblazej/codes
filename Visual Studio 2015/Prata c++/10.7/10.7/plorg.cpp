#include "plorg.h"
#include <iostream>

Plorg::Plorg(char name_[20], int sat)
{
	for (int i = 0; i < lenght; i++)
	{
		name[i] = name_[i];
		if (name_[i] == '\0')
			break;
	}
	satiety = sat;
}

Plorg::~Plorg()
{
	std::cout << name << " death" << std::endl;
}

void Plorg::eat(int sat)
{
	satiety += sat;
}

void Plorg::say()
{
	std::cout << "Me name " << name << " I am hungry as " << satiety << std::endl;
}
