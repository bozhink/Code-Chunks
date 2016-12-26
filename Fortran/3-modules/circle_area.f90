program circle_area
  use math_constants
  implicit none
  real :: radius, area
  write (unit = *, fmt = "('Enter radius of circle: ')", advance = "no")
  read *, radius
  area = pi * radius ** 2
  print "('For radius = ',f7.2,' Area = ',f7.2)", radius, area
end program circle_area
