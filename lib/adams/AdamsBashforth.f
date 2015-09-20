      subroutine adamsb1(n,t0,x0,t,x,h,func)
      implicit double precision(a-h,o-z),integer(i-n)
      dimension t0(*),x0(*),t(*),x(*)
      external func
      dimension a(5),f(5)
c Adams-Bashforth 1st order
      iorder=1
      a(1)=1.d0
      goto 100
      entry adamsb2(n,t0,x0,t,x,h,func)
c Adams-Bashforth 2nd order
      iorder=2
      a(1)=-0.5d0
      a(2)=1.5d0
      goto 100
      entry adamsb3(n,t0,x0,t,x,h,func)
c Adams-Bashforth 3rd order
      iorder=3
      a(1)=5.d0/12.d0
      a(2)=-4.d0/3.d0
      a(3)=23.d0/12.d0
      goto 100
      entry adamsb4(n,t0,x0,t,x,h,func)
c Adams-Bashforth 4th order
      iorder=4
      a(1)=-3.d0/8.d0
      a(2)=37.d0/24.d0
      a(3)=-59.d0/24.d0
      a(4)=55.d0/24.d0
      goto 100
      entry adamsb5(n,t0,x0,t,x,h,func)
c Adams-Bashforth 5th order
      iorder=5
      a(1)=251.d0/720.d0
      a(2)=-637.d0/360.d0
      a(3)=109.d0/30.d0
      a(4)=-1387.d0/360.d0
      a(5)=1901.d0/720.d0
      goto 100
c Main part of algorithm
      do i=1,iorder
         x(i)=x0(i)
         t(i)=t0(i)
         f(i)=func(t(i),x(i))
      enddo
      do i=iorder+1,n
         ff=0.d0
         do j=1,iorder
            ff=ff+a(j)*f(j)
         enddo
         