C
C File:   integrate.f
C Author: bozhin
C
C Created on November 25, 2012, 12:04 PM
C
      SUBROUTINE INTEGRATE(NQDIM, NX, NY, NZ, NXH, NYH, NZH,
     *  HX, HY, HZ, JQ, V, B, VDATA, BDATA,
     *  VVBB, BVVB, VECNV, VECNB)
      IMPLICIT NONE
C NQDIM  -- DIMENSION OF Q-SPACE; NQDIM = 3
C           EVERY Q-VECTOR MUST HAVE THE FORM: VECQ = (JQX*HX, JJ*HY, JQZ*HZ),
C           WHERE JQX, JJ, JQZ ARE INTEGERS
C JQ     -- VECTOR OF DIMENSION NQDIM, CONTAINING INTEGER COORDINATES OF VECTOR Q
C           JQ = (JQX, JJ, JQZ)
C NX, NY, NZ -- NUMBER OF POINTS OF DISCRETIZATION OF QX, QY, AND QZ AXES
C               NX, NY, NZ MUST BE ODD INTEGERS
C NXH, NYH, NZH -- HALF OF NX, NY, AND NZ, RESPECTIVELY
C                  -NXH <= JQX <= NXH
C                  -NYH <= JJ <= NYH
C                  -NZH <= JQZ <= NZH
C              IT IS IMPORTANT TO NOTEQ THAT:
C                  NX = 2 * NXH + 1
C                  NY = 2 * NYH + 1
C                  NZ = 2 * NZH + 1
C HX, HY, HZ  -- DOUBLE PRECISION STEPS IN CORRESPONDING Q-DIRECTION
C V, B        -- 4D ARRAYS, CONTAINING TABULATED VALUES OF X- AND Y-DIMENSIONS
C                   OF THE FIELDS OF V AND B
C VDATA, BDATA -- AUXILIAR 3D ARRAYS OF THE SAME DIMENSIONS AS VX, VY, BX, BY
C VVBB, BVVB -- OUTPUT / AUXILIAR 2D ARRAYS, CONTAING THE MATRICES OF INTEGRALS
C VECNV, VECNB -- OUTPUT VECTORS OF SIZE NQDIM
C
      INTEGER NX, NY, NZ, NQDIM, NXH, NYH, NZH
      INTEGER JQ (NQDIM)
      DOUBLE PRECISION HX, HY, HZ
      DOUBLE PRECISION V (NQDIM, -NXH:NXH, -NYH:NYH, -NZH:NZH)
      DOUBLE PRECISION B (NQDIM, -NXH:NXH, -NYH:NYH, -NZH:NZH)
      DOUBLE PRECISION VDATA (-NXH:NXH, -NYH:NYH, -NZH:NZH)
      DOUBLE PRECISION BDATA (-NXH:NXH, -NYH:NYH, -NZH:NZH)
      DOUBLE PRECISION VVBB (NQDIM, NQDIM)
      DOUBLE PRECISION BVVB (NQDIM, NQDIM)
      DOUBLE PRECISION VECNV (NQDIM)
      DOUBLE PRECISION VECNB (NQDIM)
      DOUBLE PRECISION PI, DV
      PARAMETER (PI=3.141592653589793238D0)
      INTEGER I, J, K, II, JJ, KK, M, N
      DOUBLE PRECISION XINTZ, DOTPROD
      DOUBLE PRECISION Q(3), DQQ, DIQQ
      DOUBLE PRECISION DQVVBB, DQBVVB
C
C VALIDITY CHECK
C
      IF ((2*NXH+1).NE.NX.OR.
     *    (2*NYH+1).NE.NY.OR.
     *    (2*NZH+1).NE.NZ) THEN
      WRITE(UNIT=0,FMT=1)
    1 FORMAT('INTEGRATE: ERROR: IVALID VALUES FOR NX, NXH, NY, NYH,',
     *       ' NZ, OR NZH')
      STOP 'INTEGRATE'
      ENDIF

      DV = 1.D0/(2.D0*PI)**3
