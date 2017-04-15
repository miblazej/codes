#include <iostream>
#include <array>
#include <vector>

using namespace std;

int przypis(std::array<int,5> abc);
void drugi_element(std::array<float, 10> ideas);
struct ryba
{
	string rodzaj;
	int waga;
	float dlugosc;
};
enum a {Tak=1,Nie=0,Chyba=2};

int main(void)
{
	char aktorzy[30];
	short bestie[100];
	float chuck[13];
	long double dipsea[64];

	array<char, 30> aktorzy1;
	array<short, 100> bestie1;
	array<float, 13> chuck1;
	array<long double, 64> dipsea1;

	array < int, 5> liczby = { 1,3,5,7,9 };
	int a;
	a = przypis(liczby);
	array<float, 10> idaes = { 1,2,3,4,5,6,7,8,9,10 };
	drugi_element(idaes);
	char abc[] = "cheeseburger";
	string s1 = "Waldorf Salat";

	ryba wegorz;
	wegorz.rodzaj = "slodkowodna";
	wegorz.waga = 1400;
	wegorz.dlugosc = 15.23;

	double ted = 10;
	double *wskaznik;
	wskaznik = &ted;
	
	float treacle[] = {1,2,3,4,5,6,7,8,9,10};
	float *wskaz;
	wskaz = &treacle[0];
	cout << *wskaz;
	wskaz = &treacle[9];
	cout << *wskaz << endl;

	cout << "Podaj liczbe !" << endl;
	int i;
	cin >> i;
	int *dynamic = new int[i];

	ryba * szczupak = new ryba;
	szczupak->rodzaj = "slodkowodna";
	szczupak->waga = 1000;
	szczupak->dlugosc = 31.4;

	vector<string> stringi;
	stringi.size() << 10;
	array<string, 10> stringi_array;





	

}

int przypis(std::array<int, 5> abc)
{
	return abc[0] + abc[4];

}
void drugi_element(std::array<float, 10> ideas)
{
	cout << ideas[2] << endl;


}
