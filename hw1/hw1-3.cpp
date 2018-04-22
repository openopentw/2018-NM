#include <stdio.h>

#include <complex>

using namespace std;

int main() {
	double A = - 64.0,
		   B = 0.0,
		   f = 1.0;
	double res1 = 1 - (1 / (1 + exp(A * f + B)));
	printf("%.17g\n", res1);
	double res2 = (exp(A * f + B)) / (1 + exp(A * f + B));
	printf("%.17g\n", res2);

	puts("== Below is my experiment. ==");
	printf("%.17g\n", (double) 1);
	printf("%.17g\n", exp(A * f + B));
	printf("%.17g\n", (double) 1 + exp(A * f + B));
	printf("%.17g\n", (double) 1 / (1 + exp(A * f + B)));
	return 0;
}
