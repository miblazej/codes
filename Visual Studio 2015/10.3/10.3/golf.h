#pragma once
#include<iostream>

using namespace std;

const int len = 40;

class Golf
{
private:
	char fullname[len];
	int handicap;
public:
	Golf();
	Golf(Golf & g);
	Golf(char *name, int hc);
	~Golf();
	const Golf setgolf(char * name, int hc);
	void show();

};
