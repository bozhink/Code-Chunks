      PROGRAM EX11_1
      PARAMETER (N=100)
      DIMENSION ZMAT(N,N)

      FPI=3.1415927/180.
      STEP=360./(N-1)
      DO I=1,N
        X=(I-1.)*STEP
        DO J=1,N
          Y=(J-1.)*STEP
          ZMAT(I,J)=2*SIN(X*FPI)*SIN(Y*FPI)
        END DO
      END DO

      CALL METAFL('CONS')
      CALL DISINI
      CALL PAGERA
      CALL HWFONT

      CALL TITLIN('3-D Colour Plot of the Function',1)
      CALL TITLIN('F(X,Y) = 2 * SIN(X) * SIN(Y)',3)

      CALL NAME('X-axis','X')
      CALL NAME('Y-axis','Y')
      CALL NAME('Z-axis','Z')

      CALL INTAX
      CALL AUTRES(N,N)
      CALL AXSPOS(300,1850)
      CALL AX3LEN(2200,1400,1400)

      CALL GRAF3(0.,360.,0.,90.,0.,360.,0.,90.,
     *               -2.,2.,-2.,1.)
      CALL CRVMAT(ZMAT,N,N,1,1)

      CALL HEIGHT(50)
      CALL TITLE
      CALL MPAEPL(3)
      CALL DISFIN
      END

