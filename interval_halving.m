a = 0;
b = 3;
accuracy = 0.05;
limit=1/(2*accuracy);%variable to help in calculation of n
n=1;

%Finding value of n
while n>0
    if 2^((n-1)/2)>=limit
        break
    else
        n=n+2;
    end
 end
       
L = b-a;

i=1;
while (i<n)
    xm = (a+b)/2; 
    ym = func(xm);
    x1 = a+(L/4);
    x2 = b-(L/4);
    y1 = func(x1);
    y2 = func(x2);
    i=i+2;
    if y1>ym && ym>y2
        b = xm;
        xm = x1;
    elseif y2>ym && ym>y1
        a = xm;
        xm = x2;
    else
        a = x1;
        b = x2;
    end
    L = b-a;
end
m=(b+a)/2;
ans=func(m);

fprintf('The solution lies between %f & %f \n',a,b);
fprintf('The optimum value occurs at midpoint lambda= %f & max value of function is %f \n',m,ans);

function f = func(x)
    f = 1/(1+x^2)^0.5 + x - (1+x^2)^0.5;
end
