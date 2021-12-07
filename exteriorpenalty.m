format rat
syms x r
f = 2*x^2 - 6*x + 9;
f_val = zeros(1,1);
phi_val = zeros(1,1);
X = zeros(1,1);
i = 1;
r_val = 10^-6;
while r_val < 10^8
    X_sol = (6+8*r_val)/(4+2*r_val);
    X(i,1) = X_sol;
    f_val(i,1) = double(subs(f,x,X(i,1)));
    phi_val(i,1) = f_val(i,1) + r_val*max([0 4-X(i,1)]);
    fprintf('Iteration %d X = %f f = %f r = %f phi = %f\n',i,X(i,1),f_val(i,1),r_val,phi_val(i,1));
    i = i + 1;    
    r_val = r_val*10;
end
