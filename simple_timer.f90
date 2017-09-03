program simple_timer
   ! Compare times of the matmul
   !    intrinsic vs. DO loops
   
   intrinsic :: matmul
   integer, parameter :: long = selected_real_kind(15, 307)
   integer, parameter :: n = 1000
   real(kind=long), parameter :: tolerance = 1.0e-11_long
   real(kind=long), dimension(n, n) :: a, b, c1, c2
   character(len=8) :: date
   real :: start_time, stop_time
   integer :: i, j, k
   character(len=*), parameter :: frmt = '(t2, a, f0.3, " seconds")'
   
   ! Get date to print on report
   call date_and_time(date=date)
   
   print *, "Timing report dated: " // &
      date(1:4) // "-" // date(5:6) // "-" // date(7:8)
   
   call random_number(a)
   call random_number(b)
   
   call cpu_time(start_time)
   c1 = 0.0_long
   do k = 1, n
      do j = 1, n
         do i = 1, n
            c1(i, j) = c1(i, j) + a(i, k) * b(k, j)
         enddo
      enddo
   enddo
   call cpu_time(stop_time)
   
   print *
   print frmt, "Time of DO loop version is: ", &
      stop_time - start_time
   
   call cpu_time(start_time)
   c2 = matmul(a, b)
   call cpu_time(stop_time)
   
   print *
   print frmt, "Time of matmul version is: ", &
      stop_time - start_time
   
   print *
   print *, "Number of significantly different elements = ", &
      count(abs(c1 - c2) > tolerance)
   
   print *
   if (any(abs(c1 - c2) > tolerance)) then
      print *, "There are significantly different values"
   else
      print *, "Two products c1 and c2 are approximately the same"
   endif
end program simple_timer

