program f0_1_lastfirst
   implicit none
   character (len=20) :: first, last
   character (len=42) :: reverse
   print *, "Enter first and last name"
   read *, first, last
   reverse = last // ", " // first
   print *, reverse
   reverse = trim(last) // ", " // first
   print *, reverse
end program f0_1_lastfirst

