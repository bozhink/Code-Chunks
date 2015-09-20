      PROGRAM PP
      INTEGER Mat(8,8),Diagpr
      DATA Mat/8*1,8*2,8*3,8*4,8*5,8*6,8*7,8*8/
      PRINT *,Diagpr(Mat,6)
      END

      INTEGER FUNCTION Diagpr(A,n)
      INTEGER i,prod,n,A(8,*)
      prod=1
      DO i=1,n
      prod=prod*A(i,i)
      END DO
      Diagpr=prod
      END