      subroutine ab1(n,t0,x0,t,x,h,f)
c Adams–Bashforth first order
      implicit double precision(a-h,o-z),integer(i-n)
      parameter (iorder=1)
      external f
      dimension x0(iorder), t0(iorder)
      dimension x(n), t(n)
      do i=1,iorder
         x(i)=x0(i)
         t(i)=t0(i)
      enddo
      do i=1,n-iorder
         x(i+1)=x(i)+h*f(t(i),x(i))
         t(i+1)=t(i)+h
      enddo
      return
      end
      
      
      subroutine ab2(n,t0,x0,t,x,h,f)
c Adams–Bashforth first order
      implicit double precision(a-h,o-z),integer(i-n)
      parameter (iorder=2)
      external f
      dimension x0(iorder), t0(iorder)
      dimension x(n), t(n)
      do i=1,iorder
         x(i)=x0(i)
         t(i)=t0(i)
      enddo
      do i=1,n-iorder
         x(i+2)=x(i+1)+h*(
     +   1.5d0*f(t(i+1),x(i+1)) - 0.5d0*f(t(i),x(i)))
         t(i+2)=t(i+1)+h
      enddo
      return
      end
      