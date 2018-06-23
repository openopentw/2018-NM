function [coefs] = qua_least_square (x, y)
	[m, ~] = size(x);

	sum_x   = sum(x);
	sum_x_2 = sum(x .^ 2);
	sum_x_3 = sum(x .^ 3);
	sum_x_4 = sum(x .^ 4);

	sum_y     = sum(y);
	sum_x_y   = sum(x .* y);
	sum_x_2_y = sum((x .^ 2) .* y);

	system_A = [sum_x_2, sum_x, m;
		sum_x_3, sum_x_2, sum_x;
		sum_x_4, sum_x_3, sum_x_2];

	system_b = [sum_y; sum_x_y; sum_x_2_y];

	coefs = system_A \ system_b;
end
