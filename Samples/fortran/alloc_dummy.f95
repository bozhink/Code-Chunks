program alloc_dummy

   real, allocatable, dimension(:) :: a

   call allocate_and_fill(a, 100)

   print *, sum(a)

contains

subroutine allocate_and_fill(da, n)

   real, allocatable, dimension(:), &
         intent(in out) :: da
   integer, intent(in) :: n

   allocate (da(n))
   call random_number(da)

end subroutine allocate_and_fill

end program alloc_dummy
