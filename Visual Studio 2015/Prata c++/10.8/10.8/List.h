#pragma once
#include <iostream>

using namespace std;

class Lista
{	
private:
	int size;
	int index;
	int *myarray = new int[100];
public:
	Lista();
	Lista(int *array_in, int size1);
	void Add(int element);
	int IsEmpty();
	int IsFull();
	void visit(int &part, int value, void (*pf)(int & , int));
	int&  return_element(int index);
	void show();
};






