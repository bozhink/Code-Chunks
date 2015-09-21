program test_for_prime_2
    implicit none
    integer::i,n
    logical::isprime
    print*,'Input a number to test'
    read*,n
    if (modulo(n,2)==0) then
       isprime=n==2
    else
       isprime=.true.
       do i=3,n-1,2
          if (modulo(n,i)==0) then
             isprime=.false.
             exit
          endif
       enddo
    endif

    if (isprime) then
       print*,n,' is prime'
    else
       print*,n,' is not prime'
    endif

end program test_for_prime_2
