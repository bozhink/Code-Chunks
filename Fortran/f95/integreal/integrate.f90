program integrate
    use integrate_module
    use sine_module
    implicit none
    print*,integral(sine,a=0.0,b=3.1415927,n=100)
end program integrate
