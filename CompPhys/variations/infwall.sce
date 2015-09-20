LIB="c:\Documents and Settings\Owner\tmp\libinfwall.so";

deff("z=basis(n,x)","z=x^n*(x*x-1)");
function z=Basis(N,x)
    for i=1:N
        z(i)=basis(i,x);
    end;
endfunction;

function z = psi(C,x)
    n=max(size(C));
    z=sum(C.*Basis(n,x));
endfunction;

ulink();
link(LIB,['infwalls','infwallh'],'f');

N=10;
S=call("infwalls",N,1,'i','out',[N,N],2,'d');
H=call("infwallh",N,1,'i','out',[N,N],2,'d');
//iS=inv(S);
//nH=iS*H;
[ab,ba,zz]=spec(H,S);

x=linspace(-1,1,100);
for i=1:max(size(x))
    y(i)=psi(zz(:,10),x(i));
end;
