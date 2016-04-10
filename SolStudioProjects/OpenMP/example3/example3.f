!     
! File:   example3.f
! Author: bozhin
!
! Created on January 11, 2013, 10:17 AM
!
      program example
         integer i, j, n
         parameter (n = 6 000)
         integer*2 a(n*n)
         real sum
!$OMP PARALLEL DO DEFAULT(PRIVATE), SHARED(A)
         do i=1,n*n
            a(i) = 2 !int(2.0*rand())
         enddo
!$OMP END PARALLEL DO

         print*,'Calculation of the sum'
         sum=0.0
         do i=1,n*n
            sum = sum + a(i)
         enddo
         print*, sum
         stop
         end
