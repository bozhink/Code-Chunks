cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      program exmpl1
C     Example 1: Bohr-Sommerfeld quantization for bound states of the
C                Lennsrd-Lones Potential
C COMPUTATIONAL PHYSICS (FORTRAN VERSION)
C by Steven E. Koonin and Dawn C. Meredith
C Copyright 1989, Addison-Wesley Publishing Company
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      call init         ! display header screen, setup parameters
    5 continue          ! main loop/ execute once for each set of param
         call param     ! get input from screen
         call archon    ! search for bound states
      goto 5
      end
 
