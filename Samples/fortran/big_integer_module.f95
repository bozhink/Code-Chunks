module big_integer_module

!  Copyright (C) 1993-2004 The Fortran Company
! 
!  Permission to use, copy, modify, and distribute this
!  software is freely granted, provided that this notice
!  is preserved.
 
!  The module named BIG_INTEGERS defines a new data type
!  BIG_INTEGER.  This data type represents nonnegative 
!  integers up to approximately 10**NR_OF_DECIMAL_DIGITS.

!  NR_OF_DECIMAL_DIGITS is a parameter that may be changed,
!  but the module must then be recompiled (it is not dynamic). 

!  The following operations are implemented.
!  b represents a big integer, c a character string,
!  and i an ordinary integer.

!  integer parameter nr_of_decimal_digits

!  type big_integer parameters Big_Inf and Big_NaN

!  big(i)
!  big(c)
!  int(b)
!  int(c)
!  char(b)
!  char(i)

!  b = i
!  b = c
!  i = b
!  i = c
!  c = b
!  c = i

!  b ? i, i ? b, and b ? b, where ? is
!    +, -, *, /, 
!    <, <=, >, >=, ==, or /=

!  b ** i

!  modulo(b, i)  [result is integer]
!  modulo(i, b)  [result is big_integer]
!  modulo(b, b)  [result is big_integer]

!  huge(b)
!  sqrt(b)

