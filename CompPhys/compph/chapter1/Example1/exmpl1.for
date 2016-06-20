CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      PROGRAM EXMPL1
C     Exmaple 1: Bohr-Sommerfeld quantization for bound states of the
C                Lennard-Jones Potential
C  COMPUTATIONAL PHYSICS (FORTRAN VERSION)
C  by Steven E. Koonin and Dawn C. Meredith
C  Copyright 1989, Addison-Wasley Publishing Company
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      CALL INIT              ! DISPLAY HEADER SCREEN, SETUP PARAMETERS
    5 CONTINUE               ! MAIN LOOP/ EXECUTE ONCE EACH SET OF PARAM
         CALL PARAM          ! GET INPUT FROM SCREEN
         CALL ARCHON         ! SEARCH FOR BOUND STATES
      GOTO 5
      END
