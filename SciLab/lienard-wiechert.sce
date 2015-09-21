function [a1,a2]=fields(r1,r2,v1,v2)
    vv=1-v1'*v2;
    vv1=1-v1'*v1;
    vv2=1-v2'*v2;
    r0=r1-r2;
    r=sqrt(r0'*r0);
    r0=r0/r;
    vr1=v1'*r0;
    vr2=v2'*r0;
    vp1=1+vr1;
    vp2=1+vr2;
    vm1=1-vr1;
    vm2=1-vr2;
    b1=vm1/(r*r*vm2*vm2);
    b2=vp2/(r*r*vp1*vp1);
    A1=vv/(r*r*vm2*vm2*vm2)*r0 - b1/vm2*v2;
    A2=-vv/(r*r*vp1*vp1*vp1)*r0 - b2/vp1*v1;
    E=[1,0,0;0,1,0;0,0,1];
    S1=(b1*E-A1*r0')*r;
    S2=(b2*E+A2*r0')*r;
    B1=vv2*A1-b1*r0;
    B2=vv1*A2+b2*r0;
    V1=v1*v1';
    V2=v2*v2';
    sv1=sqrt(vv1);
    sv2=sqrt(vv2);
    T1=(vv1*E+V1)/(vv1*sv1);
    T2=(vv2*E+V2)/(vv2*sv2);
    T1i=sv1*(E-V1);
    T2i=sv2*(E-V2);
    a1=inv(T1-S1*T2i*S2)*(B1-S1*T2i*B2);
    a2=inv(T2-S2*T1i*S1)*(B2-S2*T1i*B1);
endfunction

function z=driver(t,x)
    z(1:6)=x(7:12);
    [z(7:9), z(10:12)] = fields(x(1:3),x(4:6),x(7:9),x(10:12));
endfunction


function [a1,a2]=Lienard_Wiechert(r1,r2,v1,v2)
    r0=r1-r2;
    r=sqrt(r0'*r0);
    r0=r0/r;
    vv=1-v1'*v2;
    vv1=1-v1'*v1;
    vv2=1-v2'*v2;
    vr1=v1'*r0; vp1=1+vr1; vm1=1-vr1;
    vr2=v2'*r0; vp2=1+vr2; vm2=1-vr2;
    f1=r*r*vm2*vm2;
    f2=r*r*vp1*vp1;
    b1=vm1/f1; f1=f1/vm2;
    b2=vp2/f2; f2=f2/vp1;
    A1=vv/f1 * r0 - vm1/f1 * v2;
    A2=-vv/f2 * r0 - vp2/f2 * v1;
    E=[1,0,0;0,1,0;0,0,1];
    S1=(b1*E-A1*r0')*r; B1=vv2*A1-b1*r0;
    S2=(b2*E+A2*r0')*r; B2=vv1*A2+b2*r0;
    T1=(vv1*E+v1*v1')/(vv1**1.5); T1i=sqrt(vv1)*S2*(E-v1*v1');
    T2=(vv2*E+v2*v2')/(vv2**1.5); T2i=sqrt(vv2)*S1*(E-v2*v2');
    a1=inv(T1-T2i*S2)*(B1-T2i*B2);
    a2=inv(T2-T1i*S1)*(B2-T1i*B1);
endfunction

function z=LWdriver(t,x)
    z(1:6)=x(7:12);
    [z(7:9),z(10:12)] = Lienard_Wiechert(x(1:3), x(4:6), x(7:9), x(10:12));
endfunction
