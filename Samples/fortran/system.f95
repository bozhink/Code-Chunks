program p
  use f90_unix_proc
  call system("ls -l")
  call sleep(10)
  print*,"goodnight"
end program p
