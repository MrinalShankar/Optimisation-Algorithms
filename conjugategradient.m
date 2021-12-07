format rat
syms x1 x2
f=8*x1^2-6*x1*x2+8*x2^2-x1+x2;
x01=100;
x02=0;
max_iterations=4;
i=1;
df_dx1 = diff(f,x1);
df_dx2 = diff(f,x2);
S=-[subs(df_dx1,[x1,x2],[x01,x02]);subs(df_dx2,[x1,x2],[x01,x02])];
mod_del_F=norm(S);
values=[[x01,x02,subs(subs(f,x1,x01),x2,x02)]];
while(mod_del_F~=0)&(i<=max_iterations)
    syms lambda
    new_X=([x01;x02]+lambda*S);
    g=subs(f,[x1,x2],[new_X(1,1),new_X(2,1)]);
    dg_dlambda=diff(g,lambda);
    lambda=solve(dg_dlambda, lambda);
    x01=x01+lambda*S(1,1);
    x02=x02+lambda*S(2,1);
    f_new=subs(subs(f,x1,x01),x2,x02);
    values=[values;[x01,x02,f_new]];
    i = i+1;
    S_new=-[subs(df_dx1,[x1,x2],[x01,x02]);subs(df_dx2,[x1,x2],[x01,x02])];
    S =(S_new)+((norm(S_new))^2/(norm(S))^2)*S;
    mod_del_F=norm(S);
end

disp('x1        x2      f')
disp(values)

%Contour Plot

x=-1:1:100;
y=-5:0.1:31;
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