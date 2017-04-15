#include <iostream>
#include "plorg.h"
using namespace std;


int main(void)
{
	Plorg plorg;
	plorg.say();
	plorg.eat(50);
	plorg.say();
	plorg.~Plorg();
	getchar();
	getchar();



}