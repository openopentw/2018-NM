function [p, iter] = newton(f, df, x0, tol, max_iter)
    iter = 0;
    p = x0;
    while (sum(f(p) .^ 2) > tol) && (iter < max_iter)
        iter = iter + 1;
        p = p - df(p) \ f(p);
    end
end
