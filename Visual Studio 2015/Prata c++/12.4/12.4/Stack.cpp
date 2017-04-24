#include "Stack.h"

Stack::Stack(int n)
{
	size = n;
	top = 0;
	pitems = new Item[n];
}

Stack::Stack(const Stack & st)
{
	delete[] pitems;
	size = st.size;
	top = st.top;
	pitems = new Item[st.size];
}

Stack::~Stack()
{
	delete[] pitems;
}

bool Stack::isempty() const
{
	if (top == 0)
		return true;
	else
		return false;
}

bool Stack::isfull() const
{
	if (top == size)
		return true;
	else return false;
}

bool Stack::push(const Item & item)
{
	if (top > size)
	{
		pitems[top] = item;
		top++;
		return true;
	}
	else
	return false;
}

bool Stack::pop(Item & item)
{
	if (top > 0)
	{
		pitems[top] = 0;
		top--;
		return true;
	}
	else
		return false;
}

Stack & Stack::operator=(const Stack & st)
{
	delete[] pitems;
	size = st.size;
	top = st.top;
	pitems = new Item[size];

}
