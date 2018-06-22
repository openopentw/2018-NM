function [p, iter, conv_rates] = bisec(f, p_star, a, b, tol)
    if f(a) * f(b) >= 0
        disp('f(a) * f(b) >= 0');
    else
        conv_rates = [];
        iter = 0;
        p = (a + b) / 2;
        while abs(f(p)) > tol
            iter = iter + 1;
            %% calculate next p
            if f(a) * f(p) < 0
                b = p;
            else
                a = p;
            end
            p = (a + b) / 2;
            %% calculate error rate
            if iter > 1
                conv_rates(end + 1) = abs((p - p_star) / last_err);
                % disp(conv_rates(end));
            end
            last_err = abs(p - p_star);
            % disp(last_err);
        end
    end
end