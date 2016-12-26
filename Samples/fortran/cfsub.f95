!This is the file cfsub.f95
!gcc -c c_calls_f.c
!F -c cfsub.f95
!gcc c_calls_f.o cfsub.o

module fmod
   public :: ffunc
   contains
   function ffunc(n) result(r)
      integer, intent(in) :: n
      integer :: r
      r = 2*n
   end function ffunc
end module fmod
