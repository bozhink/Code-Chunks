i=-2.; e=1.; t=0.;
A20x20 = [ i e t t t t t t t t t t t t t t t t t t t t;
           e i e t t t t t t t t t t t t t t t t t t t;
           t e i e t t t t t t t t t t t t t t t t t t;
           t t e i e t t t t t t t t t t t t t t t t t;
           t t t e i e t t t t t t t t t t t t t t t t;
           t t t t e i e t t t t t t t t t t t t t t t;
           t t t t t e i e t t t t t t t t t t t t t t;
           t t t t t t e i e t t t t t t t t t t t t t;
           t t t t t t t e i e t t t t t t t t t t t t;
           t t t t t t t t e i e t t t t t t t t t t t;
           t t t t t t t t t e i e t t t t t t t t t t;
           t t t t t t t t t t e i e t t t t t t t t t;
           t t t t t t t t t t t e i e t t t t t t t t;
           t t t t t t t t t t t t e i e t t t t t t t;
           t t t t t t t t t t t t t e i e t t t t t t;
           t t t t t t t t t t t t t t e i e t t t t t;
           t t t t t t t t t t t t t t t e i e t t t t;
           t t t t t t t t t t t t t t t t e i e t t t;
           t t t t t t t t t t t t t t t t t e i e t t;
           t t t t t t t t t t t t t t t t t t e i e t;
           t t t t t t t t t t t t t t t t t t t e i e;
           t t t t t t t t t t t t t t t t t t t t e i;
           ]*0.5;
           
B20x20 = inv(A20x20);
h = 0.1;
a = 2.0; b = a+max(size(A20x20))*h;
x = (linspace(a,b,max(size(A20x20))))';
k = sqrt(3.0);
s=0.1*(rand(1,max(size(x)))-0.5);
psi = exp(-%i*k*(x+s'))+s';

function z=border(psi)
  z=psi;
  z(1)=0.0;
  z(max(size(psi)))=0.0;
  //z=z/max(abs(real(z)));
  return;
endfunction;


function z=setA(n)
  if n<2 then
    disp("ERROR: n must be at least 2");
    z=0;
    return;
  end;
  z=0.0*ones(n,n);
  z(1,1)=-2.0;
  z(1,2)=1.0;
  z(n,n)=-2.0;
  z(n,n-1)=1.0;
  for i=2:n-1;
    z(i,i) = -2.0;
    z(i,i-1)=1.0;
    z(i,i+1)=1.0;
  end;
endfunction;

A=setA(300);
B=inv(A);
h = 0.001;
a = -0.1; b = a+max(size(A))*h;
x = (linspace(a,b,max(size(A))))';
k = sqrt(190.0);
s=(rand(1,max(size(x)))-0.5);
psi = exp(-%i*k*(x+s'))+s';
 
