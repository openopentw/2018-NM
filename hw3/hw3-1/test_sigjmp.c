#define _GNU_SOURCE
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <setjmp.h>
#include <math.h>
#include <errno.h>
#include <float.h>
#include <fenv.h>

sigjmp_buf oh_snap;

void overflow_handler(int signal_number) {
    if (feclearexcept(FE_OVERFLOW | FE_UNDERFLOW | FE_DIVBYZERO | FE_INVALID)){
        fprintf(stdout, "Nothing Cleared!\n");
    }
    else{
        fprintf(stdout, "All Cleared!\n");
    }
    siglongjmp(oh_snap, 1);

    return;
}

int main(void) {
    float oops;
    int failure = feenableexcept(FE_OVERFLOW | FE_UNDERFLOW | FE_DIVBYZERO | FE_INVALID);
    if (failure){ fprintf(stdout, "FE ENABLE EXCEPTIONS FAILED!\n"); }
    signal(SIGFPE, overflow_handler);
    if (sigsetjmp(oh_snap, 1)) {
    puts("IN1");
      printf("Oh snap!\n");
    } else {
    puts("IN2");
      oops = exp(-708.5);
      fprintf(stdout, "Oops: %f\n", oops);
    }
    puts("END");
    return 0;
}
