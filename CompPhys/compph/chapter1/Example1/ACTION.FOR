CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      SUBROUTINE ACTION(E,X1,X2,S)
C CALCULATES THE (ACTION INTEGRAL)/2 (S) AND THE CLASSICAL TURNING
C POINTS (X1,X2) FOR A GIVEN ENERGY (E)
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C GLOBAL VARIABLES:
      INCLUDE 'PARAM.E1'
C INPUT/OUTPUT VARIABLES:
      REAL E                          ! ENERGY (INPUT)
      REAL S                          ! ENERGY (OUTPUT)
      REAL X1,X2                      ! TURNING POINTS (OUTPUT)
C LOCAL VARIBLES:
      REAL DX                         ! INCREMENT IN TURNING POINT SEARCH
      REAL H                          ! QUADRATURE STEP SIZE
      REAL SUM                        ! SUM FOR INTEGRAL
      INTEGER IFAC                    ! COEFFICIENT FOR SIMPSON'S RULE
      REAL X                          ! CURRENT X VALUE IN SUM
      REAL POT                        ! POTENTIAL AS A FUNCTION OF X (FUNCTION)
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C     FIND INNER TURNING POINT; BEGIN SEARCH AT THE WELL BOTTOM
      X1=POTMIN
      DX=.1
   50 IF (DX.GT.XTOL) THEN
         X1=X1-DX                     ! USE SIMPLE SEARCH, GOING INWARD
         IF (POT(X1).GE.E) THEN
            X1=X1+DX
            DX=DX/2
         ENDIF
      GOTO 50
      ENDIF
C
C     FIND THE OUTER TURNING POINT; BEGIN SEARCH AT THE WELL BOTTOM
      X2=POTMIN
      DX=.1
  120 IF (DX.GT.XTOL) THEN
         X2=X2+DX                     ! USE SIMPLE SEARCH GOING OUTWARD
         IF (POT(X2).GE.E) THEN
            X2=X2-DX
            DX=DX/2
         ENDIF
      GOTO 120
      ENDIF
C
C     SIMPSON'S RULE FROM X1+H TO X2-H
      IF (MOD(NPTS,2).EQ.1) NPTS=NPTS+1  ! NPTS MUST BE EVEN
      H=(X2-X1)/NPTS                     ! STEP SIZE
      SUM=SQRT(E-POT(X1+H))
      IFAC=2
      DO 200 IX=2,NPTS-2
         X=X1+IX*H
         IF (IFAC.EQ.2) THEN             ! ALTERNATE FACTORS
            IFAC=4
         ELSE
            IFAC=2
         ENDIF
         SUM=SUM+IFAC*SQRT(E-POT(X))
  200 CONTINUE
      SUM=SUM+SQRT(E-POT(X2-E))
      SUM=SUM*H/3
C
C     SPECIAL HANDLING FOR SQRT BEHAVIOR OF FIRST AND LAST INTERVALS
      SUM=SUM+SQRT(E-POT(X1+H))*2*H/3
      SUM=SUM+SQRT(E-POT(X2-H))*2*H/3
      S=SUM*GAMMA
C
      RETURN
      END

