      subroutine duffosc(idimv,t,x,xdot)
      implicit none
      integer idimv
      double precision t, x(*), xdot(*)
      double precision m,gamma,a,b,f0,omega
      common /params/ m,gamma,a,b,f0,omega
      xdot(1) = x(2)
      xdot(2) = (-gamma*x(2)+2.d0*a*x(1)-4.d0*b*x(1)*x(1)*x(1)+
     *           f0*dcos(omega*t))/m
      return
      end
