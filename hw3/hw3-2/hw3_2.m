n = 500;
tol = 1e-8;

%% generate random SPD matrix
A = rand(n, n);
SPD = A * A';

%% MATLAB's built-in function
beg = cputime;
Low_MATLAB = chol(SPD, 'lower');
time_MATLAB = cputime - beg;

%% Outer Product: 3-level for loop
A = SPD;
beg = cputime;
for k = 1 : n
    A(k, k) = sqrt(A(k, k));
    A(k + 1 : n, k) = A(k + 1 : n, k) / A(k, k);
    for j = k + 1 : n
        for i = j : n
            A(i, j) = A(i, j) - A(i, k) * A(j, k);
        end
    end
end
time_lev_3 = cputime - beg;
Low_lev_3 = tril(A);

%% compare with built-in
% fprintf('3-level == MATLAB built-in ? %d\n', n ^ 2 == nnz(ismembertol(Low_MATLAB, Low_lev_3, 1e-9)));
fprintf('3-level == MATLAB built-in ? ');
fprintf('%d\n', n ^ 2 == nnz(ismembertol(Low_MATLAB, Low_lev_3, tol)));

%% Outer Product: 2-level for loop
A = SPD;
beg = cputime;
for k = 1 : n
    A(k, k) = sqrt(A(k, k));
    A(k + 1 : n, k) = A(k + 1 : n, k) / A(k, k);
    for j = k + 1 : n
        A(j : n, j) = A(j : n, j) - A(j : n, k) * A(j, k);
    end
end
time_lev_2 = cputime - beg;
Low_lev_2 = tril(A);

%% compare with built-in
fprintf('2-level == MATLAB built-in ? ');
fprintf('%d\n', n ^ 2 == nnz(ismembertol(Low_MATLAB, Low_lev_2, tol)));

%% Outer Product: 1-level for loop
A = SPD;
beg = cputime;
for k = 1 : n
    A(k, k) = sqrt(A(k, k));
    A(k + 1 : n, k) = A(k + 1 : n, k) / A(k, k);
    A(k + 1 : n, k + 1 : n) = A(k + 1 : n, k + 1 : n) - A(k + 1 : n, k) * A(k + 1 : n, k)';
end
time_lev_1 = cputime - beg;
Low_lev_1 = tril(A);

%% compare with built-in
fprintf('1-level == MATLAB built-in ? ');
fprintf('%d\n', n ^ 2 == nnz(ismembertol(Low_MATLAB, Low_lev_1, tol)));

%% print time of each
fprintf('\n');
fprintf('cpu time of MATLAB built-in: %d\n', time_MATLAB);
fprintf('cpu time of 1-level for loop: %d\n', time_lev_1);
fprintf('cpu time of 2-level for loop: %d\n', time_lev_2);
fprintf('cpu time of 3-level for loop: %d\n', time_lev_3);
