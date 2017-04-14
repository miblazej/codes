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
		fullname[i] = g.fullname[i];
		if (g.fullname[i] == '\0')
			break;
	}
	handicap = hc;
}

Golf Golf::setgolf(char * name, int hc)
{
	



}

