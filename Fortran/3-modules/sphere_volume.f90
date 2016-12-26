program sphere_volume
  use math_constants
  implicit none
  real :: radius, volume
  write (unit = *, fmt = "('Enter radius of sphere: ')", advance = "no")
  read *, radius
  volume = (4.0 / 3.0) * pi * radius ** 3
  print "('For radius = ',f7.2,' Volume = ',f7.2)", radius, volume
end program sphere_volume
