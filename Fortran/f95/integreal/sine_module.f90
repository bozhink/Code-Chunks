module sine_module
    implicit none
    public::sine
contains
    function sine(x) result(sine_result)
    intrinsic::sin
    real,intent(in)::x
    real::sine_result
    sine_result=sin(x)
    end function sine
end module sine_module
