program leastSquares
! Least squares polynomial regression
! Least squares polynomial of order m through n
! data points (x(i), y(i)), i = 1, 2, ..., n
   !use eqn_solver
   use constants
   use least_squares
   implicit none
   integer, parameter :: n = 17, m = 2, mp1 = m + 1
   real (kind=q), dimension(n), parameter :: &
      x = (/ 0.65_q,0.85_q,1.05_q,1.25_q,1.60_q,1.60_q,2.00_q, &
             2.40_q,2.85_q,2.85_q,3.25_q,3.65_q,3.65_q,4.10_q, &
             4.45_q,4.45_q,4.90_q /)
   real (kind=q), dimension(n), parameter :: &
      y = (/ 0.80_q,1.65_q,1.30_q,1.90_q,2.05_q,2.50_q,2.65_q, &
             3.00_q,2.70_q,3.00_q,2.80_q,2.45_q,2.85_q,2.20_q, &
             1.60_q,2.00_q,1.25_q /)
   real (kind=q), dimension(mp1) :: b
   real (kind=q) :: eps, r2, sumr, sum0
   integer :: i, j

   eps = 1.0e-6_q

   call least_squares_poly(n, m, x, y, eps, b, r2, sumr, sum0)

   print "(a,i1)", "Least squares polynomial of order ", m
   print "(a,i2,a)","through ", n, " data points"
   do i = 1, n
      print "(a,i2,a,f7.2)", " Value of x(",i,"): ", x(i)
   end do
   do i = 1, n
      print "(a,i2,a,f7.2)", " Value of y(",i,"): ", y(i)
   end do
   print *, "Coefficients of polynomial, b(i), i=1,...,m+1:"
   print *, "(b(i) = constant term)"
   do i = 1, mp1
      print "(a,i1,a,f12.7)", " b(",i,") = ", b(i)
   end do
   print *, "Measures of goodness of fit:"
   print "(a,f12.7)", " sum0 = ", sum0
   print "(a,f12.7)", " sumr = ", sumr
   print *, "Correlation coefficient r =", sqrt(r2)

end program leastSquares
