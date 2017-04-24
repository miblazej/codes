#pragma once
#include <iostream>
#include <string>

using namespace std;

class Cow {
	char name[20];
	char *hobby;
	double weight;
public:
	// defaulth constructor
	Cow();
	// second constructor
	Cow(const char *nm, const char *ho, double wt);
	// copying constructor
	Cow(const Cow &c);
	// defaulth destructor
	~Cow();
	// assignment operator
	Cow & operator=(const Cow & c);
	// print function
	void ShowCow() const;
};
