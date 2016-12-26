module factor_module

use big_integer_module

private

integer, private :: nr_of_primes
integer, dimension (:), private, allocatable :: primes
logical, save, private :: primes_read = .false.
public :: prime, print_factors, read_primes

contains

function prime (b) result (pb)

   type (big_integer), intent (in) :: b
   logical :: pb
   type (big_integer) :: big_s, big_div
   integer :: div, i

   if (b <= 1) then
      pb = .false.
   else
      if (.not. primes_read) then
         pb = .false.
         return
      end if
      pb = .true.
      big_s = sqrt (b)
      do i = 1, nr_of_primes
         div = primes(i)
         if (div > big_s) then
            return  ! b is prime
         end if
         if (modulo (b, div) == 0) then
            pb = .false.
            return
         end if
      end do
      big_div = primes (nr_of_primes)
      big_div = big_div + 2
      do
         if (big_div > big_s) then
            exit
         end if
         if (modulo (b, big_div) == 0) then
            pb = .false.
            exit
         end if
         big_div = big_div + 2
      end do
   end if

end function prime

subroutine print_factors (b)

   type (big_integer), intent (in) :: b
   type (big_integer) :: temp_b, sqrt_b, f
   integer :: i, pi

   if (.not. primes_read) then
      call read_primes ()
   end if

   temp_b = b
   sqrt_b = sqrt (temp_b)

   if (b <= 1) then
      return
   end if

   do i = 1, nr_of_primes
      pi = primes (i)
      if (pi > sqrt_b) then
         call print_big (temp_b)
         write (unit=*, fmt="(a)", advance="no") " "
         return
      end if
      do
         if (modulo (temp_b, pi) == 0) then
            write (unit=*, fmt="(i0, a)", advance="no") pi, " "
            temp_b = temp_b / pi
            sqrt_b = sqrt (temp_b)
         else
            exit
         end if
      end do
      if (temp_b == 1) then
         return
      end if
   end do

   f = primes (nr_of_primes)
   do
      f = f + 2
      if (f > sqrt_b) then
         call print_big (temp_b)
         write (unit=*, fmt="(a)", advance="no") " "
         return
      end if
      do
         if (modulo (temp_b, f) == 0) then
            call print_big (f)
            write (unit=*, fmt="(a)", advance="no") " "
            temp_b = temp_b / f
         else
            exit
         end if
      end do
      if (temp_b == 1) then
         return
      end if
   end do

end subroutine print_factors

subroutine read_primes ()

   integer :: ios

   if (primes_read) then
      return
   end if

   open (unit=11, file="primes", status="old", &
         action="read", position="rewind", &
         form="unformatted", iostat=ios)
   if (ios /= 0) then
      print *, "Could not open primes file: ", ios
      stop
   end if
   read (unit=11, iostat=ios) nr_of_primes
   if (ios /= 0) then
      print *, "Could not read number of primes: ", ios
      stop
   end if
   allocate (primes(nr_of_primes), stat=ios)
   if (ios > 0) then
      print *, "Allocation of primes array failed: ", ios
      return
   end if
   read (unit=11, iostat=ios) primes
   if (ios /= 0) then
      print *, "Problem reading primes file: ", ios
      stop
   end if
   primes_read = .true.

end subroutine read_primes

end module factor_module


program factor_big_int

use big_integer_module
use factor_module

type (big_integer) :: b1

b1 = "12345678900987654321"
call print_big (b1)
print *
call print_factors (b1)

end program factor_big_int
