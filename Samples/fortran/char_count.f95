program char_count
   integer, parameter :: end_of_record = -2
   integer, parameter :: end_of_file = -1
   character (len = 1) :: c
   integer :: character_count, ios

   open (unit = 11, file = "char_count.f95", &
         status = "old", action = "read", position = "rewind")
   character_count = 0
   do
      read (unit = 11, fmt = "(a)", advance = "no", &
            iostat = ios) c
      if (ios == end_of_record) then
         cycle
      else if (ios == end_of_file) then
         exit
      else
         character_count = character_count + 1
      end if
   end do

   print *, "The number of characters in the file is", &
            character_count
end program char_count
