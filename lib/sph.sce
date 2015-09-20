function z=s2c(r,t,p)
    z(1)=r*sin(t)*cos(p);
    z(2)=r*sin(t)*sin(p);
    z(3)=r*cos(t);
endfunction

function z=s2c1(x)
    z(1)=x(1)*sin(x(2))*cos(x(3));
    z(2)=x(1)*sin(x(2))*sin(x(3));
    z(3)=x(1)*cos(x(2));
endfunction

function z=s2c2(r,t,p)
    A=[sin(t)*cos(p), r*cos(t)*cos(p), -r*sin(t)*sin(p);
       sin(t)*sin(p), r*cos(t)*sin(p),  r*sin(t)*cos(p);
       cos(t),       -r*sin(t),         0              ];
    z=A*[r;t;p];
endfunction

function z=c2s(x)
    z(1) = sqrt(x(1)*x(1) + x(2)*x(2) + x(3)*x(3) );
    z(2) = acos( x(3) / z(1) );
    z(3) = atan( x(2) / x(1) );
endfunction