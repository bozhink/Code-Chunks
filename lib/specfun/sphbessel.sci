function z=sphbesselj(n,x)
  z=sqrt(0.5*%pi*ones(x)./x).*besselj(n+0.5,x);
endfunction;

function z=sphbessely(n,x)
  z=sqrt(0.5*%pi*ones(x)./x).*bessely(n+0.5,x);
endfunction;

function z=sphbesseli(n,x)
  z=sqrt(0.5*%pi*ones(x)./x).*besseli(n+0.5,x);
endfunction;

function z=sphbesselk(n,x)
  z=sqrt(0.5*%pi*ones(x)./x).*besselk(n+0.5,x);
endfunction;

