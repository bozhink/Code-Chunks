function z=Pochhammer1(x,n)
    z=x;
    for i=1:n-1
        z=z*(x+i);
    end
endfunction

function z=BinomCoefficient(x,n)
    z=x/n;
    for i=1:n-1
        z=z*((x-i)/n);
    end
endfunction
