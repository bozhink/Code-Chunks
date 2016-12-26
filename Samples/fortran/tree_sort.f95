module tree_module

public :: insert, print_tree

   type, public :: node
      integer :: value
      type (node), pointer :: left => null(), right => null()
   end type node

contains

   recursive subroutine insert (t, number)

      type (node), pointer :: t  ! A tree
      integer, intent (in) :: number

      ! If (sub)tree is empty, put number at root
      if (.not. associated (t)) then
         allocate (t)
         t % value = number
      ! Otherwise, insert into correct subtree
      else if (number < t % value) then
         call insert (t % left, number)
      else
         call insert (t % right, number)
      end if

   end subroutine insert

   recursive subroutine print_tree (t)
   ! Print tree in infix order

      type (node), pointer :: t  ! A tree

      if (associated (t)) then
         call print_tree (t % left)
         print *, t % value
         call print_tree (t % right)
      end if

   end subroutine print_tree

end module tree_module

program tree_sort
! Sorts a file of integers by building a
! tree, sorted in infix order.
! This sort has expected behavior n log n,
! but worst case (input is sorted) n ** 2.

   use tree_module

   type (node), pointer :: t => null() ! A tree
   integer :: n
   integer, dimension (16) :: number

   number = (/ &
      2980957, &
      3269017, &
      1202604, &
      2718281, &
      8103083, &
      2202646, &
      8886110, &
      2008553, &
      4424133, &
      1627547, &
      4034287, &
      5459815, &
      7389056, &
      1096633, &
      1484131, &
      5987414 /)

   do n = 1, size (number)
      call insert (t, number (n)) ! Put next number in tree
   end do
   ! Print nodes of tree in infix order
   call print_tree (t)

end program tree_sort
