#define _GNU_SOURCE
#include <fenv.h>

#include <float.h>
#include <limits.h>
#include <setjmp.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

sigjmp_buf FESigjmp;

void sig_handler (int signal_number) {
	puts("Catch an exception.");
	siglongjmp(FESigjmp, 1);
}

int main () {
	volatile double x;

	// set up handler
	signal(SIGFPE, sig_handler);
	feenableexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW);

	// cause an underflow exception (not reported)
	x = DBL_MIN;
	printf("min_normal = %g\n", x);
	x = x / 13.0;
	printf("min_normal / 13.0 = %g\n", x);

	// cause an overflow exception (reported)
	x = DBL_MAX;
	printf("max_normal = %g\n", x);
	if (!sigsetjmp(FESigjmp, 1)) {
		x = x * x;
	}
	printf("max_normal * max_normal = %g\n", x);

	return 0;
}
