a = 0;
b = 3;
n = 10;
L=b-a;

arr=zeros(1,n+1);%Array to store fibanocci nos
arr(1)=1;arr(2)=1;
for i=3:(n+1)
    arr(i)=arr(i-1)+arr(i-2);
end

k=2;
f1 = arr(n-k+1);
f2 = arr(n+1);
Lk_star = (f1/f2)* L;
x1 = a + Lk_star;
x2 = b - Lk_star;
y1 = func(x1);
y2 = func(x2);

while k < n
    if y1>y2
        b=x2;
    else
        a=x1;
    end
    
    k=k+1;
    f1 = arr(n-k+1);
    f2 = arr(n+1);
    Lk_star = (f1/f2)* L;
   
    if y1>y2
        x2=x1;
        x1 = a + Lk_star;    
        y2=y1;
        y1=func(x1);
    else 
        x1=x2;
        x2 = b - Lk_star;
        y1=y2;
        y2=func(x2);
    
    end
    
end

%Accounting for the final iteration where x1 and x2 are equal so we take a
%value close to it and find final interval
apprx=x1-0.001;
y_dash=func(apprx);
if y_dash<y1
    b=x2;
else
    a=apprx;
end

fprintf('The solution lies between %f & %f \n',a,b);

function f = func(x)
    f = 1/(1+x^2)^0.5 + x - (1+x^2)^0.5;
end