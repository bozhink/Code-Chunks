      subroutine breather(a,u,v,x)
      implicit double precision(a-h,o-z),integer(i-n)
      dimension x(3)
      c1=1.d0-a*a
      c2=dsqrt(c1)
      c3=a*u
      c4=c2*v
      d1=dcosh(c3)
      d2=dsinh(c3)
      d3=dcos(v)
      d4=dsin(v)
      d5=dcos(c4)
      d6=dsin(c4)
      e0=2.d0/(a*(c1*d1*d1+a*a*d6*d6))
      
      x(1)=-u+c1*d1*d2*e0
      x(2)=c2*d1*(-c2*d3*d5-d4*d6)*e0
      x(3)=c2*d1*(c2*d4*d4+d3*d6)*e0
      
      return
      end

