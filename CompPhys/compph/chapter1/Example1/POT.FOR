CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      REAL FUNCTION POT(X)
C EVALUATES THE LENNARD-JONES POTENTIAL AT X
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C PASSED VARIABLES:
      REAL X
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C IF YOU CHANGE THE POTENTIAL, NORMALIZE TO A MINIMUM OF -1
C AND CHANGE THE VALUE OF POTMIN IN SUBROUTINE INIT TO THE
C NEW EQUILIBRIUM POSITION (I. E. THE X VALUE AT WHICH THE FORCE IS ZERO)
C     LENNARD-JONES POTENTIAL IN SCALED VARIABLES
      POT=4*(X**(-12)-X**(-6))
      RETURN
      END

