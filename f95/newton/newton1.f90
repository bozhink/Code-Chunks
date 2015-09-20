program newton1

   use function_module
   use newton_module

   real :: y1, y, accuracy
   integer :: icount, maxit, converg

   print *, 'Enter y1, accuracy and maxit'
   read * , y1, accuracy, maxit

   call newton(f, df, y1, accuracy, maxit, y, fy, converg)

   if (converg < maxit) then
      print *, 'Convergence reached at ', converg, &
          ' iterations:'
      print *, 'Root at x = ', y, ','
      print *, 'where f(x) = ', fy ,'.'
   else
      print *, 'No convergence in ', maxit, ' iterations!'
      print *, 'Final x = ', y, '.'
      print *, 'Final f(x) = ', fy, '.'
   endif

end program newton1

