#include "golf.h"

Golf::Golf()
{
	fullname[0] = '\0';
	handicap = 0;
}
Golf::Golf(Golf & g)
{
	handicap = g.handicap;
	for (int i = 0;; i++)
	{
		fullname[i] = g.fullname[i];
		if (g.fullname[i] == '\0')
			break;
	}
}
Golf::Golf(char *name, int hc)
{
	for (int i = 0;; i++)
	{
		fullname[i] = name[i];
		if (name[i] == '\0')
			break;
	}
	handicap = hc;
}

Golf::~Golf()
{
	cout << "Object do not exists anymore" << endl;
}

const Golf Golf::setgolf(char * name, int hc)
{
	this->handicap = hc;
	for (int i = 0;; i++)
	{
		this->fullname[i] = name[i];
		if (name[i] == '\0')
			break;
	}
	return *this;
}

void Golf::show()
{
	cout << fullname << endl;
	cout << handicap << endl;
}



