program test_for_ptime_3
   integer :: i, n
   logical :: isprime

   print *, "Input a number to test"
   read *, n
   if ( modulo(n,2) == 0 ) then
      isprime = n == 2
   else
      isprime = .true.
      do i = 3, int(sqrt(real(n))), 2
         ! See if i divides n evenly
         if ( modulo(n,i) == 0 ) then
            isprime = .false.
            exit
         end if
      end do
   end if

   if ( isprime ) then
      print *, n, " is prime"
   else
      print *, n, " is not prime"
   end if
end program test_for_ptime_3

