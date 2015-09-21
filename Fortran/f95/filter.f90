module filter_input

    public :: input
    real, public :: R, L, C
    integer, public :: f1, f2, f_inc
    
contains

    subroutine input ()
    ! This is the input routine for the program filter
    
        print *, "What is the value of the capacitance ", &
            "(in microfarads)"
        read*, C
        print*,"What is the value of the inductance ", &
            "(in millihenries)"
        read*, L
        print*,"What is the value of the resistance ", &
            "(in kilo-Ohms)"
        read*, R
        ! Read frequency data
        do
            print*, "Give initial and final frequences, ", &
                "and increment (in Hz)"
            read*, f1, f2, f_inc
            print*
            ! Check for validity
            if (f1 <= f2 .and. f_inc > 0) then
                exit
            else
                print*, "Data is inconsistent, Please try again."
            end if
        end do
    end subroutine input

end module filter_input


program filter
! This program calulates transfer function for a simple
! electronic filter, consisting of a capacitator, an
! inductor and a resistor in seriesa and then prints
! the voltage amplification and phase shift that it
! produces on the input signals in a specified range
! of frequences.

    use filter_input
    implicit none
    ! Declarations
    integer :: f
    real :: amplitude, phase
    complex :: h
    character (len=1) :: answer
    real, parameter :: pi = 3.1415926536, twopi = 2.0*pi
    
    do
        ! Get data for next case
        call input ()
        
        print "(a,i5,a,i5,a)", "Frequency response between",f1,&
            " Hz and ",f2," Hz"
        print "(a,f7.3,a)", "for a filter with a capacitator of ", &
            C, " microfarads,"
        print "(a,f7.3,a)", "inductor of ", &
            L, " millihenries, and with a"
        print "(a,f7.3,a)", "resistor of ", R, " kilo-Ohms is:"
        
        print "(2/,a,t15,a,t30,a,/,a,t15,a,t30,a,2/)", &
            "Frequency", "   Voltage", "Phase", &
            "   (Hz)", "amplification", "shift"
        
        ! Convert capacitance in farads, inductance in henries,
        ! and resistance in ohms
        C = C*1.0e-6
        L = L*1.0e-3
        R = R*1.0e3
        
        ! Loop the required frequences
        do f = f1, f2, f_inc
            ! Calculate transfer function
            h = cmplx(R, 0.0) / cmplx(R, twopi*f*L - 1.0/(twopi*f*C))
            ! Aplification factor is absolute value of h
            amplitude = abs(h)
            
            ! Phase shift is arctangent of imaginary part
            ! divided by real part
            phase = atan2 (aimag(h),real(h))
            ! Convert to degrees
            phase = 180.0 * phase / pi
           
            ! Print result for this frequency
            print "(i6,t15,f9.3,t30,f5.1)", &
                f, amplitude, phase
        end do
        
        ! Ask if another case required
        print*
        print*,"Another case? (Y/N)"
        read*,answer
        if (answer /= "Y" .and. answer /= "y") exit
    end do
end program filter

