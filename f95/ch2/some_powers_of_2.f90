program some_powers_of_2
   ! Program to print powers of 2 up to 1000
   integer :: power_of_2
   power_of_2 = 1 ! The zero of 2
   do
      print *, power_of_2
      power_of_2 = 2 * power_of_2
      if ( power_of_2 > 1000 ) then
         exit
      end if
   end do
end program some_powers_of_2

