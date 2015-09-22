p = 0.1:0.1:1;
ring42 = [0.035, 0.070, 0.112, 0.155, 0.197, 0.246, 0.295, 0.348, 0.401, 0.458];
ring43 = [0.027, 0.058, 0.094, 0.135, 0.185, 0.245, 0.317, 0.384, 0.468, 0.563];

function [a,b]=linlsq(X,Y)
    [n,m]=size(X);
    n=n*m;
    sumx = sum(X);
    sumy = sum(Y);
    sumxx = sum(X.*X);
    sumxy = sum(X.*Y);
    a=(sumx*sumy-n*sumxy)/(sumx*sumx-n*sumxx);
    b=(sumy-a*sumx)/n;
endfunction

function z = lsq2(x,y)
	[n,m]=size(x);
	n=n*m;
	sx = sum(x);
	sy = sum(y);
	sxy = sum(x.*y);
	xx = x.*x;
	sxxy = sum(xx.*y);
	sxx = sum(xx);
	xx = x.*xx;
	sxxx = sum(xx);
	xx = x.*xx;
	sxxxx = sum(xx);
	A = [n, sx, sxx; sx, sxx, sxxx; sxx, sxxx, sxxxx];
	B = [sy; sxy; sxxy];
	z = inv(A)*B;
endfunction

function z=J42_1(p)
	z = p/3 + p.*p/6;
endfunction

function z=J42_2(p)
	z = p/3 + p.*p/8;
endfunction
	