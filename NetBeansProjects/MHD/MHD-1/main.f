C
C File:   main.f
C Author: bozhin
C
C Created on November 25, 2012, 11:36 AM
C
      PROGRAM MHDMAIN
      IMPLICIT NONE
C Q-SPACE DIMENSION
      INTEGER NQDIM
      PARAMETER (NQDIM=3)
C Q-GRID DIMENSIONS
      INTEGER NQX, NQY, NQZ
      PARAMETER (NQX=21, NQY=21, NQZ=21)
      INTEGER NQXH, NQYH, NQZH
      PARAMETER (NQXH=NQX/2, NQYH=NQY/2, NQZH=NQZ/2)
C Q-GRID BOUNDARY VALUES
      DOUBLE PRECISION QXMIN, QXMAX
      DOUBLE PRECISION QYMIN, QYMAX
      DOUBLE PRECISION QZMIN, QZMAX
      PARAMETER (QXMIN = -5.D0, QXMAX = 5.D0)
      PARAMETER (QYMIN = -5.D0, QYMAX = 5.D0)
      PARAMETER (QZMIN = -5.D0, QZMAX = 5.D0)
      DOUBLE PRECISION HQX, HQY, HQZ, HT, T0, T1
      DOUBLE PRECISION DNQX1, DNQY1, DNQZ1
C INITIAL V- AND B-PROFILE ARRAYS
      DOUBLE PRECISION V0(NQDIM, -NQXH:NQX, -NQYH:NQYH, -NQZH:NQZH)
      DOUBLE PRECISION B0(NQDIM, -NQXH:NQX, -NQYH:NQYH, -NQZH:NQZH)
C NEXT-STEP V- AND B-PROFILE ARRAYS
      DOUBLE PRECISION DV(NQDIM, -NQXH:NQX, -NQYH:NQYH, -NQZH:NQZH)
      DOUBLE PRECISION DB(NQDIM, -NQXH:NQX, -NQYH:NQYH, -NQZH:NQZH)
      DOUBLE PRECISION V1(NQDIM, -NQXH:NQX, -NQYH:NQYH, -NQZH:NQZH)
      DOUBLE PRECISION B1(NQDIM, -NQXH:NQX, -NQYH:NQYH, -NQZH:NQZH)
C INTEGRAL-RELATED ARRAYS
      DOUBLE PRECISION VDATA(-NQXH:NQX, -NQYH:NQYH, -NQZH:NQZH)
      DOUBLE PRECISION BDATA(-NQXH:NQX, -NQYH:NQYH, -NQZH:NQZH)
      DOUBLE PRECISION VVBB(NQDIM,NQDIM)
      DOUBLE PRECISION BVVB(NQDIM,NQDIM)
      DOUBLE PRECISION VECNV(NQDIM)
      DOUBLE PRECISION VECNB(NQDIM)
      INTEGER JQ(NQDIM)
C MODEL PARAMETERS
      DOUBLE PRECISION ALPHA (NQDIM)
      DOUBLE PRECISION OMEGAC
      PARAMETER (OMEGAC=1.D0)
      DOUBLE PRECISION DNUK, DNUM
      PARAMETER (DNUK=1.D-1, DNUM=1.D-1)
C OTHER PARAMETERS
      INTEGER I, J, K, L, M, N, TIC, TOC
      DOUBLE PRECISION DINT, DQX, DQY, DQZ, DINT1, DINT2
C EXTERNAL FUNCTIONS
      DOUBLE PRECISION VXPRF1, VYPRF1, BXPRF1, BYPRF1
      EXTERNAL VXPRF1, VYPRF1, BXPRF1, BYPRF1
      DOUBLE PRECISION DSUM
      DATA ALPHA /0.D0, 0.D0, 1.D0/
