      program prc
      parameter (N=100)
      double complex x(N), y(N)
      double precision d, arg
      d = 4.d0
      do j = 0, N-1
         x(j) = dsin(arg(j, N, d))
      enddo
      call cfourier(N, x, y)
      do i = 1, N
         print 100,arg(i-1,N,d), x(i), y(i)
      enddo       
      stop
  100 format(f6.3,4(1x,e10.3))
      end
       
      doubleprecision function arg(j,n,a)
      doubleprecision a
      arg = 4.d0*datan(1.d0)*a*dble(j)/dble(n)
      return
      end
       
      subroutine cfourier(n,x,y)
      implicit none
      double complex x(*), y(*)
      integer n, j, k
      double precision dj, dk, dn, tpi
      tpi = 8.d0*datan(1.d0)
      dn = dble(n)
      do k = 1, n
         y(k) = 0.d0
         dk = dble(k)/dn
         do j = 1, n
            dj = tpi*dble(j-1)*dk
            y(k) = y(k) + x(j)*cdexp(dcmplx(dj))
         enddo
         y(k) = y(k)/dsqrt(dn)
      enddo
      end
