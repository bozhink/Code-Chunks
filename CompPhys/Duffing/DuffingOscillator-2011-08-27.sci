__gamma__ = 0.1;
__m__ = 1.0;
__a__ = 0.25;
__b__ = 0.50;
__omega__ =2.4;
__F0__ = 2.0;
t0 = 0.0;
t = linspace(t0,100.0,1000);
x0 = [0.5;0.0];

function z=DuffingOscillator(t,x)
    z(1) = x(2);
    z(2) = (-__gamma__*x(2) + 2*__a__*x(1) - 4*__b__*x(1)*x(1)*x(1) + __F0__*cos(__omega__*t))/__m__;
endfunction

y = ode("stiff",x0,t0,t,DuffingOscillator);

scf(0);
clf(0);
plot2d(y(1,:),y(2,:),[1]);
//plot2d(t,y(1,:),[1]);