C
C
C
      DNQX1 = DFLOAT(NQX-1)
      DNQY1 = DFLOAT(NQY-1)
      DNQZ1 = DFLOAT(NQZ-1)
      HQX   = (QXMAX - QXMIN) / DNQX1
      HQY   = (QYMAX - QYMIN) / DNQY1
      HQZ   = (QZMAX - QZMIN) / DNQZ1
C
C INITIAL PROFILES
C
      CALL SETPROF(NQDIM, NQX, NQXH, HQX, NQY, NQYH, HQY,
     *   NQZ, NQZH, HQZ, V0, B0)

!!! TEST OF SUBROUTINES
!!      CALL XINT(NQX, HQX, NQY, HQY, NQZ, HQZ, B0(1,:,:,:), DINT)
!!      PRINT*,'DINT=',DINT
!!
!!      CALL ZINTEG2(NQX, NQY, NQZ, HQX, HQY, HQZ,
!!     *      B0(1,:,:,:), B0(2,:,:,:), DINT1, DINT2)
!!      PRINT*,'DINT1=',DINT1
!!      PRINT*,'DINT2=',DINT2
!!
!!
!!      JQ(1) = 8
!!      JQ(2) = -7
!!      JQ(3) = 3
!!
!!      CALL SYSTEM_CLOCK(TIC)
!!
!!      CALL INTEGRATE (NQDIM, NQX, NQY, NQZ, NQXH, NQYH, NQZH,
!!     *  HQX, HQY, HQZ, JQ, V0, B0, VDATA, BDATA,
!!     *  VVBB, BVVB, VECNV, VECNB)
!!
!!      CALL SYSTEM_CLOCK(TOC)
!!      PRINT*,'TIME = ',TOC-TIC
!!
!!      PRINT*
!!      PRINT*, VVBB(1,1), VVBB(1,2), VVBB(1,3)
!!      PRINT*, VVBB(2,1), VVBB(2,2), VVBB(2,3)
!!      PRINT*, VVBB(3,1), VVBB(3,2), VVBB(3,3)
!!      PRINT*
!!      PRINT*, BVVB(1,1), BVVB(1,2), BVVB(1,3)
!!      PRINT*, BVVB(2,1), BVVB(2,2), BVVB(2,3)
!!      PRINT*, BVVB(3,1), BVVB(3,2), BVVB(3,3)
!!      PRINT*
!!      PRINT*, VECNV
!!      PRINT*, VECNB
!!
!!
!!      CALL SQVB(NQDIM, NQX, NQY, NQZ, NQXH, NQYH, NQZH,
!!     *  HQX, HQY, HQZ, V0, B0, VDATA, BDATA,
!!     *  DINT1, DINT2)
!!      PRINT*
!!      PRINT*,DINT1, DINT2
!!! END OF TEST OF SUBROUTINES

      HT = 0.05D0
      T0 = 0.D0
      N = 30

      DO 200 L = 1, N

      T1 = T0 + DFLOAT(L-1) * HT

      CALL SQVB(NQDIM,NQX,NQY,NQZ,NQXH,NQYH,NQZH,HQX,HQY,HQZ,
     *  V0, B0, VDATA, BDATA, DINT1, DINT2)

      PRINT*, T1, DINT1, DINT2
      WRITE(UNIT=0,FMT=*) T1, DINT1, DINT2

      CALL FIELD(NQDIM, NQX,NQXH,HQX,NQY,NQYH,HQY,NQZ,NQZH,HQZ,
     *  ALPHA, OMEGAC, DNUK, DNUM, V0, B0, DV, DB,
     *  VDATA, BDATA, VVBB, BVVB, VECNV, VECNB)
      DO 100 I = -NQXH, NQXH
      DO 100 J = -NQYH, NQYH
      DO 100 K = -NQZH, NQZH
      DO 100 M = 1, NQDIM
         V0(M,I,J,K) = V0(M,I,J,K) + HT*DV(M,I,J,K)
         B0(M,I,J,K) = B0(M,I,J,K) + HT*DB(M,I,J,K)
  100 CONTINUE
  200 CONTINUE

      T1 = T0 + DFLOAT(N)*HT

      CALL SQVB(NQDIM,NQX,NQY,NQZ,NQXH,NQYH,NQZH,HQX,HQY,HQZ,
     *  V0, B0, VDATA, BDATA, DINT1, DINT2)

      PRINT*, T1, DINT1, DINT2
      WRITE(UNIT=0,FMT=*) T1, DINT1, DINT2

      CALL SQVB(NQDIM,NQX,NQY,NQZ,NQXH,NQYH,NQZH,HQX,HQY,HQZ,
     *  V0, B0, VDATA, BDATA, DINT1, DINT2)

      PRINT*, T1, DINT1, DINT2





      STOP
      END
