#include "person.h"


using namespace std;

Person::Person(const std::string & ln, const char * fn)
{
	lname = ln;
	for (int i = 0;; i++)
	{
		fname[i] = fn[i];
		if (fn[i] == '\0')
			break;
	}
}

void Person::Show() const
{
	cout << "First name: " << fname << " Second name: " << lname << endl;
}

void Person::FormalShow() const
{
	cout << "Last name: " << lname << " First name: " << fname << endl;
}
