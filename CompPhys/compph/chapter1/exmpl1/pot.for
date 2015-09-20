cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      real function pot(x)
C evaluates the Lennard-Jones potential at X
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C Passed variables:
      real x
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C If you change the potential, normalize to a minimum of -1
C and change the value of potmin in subroutine init to the
C new equilibrium position (i.e. the X value at which the force is zero)
C     Lennard-Jones potential in scaled variables
      pot=4*(X**(-12)-x**(-6))
      return
      end

