      subroutine fadd(n,x,y,z)
      integer n, x(*), y(*), z(*)
      do i = 1, n
         z(i) = x(i)+y(i)
      enddo
      end
      
      subroutine matmul(n, m, p, x, y, z)
      integer n, m, p
      doubleprecision x(n,m), y(m,p), z(n,p)
      integer i,j,k
      do i = 1, n
      do j = 1, p
         z(i,j)=0.d0
         do k=1,m
            z(i,j) = z(i,j) + x(i,k)*y(k,j)
         enddo
      enddo
      enddo
      end


