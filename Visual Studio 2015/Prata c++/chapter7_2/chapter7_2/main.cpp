#include <iostream>
#include <string>

const int Size = 10;
using namespace std;



double * fill_array(double tab[], int size);
void show_array(double tab[], double * last_element);
void reverse_array(double tab[], int size);

int main(void)
{
	double tab[Size];
	int size_2;
	show_array(tab, fill_array(tab, Size));

	getchar();
	getchar();


}

double * fill_array(double tab[], int size)
{
	int i = 0;
	double *ostatni_element;
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

	ostatni_element = &tab[i];
	return ostatni_element;
}

void show_array(double tab[], double * last_element)
{
	double * first_element;
	first_element = &tab[0];
	double a;
	while (first_element < last_element)
	{
		a = *first_element;
		cout << a << endl;
		first_element++;
	}
}

void reverse_array(double tab[], int size)	// bezsenoswny algorytm bo na bank juz ktos to wymuslil ale prosze zobaczyc jaki inteligetny jestem nawet sobie zapisze to
{

	
}
