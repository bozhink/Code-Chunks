program triangle
    implicit none
    !declare and initialize the constant pi
    real,parameter::pi=3.141527
    !declare intrinsic function sin(x)
    real,intrinsic::sin
    !declare the angles and sides of the triangle
    real::A,B,C,AB,AC,BC
    !issue initial invitation and start do loop
    print*,"Input two angles A and B and"
    print*,"side AB of the triangle ABC"
    do
        read*,A,B,AB
        if ((A>0).and.(B>0).and.(A+B<180).and.(AB>0)) then
            exit
        endif
        print*,"All input must be positive and"
        print*,"angle sum <180"
    enddo
    !calculate the third angle and other two sides
    C=180.0-(A+B)
    AC=AB*sin(B*pi/180)/sin(C*pi/180)
    BC=AB*sin(A*pi/180)/sin(C*pi/180)
    !output results
    print*,"The third angle C = ", C
    print*,"The side AC = ",AC
    print*,"The side BC = ",BC

end program triangle