C
C CALCULATION OF VVBB AND BVVB MATRICES
C
C     HERE WE USE PERIODIC BOUNDARY CONDITIONS FOR (Q-Q') TERM
      DO M = 1, NQDIM
      DO N = 1, NQDIM
      DO I = -NXH, NXH
          II = MOD(JQ(1) - I + NXH + NX, NX) - NXH
          DO J = -NYH, NYH
              JJ = MOD(JQ(2) - J + NYH + NY, NY) - NYH
              DO K = -NZH, NZH
                  KK = MOD(JQ(3) - K + NZH + NZ, NZ) - NZH
                  VDATA(I,J,K) = V(M,I,J,K) * V(N,II,JJ,KK)
     *                         + B(M,I,J,K) * B(N,II,JJ,KK)
                  BDATA(I,J,K) = B(M,I,J,K) * V(N,II,JJ,KK)
     *                         - V(M,I,J,K) * B(N,II,JJ,KK)
              ENDDO
          ENDDO
      ENDDO
      CALL ZINTEG2(NX,NY,NZ,HX,HY,HZ,VDATA,BDATA,DQVVBB,DQBVVB)
      VVBB(M,N) = DV * DQVVBB
      BVVB(M,N) = DV * DQBVVB
      ENDDO
      ENDDO
C
C CALCULATION OF THE COMPONENTS OF VECTOR Q
C
      Q(1) = DFLOAT(JQ(1)) * HX
      Q(2) = DFLOAT(JQ(2)) * HY
      Q(3) = DFLOAT(JQ(3)) * HZ
      DQQ = Q(1)*Q(1)+Q(2)*Q(2)+Q(3)*Q(3)
      IF (JQ(1).EQ.0 .AND. JQ(2).EQ.0 .AND. JQ(3).EQ.0) THEN
          DIQQ = 0.D0
      ELSE
          DIQQ = 1.D0 / DQQ
      ENDIF
C
C CALCULATION OF INTEGRAL VECTORS
C
      DO I = 1, NQDIM
          VECNV(I) = VVBB(I,1)*Q(1)+VVBB(I,2)*Q(2)+VVBB(I,3)*Q(3)
          VECNB(I) = BVVB(I,1)*Q(1)+BVVB(I,2)*Q(2)+BVVB(I,3)*Q(3)
      ENDDO
      DQVVBB = DIQQ*(Q(1)*VECNV(1) + Q(2)*VECNV(2) + Q(3)*VECNV(3))
      DQBVVB = DIQQ*(Q(1)*VECNB(1) + Q(2)*VECNB(2) + Q(3)*VECNB(3))
      DO I = 1, NQDIM
          VECNV(I) = VECNV(I) - DQVVBB * Q(I)
          VECNB(I) = VECNB(I) - DQBVVB * Q(I)
      ENDDO
C
C END OF SUBROUTINE
C
      RETURN
      END




      SUBROUTINE SQVB(NQDIM, NX, NY, NZ, NXH, NYH, NZH,
     *  HX, HY, HZ, V, B, VDATA, BDATA,
     *  SQV, SQB)
      IMPLICIT NONE
C NQDIM  -- DIMENSION OF Q-SPACE; NQDIM = 3
C           EVERY Q-VECTOR MUST HAVE THE FORM: VECQ = (JQX*HX, JJ*HY, JQZ*HZ),
C           WHERE JQX, JJ, JQZ ARE INTEGERS
C NX, NY, NZ -- NUMBER OF POINTS OF DISCRETIZATION OF QX, QY, AND QZ AXES
C               NX, NY, NZ MUST BE ODD INTEGERS
C NXH, NYH, NZH -- HALF OF NX, NY, AND NZ, RESPECTIVELY
C                  -NXH <= JQX <= NXH
C                  -NYH <= JJ <= NYH
C                  -NZH <= JQZ <= NZH
C              IT IS IMPORTANT TO NOTEQ THAT:
C                  NX = 2 * NXH + 1
C                  NY = 2 * NYH + 1
C                  NZ = 2 * NZH + 1
C HX, HY, HZ  -- DOUBLE PRECISION STEPS IN CORRESPONDING Q-DIRECTION
C V, B        -- 4D ARRAYS, CONTAINING TABULATED VALUES OF X- AND Y-DIMENSIONS
C                   OF THE FIELDS OF V AND B
C VDATA, BDATA -- AUXILIAR 3D ARRAYS OF THE SAME DIMENSIONS AS VX, VY, BX, BY
C SQB, SQV -- SUARES OD VECTORS V AND B
C
      INTEGER NX, NY, NZ, NQDIM, NXH, NYH, NZH
      DOUBLE PRECISION HX, HY, HZ
      DOUBLE PRECISION V (NQDIM, -NXH:NXH, -NYH:NYH, -NZH:NZH)
      DOUBLE PRECISION B (NQDIM, -NXH:NXH, -NYH:NYH, -NZH:NZH)
      DOUBLE PRECISION VDATA (-NXH:NXH, -NYH:NYH, -NZH:NZH)
      DOUBLE PRECISION BDATA (-NXH:NXH, -NYH:NYH, -NZH:NZH)
      DOUBLE PRECISION SQV, SQB
      DOUBLE PRECISION PI, DV
      PARAMETER (PI=3.141592653589793238D0)
      INTEGER I, J, K, M
      DOUBLE PRECISION XINTZ, DOTPROD
      DOUBLE PRECISION Q(3), DQQ
      DOUBLE PRECISION DINT1, DINT2
C
C VALIDITY CHECK
C
      IF ((2*NXH+1).NE.NX.OR.
     *    (2*NYH+1).NE.NY.OR.
     *    (2*NZH+1).NE.NZ) THEN
      WRITE(UNIT=0,FMT=1)
    1 FORMAT('INTEGRATE: ERROR: IVALID VALUES FOR NX, NXH, NY, NYH,',
     *       ' NZ, OR NZH')
      STOP 'INTEGRATE'
      ENDIF
      DV = 1.D0/(2.D0*PI)**3
C
C CALCULATION OF SQV AND SQB
C
      DO I = -NXH, NXH
          Q(1) = DFLOAT(I) * HX
      DO J = -NYH, NYH
          Q(2) = DFLOAT(I) * HY
      DO K = -NZH, NZH
          Q(3) = DFLOAT(K) * HZ
          DQQ = Q(1)*Q(1)+Q(2)*Q(2)+Q(3)*Q(3)
          VDATA(I,J,K) = 0.D0
          BDATA(I,J,K) = 0.D0
          DO M = 1, NQDIM
              VDATA(I,J,K)=VDATA(I,J,K) + DQQ*V(M,I,J,K)*V(M,I,J,K)
              BDATA(I,J,K)=BDATA(I,J,K) + DQQ*B(M,I,J,K)*B(M,I,J,K)
          ENDDO
      ENDDO
      ENDDO
      ENDDO
      CALL ZINTEG2(NX,NY,NZ,HX,HY,HZ,VDATA,BDATA,DINT1,DINT2)
      SQV = DV * DINT1
      SQB = DV * DINT2
      END