a=0;
step=0.1;
max=func(a);
max_lambda=0;
while(true)
    a=a+step;
    step=a;
    res=func(a);
    if res>max
        max=res;
        max_lambda=a;
    else
        break
    end
    
end

fprintf('The maximum value is %f which occurs at lambda=%f \n',max,max_lambda);

function f = func(x)
    f = 1/(1+x^2)^0.5 + x - (1+x^2)^0.5;
end