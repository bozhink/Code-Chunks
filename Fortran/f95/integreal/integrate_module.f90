module integrate_module
    implicit none
    public::integral
contains
    function integral(f,a,b,n) result(integral_result)
    !Calculate a trapezoidal approximation to an area
    !using n trapezoids
    !The region is bound by lines x=a,y=0,x=b
    !and the curve y=f(x)
    !
    interface
        function f(x) result(f_result)
            real,intent(in)::x
            real::f_result
        end function f
    end interface
    !
    real,intent(in)::a,b
    integer,intent(in)::n
    real::integral_result
    real::h,total
    integer::i
    h=(b-a)/n
    total=0.5*(f(a)+f(b))
    do i=1,n-1
        total=total+f(a+i*h)
    enddo
    integral_result=h*total
    end function integral
end module integrate_module
