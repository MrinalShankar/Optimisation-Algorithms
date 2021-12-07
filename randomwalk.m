%Sometimes takes long time to converge depending on values of random
%numbers
syms x1 x2
f=100*(x2-x1^2)^2+(1-x1)^2;
x01=0;
x02=0;
f_val=subs(subs(f,x1,x01),x2,x02);
values=[[x01,x02,f_val]];
while 1
    r=rand(2,1);
    while(r(1,1)^2+r(2,1)^2>1)
        r=rand(2,1);
    end
    S=[r(1,1);r(2,1)];
    syms lambda
    new_X=([x01;x02]+lambda*S);
    g=subs(f,[x1,x2],[new_X(1,1),new_X(2,1)]);
    dg_dlambda=diff(g,lambda);
    lambda = vpa(solve(dg_dlambda==0, lambda),6);
    lambda = lambda(imag(lambda)==0);
    for k = 1:size(lambda,1)
            fun_lambda_value(k) = subs(f,[x1,x2],[x01+lambda(k)*S(1,1),x02+lambda(k)*S(2,1)]);
    end
    [value, index] = min(fun_lambda_value);
    lambda = lambda(index);
    f_old=subs(subs(f,x1,x01),x2,x02);
    x01=x01+lambda*S(1,1);
    x02=x02+lambda*S(2,1);
    f_new=value;
    if f_new>=f_old
        break
    end
    values=[values;[x01,x02,f_new]];
end
disp('x1        x2      f')
disp(values)

%Contour Plot

x=0:0.1:5;
y=0:0.1:5;
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