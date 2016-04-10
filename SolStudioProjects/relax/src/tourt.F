        SUBROUTINE TOURT( XR, YR, XS, YS )
        IMPLICIT DOUBLE PRECISION(A-Z)
C
C     AUXILIARY-LIBRARY-ROUTINE FOR CNTOUR
C
C                                                29/JULY/1980
C                                                C.J. KOST SIN
C  
C     reqd. routines - NONE
C
C       THIS ROUTINE CAN BE USED TO TRANSFORM FROM A
C       RECTANGULAR CO-ORDINATE SYSTEM TO ANY OTHER.
C       PRESENTLY IT IS A DUMMY IE. NO TRANSFORMATION
C       IS PERFORMED UPON THE INPUT PAIRS (XR,YR) & (XS,YS).
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
D     write(40,*)xr,yr,xs,ys
      X=XR*DCOS(YR)
      Y=XR*DSIN(YR)
      XR=X
      YR=Y
      X=XS*DCOS(YS)
      Y=XS*DSIN(YS)
      XS=X
      YS=Y
CD    write(30,*)'      ',xr,yr,xs,ys
      RETURN
      END
