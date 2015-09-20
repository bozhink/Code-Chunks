program pendulumperiod
   ! This program calculates the period T 
   ! and the frequency f of a simple gravity pendulum
   ! by its length L
   real, parameter :: pi = 3.14159265, g = 9.80665
   real :: T, f, L
   print *, "Enter the length of the pendulum in m"
   read *, L
   T = (2.0*pi) * sqrt(L/g)
   f = 1.0 / T
   print *, "The period of a simple gravity pendulum of lenght L =", &
      L, " is T = ", T, " s"
   print *, "The frequency of a simple gravity pendulum of lenght L =", &
      L, " is f = ", f, " Hz"
end program pendulumperiod

