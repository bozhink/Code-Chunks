program linear_regression
   use constants
   use least_squares
   implicit none
   integer, parameter :: n_sets = 15
   real (kind=q), dimension(n_sets), parameter :: &
      x = (/ 4.0_q, 5.0_q, 6.0_q, 7.0_q, 8.0_q, 9.0_q,10.0_q,11.0_q,&
            12.0_q,13.0_q,14.0_q,15.0_q,16.0_q,17.0_q,18.0_q/)
   real (kind=q), dimension(n_sets), parameter :: &
      y = (/ 6.558_q,8.206_q,9.880_q,11.50_q,13.14_q,14.82_q,16.40_q,18.04_q,&
             19.69_q,21.32_q,22.96_q,24.60_q,26.24_q,27.88_q,29.52_q/)
   real (kind=q) :: deltae, e0, syx, r2, sa, sb
   integer :: i
   do i = 1, n_sets
      print "('Value of x(',i2,'): ',f9.3,3x,'Value of y(',i2,'): ',f9.3)", i, x(i), i, y(i)
   end do
   
   call least_squares_line (n_sets, x, y, e0, deltae, syx, r2, sa, sb)
   print*
   print "('Value of elementary charge = ',f9.6)", e0
   print "('Experimental error         = ',f9.6)", deltae
   print "('Error in calculating e0    = ',f9.6)", sa
   print "('Error in intercept         = ',f9.6)", sb
   print "('Measure of goodness of fit = ',f9.6)", syx
   print "('Correlation coefficient    = ',f9.6)", sqrt(r2)
end program linear_regression