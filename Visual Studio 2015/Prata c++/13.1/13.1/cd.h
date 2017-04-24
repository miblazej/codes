#include <iostream>
// base class
class Cd { // represents a CD disk
protected:
	char * performers;
	char * label;
	int selections; // number of selections
	double playtime; // playing time in minutes
public:
	Cd(char * s1, char * s2, int n, double x);
	Cd(const Cd & d);
	Cd();
	~Cd();
	virtual void Report() const; // reports all CD data
	Cd & operator=(const Cd & d);
};

class Classic :public Cd
{
private:
	char * main_song;
public:
	virtual void Report() const;
	Classic(char * s1, char * s2,char * s3, int n, double x);
	Classic(const Classic & d);
	Classic();
	~Classic();
	Classic & operator=(const Classic & d);



};
