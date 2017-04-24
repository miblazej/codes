#include "cd.h"

Cd::Cd(char * s1, char * s2, int n, double x): selections(n), playtime(x)
{

	delete[] performers;
	delete[] label;
	int len;
	len = strlen(s1);
	performers = new char[len +1];
	len = strlen(s2);
	label = new char[len + 1];
	strcpy(performers, s1);
	strcpy(label, s2);
}

Cd::Cd(const Cd & d)
{
	delete[] performers;
	delete[] label;
	int len;
	len = strlen(d.performers);
	performers = new char[len + 1];
	len = strlen(d.label);
	label = new char[len + 1];
	strcpy(performers, d.performers);
	strcpy(label, d.label);
	selections = d.selections;
	playtime = d.playtime;
}

Cd::Cd()
{
	delete[] performers;
	delete[] label;
	performers = new char[1];
	label = new char[1];
	performers[0] = '\0';
	label[0] = '\0';
	selections = 0;
	playtime = 0;
}

Cd::~Cd()
{
	delete[] performers;
	delete[] label;
}

void Cd::Report() const
{
	std::cout << performers << std::endl;
	std::cout << label << std::endl;
	std::cout << "Selections: " << selections << std::endl;
	std::cout << "Playtime: " << playtime << std::endl;
}

Cd & Cd::operator=(const Cd & d)
{
	if (this == &d)
		return *this;
	delete[] performers;
	delete[] label;
	int len;
	len = strlen(d.performers);
	performers = new char[len + 1];
	strcpy(performers, d.performers);
	len = strlen(d.label);
	label = new char[len + 1];
	strcpy(label, d.label);
	playtime = d.playtime;
	selections = d.selections;
	return *this;
	// TODO: insert return statement here
}

void Classic::Report() const
{
	std::cout << performers << std::endl;
	std::cout << label << std::endl;
	std::cout << main_song << std::endl;
	std::cout << "Selections: " << selections << std::endl;
	std::cout << "Playtime: " << playtime << std::endl;

}

Classic::Classic(char * s1, char * s2,char * s3,int n, double x) : Cd(s1,s2,n,x)
{
	delete[] main_song;
	int len;
	len = strlen(s3);
	main_song = new char[len + 1];
	strcpy(main_song, s3);
}

Classic::Classic(const Classic & d) : Cd(d)
{
	delete[] main_song;
	int len;
	len = strlen(main_song);
	main_song = new char[len + 1];
	strcpy(main_song, d.main_song);
}

Classic::Classic() : Cd()
{
	delete[] main_song;
	main_song = new char[1];
	main_song[0] = '\0'; 
}

Classic::~Classic()
{
	delete[] main_song;
}

Classic & Classic::operator=(const Classic & d)
{
	if (this == &d)
		return *this;
	Cd::operator=(d);
	delete[] main_song;
	int len;
	len = strlen(main_song);
	main_song = new char[len + 1];
	strcpy(main_song, d.main_song);
	return *this;

}
