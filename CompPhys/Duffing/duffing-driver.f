      program Duffing driver
      implicit double precision(a-h,o-z),integer(i-n)
      parameter(n=1001)
      dimension x(n),y(n)
      open(unit=10,file='duffing.dat',status='old')
      do i=1,n
      read(unit=10,fmt=*) x(i), y(i)
      enddo
      close(unit=10)
      x0=0.92d0*gmin(n,x)
      x1=1.02d0*gmax(n,x)
      y0=0.98d0*gmin(n,y)
      y1=7.02d0*gmax(n,y)
      b0=1.d-7
      b1=1.d-3
      print*,x0,x1,y0,y1,b0,b1
      m=10
      call fracdim(n,x,y,x0,x1,y0,y1,b0,b1,m,Dr,ierr)
      print*,Dr
      print*,ierr
      stop
      end

      function gmin(n,x)
      implicit double precision(a-h,o-z),integer(i-n)
      dimension x(n)
      gmin=x(1)
      do i=2,n
         if (x(i).lt.gmin) gmin=x(i)
      enddo
      return
      end

      function gmax(n,x)
      implicit double precision(a-h,o-z),integer(i-n)
      dimension x(n)
      gmax=x(1)
      do i=2,n
         if (x(i).gt.gmax) gmax=x(i)
      enddo
      return
      end
