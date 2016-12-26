program io_demo

!  Use the "stream IO" feature to read lines a character
!  at a time and do some simple processing of each character.

integer              :: i, n, ios
character (len=50)   :: line
character (len=1)    :: c

open (unit=10, file="io_demo.f95", status="old",         &
      action="read", form="formatted", position="rewind")

i = 0
print *, "Echo the lines"

do
  read (unit=10, fmt="(a)", iostat=ios) line
  if (ios==0) then
    i = i + 1
    print *, i, ">", line, "<"
  else
    exit
  endif
enddo

rewind (unit=10)

print *
print *, "Process each line"

do n = 1,i
  write (unit=*, fmt="(a)", advance="no") " >>>"
  ch:  do
! Read a character at a time
    read (unit=10, fmt="(a)", iostat=ios, advance="no") c
    if (ios /= 0) then
      write (unit=*, fmt="(a)") "<<<"
      exit ch
    endif
! Perform a simple operation on each character
    select case (c)
      case ("a":"z", "A":"Z")
        write (unit=*, fmt="(a)", advance = "no") c
      case ("0":"9")
        write (unit=*, fmt="(a)", advance = "no") c
        write (unit=*, fmt="(a)", advance = "no") "*"
      case ("!")
        write (unit=*, fmt="(a)" ) "||"
        read  (unit=10, fmt="(a)") c  ! Terminate this input line
        exit ch  
      case default
!       Skip other characters
      end select
  enddo  ch
enddo 
end program io_demo
