% Define the tridiagonal matrix A
A = [20 -1 0 0;
    -1 20 -1 0;
    0 -1 20 -1;
    0 0 -1 20];

% Define the vector b
b = [1; 2; 3; 4];
c= [2;3;4;10];

% Solve the equation A*x = b using the backslash operator (\)
x = A \ b;
y=A\c;

% Display the solution
disp(x);
disp(y);
thomas = Thomas(-1*ones(3, 1), 20*ones(4, 1), -1*ones(3, 1), [b c])

