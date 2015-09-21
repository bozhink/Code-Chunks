program lastfirst
   character (len=20) :: first, last
   character (len=len(first)+len(last)+2) :: reverse
   print *, "Enter first and last name"
   read *, first, last
   reverse = trim(last) // ", " // trim(first)
   print *, reverse
end program lastfirst

