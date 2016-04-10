      program example
         integer i, n
         parameter (n = 36 000 000)
         real*8 sum, a(n)

         do i=1,n
            a(i) = i*i
         enddo

         sum=0.0d0
!$OMP PARALLEL DO DEFAULT(PRIVATE), SHARED(A, SUM)
         do i=1,n
            sum = sum + a(i)
         enddo
!$OMP END PARALLEL DO
         print*, sum
         stop
         end
