program blastoff
   implicit none
   integer :: i
   do i = 10, 1, -1
      print *, i
      call sleep(1)
   end do
   print *, "Blast off!"
end program blastoff

