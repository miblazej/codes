#include <iostream>
#include<math.h>
#include<stdint.h>
#include <chrono>
#include <thread>



using namespace std;
#define MAX 100000000
#define _CRT_OBSOLETE_NO_WARNINGS

int main()
{
	// semidefinitive matrix
	double A[3][3] = { {5,-1,2},{3,8,-2},{1,1,4}
	};
	//Error calculation
	double error;
	// omega for sor calculations
	float omega = 0.5;
	double B[3][1] = { { 12 }, { -25 }, {6}
	};
	// vector with old x values
	double x_old[3][1] = {{ 0 }, { 0 }, { 0 }
	};
	double a;
	// vector with new x values
	double x_new[3][1] = { { 0 },{ 0 },{ 0 }
	};
	// Jacobi method
	for (int n = 0; n < MAX; n++)
	{
		
		x_new[0][0] = (B[0][0] + ((-1)*A[0][1] * x_old[1][0] +(-1)*A[0][2] * x_old[2][0])) / A[0][0];
		x_new[1][0] = (B[1][0] + ((-1)*A[1][0] * x_old[0][0] +(-1)* A[1][2] * x_old[2][0]))/ A[1][1];
		x_new[2][0] = (B[2][0] + ((-1)*A[2][0] * x_old[0][0] +(-1)*A[2][1] * x_old[1][0])) / A[2][2];
		// x update
		for (int m = 0; m < 3; m++)
		{
			x_old[m][0] = x_new[m][0];
		}
		// error calculation
		double evaluation;
		error = 0;
		for (int o = 0; o < 3; o++)
		{
			evaluation = ((A[o][0] * x_old[0][0] + A[o][1] * x_old[1][0] + A[o][2] * x_old[2][0]));
			error += abs((B[o][0] - evaluation));
		}
		cout << "Iteration count: " << n << endl;
		cout << "x1 " << x_old[0][0] << endl;
		cout << "x2 " << x_old[1][0] << endl;
		cout << "x3 " << x_old[2][0] << endl;
		cout << "Error value: " << error << endl;
		std::this_thread::sleep_for(std::chrono::milliseconds(1000));
		
		if (error < 0.000001)
		{
			cout << " Final iteration count: " << n << endl;
			cout << "x1 " << x_old[0][0] << endl;
			cout << "x2 " << x_old[1][0] << endl;
			cout << "x3 " << x_old[2][0] << endl;
			cout << "Error value: " << error << endl;
			break;
		}
	}
	// Gaus riesel method
	cout << "Gaus riesel method" << endl;
	for (int m = 0; m < 3; m++)
	{
		x_new[m][0] =0;
	}
	for (int n = 0; n < MAX; n++)
	{

		x_new[0][0] = (B[0][0] + ((-1)*A[0][1] * x_new[1][0] + (-1)*A[0][2] * x_new[2][0])) / A[0][0];
		x_new[1][0] = (B[1][0] + ((-1)*A[1][0] * x_new[0][0] + (-1)*A[1][2] * x_new[2][0])) / A[1][1];
		x_new[2][0] = (B[2][0] + ((-1)*A[2][0] * x_new[0][0] + (-1)*A[2][1] * x_new[1][0])) / A[2][2];
		// x update
		
		// error calculation
		double evaluation;
		error = 0;
		for (int o = 0; o < 3; o++)
		{
			evaluation = ((A[o][0] * x_new[0][0] + A[o][1] * x_new[1][0] + A[o][2] * x_new[2][0]));
			error += abs((B[o][0] - evaluation));
		}
		cout << "Iteration count: " << n << endl;
		cout << "x1 " << x_new[0][0] << endl;
		cout << "x2 " << x_new[1][0] << endl;
		cout << "x3 " << x_new[2][0] << endl;
		cout << "Error value: " << error << endl;
		std::this_thread::sleep_for(std::chrono::milliseconds(1000));

		if (error < 0.000001)
		{
			cout << " Final iteration count: " << n << endl;
			cout << "x1 " << x_new[0][0] << endl;
			cout << "x2 " << x_new[1][0] << endl;
			cout << "x3 " << x_new[2][0] << endl;
			cout << "Error value: " << error << endl;
			break;
		}
	}
	// SOR method
	cout << "SOR method" << endl;
	for (int m = 0; m < 3; m++)
	{
		x_new[m][0] = 0;
	}
	for (int n = 0; n < MAX; n++)
	{

		x_new[0][0] -= (omega / A[0][0]) * ((A[0][0] * x_new[0][0] + A[0][1] * x_new[1][0] + A[0][2] * x_new[2][0]) - B[0][0]);
		x_new[1][0] -= (omega / A[1][1]) * ((A[1][0] * x_new[0][0] + A[1][1] * x_new[1][0] + A[1][2] * x_new[2][0]) - B[1][0]);
		x_new[2][0] -= (omega / A[2][2]) * ((A[2][0] * x_new[0][0] + A[2][1] * x_new[1][0] + A[2][2] * x_new[2][0]) - B[2][0]);
		// x update

		// error calculation
		double evaluation;
		error = 0;
		for (int o = 0; o < 3; o++)
		{
			evaluation = ((A[o][0] * x_new[0][0] + A[o][1] * x_new[1][0] + A[o][2] * x_new[2][0]));
			error += abs((B[o][0] - evaluation));
		}
		cout << "Iteration count: " << n << endl;
		cout << "x1 " << x_new[0][0] << endl;
		cout << "x2 " << x_new[1][0] << endl;
		cout << "x3 " << x_new[2][0] << endl;
		cout << "Error value: " << error << endl;
		std::this_thread::sleep_for(std::chrono::milliseconds(1000));

		if (error < 0.000001)
		{
			cout << " Final iteration count: " << n << endl;
			cout << "x1 " << x_new[0][0] << endl;
			cout << "x2 " << x_new[1][0] << endl;
			cout << "x3 " << x_new[2][0] << endl;
			cout << "Error value: " << error << endl;
			break;
		}
	}


	getchar();
	
	







	return 0;
}



