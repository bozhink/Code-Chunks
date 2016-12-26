program test_big_module
 
use big_integer_module
 
type (big_integer) :: b1, b2
 
b1 = "1234567654321"
b2 = "9876543456789"
call print_big (b1 + b2)
print *
 
end program test_big_module
