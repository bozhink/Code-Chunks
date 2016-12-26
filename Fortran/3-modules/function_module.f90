module function_module
  implicit none
  public :: f
contains
  function f(x) result (f_val)
    implicit none
    real, intent(in) :: x
    real :: f_val
    f_val = x * sin(x)
  end function f
end module function_module

