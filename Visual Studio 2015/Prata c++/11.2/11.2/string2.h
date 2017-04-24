#pragma once
#include <iostream>
#include <cctype>
using std::ostream;
using std::istream;
class String
{
private:
	char * str; // pointer to string
	int len; // length of string
	static int num_strings; // number of objects
	static const int CINLIM = 80; // cin input limit
public:
	// constructors and other methods
	String(const char * s); // constructor
	String(); // default constructor
	String(const String & st); // copy constructor
	~String(); // destructor
	int length() const { return len; }
	// overloaded operator methods
	String & operator=(const String & st);
	String & operator=(const char * st);
	char & operator[](int i);
	const char & operator[](int i) const;
	// overloaded operator friends
	String & operator+(const String &st);
	friend bool operator<(const String &st, const String &st2);
	friend bool operator>(const String &st1, const String &st2);
	friend bool operator==(const String &st, const String &st2);
	friend ostream & operator<<(ostream & os, const String & st);
	friend istream & operator>>(istream & is, String & st);
	// static function
	static int HowMany();
	void stringlow();
	void stringup();
	int HowManyCh(char s);
	void init();
};