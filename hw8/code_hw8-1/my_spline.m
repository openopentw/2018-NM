function [breaks, coefs] = my_spline(x, y)
    breaks = x;
    [n, ~] = size(y);
    n = n - 1;

    %% solve a
    a = y;

    %% solve c
    h = x(2: n+1) - x(1: n);

    tmp_system_A = zeros(n-1, n+1);
    tmp_system_A(1:n-1, 1:n-1) = tmp_system_A(1:n-1, 1:n-1) + diag(h(1:n-1));
    tmp_system_A(1:n-1, 2:n)   = tmp_system_A(1:n-1, 2:n)   + diag(2 * (h(1:n-1) + h(2:n)));
    tmp_system_A(1:n-1, 3:n+1) = tmp_system_A(1:n-1, 3:n+1) + diag(h(2:n));
    system_A = tmp_system_A(1:n-1, 2:n);

    tmp_system_b = (3 ./ h) .* (a(2:n+1) - a(1:n));
    system_b = tmp_system_b(2: n) - tmp_system_b(1: n-1);

    c = zeros(n+1, 1);
    c(2:n) = system_A \ system_b;

    %% solve b
    b = (1 ./ h) .* (a(2:n+1) - a(1:n)) - (h ./ 3) .* (2 * c(1:n) + c(2:n+1));

    %% solve d
    d = (c(2:n+1) - c(1:n)) ./ (3 .* h);

    %% combine a, b, c, d
    coefs = [d, c(1:n), b, a(1:n)];
end
