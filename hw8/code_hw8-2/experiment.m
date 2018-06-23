% x = rand(20, 1);
% y = rand(20, 1);
% xx = linspace(min(x), max(x), 100);

x = [2100 2300 2500 2700 2900 3100 3300 3500 3700 3900 4100 4300]';
y = [48 42 31 34 31 21 23 23 21 16 17 21]';
xx = 2100: 10: 4300;

[coefs] = qua_least_square(x, y);
pv = polyval(coefs, xx);

hold on
qua_o    = plot(x, y, 'o', 'Color', 'k');
qua_line = plot(xx, pv, '-', 'Color', 'b');
hold off

legend([qua_o, qua_line], {'exact value given', 'quadratic least square'});
