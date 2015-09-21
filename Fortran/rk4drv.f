      program RK4 driver
      implicit double precision(a-h,o-z),integer(i-n)
      parameter (n=1200)
      parameter (h=0.01d0)
      dimension t(n),x(n)
      external func
      t0=0.d0
      x0=1.d0
      call rk4(t0,y0,h,func,n,t,x)
      open(unit=11,file='dat.txt',status='replace',iostat=ierr,err=100)
      do i=1,n
      write(unit=11,fmt=*,iostat=ierr,err=100) t(i), x(i)
      enddo
      close(unit=11,iostat=ierr)
  100 stop
      end
      
      subroutine rk4(t0,y0,h,func,n,t,y)
      implicit double precision (a-h,o-z),integer(i-n)
      parameter(is=4)
      dimension bt(2:is+1,0:is)
      dimension t(n), y(n)
      external func
      integer i
      bt(2,0)=0.5d0
      bt(3,0)=0.5d0
      bt(4,0)=1.d0
      bt(2,1)=0.5d0
      bt(3,1)=0.d0
      bt(3,2)=0.5d0
      bt(4,1)=0.d0
      bt(4,2)=0.d0
      bt(4,3)=1.d0
      bt(5,1)=1.d0/6.d0
      bt(5,2)=1.d0/3.d0
      bt(5,3)=1.d0/3.d0
      bt(5,4)=1.d0/6.d0
      t(1) = t0
      y(1) = y0
      do i=1,n-1
         call rkb(t(i),y(i),h,is,bt,func,t(i+1),y(i+1))
      enddo
      return
      end

      function func(t,x)
      implicit double precision(a-z)
      func = -t
      return
      end
 
