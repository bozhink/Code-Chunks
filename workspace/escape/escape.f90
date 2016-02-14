program escape
    implicit none
! Accepts as input an initial valocity v
! Prints maximum height attained,
!   if cbject does not escape earth
! Prints final escape velocity, vfinal,
!   if object escapes
!
! Parameters
!   g = acceleration of gravity near earth's
!       surface in meters/sec**2 (m/s**2)
!   RE = radius of the earth (in meters)
    real::v,h,vfinal
    real,parameter::g=9.70,RE=6.366e6

    print*,'Input the initial velocity'
    read*,v
    print*,"Objects's initial velocity = ",v," m/s"
    if (v**2<2*g*RE) then
       h=RE/(1-v**2/(2*g*RE))
       print*,"The object attains a height of", &
              h-RE," m"
       print*,"above the earth's surface " // &
              "before returning to earth."
    elseif (abs((v**2-2*g*RE)/(2*g*RE))<1.0e-3) then
       print*,"This velocity is the escape "// &
              "velocity of the earth."
       print*,"The object just barely escapes "// &
              "from earth's gravity."
    else
       vfinal=sqrt(v**2-2*g*RE)
       print*,"The object escape with velocity ",&
              vfinal, " m/s."
    endif
end program escape
