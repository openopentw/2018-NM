% x = [-2 -1 0 1 2]';
% y = [4 -1 2 1 8]';
% xx = linspace(-2, 2, 101);

x = [0 1 2.5 3.6 5 7 8.1 10]';
y = sin(x) - cos(x);
xx = 0:.25:10;

[breaks, coefs] = my_spline(x, y);
pp = mkpp(breaks, coefs)
pp_vals = ppval(pp, xx);

[sp] = spline(x, y)
sp_vals = ppval(sp, xx);

mean(pp_vals)
mean(sqrt((pp_vals - sp_vals) .^ 2))

hold on
sp_o = plot(x, y, 'o', 'Color', 'k');
pp_line = plot(xx, pp_vals, '-', 'Color', 'b');
sp_line = plot(xx, sp_vals, '--', 'Color', 'r');
hold off

legend([sp_o, pp_line, sp_line], ...
    {'exact value given', 'My spline', "Matlab's spline"})
