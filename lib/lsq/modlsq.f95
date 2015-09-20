       module modlsq
           public :: gausselim
           public :: lsq
       contains
       subroutine gausselim(a, b, n, eps)
           implicit none
           real, dimension(:,:), intent(in out) :: a
           real, dimension(:),   intent(in out) :: b
           real, intent(in)                     :: eps
           integer, intent(in)                  :: n
           integer :: i, j, k, ii, jj, ji, kj, ll, nn, npivot, np1
           real :: y, con

           np1 = n+1
! print*,1
           do i = 1, n
               a(i,np1) = b(i)
           enddo
! print*,2
           do ii = 2, n
               i = ii - 1
               npivot = i
               do jj = ii, n
                   if( abs( a(npivot,i ) ) < abs( a(jj,j) ) ) then
                       npivot = jj
                   endif
               enddo
! print*,3
               if( abs( a(npivot,i) ) < eps) then
                   print 100
                   return
               endif
               if(npivot==i) then

               else
                   do jj=1,np1
                       y=a(i,jj)
                       a(i,jj) = a(npivot, jj)
                       a(npivot, jj) = y
                   enddo
               endif
! print*,4
               do ji=ii,n
                   if( abs(a(ji,i)) < eps) then

                   else
                       con = a(ji,i)/a(i,i)
                       a(ji, i) = con
                       do kj=ii,np1
                           a(ji,kj) = a(ji, kj) - con*a(i,kj)
                       enddo
                   endif
               enddo
! print*,5
           enddo
! print*,6
           if( abs( a(n,n) ) < eps ) then
               print 100
               return
           endif
! print*,7
           a(n,np1) = a(n,np1)/a(n,n)
           do j=2,n
               nn = np1 - j
               ll = nn + 1
               con = a(nn, np1)
               do k = ll, n
                   con = con - a(nn, k)*a(k, np1)
               enddo
               a(nn,np1) = con/a(nn, nn)
           enddo
! print*,8
           do i=1,n
               b(i) = a(i,np1)
           enddo
! print*,9
      return
  100 format('Diagonal zero',/,'matrix may be singular')
      end subroutine gausselim


      subroutine lsq(x, y, n, m, eps, b, sum0, sumr, r)
      implicit none

      integer, intent(in)                :: n, m
      real, dimension(n), intent(in)     :: x
      real, dimension(n), intent(in)     :: y
      real, intent(in)                   :: eps

      real, dimension(m+1), intent(out)  :: b
      real, intent(out)                  :: sum0
      real, intent(out)                  :: sumr
      real, intent(out)                  :: r

      real, dimension(2*m)      :: sx
      real, dimension(m+1)      :: sxy
      real, dimension(m+1, 2*m) :: a
      real    :: sum1, ybar
      integer :: i, j, m2, mp1, mp2

      m2  = 2 * m
      mp1 = m + 1
      mp2 = m + 2
      do i = 1, mp1
          sxy(i) = 0.0
      end do
      sx(1) = 0.0
      do j = 1, n
          sx(1) = sx(1) + x(j)
      enddo
      do i = 1, m2
          sx(i) = 0.0
          do j = 1, n
              sx(i) = sx(i) + x(j)**i
          enddo
      enddo
      do i = 1, mp1
          sxy(i) = 0.0
          if( i .gt. 1) then
              do j = 1, n
                  sxy(i) = sxy(i) + y(j) * x(j)**(i-1)
              enddo
          else
              do j = 1, n
                  sxy(i) = sxy(i) + y(j)
              enddo
          endif
      enddo
      do i = 1, mp1
          do j = 1, mp1
              if ( (i .eq. 1) .and. (j .eq. 1) ) then
                  a(i,j) = real(n)
              else
                  a(i,j) = sx(i+j-2)
              endif
          enddo
      enddo
      do i = 1, mp1
          b(i) = sxy(i)
      enddo

      call gausselim(a, b, mp1,eps)
      ybar = sxy(1)/real(n)
      sum0 = 0.0
      do i = 1, n
          sum0 = sum0 + ( y(i) - ybar )**2
      enddo
      sumr = 0.0
      do j = 1, n
          sum1 = b(1)
          do i = 2, mp1
              sum1 = sum1 + b(i) * x(j)**(i-1)
          enddo
          sumr = sumr + ( y(j) - sum1 )**2
      enddo
      r = sqrt( ( sum0 - sumr ) / sum0 )
      return
      end subroutine lsq

      end module modlsq
