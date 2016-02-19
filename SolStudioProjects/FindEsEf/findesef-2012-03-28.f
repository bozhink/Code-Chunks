*
* File:   findesef.f
* Author: bozhin
*
* Created on Sun, 2012, Jan 22, 18:11
* Last modified 2012, Feb 3
*
      PROGRAM FIND_ES_EF
      IMPLICIT NONE
C PARAMETERS
      DOUBLE PRECISION KELVIN, PI
      PARAMETER (KELVIN=1.D0/11604.D0)
      PARAMETER (PI=3.1415926535897932D0)
C
      INTEGER I
C
      DOUBLE PRECISION Ed, Es, Ep, Tpd, Tsp, Tpp
      DOUBLE PRECISION TEMP, EF
      COMMON /BHPARAMS/ Ed, Es, Ep, Tpd, Tsp, Tpp
      COMMON /TEMPEF/ TEMP, EF
C
      DOUBLE PRECISION SPARAM(13)
      DOUBLE PRECISION S, ESS, EFERMI
C
      DATA SPARAM/1.74D0,2.44D0,0.72D0,0.87D0,0.66D0,0.62D0,
     *   0.59D0,0.33D0,0.33D0,0.39D0,0.38D0,0.36D0,0.94D0/
      TEMP=90.D0*KELVIN
      EF=1.543D0
      call setriang(0.d0,0.d0,pi,pi)
!      DJ=FINTEGRAL(1.543D0)
!      PRINT*,DJ
!      PRINT*
!      PRINT*
!      S=0.66D0
!      PRINT*,S
      DO I=1,13
         S=SPARAM(I)
         WRITE(UNIT=0,FMT=10)S
         CALL FINDESEF(S,ESS,EFERMI)
         PRINT 100,S,ES,EFERMI
      ENDDO
      STOP
   10 FORMAT('FIND_ES_EF: S=',F5.2)
  100 FORMAT(F4.2,1X,F7.3,1X,F7.3)
      END

      SUBROUTINE FINDESEF(S,ESS,EFERMI)
      IMPLICIT NONE
      DOUBLE PRECISION S, ESS, EFERMI
      DOUBLE PRECISION FINTEG
      EXTERNAL FINTEG
      LOGICAL IFPRINT
      INTEGER NMAX,ITER,IERR,I,J
      DOUBLE PRECISION RELERR,ABSERR
      DOUBLE PRECISION EF0,F0,EF1,F1,DF
      DOUBLE PRECISION KELVIN, PI, ZERO
      PARAMETER (KELVIN=1.D0/11604.D0)
      PARAMETER (PI=3.1415926535897932D0)
      PARAMETER (ZERO=1.D-300)
      DOUBLE PRECISION FILLINGF
      DOUBLE PRECISION Ed, Es, Ep, Tpd, Tsp, Tpp
      DOUBLE PRECISION TEMP, EF
      COMMON /BHPARAMS/ Ed, Es, Ep, Tpd, Tsp, Tpp
      COMMON /TEMPEF/ TEMP, EF
      COMMON /LPRINT/ IFPRINT
C
      TEMP = 90*KELVIN
      FILLINGF = 0.34D0 ! FILLING FACTOR = 1/2 - P, P=0.16
      NMAX = 30
      RELERR = 0.001D0
      ABSERR = 0.001D0
      IFPRINT = .FALSE.
      EFERMI = 1.666D0
      ESS = 4.D0*S*Tsp*Tsp/(EFERMI-Ep) + EFERMI
      Es  = ESS
      DO I=1,NMAX
         EF0 = 0.1D0
         EF  = EF0
         F0  = FINTEG() - FILLINGF
         EF1 = 2.0D0
         EF  = EF1
         F1  = FINTEG() - FILLINGF
         ITER = 0
         ! SECANT METHOD STARTS HERE
         DO J=1,NMAX
            ITER = ITER+1                        ! NUMBER OF ITERATIONS
            DF = F1 - F0                         ! THIS PARAMETER GOES IN DENOMINATOR
            IF (DABS(DF).LT.ZERO) THEN           ! SO IT MUST NOT BE ZERO
               IERR=1                            ! BUT IF IT IS ZERO
               IF (IFPRINT) WRITE(UNIT=0,FMT=10) ! ERROR IS RAISED
               EFERMI=0.D0                       ! AND EFERMI IS SET TO ZERO
               GOTO 1
            ENDIF
            EFERMI = EF1 - F1*(EF1-EF0)/DF       ! NET APPROXIMATION: SECANT STEP
            IF (DABS(EF1).LT.ZERO) THEN
               IF (IFPRINT) WRITE(UNIT=0,FMT=11)
               IF (DABS(EFERMI-EF1).LT.ABSERR) GOTO 1
            ELSE
               IF (DABS((EFERMI-EF1)/EF1).LT.ABSERR) GOTO 1
            ENDIF
            EF0 = EF1
            F0  = F1
            EF1 = EFERMI
            EF  = EF1
            F1  = FINTEG() - FILLINGF
         ENDDO
    1    CONTINUE
         ! SECANT METHOD ENDS HERE
         !
         ! NEXT APPROXIMATION TO ES AND EF:
         ESS = 4.D0*S*Tsp*Tsp/(EFERMI-Ep) + EFERMI
         IF (IFPRINT) THEN
            WRITE(UNIT=0,FMT=100)I,ESS,EFERMI,ITER,IERR
         ENDIF
         IF (DABS(ESS).LT.ZERO) THEN
            IF (DABS(Es-ESS).LT.ABSERR) RETURN
         ELSE
            IF (DABS((Es-ESS)/ESS).LT.RELERR) RETURN
         ENDIF
         Es = ESS
      ENDDO
      WRITE(UNIT=0,FMT=200)
      RETURN
   10 FORMAT('FINDESEF: ERROR: function finteg is ',
     * 'too slowly changing by EF')
   11 FORMAT('FINDESEF: WARNING: old approximation ',
     * 'is too close to zero')
  100 FORMAT('FINDESEF: #',I2,1X,F7.3,1X,F7.3,1X,'ITERATIONS=',I2,
     *       1X,'FLAG=',I2)
  200 FORMAT('FINDESEF: MAXIMUM NUMBER OF ITERATIONS EXCEEDED')
      END
