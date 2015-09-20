module math_constants
    real, public, parameter :: pi = 3.1415926536
end module math_constants

program circle_area
    use math_constants
    real :: radius, area
    print*, "Enter radius of circle"
    read*, radius
    area = pi*radius**2
    print*, "For radius = ", radius, ", Area = ", area
end program circle_area
