C
C File:   xint.f
C Author: bozhin
C
C Created on November 25, 2012, 8:20 PM
C

C**********************************************************************
      SUBROUTINE XINT(NX, HX, NY, HY, NZ, HZ, VX, DINT)
      IMPLICIT NONE
      INTEGER NX, NY, NZ
      DOUBLE PRECISION HX, HY, HZ
      DOUBLE PRECISION VX(NX,NY,NZ), DINT
      DOUBLE PRECISION XINTZ
      DINT =  XINTZ(NX, NY, NZ, HX, HY, HZ, VX)
      RETURN
      END

      FUNCTION XINTX(NX, NY, NZ, Y, Z, HX, FDATA)
      IMPLICIT NONE
      INTEGER NX, NY, NZ, X, Y, Z
      DOUBLE PRECISION FDATA (NX, NY, NZ), HX
      DOUBLE PRECISION DSUM, DINT
      DOUBLE PRECISION XINTX
      DINT = FDATA(1, Y, Z) + FDATA(NX, Y, Z)
      DINT = DINT + 4.D0*FDATA(NX-1, Y, Z)
      DSUM = 0.D0
      DO X = 2, NX-3, 2
      DSUM = DSUM + 2.D0*FDATA(X, Y, Z) + FDATA(X+1, Y, Z)
      ENDDO
      XINTX = HX*(DINT + 2.D0*DSUM)/3.D0
      END

      FUNCTION XINTY(NX, NY, NZ, Z, HX, HY, FDATA)
      IMPLICIT NONE
      INTEGER NX, NY, NZ, Y, Y1, Z
      DOUBLE PRECISION HX, HY
      DOUBLE PRECISION FDATA (NX, NY, NZ)
      DOUBLE PRECISION DSUM, DINT
      DOUBLE PRECISION XINTX, XINTY
      Y = 1
      DINT = XINTX(NX, NY, NZ, Y, Z, HX, FDATA)
      Y = NY
      DINT = DINT + XINTX(NX, NY, NZ, Y, Z, HX, FDATA)
      Y = NY - 1
      DINT = DINT + 4.D0*XINTX(NX, NY, NZ, Y, Z, HX, FDATA)
      DSUM = 0.D0
      DO Y = 2, NY-3, 2
      Y1 = Y + 1
      DSUM = DSUM + 2.D0*XINTX(NX, NY, NZ, Y, Z, HX, FDATA)
     *                + XINTX(NX, NY, NZ, Y1, Z, HX, FDATA)
      ENDDO
      XINTY = HY * (DINT + 2.D0*DSUM) / 3.D0
      END

      FUNCTION XINTZ(NX, NY, NZ, HX, HY, HZ, FDATA)
      IMPLICIT NONE
      INTEGER NX, NY, NZ, Z, Z1
      DOUBLE PRECISION HX, HY, HZ
      DOUBLE PRECISION FDATA (NX, NY, NZ)
      DOUBLE PRECISION DSUM, DINT
      DOUBLE PRECISION XINTZ, XINTY
      Z = 1
      DINT = XINTY(NX, NY, NZ, Z, HX, HY, FDATA)
      Z = NZ
      DINT = DINT + XINTY(NX, NY, NZ, Z, HX, HY, FDATA)
      Z = NZ - 1
      DINT = DINT + XINTY(NX, NY, NZ, Z, HX, HY, FDATA)
      DSUM=0.D0
      DO Z = 2, NZ-3, 2
      Z1 = Z + 1
      DSUM = DSUM + 2.D0*XINTY(NX, NY, NZ, Z, HX, HY, FDATA)
     *                + XINTY(NX, NY, NZ, Z1, HX, HY, FDATA)
      ENDDO
      XINTZ = HZ * (DINT + 2.D0*DSUM) / 3.D0
      END
