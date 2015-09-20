      PROGRAM EX14_3 SHADED CONTOUR PLOT
      PARAMETER (N=50)
      DIMENSION ZMAT(N,N),ZLEV(12),XRAY(N),YRAY(N)
      
      STEP=1.6/(N-1)
      DO I=1,N
         X=0.0+(I-1)*STEP
         XRAY(I)=X
         DO J=1,N
            Y=0.0+(J-1)*STEP
            YRAY(J)=Y
            ZMAT(I,J)=(X**2.-1.)**2. + (Y**2.-1.)**2.
         ENDDO
      ENDDO
      
      CALL SETPAG('DA4P')
      CALL METAFL('EPS')
      CALL DISINI
      CALL PAGERA
      CALL COMPLX
      
      CALL MIXALF
      CALL TITLN('Shaded Contour Plot',1)
      CALL TITLN('F(X,Y) = (X[2$-1)[2$ + (Y[2$ - 1)[2$',3)
      CALL NAME('X-axis','X')
      CALL NAME('Y-axis','Y')
      
      CALL SHMOD('POLY','CONTUR')
      CALL AXSPOS(450,2670)
      CALL GRAF(.0,1.6,.0,.2,.0,1.6,.0,.2)
      
      DO I=1,12
         ZLEV(13-I)=.1+(I-1)*.1
      ENDDO
      
      CALL CONSHD(XRAY,N,YRAY,N,ZMAT,ZLEV,12)
      
      CALL HEIGHT(50)
      CALL TITLE
      CALL DISFIN
      END
