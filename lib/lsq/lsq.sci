function z=linlsq(x,y)
  n=max(size(x));
  sx=sum(x); sx2=sum(x.*x);
  sy=sum(y); sxy=sum(x.*y);
  a=(sx*sy-n*sxy)/(sx*sx-n*sx2);
  b=(sy-a*sx)/n;
  z = [b;a];
  return;
endfunction;

function [A,B]=lsqSetAB(x,y,m)
    n=max(size(x));
    m2=2*m; mp1=m+1; m2p1=m2+1;
    sx=0.0*ones(1,m2p1);
    B=0.0*ones(mp1,1);
    A=0.0*ones(mp1,mp1);
    sx(1)=n;
    for j=1:n
        xx=x(j);
        for i=2:m2p1
            sx(i)=sx(i)+xx;
            xx=xx*x(j);
        end;
    end;
    for j=1:n
        xx=y(j);
        for i=1:mp1
            B(i)=B(i)+xx;
            xx=xx*x(j);
        end;
    end;
    for i=1:mp1
        for j=1:mp1
            A(i,j)=sx(i+j-1);
        end;
    end;
endfunction

function z=LSQ(x,y,m)
    [A,B]=lsqSetAB(x,y,m);
    z=A\B;
endfunction

function z=lsqPolynom(x,lsqCoeff)
    n=max(size(lsqCoeff));
    N=max(size(x));
    for k=1:N
        z(k)=lsqCoeff(n);
        for i=n-1:-1:1
            z(k)=z(k)*x(k)+lsqCoeff(i);
        end
    end
endfunction