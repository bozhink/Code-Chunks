program string
   use iso_varying_string
   type(varying_string) :: s
   call get(string=s)
   s = s // s
   call put(string=s)
   print *, len(s)
end program string
