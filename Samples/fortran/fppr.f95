$define WINDOWS 0
$define FPPR_KWD_CASE FPPR_LOWER
$define FPPR_USR_CASE FPPR_LEAVE
$define FPPR_MAX_LINE 132
program test_fppr

$if WINDOWS
character(len=*), parameter :: slash = "\"
$else
character(len=*), parameter :: slash = "/"
$endif

character(len=*), parameter :: file_name = &
   "." // slash // "fppr_out.f95"
integer :: ios
character(len=99) :: line

open (file=file_name, unit=35, &
      iostat=ios, status="old", &
      action="read", position="rewind")
if (ios == 0) then
   print *, "Successfully opened ", file_name
   read (unit=35, fmt="(a)") line
   print *, "First line: ", trim(line)
else
   print *, "Couldn't open ", file_name
   print *, "IOSTAT = ", ios
end if

end program test_fppr

! [walt@localhost Examples]$ fppr < fppr.F95 > fppr_out.f95
! This is f90ppr: @(#) fppridnt.f90	V-1.3 00/05/09 Michel Olagnon
! ( usage: f90ppr < file.F90  > file.f90 )
! [walt@localhost Examples]$ F fppr_out.f95
! [walt@localhost Examples]$ ./a.out
!  Successfully opened ./fppr_out.f95
!  First line: program test_fppr
