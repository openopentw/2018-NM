format long;

TOL = 1e-7;
MAX_ITER = 30;
X0 = [44; 86; 23];

[p, iter] = newton(@f, @df, X0, TOL, MAX_ITER);
p
iter