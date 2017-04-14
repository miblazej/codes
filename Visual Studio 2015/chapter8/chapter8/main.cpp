#include <iostream>
#include <string>

using namespace std;



template <typename T>
T maxn(T *tab,int n);


template <> const char* maxn<const char*>(const char* tab[], int n);






int main(void)
{
	int a[4] = { 1,2,3,4};
	double c[5] = { 1,2,3,4,5 };
	const char * d[3] = { "Andzerj","Pasdfsdfsdfsdfsdfsdfsdgsdgsdgsdfdsfwel","kuba" };

	cout << maxn(a, 4) << endl;
	cout << maxn(c, 5) << endl;
	cout << maxn(d, 3) << endl;
	
	getchar();
	getchar();

}



template<typename T>
T maxn(T * tab, int n)
{
	T max;
	max = tab[0];
	for (int i = 0; i < n; i++)
		max = max > tab[i] ? max : tab[i];


	return max;
	
}

template<>
int maxn(int * tab, int n)
{
	return 0;
}

template<>
const char * maxn(const char * tab[], int n)
{
	const char *p;
	int a, b;
	p = tab[0];
	for (int i = 0; i < n; i++)
	{
		p = strlen(p) > strlen(tab[i]) ? p : tab[i];
	}

	return p;
}


