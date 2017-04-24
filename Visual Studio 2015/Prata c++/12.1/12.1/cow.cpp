#include "cow.h"

Cow::Cow()
{
	name[0] = '\0';
	hobby = new char[1];
	hobby[0] = '\0';
	weight = 0;
}

Cow::Cow(const char * nm, const char * ho, double wt)
{
	for (int i = 0; nm[i] != '\0' && i < 20; i++)
		name[i] = nm[i];
	int len;
	len = strlen(ho);
	delete[] hobby;
	hobby = new char[len + 1];
	strcpy(hobby, ho);
	weight = wt;
}

Cow::Cow(const Cow & c)
{
	for (int i = 0; c.name[i] != '\0' && i < 20; i++)
		name[i] = c.name[i];
	int len;
	len = strlen(c.hobby);
	delete[] hobby;
	hobby = new char[len + 1];
	strcpy(hobby, c.hobby);
	weight = c.weight;
}

Cow::~Cow()
{
	delete[] hobby;
	delete[] name;
	
}

Cow & Cow::operator=(const Cow & c)
{
	if (this == &c)
		return *this;
	for (int i = 0; c.name[i] != '\0' && i < 20; i++)
		name[i] = c.name[i];
	delete[] hobby;
	int len = strlen(c.hobby);
	hobby = new char[len + 1];
	strcpy(hobby, c.hobby);
	weight = c.weight;
	return *this;
}

void Cow::ShowCow() const
{
	cout << "Name " << name << " Hobby " << hobby << " Weight " << weight << endl;
}
