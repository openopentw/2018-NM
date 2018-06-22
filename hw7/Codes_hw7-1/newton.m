function [p, iter, conv_rates] = newton(f, df, p_star, x0, tol, max_iter)
    conv_rates = [];
    iter = 0;
    p = x0;
    while (abs(f(p)) > tol) && (iter < max_iter)
        iter = iter + 1;
        % calculate next p
        p = p - f(p) / df(p);
        % display error rate
        if iter > 1
            conv_rates(end + 1) = abs((p - p_star) / (last_err ^ 2));
            disp(conv_rates(end));
        end
        last_err = abs(p - p_star);
    end
end
