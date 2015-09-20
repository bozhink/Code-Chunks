program test_for_prime
    implicit none
    integer::i,n
    logical::isprime
    print*,'Input a number to test'
    read*,n
    isprime=.true.
    do i=2,n-1
       if (modulo(n,i)==0) then
          isprime=.false.
          exit
       endif
    enddo
    if (isprime) then
       print*,n,' is prime'
    else
       print*,n,' is not prime'
    endif

end program test_for_prime
