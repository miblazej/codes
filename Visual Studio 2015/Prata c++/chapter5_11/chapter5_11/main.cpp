#include <iostream>
#include <string>
#include <cstring>
using namespace std;

struct Car
{
	string Marka;
	int rok_produkcji;


};

int main(void)
{
	int liczba_wierszy;
	int b;
	cout << "Podaj liczbe wierszy: " << endl;
	cin >> liczba_wierszy;
	for (int i = 1; i <= liczba_wierszy; i++)
	{
		
		for (int j = 0; j < (liczba_wierszy - i); j++)
			printf(".");
		for (int j = 0; j < (i); j++)
			printf("*");
		printf("\n");
	}
	
	getchar();
	getchar();

}