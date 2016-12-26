program integrate
  use sine_module
  use integrate_module
  implicit none
  print *, integral(sine, a = 0.0, b = 3.14159, n = 100)
end program integrate
