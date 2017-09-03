module path_constants
   implicit none
   integer, public, parameter :: number_of_neighbours = 4
   integer, public, dimension(number_of_neighbours), parameter :: dx = (/ 0, 1, -1, 0 /)
   integer, public, dimension(number_of_neighbours), parameter :: dy = (/ 1, 0, 0, -1 /)
end module path_constants
