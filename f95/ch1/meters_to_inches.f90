program meters_to_inches
! Converts length in meters to length in inches.
! The length in meters is typed
! when prompted during executuion.

   real :: m, inch
   real, parameter :: inch_per_m = 39.37

   ! Get the number of meters
   print *, "Enter a length in meters"
   read *, m

   inch = m * inch_per_m ! Do the conversion

   print *, m, "meters = ", inch, "inches"

end program meters_to_inches