!  call print_big(b)
!  call random_number(b, low, high)

   implicit none

   public :: big
   public :: int
   public :: char
   public :: print_big
   public :: assignment(=)
   public :: operator(+)
   public :: operator(-)
   public :: operator(*)
   public :: operator(/)
   public :: operator(**)
   public :: modulo
   public :: huge
   public :: sqrt
   public :: random_number
   public :: operator(==)
   public :: operator(/=)
   public :: operator(<=)
   public :: operator(<)
   public :: operator(>=)
   public :: operator(>)

   private :: big_gets_int, &
              big_int, &
              big_gets_char, &
              big_char, &
              int_gets_big, &
              int_big, &
              int_gets_char, &
              int_char, &
              char_gets_big, &
              char_big, &
              char_gets_int, &
              char_int

   private :: big_plus_int, &
              int_plus_big, &
              big_plus_big, &
              big_minus_int, &
              int_minus_big, &
              big_minus_big, &
              big_times_int, &
              int_times_big, &
              big_times_big, &
              big_div_int, &
              int_div_big, &
              big_div_big, &
              big_power_int, &
              r_big_power_int, &
              modulo_big_int, &
              modulo_int_big, &
              modulo_big_big

   private :: big_eq_int, &
              int_eq_big, &
              big_eq_big, &
              big_ne_int, &
              int_ne_big, &
              big_ne_big, &
              big_le_int, &
              int_le_big, &
              big_le_big, &
              big_ge_int, &
              int_ge_big, &
              big_ge_big, &
              big_lt_int, &
              int_lt_big, &
              big_lt_big, &
              big_gt_int, &
              int_gt_big, &
              big_gt_big

   private :: huge_big, &
              big_base_to_power, &
              print_big_base, &
              sqrt_big, &
              msd, &
              random_number_big

   intrinsic :: char
   intrinsic :: int
   intrinsic :: modulo
   intrinsic :: huge
   intrinsic :: sqrt
   intrinsic :: random_number
   intrinsic :: radix
   intrinsic :: digits

   ! This indicates the maximum number of decimal digits
   ! that a big integer may contain.

   integer, parameter, public :: nr_of_decimal_digits = 100

   ! If the radix (returned by "radix(0)" of the integers on
   ! your system is not 2 change the following constant to
   ! the logarithm in the base 10 of the radix: log10(radix)

   real, parameter, private :: log_base_10_of_radix = 0.30103

   integer, parameter, private :: &
         d = digits(0) / 2, &
         r = radix(0), &
         base = r ** d, &
         nr_of_digits = nr_of_decimal_digits / (log_base_10_of_radix * d) + 1

   ! The base of the number system is r ** d,
   ! so that each "digit" is 0 to r**d - 1

   type, public :: big_integer
      private
      integer, dimension(0 : nr_of_digits) :: digit
   end type big_integer

   integer, private, parameter :: &
         Inf = 1, &
         NaN = 2

   integer, private :: n

   type(big_integer), public, parameter :: &
         Big_Inf = big_integer( (/ (0, n = 0, nr_of_digits-1), Inf /) ), &
         Big_NaN = big_integer( (/ (0, n = 0, nr_of_digits-1), NaN /) )

   interface big
      module procedure big_char, &
                       big_int
   end interface

   interface int
      module procedure int_char, &
                       int_big
   end interface

   interface char
      module procedure char_big, &
                       char_int
   end interface

   interface assignment(=)
      module procedure big_gets_int, &
                       big_gets_char, &
                       int_gets_big, &
                       int_gets_char, &
                       char_gets_big, &
                       char_gets_int
   end interface

   interface operator(+)
      module procedure big_plus_int, &
                       int_plus_big, &
                       big_plus_big
   end interface

   interface operator(-)
      module procedure big_minus_int, &
                       int_minus_big, &
                       big_minus_big
   end interface

   interface operator(*)
      module procedure big_times_int, &
                       int_times_big, &
                       big_times_big
   end interface

   interface operator(/)
      module procedure big_div_int, &
                       int_div_big, &
                       big_div_big
   end interface

   interface operator(**)
      module procedure big_power_int
   end interface

   interface modulo
      module procedure modulo_big_int, &
                       modulo_int_big, &
                       modulo_big_big
   end interface

   interface operator(==)
      module procedure big_eq_int, &
                       int_eq_big, &
                       big_eq_big
   end interface

   interface operator(/=)
      module procedure big_ne_int, &
                       int_ne_big, &
                       big_ne_big
   end interface

   interface operator(<=)
      module procedure big_le_int, &
                       int_le_big, &
                       big_le_big
   end interface

   interface operator(>=)
      module procedure big_ge_int, &
                       int_ge_big, &
                       big_ge_big
   end interface

   interface operator(<)
      module procedure big_lt_int, &
                       int_lt_big, &
                       big_lt_big
   end interface

   interface operator(>)
      module procedure big_gt_int, &
                       int_gt_big, &
                       big_gt_big
   end interface

   interface huge
      module procedure huge_big
   end interface

   interface sqrt
      module procedure sqrt_big
   end interface

   interface random_number
      module procedure random_number_big
   end interface

contains

pure function big_char(c) result(b)

   character(len=*), intent(in) :: c
   type(big_integer) :: b
   integer :: temp_digit, n

   if (len(c) > nr_of_decimal_digits) then
      b = Big_Inf
      return
   end if
   b % digit = 0
   do n = 1, len(c)
      temp_digit = index("0123456789", c(n:n)) - 1
      if (temp_digit < 0) then
         b = Big_NaN
         return
      end if
      b = b * 10 + temp_digit
   end do

end function big_char

pure subroutine big_gets_char(b, c)

   type(big_integer), intent(out) :: b
   character(len=*), intent(in) :: c

   b = big_char(trim(c))

end subroutine big_gets_char

pure function big_int(i) result(b)

   integer, intent(in) :: i
   type(big_integer) :: b
   integer :: temp_i, n

   if (i < 0) then
      b = Big_NaN
      return
   end if

   b % digit = 0
   temp_i = i
   do n = 0, nr_of_digits - 1
      if (temp_i == 0) return
      b % digit(n) = modulo(temp_i, base)
      temp_i = temp_i / base
   end do

   if (temp_i /= 0) b = Big_Inf

end function big_int

pure subroutine big_gets_int(b, i)

   type(big_integer), intent(out) :: b
   integer, intent(in) :: i

   b = big(i)

end subroutine big_gets_int

pure function int_char(c) result(i)

   character(len=*), intent(in) :: c
   integer :: i

   i = int(big(trim(c)))

end function int_char

pure subroutine int_gets_char(i, c)

   integer, intent(out) :: i
   character(len=*), intent(in) :: c

   i = int_char(trim(c))

end subroutine int_gets_char

pure function int_big(b) result(i)

   type(big_integer), intent(in) :: b
   integer :: i

   if (b % digit(nr_of_digits) /= 0 .or. msd(b) > 1) then
      i = huge(i)
   else
      i = base * b % digit(1) + b % digit(0)
   end if

end function int_big

pure subroutine int_gets_big(i, b)

   integer, intent(out) :: i
   type(big_integer), intent(in) :: b

   i = int(b)

end subroutine int_gets_big

pure function char_big(b) result(c)

   type(big_integer), intent(in) :: b
   character(len=nr_of_decimal_digits+9) :: c 
   type(big_integer) :: temp_big
   integer :: n, remainder
   character(len=*), parameter :: digit_chars = "0123456789"

   temp_big = b
   c = repeat(" ", len(c)-1) // "0"
   do n = len(c), 1, -1
      if (temp_big == 0) exit
      remainder = modulo(temp_big, 10) + 1
      temp_big = temp_big / 10
      c(n:n) = digit_chars(remainder:remainder)
   end do

   c = adjustl(c)

end function char_big

pure subroutine char_gets_big(c, b)

   type(big_integer), intent(in) :: b
   character(len=*), intent(out) :: c

   c = char(b)

end subroutine char_gets_big

pure function char_int(i) result(c)

   integer, intent(in) :: i
   character(len=nr_of_decimal_digits+9) :: c

   c = big(i)

end function char_int

pure subroutine char_gets_int(c, i)

   integer, intent(in) :: i
   character(len=*), intent(out) :: c

   c = big(i)

end subroutine char_gets_int

pure function msd(x) result(msd_result)

! Find most significan digit of x

   type(big_integer), intent(in) :: x
   integer :: msd_result
   integer :: n

   do n = nr_of_digits, 0, -1
      if (x % digit(n) /= 0) then
         msd_result = n
         return
      end if
   end do

   msd_result = -1

end function msd

pure function big_plus_int(b, i) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   type(big_integer) :: bi

   bi = b + big(i)

end function big_plus_int

pure function int_plus_big(i, b) result(bi)

   integer, intent(in) :: i
   type(big_integer), intent(in) :: b
   type(big_integer) :: bi

   bi = b + big(i)

end function int_plus_big

pure function big_plus_big(x, y) result(bb)

   type(big_integer), intent(in) :: x, y
   type(big_integer) :: bb
   integer :: carry, temp_digit, n, m

   if (x % digit(nr_of_digits) /= 0 .or. &
       y % digit(nr_of_digits) /= 0) then
      if (x == Big_NaN .or. y == Big_NaN) then
         bb = Big_NaN
      else if (x == Big_Inf .or. y == Big_Inf) then
         bb = Big_Inf
      end if
      return
   end if
   
   carry = 0
   m = max(msd(x), msd(y))
   do n = 0, m
      temp_digit = &
         x % digit(n) + y % digit(n) + carry
      bb % digit(n) = modulo(temp_digit, base)
      carry = temp_digit / base
   end do

   bb % digit(m+1) = carry
   bb % digit(m+2:nr_of_digits) = 0
   if (bb % digit(nr_of_digits) /= 0) bb = Big_Inf

end function big_plus_big

pure function big_minus_int(b, i) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   type(big_integer) :: bi

   bi = b - big(i)

end function big_minus_int

pure function int_minus_big(i, b) result(ib)

   integer, intent(in) :: i
   type(big_integer), intent(in) :: b
   type(big_integer) :: ib

   ib = big(i) - b

end function int_minus_big

pure function big_minus_big(x, y) result(bb)

   type(big_integer), intent(in) :: x, y
   type(big_integer) :: bb
   type(big_integer) :: temp_big
   integer :: n

   if (x % digit(nr_of_digits) /= 0 .or. &
       y % digit(nr_of_digits) /= 0) then
      if (x == Big_NaN .or. y == Big_NaN) then
         bb = Big_NaN
      else if (x == Big_Inf .and. y == Big_Inf) then
         bb = Big_NaN
      else if (x == Big_Inf) then
         bb = Big_Inf
      else if (y == Big_Inf) then
         bb = 0
      end if
      return
   end if

   temp_big = x
   do n = 0, nr_of_digits - 1
      bb % digit(n) = temp_big % digit(n) - y % digit(n)
      if (bb % digit(n) < 0) then
         bb % digit(n) = bb % digit(n) + base
         temp_big % digit(n + 1) = temp_big % digit(n + 1) - 1
      end if
   end do

   if (temp_big % digit(nr_of_digits) < 0) then
      bb % digit = 0
   else
      bb % digit(nr_of_digits) = 0
   end if

end function big_minus_big

pure function big_times_int(b, i) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   type(big_integer) :: bi

   bi = b * big(i)

end function big_times_int

pure function int_times_big(i, b) result(bi)

   integer, intent(in) :: i
   type(big_integer), intent(in) :: b
   type(big_integer) :: bi

   bi = b * big(i)

end function int_times_big

pure function big_times_big(x, y) result(bb)

   type(big_integer), intent(in) :: x, y
   type(big_integer) :: bb

   integer, dimension(0:2*nr_of_digits) :: tb
   integer :: ix, iy, ib, carry, prod

   if (x % digit(nr_of_digits) /= 0 .or. &
       y % digit(nr_of_digits) /= 0) then
      if (x == Big_NaN .or. y == Big_NaN) then
         bb = Big_NaN
      else if (x == Big_Inf .or. y == Big_Inf) then
         bb = Big_Inf
      end if
      return
   end if

   tb = 0

   do ix = 0, msd(x)
      carry = 0
      do iy = 0, msd(y)
         ib = ix + iy
         prod = x % digit(ix) * y % digit(iy) + tb(ib) + carry
         carry = prod / base
         tb(ib) = modulo(prod, base)
      end do
      tb(ib+1) = carry
   end do

   if (any(tb(nr_of_digits :) /= 0)) then
      bb = Big_Inf
   else
      bb % digit = tb(: nr_of_digits)
   end if
   
end function big_times_big

pure function big_base_to_power(n)  result(b)

   integer, intent(in) :: n
   type(big_integer) :: b

   if(n < 0) then
     b = 0
   else if(n >= nr_of_digits) then
      b = Big_Inf
   else
      b % digit = 0
      b % digit(n) = 1
   end if

end function big_base_to_power

pure function big_div_int(b, i) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   type(big_integer) :: bi

   bi = b / big(i)

end function big_div_int

pure function int_div_big(i, b) result(ib)

   integer, intent(in) :: i
   type(big_integer), intent(in) :: b
   type(big_integer) :: ib

   ib = big(i) / b

end function int_div_big

pure function big_div_big(x, y) result(bb)

   type(big_integer), intent(in) :: x, y
   type(big_integer) :: bb

   type(big_integer) :: tx, ty

   integer :: msdx, msdy, ix, iy
   integer :: v1, v2, u0, u1, u2
   integer :: dd, bi, car, bar, prd, tmp

   if (x % digit(nr_of_digits) /= 0 .or. &
       y % digit(nr_of_digits) /= 0) then
      if (x == Big_NaN .or. y == Big_NaN) then
         bb = Big_NaN
      else if (x == Big_Inf) then
         if (y == Big_Inf .or. y == 0) then
            bb = Big_NaN
         else
            bb = Big_Inf
         end if
      else if (y == Big_Inf) then
         bb = 0
      end if
      return
   end if

   if (y == 0) then
      if (x == 0) then
         bb = Big_NaN
      else
         bb = Big_Inf
      end if
      return
   end if

   msdx = msd(x)
   msdy = msd(y)

   bb % digit = 0

   if (msdx < msdy) then
      return
   end if

   if (msdy == 0) then
      car = 0
      dd = y % digit(0)
      do ix = msdx, 0, -1
         tmp = car * base + x % digit(ix)
         bb % digit(ix) = tmp / dd
         car = modulo(tmp, dd)
      end do
      return
   end if

   tx = x
   ty = y

   car = 0
   bar = 0
   prd = 0
   dd = base / (ty % digit(msdy) + 1)
   if (dd /= 1) then
      do ix = 0, msdx
         tx % digit(ix) = tx % digit(ix) * dd + car
         car = tx % digit(ix) / base
         tx % digit(ix) = tx % digit(ix) - base * car
      end do
      tx % digit(msdx+1) = car
      car = 0
      do iy = 0, msdy
         ty % digit(iy) = ty % digit(iy) * dd + car
         car = ty % digit(iy) / base
         ty % digit(iy) = ty % digit(iy) - base * car
      end do
   end if

   v1 = ty % digit(msdy)
   v2 = ty % digit(msdy-1)

   do msdx = msdx + 1, msdy + 1, -1

      u0 = tx % digit(msdx)
      u1 = tx % digit(msdx-1)
      u2 = tx % digit(msdx-2)

      if (u0 == v1) then
         bi = base - 1
      else 
         bi = (u0*base + u1) / v1
      end if

      do
         if (v2*bi <= (u0*base + u1 - bi*v1) * base + u2) then
            exit
         end if
         bi = bi - 1
      end do

      if (bi > 0) then
         car = 0
         bar = 0
         ix = msdx - msdy - 1
         do iy = 0, msdy
            prd = bi * ty % digit(iy) + car
            car = prd / base
            prd = prd - base * car
            tx % digit(ix) = tx % digit(ix) - (prd + bar)
            if (tx % digit(ix) < 0) then
               bar = 1
               tx % digit(ix) = tx % digit(ix) + base
            else
               bar = 0
            end if
            ix = ix + 1
         end do
         if (tx % digit(msdx) < car + bar) then
            car = 0
            bi = bi -1
            ix = msdx - msdy - 1
            do iy = 0, msdy
               tx % digit(ix) = tx % digit(ix) + ty % digit(iy) + car
               if (tx % digit(ix) > base) then
                  car = 1
                  tx % digit(ix) = tx % digit(ix) - base
               else
                  car = 0
               end if
               ix = ix + 1
            end do
         end if
      end if
      tx % digit(msdx) = 0
      bb % digit(1:nr_of_digits) = bb % digit(0:nr_of_digits-1)
      bb % digit(0) = bi
   end do

end function big_div_big

pure function modulo_big_int(b, i) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   integer :: bi

   bi = modulo(b, big(i))

end function modulo_big_int

pure function modulo_int_big(i, bb) result(ib)

   type(big_integer), intent(in) :: bb
   integer, intent(in) :: i
   type(big_integer) :: ib

   ib = modulo(big(i), bb)

end function modulo_int_big

pure function modulo_big_big(x, y) result(bb)

   type(big_integer), intent(in) :: x, y
   type(big_integer) :: bb

   bb = x - x / y * y

end function modulo_big_big

pure function big_eq_int(b, i) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   logical :: bi

   bi = b % digit(nr_of_digits) == 0 .and. int(b) == i

end function big_eq_int

pure function int_eq_big(i, b) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   logical :: bi

   bi = b % digit(nr_of_digits) == 0 .and. int(b) == i

end function int_eq_big

pure function big_eq_big(x, y) result(bb)

   type(big_integer), intent(in) :: x, y
   logical :: bb

   bb = all(x % digit == y % digit)

end function big_eq_big

pure function big_ne_int(b, i) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   logical :: bi

   bi = b % digit(nr_of_digits) == 0 .or. int(b) /= i

end function big_ne_int

pure function int_ne_big(i, b) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   logical :: bi

   bi = b % digit(nr_of_digits) == 0 .or. int(b) /= i

end function int_ne_big

pure function big_ne_big(x, y) result(bb)

   type(big_integer), intent(in) :: x, y
   logical :: bb

   bb = any(x % digit /= y % digit)

end function big_ne_big

pure function big_le_int(b, i) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   logical :: bi

   bi = b % digit(nr_of_digits) == 0 .and. int(b) <= i
 
end function big_le_int

pure function int_le_big(i, b) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   logical :: bi

   if (b % digit(nr_of_digits) /= 0) then
      bi = (b == Big_Inf)
   else
      bi = i <= int(b)
   end if
 
end function int_le_big

pure function big_le_big(x, y) result(bb)

   type(big_integer), intent(in) :: x, y
   logical :: bb
   integer :: n

   if (x % digit(nr_of_digits) /= 0 .or. &
       y % digit(nr_of_digits) /= 0) then
      if (x == Big_NaN .or. y == Big_NaN) then
         bb = .false.
      else if (y == Big_Inf) then
         bb = .true.
      else if (x == Big_Inf) then
         bb = .false.
      end if
      return
   end if

   bb = .true.
   do n = nr_of_digits, 0, -1
      if (x % digit(n) /= y % digit(n)) then
         bb = (x % digit(n) < y % digit(n))
         exit
      end if
   end do

end function big_le_big

pure function big_gt_int(b, i) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   logical :: bi

   if (b % digit(nr_of_digits) /= 0) then
      bi = (b == Big_Inf)
   else
      bi = int(b) > i
   end if
 
end function big_gt_int

pure function int_gt_big(i, b) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   logical :: bi

   bi = b % digit(nr_of_digits) == 0 .and. i > int(b)
 
end function int_gt_big

pure function big_gt_big(x, y) result(bb)

   type(big_integer), intent(in) :: x, y
   logical :: bb
   integer :: n

   if (x % digit(nr_of_digits) /= 0 .or. &
       y % digit(nr_of_digits) /= 0) then
      if (x == Big_NaN .or. y == Big_NaN) then
         bb = .false.
      else if (y == Big_Inf) then
         bb = .false.
      else if (x == Big_Inf) then
         bb = .true.
      end if
      return
   end if

   bb = .true.
   do n = nr_of_digits, 0, -1
      if (x % digit(n) /= y % digit(n)) then
         bb = (x % digit(n) < y % digit(n))
         exit
      end if
   end do
   bb = .not. bb

end function big_gt_big

pure function big_lt_int(b, i) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   logical :: bi

   bi = b % digit(nr_of_digits) /= 0 .and. i > int(b)

end function big_lt_int

pure function int_lt_big(i, b) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   logical :: bi

   if (b % digit(nr_of_digits) /= 0) then
      bi = (b == Big_Inf)
   else
      bi = int(b) > i
   end if
 
end function int_lt_big

pure function big_lt_big(x, y) result(bb)

   type(big_integer), intent(in) :: x, y
   logical :: bb
   integer :: n

   if (x % digit(nr_of_digits) /= 0 .or. &
       y % digit(nr_of_digits) /= 0) then
      if (x == Big_NaN .or. y == Big_NaN) then
         bb = .false.
      else if (x == Big_Inf) then
         bb = .false.
      else if (y == Big_Inf) then
         bb = .true.
      end if
      return
   end if

   bb = .false.
   do n = nr_of_digits, 0, -1
      if (x % digit(n) /= y % digit(n)) then
         bb = (x % digit(n) < y % digit(n))
         exit
      end if
   end do

end function big_lt_big

pure function big_ge_int(b, i) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   logical :: bi

   if (b % digit(nr_of_digits) /= 0) then
      bi = (b == Big_Inf)
   else
      bi = i <= int(b)
   end if
 
end function big_ge_int

pure function int_ge_big(i, b) result(bi)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   logical :: bi

   bi = b % digit(nr_of_digits) == 0 .and. int(b) <= i
 
end function int_ge_big

pure function big_ge_big(x, y) result(bb)

   type(big_integer), intent(in) :: x, y
   logical :: bb
   integer :: n

   if (x % digit(nr_of_digits) /= 0 .or. &
       y % digit(nr_of_digits) /= 0) then
      if (x == Big_NaN .or. y == Big_NaN) then
         bb = .false.
      else if (x == Big_Inf) then
         bb = .true.
      else if (y == Big_Inf) then
         bb = .false.
      end if
      return
   end if

   bb = .false.
   do n = nr_of_digits, 0, -1
      if (x % digit(n) /= y % digit(n)) then
         bb = (x % digit(n) < y % digit(n))
         exit
      end if
   end do

   bb = .not. bb

end function big_ge_big

pure function huge_big(b) result(hb)

   type(big_integer), intent(in) :: b
   type(big_integer) :: hb

   hb % digit(0) = b % digit(0) ! to avoid diagnostic
   hb % digit = base - 1
   hb % digit(nr_of_digits) = 0

end function huge_big

pure function sqrt_big(b) result(sb)

   type(big_integer), intent(in) :: b
   type(big_integer) :: sb
   type(big_integer) :: old_sqrt_big, new_sqrt_big
   integer :: n

   if (b % digit(nr_of_digits) /= 0) then
       sb = b
       return
   end if

   n = msd(b)

   if (n == -1) then
      sb = 0
   else if (n == 0) then
      sb = int(sqrt(b % digit(0) + 0.5))
   else
      old_sqrt_big = 0
      if (modulo(n, 2) == 0) then
         old_sqrt_big % digit(n / 2) = sqrt(b % digit(n) + 0.5)
      else
         old_sqrt_big % digit((n - 1) / 2) =  &
               sqrt(base * b % digit(n) + b % digit(n-1) + 0.5)
      end if

      do
         new_sqrt_big = (old_sqrt_big + b / old_sqrt_big) / 2
         if (new_sqrt_big == old_sqrt_big .or.  &
             new_sqrt_big == old_sqrt_big + 1 .or.  &
             new_sqrt_big == 0) exit
         old_sqrt_big = new_sqrt_big
      end do
      sb = old_sqrt_big
   end if

end function sqrt_big

pure function big_power_int(b, i)  &
      result(big_power_int_result)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   type(big_integer) :: big_power_int_result

   if (b == Big_NaN) then
      big_power_int_result = Big_NaN
   else if (i < 0) then
      if (b == 0) then
         big_power_int_result = Big_Inf
      else
         big_power_int_result = 0
      end if
   else if (i == 0) then
      if (b == 0 .or. b == Big_Inf) then
         big_power_int_result = Big_NaN
      else
         big_power_int_result = 1
      end if
   else if (b == Big_Inf) then
      big_power_int_result = Big_Inf
   else
      big_power_int_result = r_big_power_int(b, i)
   end if

end function big_power_int

pure recursive function r_big_power_int(b, i)  &
      result(big_power_int_result)

   type(big_integer), intent(in) :: b
   integer, intent(in) :: i
   type(big_integer) :: big_power_int_result
   type(big_integer) :: temp_big

   if (i == 0) then
      big_power_int_result = 1
   else
      temp_big = big_power_int(b, i / 2)
      if (modulo(i, 2) == 0) then
         big_power_int_result = temp_big * temp_big
      else
         big_power_int_result = temp_big * temp_big * b
      end if
   end if

end function r_big_power_int

subroutine print_big(b)

   type(big_integer), intent(in) :: b

   if (b == Big_Inf) then
      write (unit=*, fmt="(a)", advance="no") "Inf"
   else if (b == Big_NaN) then
      write (unit=*, fmt="(a)", advance="no") "NaN"
   else
      write (unit=*, fmt="(a)", advance="no") trim(char(b))
   end if

end subroutine print_big

subroutine print_big_base(b)

   type(big_integer), intent(in) :: b
   integer :: n

   print *, "base: ", base
   do n = nr_of_digits, 1, -1
      if (b % digit(n) /= 0) exit
   end do
   print "(10i9)", b % digit(n:0:-1)

end subroutine print_big_base

subroutine random_number_big(r, low, high)
 
!  Generate by linear congruence x' = ax + c mod m
!  where m is huge(b) + 1 = base ** nr_of_digits

   type(big_integer), intent(out) :: r
   type(big_integer), intent(in) :: low, high
   integer :: n, i, carry, prod, summ
   type(big_integer), save :: x = big_integer( (/ (1, i=0,nr_of_digits-1), 0 /) )
   type(big_integer), parameter :: h = big_integer( (/ (base-1, i=0,nr_of_digits-1), 0 /) )
   integer, parameter :: a = 16907, c = 8191

!  Multiply by a
   carry = 0
   do n = 0, nr_of_digits - 1
      prod = x % digit(n) * a + carry
      x % digit(n) = modulo(prod, base)
      carry = prod / base
   end do

!  Add c
   carry = c
   do n = 0, nr_of_digits - 1
      summ = x % digit(n) + carry
      x % digit(n) = modulo(summ, base)
      carry = summ / base
   end do

   r = x / (h / (high -low + 1)) + low

end subroutine random_number_big

end module big_integer_module