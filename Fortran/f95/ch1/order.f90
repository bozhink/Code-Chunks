program order
   ! Do some math
   real :: x, y, z
   real :: a, b, c, d, e, f, g
   print *, "Enter values of a, b, c, d, e, f, and g" 
   read *, a, b, c, d, e, f, g

   x = a*b + c*d + e/f**g
   y = a*(b + c)*d + (e/f)**g
   z = a*(b + c)*(d + e)/f**g

   print *, "a*b + c*d + e/f**g = ", x
   print *, "a*(b + c)*d + (e/f)**g = ", y
   print *, "a*(b + c)*(d + e)/f**g = ", z
end program order

