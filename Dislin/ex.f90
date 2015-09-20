      PROGRAM EXA_10
      USE DISLIN
      IMPLICIT NONE
      INTEGER, PARAMETER :: N=50
      REAL, DIMENSION (N,N) :: ZMAT
      CHARACTER (LEN=60) :: CTIT1 = 'Surface Plot (SURMAT)', &
                            CTIT2 = 'F(X,Y) = 2*SIN(X)*SIN(Y)'
      REAL    :: FPI,STEP,X,Y
      INTEGER :: I,J

      FPI=3.14159/180.
      STEP = 360./(N-1)
      DO I=1,N
        X=(I-1)*STEP
        DO J=1,N
          Y=(J-1)*STEP
          ZMAT(I,J)=2*SIN(X*FPI)*SIN(Y*FPI)
        END DO
      END DO

      CALL SETPAG('DA4P')
      CALL METAFL('CONS')
      CALL DISINI()
      CALL PAGERA()
      CALL COMPLX()
      CALL AXSPOS(200,2600)
      CALL AXSLEN(1800,1800)

      CALL NAME('X-axis','X')
      CALL NAME('Y-axis','Y')
      CALL NAME('Z-axis','Z')

      CALL TITLIN(CTIT1,2)
      CALL TITLIN(CTIT2,4)

      CALL VIEW3D(-5.,-5.,4.,'ABS')
      CALL GRAF3D(0.,360.,0.,90.,0.,360.,0.,90.,-3.,3.,-3.,1.)
      CALL HEIGHT(50)
      CALL TITLE()

      CALL COLOR('GREEN')
      CALL SURMAT(ZMAT,N,N,1,1)

      CALL DISFIN()
      STOP
      END PROGRAM EXA_10
