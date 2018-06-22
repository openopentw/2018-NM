format long;

TOL = 1e-14;
MAX_ITER = 20;

% %% f1
% disp('f1');
% 
% Func = @f1;
% DFunc = @df1;
% BEG = 0.65;
% END = 8;
% P_STAR = 1;
% 
% disp('bisec');
% [p, iter, conv_rates] = bisec(Func, P_STAR, BEG, END, TOL);
% disp(p);
% disp(iter);
% % disp(conv_rates);
% 
% disp('newton');
% [p, iter, conv_rates] = newton(Func, DFunc, P_STAR, END, TOL, MAX_ITER);
% disp(p);
% disp(iter);
% % disp(conv_rates);

% %% f2 disp('f2');
% 
% Func = @f2;
% DFunc = @df2;
% BEG = -2;
% END = 2;
% P_STAR = 0.785398163397448;
% 
% disp('bisec');
% [p, iter, conv_rates] = bisec(Func, P_STAR, BEG, END, TOL);
% disp(p);
% disp(iter);
% % disp(conv_rates);
% 
% disp('newton');
% [p, iter, conv_rates] = newton(Func, DFunc, P_STAR, END, TOL, MAX_ITER);
% disp(p);
% disp(iter);
% % disp(conv_rates);

%% f3 disp('f3');

Func = @f3;
DFunc = @df3;
BEG = -3.7;
END = 4.7;
P_STAR = 0;

disp('bisec');
[p, iter, conv_rates] = bisec(Func, P_STAR, BEG, END, TOL);
% disp(p);
% disp(iter);
% disp(conv_rates);

disp('newton');
[p, iter, conv_rates] = newton(Func, DFunc, P_STAR, END, TOL, MAX_ITER);
% disp(p);
% disp(iter);
% disp(conv_rates);
