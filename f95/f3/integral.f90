program integral
    implicit none
    !Calculates a trapeziodal approximation to
    !an srea using n trapezoids.
    !n is read from the input file (keyboard).
    !The region is bounded by lines x=a, y=0,
    !x=b, and the curve y=sin(x).
    !a snd b also are read from the input file
    real,intrinsic::sin
    real::a,b,h,total
    integer::i,n
    print*,'Enter n'
    read*,n
    print*,'Input data n:',n
    print *,"Enter a and b"
    read*,a,b
    print*,"Input data a:",a
    print*,"Input data b:",b
    h=(b-a)/n
    !Calculate the total f(a/2)+f(a+h)+...+f(b-h)+f(b/2)
    !Do the first and last term first
    total=0.5*(sin(a)+sin(b))
    do i=1,n-1
       total=total+sin(a+i*h)
    enddo
    print*,'Trapezoidal approximation to the area = ',&
           h*total
end program integral
