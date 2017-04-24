#include "string2.h"
#include<iostream>
using namespace std;

int main(void)
{
	
	String a("abecadlo");
	String b;
	b = a;
	cout << b << endl;
	cout << b.HowManyCh('a') << endl;
	String c("analfabetyzm");
	String d;
	d = a + c;
	cout << d << endl;
	cout << d.HowManyCh('a') << endl;
	getchar();
	getchar();





}