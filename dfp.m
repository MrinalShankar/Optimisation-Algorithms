format long
syms X Y;
%f = X - Y + 2*X^2 + 2*X*Y + Y^2;
%f= X^2 + 25*Y^2;
f= X^2 + 2*Y^2 -4*X - 2*X*Y;
%f= 3*X^2 - sin(Y);
% Initial Guess (Choose Initial Guesses):
x(1) = 1;
y(1) = 1;
e = 10^(-8); % Convergence Criteria
i = 1; % Iteration Counter
% Gradient and Hessian Computation:
df_dx = diff(f, X)
df_dy = diff(f, Y)
go = [subs(df_dx,[X,Y], [x(1),y(1)]) subs(df_dy, [X,Y], [x(1),y(1)])] % Gradient
x_o=[x(1);y(1)]
Io=eye(2)
Ho=Io;
do=-Ho*go'
alpha_o=-x_o/do
x_1=x_o+abs(max(alpha_o(1)))*do
x(1)=x_1(1);
y(1)=x_1(2);
g1 = [subs(df_dx,[X,Y], [x(1),y(1)]) subs(df_dy, [X,Y], [x(1),y(1)])] 
yo=g1-go;
yo=yo'
so=x_1-x_o
so_t=so'
H1=Ho+((so*so_t)/(so_t*yo))-((Ho*(yo*yo')*Ho)/(yo'*Ho*yo))
d1=-H1*g1'
alpha_1=-x_1/d1
x_2=x_1+abs(max(alpha_1(1)))*d1