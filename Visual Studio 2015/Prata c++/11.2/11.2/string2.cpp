#include "string2.h"

int String::num_strings = 0;

String::String(const char * s)
{
	delete[] str;
	len = strlen(s);
	str = new char[len + 1];
	strcpy(str, s);
	num_strings++;
}

String::String()
{
	delete[] str;
	len = 0;
	str = new char[len + 1];
	str[0] = '\0';
	num_strings++;
}

String::String(const String & st)
{
	num_strings++;
	len = st.len;
	str = new char[len + 1];
	strcpy(str, st.str);
}

String::~String()
{
	--num_strings;
	delete[] str;
}

String & String::operator=(const String & st)
{
	if (this == &st)
		return *this;
	delete[] str;
	len = st.len;
	str = new char[len + 1];
	strcpy(str, st.str);
	return *this;
}

String & String::operator=(const char * st)
{
	delete[] str;
	len = strlen(st);
	str = new char[len + 1];
	strcpy(str, st);
	return *this;
	// TODO: insert return statement here
}


char & String::operator[](int i)
{
	return str[i];

	// TODO: insert return statement here
}

const char & String::operator[](int i) const
{
	return str[i];
	// TODO: insert return statement here
}

String & String::operator+(const String & st)
{
	char * dummy;
	dummy = new char[strlen(str) + 1];
	len = strlen(str) + strlen(st.str);
	strcpy(dummy, str);
	str = new char[len + 1];
	strcpy(str, dummy);
	strcat(str, st.str);
	return *this;
}

int String::HowMany()
{
	return num_strings;
}

void String::stringlow()
{
	for (int i = 0; str[i]; i++)
		str[i] = tolower(str[i]);

}

void String::stringup()
{
	for (int i = 0; str[i]; i++)
		str[i] = toupper(str[i]);
}

int String::HowManyCh(char s)
{
	int number_of_char;
	number_of_char = 0;
	for (int i = 0; str[i]; i++)
	{
		if (str[i] == s)
			number_of_char++;
	}
	return number_of_char;
}

void String::init()
{
	num_strings = 0;
}

bool operator<(const String & st, const String & st2)
{
	if (strlen(st.str) < strlen(st2.str))
		return true;
	else
		return false;
}

bool operator>(const String & st1, const String & st2)
{
	if (strlen(st1.str) > strlen(st2.str))
		return true;
	else
		return false;
}

bool operator==(const String & st, const String & st2)
{
	return (strcmp(st.str, st2.str) == 0);
}

ostream & operator<<(ostream & os, const String & st)
{
	os << st.str;
	return os;
	// TODO: insert return statement here
}

istream & operator >> (istream & is, String & st)
{
	char temp[String::CINLIM];
	is.get(temp, String::CINLIM);
	if (is)
		st = temp;
	while (is && is.get() != '\n')
		continue;
	return is;
	// TODO: insert return statement here
}
