syms x r
phi = 2*x^2 - 6*x + 9 - (r/(4-x));
f = 2*x^2 - 6*x + 9;
f_val = zeros(1,1);
phi_val = zeros(1,1);
X = zeros(1,1);
i = 1;
r_val = 1000000;
while r_val > 10^-12
    phi_r = subs(phi,r,r_val);
    df = diff(phi_r,x) == 0;
    X_sol  = double(solve(df,x));
    X_sol = X_sol(X_sol == real(X_sol));
    phi_sol = double(subs(phi_r,x,X_sol));
    if X_sol(find(min(phi_sol)),1) > 4
        X(i,1) = X_sol(find(min(phi_sol)),1);
        phi_val(i,1) = min(phi_sol);
        f_val(i,1) = double(subs(f,x,X(i,1)));
        fprintf('Iteration %d X = %f f = %f r = %f phi = %f\n',i,X(i,1),f_val(i,1),r_val,phi_val(i,1));
        i = i + 1;
    end
    r_val = r_val*0.1;
end
phi_r = subs(phi,r,0);
df = diff(phi_r,x) == 0;
X_sol  = double(solve(df,x));
X_sol = X_sol(X_sol == real(X_sol));
phi_sol = double(subs(phi_r,x,X_sol));
if X_sol(find(min(phi_sol)),1) > 4
   X(i,1) = X_sol(find(min(phi_sol)),1);
   phi_val(i,1) = min(phi_sol);
   f_val(i,1) = double(subs(f,x,X(i,1)));
   fprintf('Iteration %d X = %f f = %f phi= %f\n',i,X(i,1),f_val(i,1),phi_val(i,1));
   i = i + 1;
end   