program test_roman
use roman_numerals_module
implicit none

type(roman) :: r
integer :: i

write (unit=*, fmt="(a)") "Integer  Roman Number"
do i = 1900, 2000
  r = i
  write (unit=*, fmt="(/, tr4, i4, tr2)", advance = "NO") i
  call print_roman (r)
end do
write (unit=*, fmt="(2/)")

end program test_roman
