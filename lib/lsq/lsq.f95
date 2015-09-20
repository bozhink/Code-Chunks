       program plsq

       use modlsq

       !implicit none

       integer, parameter            :: n=17, m=2
       real, dimension(n), parameter :: &
           x = (/0.65, 0.85, 1.05, 1.25, 1.60, 1.60, 2.00, &
                 2.40, 2.85, 2.85, 3.25, 3.65, 3.65, 4.10, &
                 4.45, 4.45, 4.90/)
       real, dimension(n), parameter :: &
           y = (/0.80, 1.65, 1.30, 1.90, 2.05, 2.50, 2.65, &
                 3.00, 2.70, 3.00, 2.80, 2.45, 2.85, 2.20, &
                 1.60, 2.00, 1.25/)
       real, dimension(m+1)      :: b
       real, dimension(2*m)      :: sx
       real, dimension(m+1)      :: sxy
       real, dimension(m+1, 2*m) :: a
       real    :: eps, r, sumr, sum0, sum1, ybar
       integer :: i, j, m2, mp1, mp2
       eps = 1.0e-6; mp1 = m+1
       call lsq(x, y, n, m, eps, b, sum0, sumr, r)

!        m2 = 2*m
!        mp1 = m+1
!        mp2 = m+2
!        eps = 1.0e-6
!        do i=1,mp1
!            sxy(i)=0.0
!        end do
!        sx(1)=0.0
!        do j=1,n
!            sx(1)=sx(1)+x(j)
!        enddo
!        do i=1,m2
!            sx(i)=0.0
!            do j=1,n
!                sx(i)=sx(i)+x(j)**i
!            enddo
!        enddo
!        do i=1,mp1
!            sxy(i)=0.0
!            if(i>1) then
!                do j=1,n
!                    sxy(i)=sxy(i) + y(j)*x(j)**(i-1)
!                enddo
!            else
!                do j=1,n
!                    sxy(i) = sxy(i) + y(j)
!                enddo
!            endif
!        enddo
!        do i=1,mp1
!            do j=1,mp1
!                if ( (i.eq.1).and.(j.eq.1) ) then
!                    a(i,j) = real(n)
!                else
!                    a(i,j) = sx(i+j-2)
!                endif
!            enddo
!        enddo
!        do i=1,mp1
!            b(i) = sxy(i)
!        enddo
! 
!        call gausselim(a, b, mp1,eps)
!        ybar = sxy(1)/real(n)
!        sum0 = 0.0
!        do i=1,n
!            sum0 = sum0 + (y(i)-ybar)**2
!        enddo
!        sumr = 0.0
!        do j=1,n
!            sum1=b(1)
!            do i=2,mp1
!                sum1=sum1+b(i)*x(j)**(i-1)
!            enddo
!            sumr = sumr + ( y(j)-sum1 )**2
!        enddo
!        r = sqrt( (sum0-sumr)/sum0 )

       print "(a,i1)", "Least squares polynomial of order ", m
       print "(a,i2,a)", "through ", n, " data points"
       do i=1,n
           print "(a,i2,a,f7.2)", "  Value of x(",i,"): ",x(i)
       enddo
       do i=1,n
           print "(a,i2,a,f7.2)", "  Value of y(",i,"): ",y(i)
       enddo
       print *,"Coefficients of polynomial, b(i), i=1,...,m+1:"
       do i=1,mp1
           print "(a,i1,a,f12.7)", " b(",i,") = ", b(i)
       enddo
       print*,"Measures of goodness of fit:"
       print "(2x,a,f12.7)", "sum0 = ", sum0
       print "(2x,a,f12.7)", "sumr = ", sumr
       print *, "Correlation coefficient r = ", r
       stop
       end

