function y = f(x)
    % roots: (x1, x2, x3) = (sqrt(-35/4 + 4*sqrt(5)), sqrt(3) / 2, -2 + sqrt(5))
    x1 = x(1);
    x2 = x(2);
    x3 = x(3);
    y = [x1^2 + x2^2 + x3^2 - 1;
        x1^2 + x3^2 - 1/4;
        x1^2 + x2^2 - 4*x3];
end
