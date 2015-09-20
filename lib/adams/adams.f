      subroutine adamsb1(n,t0,x0,t,x,h,func)
      implicit double precision(a-h,o-z),integer(i-n)
      dimension t0(*),x0(*),t(*),x(*)
      external func
      dimension a(5),f(5)
c First order Adams-Bashforth
      iorder=1
      a(1)=1.d0
      goto 100
      entry adamsb2(n,t0,x0,t,x,h,func)
c Second order Adams-Bashforth
      iorder=2
      a(1) = -0.5d0
      a(2) =  1.5d0
      goto 100
      entry adamsb3(n,t0,x0,t,x,h,func)
c Third order Adams-Bashforth
      iorder=3
      a(1)=5.d0/12.d0
      a(2)=-4.d0/3.d0
      a(3)=23.d0/12.d0
      goto 100
      entry adamsb4(n,t0,x0,t,x,h,func)
c Fourth order Adams-Bashforth
      iorder=4
      a(1)=-3.d0/8.0d0
      a(2)=37.d0/24.d0
      a(3)=-59.d0/24.d0
      a(4)=55.d0/24.d0
      goto 100
      entry adamsb5(n,t0,x0,t,x,h,func)
c Fifth order Adams-Bashforth
      iorder=5
      a(1)=251.d0/720.d0
      a(2)=-637.d0/360.d0
      a(3)=109.d0/30.d0
      a(4)=-1387.d0/360.d0
      a(5)=1901.d0/720.d0
      goto 100
c
c Main algorithm
c
  100 do 110 i=1,iorder
         x(i)=x0(i)
         t(i)=t0(i)
         f(i)=func(t(i),x(i))
  110 continue
      do 120 i=iorder+1,n
         s=0.d0
         do 115 j=1,iorder-1
            s=s+a(j)*f(j)
            f(j)=f(j+1)
  115    continue
         x(i)=x(i-1)+h*(s+a(iorder)*f(iorder))
         t(i)=t(i-1)+h
         f(iorder)=func(t(i),x(i))
  120 continue
      return
      end


