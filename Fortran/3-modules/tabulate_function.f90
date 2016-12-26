! print table of function values
program tabulate_function
  ! import the function definition
  use function_module
  implicit none
  integer :: i, n
  real :: x, xmin, xmax, xstep
  write (unit = *, fmt = "('# Enter xmin, xmax: ')", advance = 'no')
  read *, xmin, xmax
  write (unit = *, fmt = "('# Enter number of values to print: ')", advance = 'no')
  read *, n
  
  xstep = (xmax - xmin) / (n - 1)
  do i = 0, n - 1
    x = xmin + xstep * i
    print "(f7.2,1x,f7.2)", x, f(x)
  enddo
end program tabulate_function

