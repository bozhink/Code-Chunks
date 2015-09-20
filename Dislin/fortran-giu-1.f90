program mygui1
use dislin
implicit none
integer :: ival, iselect
character :: myname*30, myfile*100

call dwgmsg('Program mygui1 has started.|Second line of msg')

ival = 0 ! value is NO upon entry
call dwgbut('Does this look ok?', ival)
print*,'Return value (0=n0 and 1=yes) :', ival

myname = ' ' ! some initial value needed on entry
call dwgtxt('What is your name?', myname)
print*,"User's name: ", trim(myname)

iselect = 2 ! default value needed on etry
call dwglis('Choose level', 'Easy|Medium|Hard', iselect)
print*,'Choosen level: ', iselect

myfile = 'mygiu1.f90' ! initial value needed on entry
call dwgfil('Choose a Fortran file', myfile, '*.f90')
print*,'The chosen file: ',trim(myfile)
end program mygui1
