from math import exp

res = 0.0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000053308927463458623
print(res)

print("python ver: ")
A = - 64.0
B = 0.0
f = 1.0
res1 = 1 - (1 / (1 + exp(A * f + B)));
print(res1)
res2 = (exp(A * f + B)) / (1 + exp(A * f + B));
print(res2)

print("== Below is my experiment. ==")
print(exp(A * f + B));
print(1 + exp(A * f + B));
print(1 / (1 + exp(A * f + B)));
