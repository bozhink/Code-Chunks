module function_module
    implicit none
    public :: f
contains
    function f(x) result(f_result)
        implicit none
        real,intent(in)::x
        real::f_result
        f_result=1.5*x/((1.0+x*x)**2)- &
            0.65*atan(1.0/x)+0.65*x/(x*x+1.0)
    end function f
end module function_module
