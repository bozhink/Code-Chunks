! g77 -c f77sub.f
! F f77sub.o f_calls_f77.f95
! ./a.out
! The value of arg is 42

program f_calls_f77
  integer, parameter :: n = 42
  call f77sub (n)
end program f_calls_f77

! file f77sub.f:

!      subroutine f77sub(arg)
!
!      print *, "The value of arg is ", arg
!
!      end
