      subroutine triang(h,n,x,y)
      implicit none
      integer n, i, j
      double precision h,x(3,2*n*n),y(3,2*n*n)
      double precision x0(3,2), y0(3,2)
      double precision hx, hy
      common /trng0xy/ x0, y0
      x0(1,1)=0.d0 * h
      y0(1,1)=0.d0 * h
      x0(2,1)=1.d0 * h
      y0(2,1)=0.d0 * h
      x0(3,1)=1.d0 * h
      y0(3,1)=1.d0 * h
      x0(1,2)=0.d0 * h
      y0(1,2)=0.d0 * h
      x0(2,2)=1.d0 * h
      y0(2,2)=1.d0 * h
      x0(3,2)=0.d0 * h
      y0(3,2)=1.d0 * h
      do j = 0, n-1
         do i = 0 , n-1
            hx = h*dble(i);
            x(1,1 + 2*( i + n*j )) = x0(1,1) + hx;
            x(2,1 + 2*( i + n*j )) = x0(2,1) + hx;
            x(3,1 + 2*( i + n*j )) = x0(3,1) + hx;
c
            x(1,2 + 2*( i + n*j )) = x0(1,2) + hx;
            x(2,2 + 2*( i + n*j )) = x0(2,2) + hx;
            x(3,2 + 2*( i + n*j )) = x0(3,2) + hx;
c
            hy = h*dble(j);
            y(1,1 + 2*( i + n*j )) = y0(1,1) + hy;
            y(2,1 + 2*( i + n*j )) = y0(2,1) + hy;
            y(3,1 + 2*( i + n*j )) = y0(3,1) + hy;
c
            y(1,2 + 2*( i + n*j )) = y0(1,2) + hy;
            y(2,2 + 2*( i + n*j )) = y0(2,2) + hy;
            y(3,2 + 2*( i + n*j )) = y0(3,2) + hy;
         enddo
      enddo
      return
      end

      
      
