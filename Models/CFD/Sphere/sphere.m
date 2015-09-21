function [f] = dudt(t, u)
	% u(1) = u
	% u(2) = x
	% f(2) = dx/dt = u
	% f(1) = du/dt = rho * Cd * pi * r / (2*m) * (v^2-2u*v+u^2)
	rho = 1000;
	Cd = 1;
	m = 5;
	r = 0.05;
	fac = rho * Cd * pi * r*r / (2*m);
	v = 1;
	
	f(1) = fac * (v^2 - 2*u(1) + u(1)^2);
	f(2) = u(1);
	f = f';
endfunction




rho = 1000;
Cd = 1;
m = 5;
r = 0.05;
fac = rho * Cd * pi * r*r / (2*m);
v = 1;
x = [0:0.1:10];
% step size
h = 1.0;
% Euler's method, forward finite difference
t = [0:h:10];
N = length(t);
u_e = zeros(N,1);
x_e = zeros(N,1);
u_e(1) = 0;
x_e(1) = 0;
for n = 2:N
	u_e(n) = u_e(n-1) + h*fac*(v^2-2*v*u_e(n-1) + u_e(n-1)^2);
	x_e(n) = x_e(n-1) + h*u_e(n-1);
endfor
% Runge Kutta
u0 = [0 0]';
u = lsode(dudt, t, u0);

