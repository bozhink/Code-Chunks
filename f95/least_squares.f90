program least_squares
! Least squares polynomial regressin
! Least sqares polynomial of order m through n
! data points (x(i),y(i)), i=1,2,...,n
use eqn_solver
implicit none
    integer :: n,m,iargc,ierr
    intrinsic :: iargc
    character(len=255) :: arg
    if (iargc()<2) then
       write(unit=0,fmt=*)"Usage: least_squares <number-of-data-points> <order>"
       stop "iargc"
    endif
    call getarg(1,arg)
    read(unit=arg,fmt=*,iostat=ierr) n
    if (ierr.ne.0) stop "Invalid number n"
    call getarg(2,arg)
    read(unit=arg,fmt=*,iostat=ierr) m
    if (ierr.ne.0) stop "Invalid number m"
    call main(n,m)
    stop
end program least_squares

subroutine main(n,m)
use eqn_solver
implicit none
   integer, intent(in) :: n,m
   real,dimension(n):: x
   real,dimension(n):: y
   real, dimension(m+1)     ::b
   real,dimension(2*m)      ::sx
   real,dimension(m+1)      ::sxy
   real,dimension(m+1,2*m)  ::a
   real     ::eps,r,sumr,sum0,sum1,ybar
   integer  ::i,j,m2,mp1,mp2,ierr

   do i=1,n
      read(unit=*,fmt=*,iostat=ierr) x(i), y(i)
      if (ierr.ne.0) stop "Invalid number x,y"
   enddo

   m2=2*m
   mp1=m+1
   mp2=m+2
   eps=1.e-6
   do i=1,mp1
       sxy(i)=0.e0
   enddo

   sx(1)=0.e0
   do j=1,n
       sx(1)=sx(1)+x(j)
   enddo

   do i=2,m2
       sx(i)=0e0
       do j=1,n
          sx(i)=sx(i)+x(j)**real(i)
       enddo
   enddo

   do i=1,mp1
      sxy(i)=0.e0
      if (i>1) then
         do j=1,n
            sxy(i)=sxy(i)+(x(j)**real(i-1))*y(j)
         enddo
      else
         do j=1,n
            sxy(i)=sxy(i)+y(j)
         enddo
      endif
   enddo

   do i=1,mp1
       do j=1,mp1
           if ((i==1).and.(j==1)) then
               a(i,j)=real(n)
           else
               a(i,j)=sx(i+j-2)
           endif
       enddo
   enddo

   do i=1,mp1
       b(i)=sxy(i)
   enddo
   !
   call gaussian_elimination(a,b,mp1,mp2,eps)
   ybar=sxy(1)/real(n)
   sum0=0.e0
   do i=1,n
       sum0=sum0+(y(i)-ybar)**2
   enddo
   sumr=0.0
   do j=1,n
       sum1=b(1)
       do i=2,mp1
           sum1=sum1+b(i)*x(j)**real(i-1)
       enddo
       sumr=sumr+(y(j)-sum1)**2
   enddo
   r=sqrt((sum0-sumr)/sum0)
   print '(a,i1)','Least squares polynomial of order ',m
   print '(a,i2,a)','through ',n,' data points'
   do i=1,n
       print '(a,i2,a,f7.2)',' Value of x(',i,'): ',x(i)
   enddo
   do i=1,n
       print '(a,i2,a,f7.2)',' Value of y(',i,'): ',y(i)
   enddo
   print*,'Coefficients of polynomial, b(i), i=1,...,m+1:'
   print*,'(b(1) = constant term)'
   do i=1,mp1
       print '(a,i1,a,f12.7)',' b(',i,') = ',b(i)
   enddo
   print*,'Measures of goodness of fit:'
   print '(a,f12.7)',' sum0 = ',sum0
   print '(a,f20.7)',' sumr = ',sumr
   print*,'Correlation coefficient r = ',r
end subroutine main