C
C**********************************************************************C
C                                                                      C
C                       PROFILE FUNCTIONS                              C
C                                                                      C
C**********************************************************************C
      SUBROUTINE SETPROF(NQDIM, NX, NXH, HX, NY, NYH, HY,
     *                   NZ, NZH, HZ, V, B)
      IMPLICIT NONE
      INTEGER NQDIM, NX, NXH, NY, NYH, NZ, NZH
      DOUBLE PRECISION HX, HY, HZ
      DOUBLE PRECISION V(NQDIM, -NXH:NXH, -NYH:NYH, -NZH:NZH)
      DOUBLE PRECISION B(NQDIM, -NXH:NXH, -NYH:NYH, -NZH:NZH)
      DOUBLE PRECISION QX, QY, QZ
      DOUBLE PRECISION QXZ, QYZ
      INTEGER IX, IY, IZ
      DOUBLE PRECISION VXPRF1, VYPRF1, BXPRF1, BYPRF1
      DO IX = -NXH, NXH
          QX = DFLOAT(IX) * HX
          DO IY = -NYH, NYH
              QY = DFLOAT(IY) * HY
              DO IZ = -NZH, NZH
                  QZ = DFLOAT(IZ) * HZ
                  IF (IZ.EQ.0) THEN
                      QXZ = 0.D0
                      QYZ = 0.D0
                  ELSE
                      QXZ = - QX / QZ
                      QYZ = - QY / QZ
                  ENDIF
                  V(1,IX,IY,IZ)=VXPRF1(QX,QY,QZ)
                  V(2,IX,IY,IZ)=VYPRF1(QX,QY,QZ)
                  V(3,IX,IY,IZ)=QXZ*V(1,IX,IY,IZ)+QYZ*V(2,IX,IY,IZ)
                  B(1,IX,IY,IZ)=BXPRF1(QX,QY,QZ)
                  B(2,IX,IY,IZ)=BYPRF1(QX,QY,QZ)
                  B(3,IX,IY,IZ)=QXZ*B(1,IX,IY,IZ)+QYZ*B(2,IX,IY,IZ)
              ENDDO
          ENDDO
      ENDDO
      END




      FUNCTION VXPRF1(QX,QY,QZ)
      DOUBLEPRECISION QX, QY, QZ, VXPRF1
      VXPRF1 = QZ*QZ*DEXP(-QX*QX-QY*QY-QZ*QZ)
      END
C**********************************************************************
      FUNCTION VYPRF1(QX,QY,QZ)
      DOUBLEPRECISION QX, QY, QZ, VYPRF1
      VYPRF1 = QZ*QZ/DCOSH(QZ*QZ+QX*QX+QY*QY)
      END
C**********************************************************************
      FUNCTION BXPRF1(QX,QY,QZ)
      DOUBLEPRECISION QX, QY, QZ, BXPRF1
      BXPRF1=QZ*QZ*QX*QX*QY*QY*DEXP(-QX*QX-QY*QY-QZ*QZ)
      END
C**********************************************************************
      FUNCTION BYPRF1(QX,QY,QZ)
      DOUBLEPRECISION QX, QY, QZ, BYPRF1
      BYPRF1 = -QZ*QZ*DEXP(-QZ*QZ)
      END
C**********************************************************************




