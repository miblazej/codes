#pragma once

const int lenght = 20;

class Plorg
{
private:
	char name[lenght];
	int satiety;
public:
	Plorg(char name_[20] = "Plorga", int sat = 50);
	~Plorg();
	void eat(int sat);
	void say();
};
