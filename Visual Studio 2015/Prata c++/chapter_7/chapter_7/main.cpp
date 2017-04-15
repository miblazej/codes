#include <iostream>
#include <string>

const int Size = 10;
using namespace std;



int fill_array(double tab[],int size);
void show_array(double tab[], int size);
void reverse_array(double tab[], int size);

int main(void)
{
	double tab[Size];
	int size_2;
	size_2 = fill_array(tab, Size);
	show_array(tab, size_2);
	reverse_array(tab, size_2);
	show_array(tab, size_2);
	getchar();
	getchar();
	

}

int fill_array(double tab[], int size)
{
	int i = 0;
	cout << "Podaj liczbe" << endl;
	while (cin >> tab[i] && i < size)
	{
		
		if (i < (size - 1))
		{
			cout << "Podaj liczbe " << endl;
			i++;
		}
		else
		{
			i++;
			break;
		}
	}

	return i;
}

void show_array(double tab[], int size)
{
	int i = 0;
	double a;
	while (i < size)
	{
		a = tab[i];
		cout << a << endl;
		i++;
	}
}

void reverse_array(double tab[], int size)	// bezsenoswny algorytm bo na bank juz ktos to wymuslil ale prosze zobaczyc jaki inteligetny jestem nawet sobie zapisze to
{
	double dummy;
	double dwa;
		for (int i = 0; i < (size / 2); i++)
		{
			dummy = tab[i];
			dwa = tab[(size - 1) - i];
			tab[i] = dwa;
			tab[(size-1) - i] = dummy;
		}
}
