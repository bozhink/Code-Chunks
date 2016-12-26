module random_module

public :: random_int

contains

subroutine random_int (value, low, high)

   integer, dimension (:), intent (out) :: value
   integer, intent (in) :: low, high
   real, dimension (size (value)) :: uniform_value

   call random_number (uniform_value)
   value =  &
   int ((high - low + 1) * uniform_value + low)

end subroutine random_int

end module random_module

program seven_11

   use random_module

   integer, parameter :: number_of_rolls = 1000
   integer, dimension (number_of_rolls) ::  &
         dice, die_1, die_2
   integer :: wins

   call random_seed ()
   call random_int (die_1, 1, 6)
   call random_int (die_2, 1, 6)
   dice = die_1 + die_2
   wins = count ((dice == 7) .or. (dice == 11))

   print "(a, f6.2)",  &
   "The percentage of rolls that are 7 or 11 is", &
   100.0 * real (wins) / real (number_of_rolls)

end program seven_11
