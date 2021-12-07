syms x1 x2;
f = 100*(x2-x1^2)^2+(1-x1)^2;
x01 = -0.5;
x02 = 0.5;
S = [0;1];
epsilon = 0.01;
i = 1;
F = subs(f, [x1,x2], [x01,x02]);
f_plus = [x01;x02] + epsilon*S;
F_plus = subs(f, [x1,x2], [f_plus(1,1), f_plus(2,1)]);
f_minus = [x01;x02] - epsilon*S;
F_minus = subs(f, [x1,x2], [f_minus(1,1), f_minus(2,1)]);
if F_minus < F
    S = -S;
else
    S = S;
end
values=[[x01,x02,F]];
while ((double(F) > double(F_minus))||(double(F) > double(F_plus)))
    syms lambda; 
    fun_lambda_value=[];
    new_X=([x01;x02]+lambda*S);
    g = subs(f, [x1,x2], [new_X(1,1),new_X(2,1)]);
    dg_dlambda = diff(g,lambda);
    lambda = vpa(solve(dg_dlambda==0, lambda),6);
    lambda = lambda(imag(lambda)==0);
    for k = 1:size(lambda,1)
            fun_lambda_value(k) = subs(f,[x1,x2],[x01+lambda(k)*S(1,1),x02+lambda(k)*S(2,1)]);
    end
    [value, index] = min(fun_lambda_value);
    lambda = lambda(index);
    x01=x01+lambda*S(1,1);
    x02=x02+lambda*S(2,1);
    i = i+1;
    if rem(i,2) == 0
        S = [1;0];
    else
        S = [0;1];
    end
    F = value;
    values=[values;[x01,x02,F]];
    f_plus = [x01;x02] + epsilon*S;
    F_plus = subs(f, [x1,x2], [f_plus(1,1), f_plus(2,1)]);
    f_minus = [x01;x02] - epsilon*S;
    F_minus = subs(f, [x1,x2], [f_minus(1,1), f_minus(2,1)]);
    if double(F_minus)<double(F)
        S = -S;
    else
        S = S;
    end
end
disp('x1        x2      f')
disp(values)


%Contour Plot

x=-5:0.1:5;
y=-5:0.1:5;
[X,Y]=meshgrid(x,y);
Z=8.*(X.^2)+8.*(Y.^2)-6.*X.*Y-1.*X+1.*Y;
contour(X,Y,Z,150)
xlabel('X1')
ylabel('X2')
title('Contour Plot')
x_1=values(1:end,1);
y_1=values(1:end,2);
hold on
plot(x_1,y_1,'*-r')
hold off