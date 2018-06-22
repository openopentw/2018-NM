function y = df(x)
    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    y = [2 * x1, 2 * x2, 2 * x3;
        2 * x1, 0, 2 * x3;
        2 * x1, 2 * x2, -4];
end