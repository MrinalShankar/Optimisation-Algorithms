a = 0;
b = 3;
L=b-a;
accuracy = 0.05;
delta=0.001;
limit=(1-delta/L)/(2*accuracy-delta/L);%variable to help in calculation of n
n=2;

%Finding value of n
while n>0
    if 2^(n/2)>=limit
        break
    else
        n=n+2;
    end
end

i=2; 
while i<=n
        mid = (a + b)/2;
        a1 = mid - delta/2;
        b1 = mid + delta/2;
        if (func(a1) > func(b1))
            b = b1;
        elseif (func(a1) < func(b1))
            a = a1;
        elseif (func(a1) == func(b1))
            a = a1;
            b = b1;
        end
        i=i+2; 
        
end

m=(b+a)/2;
ans=func(m);

fprintf('The solution lies between %f & %f \n',a,b);
fprintf('The optimum value occurs at midpoint lambda= %f & max value of function is %f \n',m,ans);


function f = func(x)
    f = 1/(1+x^2)^0.5 + x - (1+x^2)^0.5;
end
