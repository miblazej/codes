#include "List.h"


inline Lista::Lista()
{
	int *myarray = new int[20];
	size = 20;
	index = 0;
}



Lista::Lista(int * array_in, int size1)
{
	size = size1;
	index = 0;
	for (int i = 0; i < size; i++,index++)
		myarray[i] = array_in[i];

}

void Lista::Add(int element)
{
	if (element < size)
		myarray[index] = element;
	else
		cout << "List if full";
}

int Lista::IsEmpty()
{

	if (index == 0)
		return 1;
	else
		return 0;
}


int Lista::IsFull()
{
	if(index == (size))
		return 1;
	else 
		return 0;
}

void Lista::visit(int &part, int value,void(*pf)(int &, int))
{
	(*pf)(part, value);

}

int & Lista::return_element(int index)
{
	
	return myarray[index];
}

void Lista::show()
{
	for (int i = 0; i < size; i++)
	{
		cout << "Element number: " << myarray[i] << endl;
	}
}




