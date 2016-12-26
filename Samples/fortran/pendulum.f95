program pendulum
!  Calculates the frequency and period
!  of a pendulum of length L

   real :: L, f, T
   real, parameter :: pi = 3.14159, &
                       g = 9.80665

   L = 1

   f = (1.0 / (2.0 * pi)) * sqrt (g / L)
   T = 1.0 / f
   print *, "The frequency of the pendulum is", &
                  f, "swings/sec."
   print *, "Each swing takes", T, "sec."
end program pendulum
