module prime_mod

public :: prime

contains

function prime (b) result (pb)

   integer, intent (in) :: b
   logical :: pb
   integer :: s, div

   if (b <= 1) then
      pb = .false.
   else if (b == 2) then
      pb = .true.
   else if (modulo (b, 2) == 0) then
      pb = .false.
   else
      pb = .true.
      s = int(sqrt(real(b)+0.5))
      div = 3
      do
         if (div > s) then
            exit
         end if
         if (modulo (b, div) == 0) then
            pb = .false.
            exit
         end if
         div = div + 2
      end do
   end if

end function prime

end module prime_mod

program make_primes

   use prime_mod

   integer, parameter :: max_n = 10000000
   integer :: a
   integer, dimension(max_n) :: primes
   integer :: n, ios

   open (unit=11, file="primes", status="replace", &
        action="write", form="unformatted", iostat=ios)

    if (ios /= 0) then
       print *, "Unable to open primes file"
       stop
    end if
    n = 1
    primes(n)=2
    a = 3
    do
    if (prime(a)) then
       n = n+1
       primes(n) = a
       if (n==max_n) then
          exit
       end if
if(modulo(n,max_n/10)==0)then
print*,n
end if
    end if
if(a>huge(a)-2) then
   print*,"limit",a,n,huge(a)
   exit
end if
    a = a+2
    end do
    write(unit=11) n
    write(unit=11) primes
    print*,n,primes(n),huge(n)
    close(unit=11, status="keep")
    
end program make_primes
