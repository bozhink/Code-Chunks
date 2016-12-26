module  swap_routines

! A module which defines a generic subroutine, swap, and defines
! the specific subroutines which implement it for several data
! types.

public  ::  swap ! Only the generic name is visable 
                 ! outside of the module
private ::  i_swap, r_swap, c_swap, l_swap, ch_swap

interface swap
    module procedure  i_swap, r_swap, c_swap, l_swap, ch_swap
end interface

contains

subroutine i_swap (a,b)
integer,  intent(inout)  ::  a,b
integer                  ::  t
t = a
a = b
b = t
end subroutine i_swap

subroutine r_swap (a,b)
real,  intent(inout) ::  a,b
real                 ::  t
t = a
a = b
b = t
end subroutine r_swap

subroutine c_swap (a,b)
complex,  intent(inout)  ::  a,b
complex                  ::  t
t = a
a = b
b = t
end subroutine c_swap

subroutine l_swap (a,b)
logical,  intent(inout)  ::  a,b
logical                  ::  t
t = a
a = b
b = t
end subroutine l_swap

subroutine ch_swap (a,b)
character(len=*),  intent(inout)  ::  a,b
character(len=1)                  ::  t
integer                           ::  i
if (len(a) == len(b) ) then
  do i = 1, len(a)
    t = a(i:i)
    a(i:i) = b(i:i)
    b(i:i) = t
  end do
else
  print *, "Lengths of character strings differ--can't swap"
  stop
end if
end subroutine ch_swap

end module swap_routines

program try_swap

use swap_routines

integer             :: i1, i2
character (len=16)  :: c1, c2

i1 = 10
i2 = 20
c1 = "String1"
c2 = "The other string"

print *, "i1 and i2 before swap", i1, i2
call swap (i1, i2)
print *, "i1 and i2 after  swap", i1, i2

print *, "c1 and c2 before swap >", c1, "< >", c2,"<"
call swap (c1, c2)
print *, "c1 and c2 after  swap >", c1, "< >", c2,"<"

end program try_swap
