#include <iostream>
#include <cctype>
#include <string>
#include <fstream>

const int SIZE = 500;

using namespace std;




int main(void)
{
	ifstream myReadFile;
	myReadFile.open("pamietenik.txt");
	char c;
	long int i = 0;
	while (myReadFile.get(c))
	{
		i++;
	}
	myReadFile.close();
	cout << "Plik posiada " << i << " znakow" << endl;

	getchar();
	getchar();
	
}
	
