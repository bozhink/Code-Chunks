function z=GaugeOscilator(t,x)
    n=32;
    z(1) = x(n+1);
    z(n+1) = x(n+2)-x(1);
    for i=2:n-1
        z(i) = x(n+i);
        z(n+i) = x(n+i+1) - x(n+i-1) - x(i);
    end
    z(n) = x(n+n);
    z(n+n) = -x(n+n-1) - x(n);
endfunction

xx=linspace(0,3*%pi,64);
y0=sin(xx);
t0=0;
t=t0:1:1000;
Z=ode(y0,t0,t,GaugeOscilator);
nz=max(size(Z));
