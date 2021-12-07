a = 0;
b = 3;
accuracy=0.05;
n = (1/accuracy)-1;
delta_x = (b-a)/(n+1);

x1 = a;
x2=x1+delta_x;
x3=x2+delta_x;


while (x3 <= b)
    y1 = func(x1); 
    y2 = func(x2);
    y3 = func(x3); 
    if y1<y2 && y2>y3 
        fprintf('The final interval of uncertainty is (%f , %f)\n',x1,x3);
        fprintf('The maximum value is %f which occurs at lambda=%f \n',y2,x2);
        break
    else
        x1 = x2;
        x2 = x3;
        x3 = x2 + delta_x;
    end
    
end


function f = func(x)
    f = 1/(1+x^2)^0.5 + x - (1+x^2)^0.5;
end
