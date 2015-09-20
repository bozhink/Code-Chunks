      program lsqexec
      integer n,m
      print*,'Enter number of porints:'
      read*,n
      print*,'Enter reqired order:'
      read*,m
      
      call exec(n,m)
      stop
      end


      subroutine exec(n,m)

       use modlsq

       !implicit none

       integer                   :: n, m
       real, dimension(n)        :: x
       real, dimension(n)        :: y
       real, dimension(m+1)      :: b
       real, dimension(2*m)      :: sx
       real, dimension(m+1)      :: sxy
       real, dimension(m+1, 2*m) :: a
       real    :: eps, r, sumr, sum0, sum1, ybar
       integer :: i, j, m2, mp1, mp2
       eps = 1.0e-6
       mp1 = m+1

       do i=1,n
!            read(unit=5,fmt=*,iostat=ierr,err=10,end=10) x(i), y(i)
           read*, x(i), y(i)
       enddo

   10  call lsq(x, y, n, m, eps, b, sum0, sumr, r)

       do i=1,n
           print "(f16.3,1x,f16.3)",x(i), y(i)
       enddo

       print *,"Coefficients of polynomial, b(i), i=1,...,m+1:"
       do i=1,mp1
           print "(a,i1,a,f12.7)", " b(",i,") = ", b(i)
       enddo
       print*,"Measures of goodness of fit:"
       print "(2x,a,f20.7)", "sum0 = ", sum0
       print "(2x,a,f20.7)", "sumr = ", sumr
       print *, "Correlation coefficient r = ", r
       return
       end

