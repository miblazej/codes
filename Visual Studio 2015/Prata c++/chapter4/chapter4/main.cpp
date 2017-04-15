#include <iostream>
#include <cstring>
#include <string>
#include <array>
using namespace std;

struct Pizza
{
	string Marka;
	float waga;
	float srednica;
};


int main(void)
{
	float sum = 0;
	array<float, 3> wyniki;
	for (int i = 0; i < 3; i++)
	{
		cout << "Podaj czas ";
		cin >> wyniki[i];
		sum += wyniki[i];
	}
	cout << "Srednia wynikow to: " << sum / 3;
	getchar();
	getchar();
}