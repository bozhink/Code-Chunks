program test_gauss
! This program defines the coefficients od a set
! of linear equations, and solves them using the
! module procedure gaussian_solve
use linear_equations
    implicit none
    !
    ! Allocatable arrays for coefficients
    real,allocatable,dimension(:,:)::a
    real,allocatable,dimension(:)  ::b
    !
    ! Size of arrays
    integer::n
    !
    ! Loop variables and error flag
    integer::i,error
    !
    ! Get size of problem
    print*,'How many equations are there?'
    read*,n
    !
    ! Allocate arrays
    allocate (a(n,n),b(n))
    !
    ! Get coefficients
    print*,'Type coefficients for each equation in turn'
    do i=1,n
        read*,a(i,:),b(i)
    enddo
    !
    ! Attempt to solve set of equations
    call gaussian_solve(a,b,error)
    !
    ! Check to see if there were any errors
    if (error<=-1.and.error>-3) then
        print*,'Error in call to gaussian_solve'
    elseif (error==-4) then
        print*,'Set of equations is degenerate'
    else
        print*
        print*,'Solution is:'
        print*
        do i=1,n
           print "(a,i2,a,f10.6)"," x(",i,") = ",b(i)
        enddo
    endif
end program test_gauss
