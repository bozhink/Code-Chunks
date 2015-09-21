program descriptors
    real :: x
    integer :: n, a, b, c
    character (len=13), parameter :: layout = "(f5.1, a, i4)"
    
    x = 6.3
    n = -26
    a = 9999
    b = 7632
    c = -8888
    
    print "(f5.1,es9.1,a,i4)", x, x, " and ", n
    print*
    print "(f5.1,a,i4)", x, " and ", n
    print*
    print layout, x, " and ", n
    print*
    print "(a, /, a, /, a)", "These character strings", &
        "all appear", "in separate lines"
    print*
    print "(t30, i5, t50, i5, t10, i5)", a, b, c

end program descriptors
