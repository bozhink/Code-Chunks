module comp_module

public :: compress

contains

! The result of this function is the original argument with
! adjacent duplicate entries deleted (so if it was sorted,
! each element is unique).

function compress(array) result (ra)

   integer, allocatable, &
            dimension(:) :: ra
   integer,intent(in), dimension(:) :: array
   integer :: i, n

   if (size(array, 1)==0) theN
      allocate(ra(0))
   else
      n = 1
      do i = 2, size(array)
         if (array(i) /= array(i-1)) n = n + 1
      end do
      allocate(ra(n))
      n = 1
      ra(1) = array(1)
      do i = 2, size(array)
         if (array(i) /= ra(n)) then
            n = n + 1
            ra(n) = array(i)
         end if
      end do
   end if

end function compress

end module comp_module

module list_module

use comp_module
private

type, public :: list
   integer, dimension(:), &
         allocatable :: value
end type list

public :: assignment(=)
private :: assign

! Modify assignment of lists
! so that compression occurs

interface assignment(=)
   module procedure assign
end interface

contains

subroutine assign(v, e)

   type(list), intent(in) :: e
   type(list), intent(out) :: v

   allocate(v%value(size(compress(e%value))))
   v%value = compress(e%value)

end subroutine assign

end module list_module


program alloc_struct

use list_module

type(list) :: b
integer :: n

b = list( (/ 1,1,1,2,2,2,2,3,4,4 /) )
n = size(b%value)
print *, n, ":", b%value

end program alloc_struct
