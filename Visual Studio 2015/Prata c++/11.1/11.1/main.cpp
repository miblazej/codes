#include <iostream>
#include <cstdlib>
#include <ctime>
#include <fstream>
#include "h1.h"



int main(void)
{
	using namespace std;
	using VECTOR::Vector;

	srand(time(0));

	double direction;
	Vector step;
	Vector result(0.0, 0.0);

	ofstream myfile;
	myfile.open("Way_1.txt");

	unsigned long steps = 0;
	double step_lenght = 0;
	cout << "How many random steps should be person make" << endl;
	cin >> steps;
	cout << "How long one step should be " << endl;
	cin >> step_lenght;
	myfile << "Number of steps: " << steps << ",lenght of step: " << step_lenght << endl;

	for (int i = 0; i < steps; i++)
	{
		direction = rand() % 360;
		step.reset(0.0,0.0);
		step.reset(step_lenght, direction, Vector::POL);
		result = result + step;
		myfile << "Step number: " << i + 1 << " position: " << result.xval() << "," << result.yval() << endl;
	}
	result.calc();
	myfile << "Step average lenght" << result.magval() / steps << endl;
	myfile << "Step final angle" << result.angval() << endl;
	myfile << "Normaly it will take " << result.magval() / step_lenght << " steps" << endl;
	myfile.close();
	return 0;
}