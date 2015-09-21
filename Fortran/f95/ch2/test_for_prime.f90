program test_for_prime
   integer :: i, n
   logical :: isprime

   print *, "Input a number to test"
   read *, n
   isprime = .true. ! This will be changed if it isn't prime
   do i = 2, n-1
      ! See if i divides n evenly
      if ( modulo(n,i) == 0 ) then
         isprime = .false.
         exit
      end if
   end do

   if ( isprime ) then
      print *, n, " is prime"
   else
      print *, n, " is not prime"
   end if
end program test_for_prime

