#include <iostream>
#include "golf.h"



int main(void)
{

	Golf Michal;
	Michal.show();
	Michal.setgolf("Michal", 19);
	Michal.show();
	Michal.~Golf();
	Golf Piotrek("Piotr", 12);
	Piotrek.show();
	Piotrek.~Golf();
	getchar();
	getchar();
	
	
	






}