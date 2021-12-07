a = 0;
b = 3;
n = 10;
L=b-a;

golden=0.618;

k=2;
Lk_star = (golden^k)* L;
x1 = a + Lk_star;
x2 = b - Lk_star;
y1 = func(x1);
y2 = func(x2);

while k <= n
    if y1>y2
        b=x2;
    else
        a=x1;
    end
    
    k=k+1;
    Lk_star = (golden^k)* L;
   
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


fprintf('The solution lies between %f & %f \n'function f = func(x)
    f = 1/(1+x^2)^0.5 + x - (1+x^2)^0.5;
end,a,b);

