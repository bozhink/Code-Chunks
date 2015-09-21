

function z=logistic(x,mu)
    z=mu*x*(1-x);
endfunction

x0=-0.00001;
m=3;
N=35;
X=zeros(1,N); Y=X;
X(1)=x0;
Y(1)=logistic(x0,m);
for i=2:N
    X(i)=Y(i-1);
    Y(i)=logistic(X(i),m);
end
clf();plot2d2(X,Y,1,"111","step function");
