funcprot(0);

a = 0.5;
b = 1.34;
tau = 1.75;

deff("z=p(x)", "z=a*x**(-tau)");
deff("z=P(x)", "z=a*x**(1-tau)/(tau-1)");
deff("z=FP(omega,T)", "z=T**(omega-1).*P(T)");


function z=Integral(x, px)
    z=px;
    n=max(size(px));
    for i=n-1:-1:1
        z(i) = z(i+1) + px(i)
    end
endfunction

function z=Fip(x,px,omega)
    z=x**(omega-1).*Integral(x,px);
endfunction

function z=Fipc(x,px,omega)
    z=x**(omega-1).*(Integral(x,px)+correction);
endfunction

XMAX=100000;
x=1:1:XMAX;
px=p(x);
Px=P(x);
ipx=Integral(x,px);

correction = P(XMAX);
