#include<iostream>
using namespace std;

int main(void)
{
	int i;
	int j;
	int suma = 0;
	cout << "Podaj pierwsza liczbe: " << endl;
	cin >> i;
	cout << "Podaj druga liczbe: " << endl;
	cin >> j;
	for (; i < j + 1; i++)
		suma += i;
	cout << "Suma tych dwoch liczb to : " << suma << endl;
	getchar();
	getchar();
}