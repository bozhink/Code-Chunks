! [walt@sonora Examples]$ F args.f95 
! [walt@sonora Examples]$ ./a.out aaaa bbbbb ccc
!  /bin/bash
!  0 ./a.out
!  1 aaaa
!  2 bbbbb
!  3 ccc

program test_args

use f90_unix_env

integer :: n_args, n
character(len=99) :: arg, shell

call getenv("SHELL",shell)
print *, trim(shell)

n_args = iargc()
do n = 0, n_args
   call getarg(n, arg)
   print *, n, trim(arg)
end do

end program test_args
