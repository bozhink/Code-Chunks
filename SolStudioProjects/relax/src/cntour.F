       SUBROUTINE CNTOUR( XP , NXX, YP , NYY, ZP , IDIMX, TOURR,
     1 VALL , CVAL  ,SYMSIZ)
C
C     LIBRARY-ROUTINE
C
C                                                05/AUG/1980
C                                                C.J. KOST SIN
C
C  
C      reqd. KOSTL: routines - ISON,TOURA
C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C
C      C O N T O U R  P L O T T I N G  O F  A  G R I D
C
C      XP = ARRAY OF X VALUES - SINGLE DIMENSION
C      YP = ARRAY OF Y VALUES - SINGLE DIMENION,
C      ZP ' DOUBLE DIMENSION ARRAY( IDIMX BY ..... ) CONTAINING THE
C              Z VALUES ( Z = F( X , Y )  )  TO BE CONTOURED.
C      NX , NY , = THE CONTOURING GRID IS NX LONG BY NY WIDE .
C      I. E. THE GRID MAY BE SMALLER THAN THE ARRAY WHICH CONTAINS IT.
C      'VAL' IS AN INDICATOR FOR PLOTTING NUMBERS ON THE LINES.
C      IF ABS( VAL ) .LT. 0.5 THEN NO NUMBERS ARE PLOTTED
C      IF POSITIVE THEN NUMBERS ARE PLACED VAL CELLS APART.
C      IF NEGATIVE THE NUMBERS ARE PLOTTED ABS( VAL) APART.
C      IF NEGATIVE NEGATIVE VALUES ON THE GRID ARE NOT PLOTTED AT ALL.
C
C      CVAL IS THE VALUE OF THE NUMBER TO BE PLACED ON THE CONTOUR.
C      ONLY THE INTEGER PORTION OF THE NUMBER IS PLOTTED .
C      IF 'CVAL' = 0 THEN THE FIRST 3 SIGNIFICANT DIGITS OF TOURR ARE
C              USED.
C
C  Modified Dec 5/83 by Fred Jones: according the above, for the case 
C  0 < CVAL < 1 one expects to get a "0" contour label since the 
C  integer part of CVAL is 0.  The code has been corrected to get this
C  behaviour, since otherwise there is no way to get a "0" contour
C  label when TOURR is very small but not exactly zero.
C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
       DIMENSION XP(   2   ) , YP(   2   ) , ZP( IDIMX ,2  )
       COMMON /SYMB0L/ SYMS
       COMMON / TOUR1C / TOUR , IRP , JRP , ISP , JSP , NX , NY
       COMMON /TOUR2C/ IPEN, VAL, XVAL, SEP, PLACE, POS, XSEP, XSEP2
       LOGICAL PLACE , POS

       SYMS=5.
       NP=10
       IF(NP.GE.10)SYMS=SYMSIZ
       VAL = VALL
       TOUR = TOURR
       NX = NXX
       NY = NYY
C***** INITIALIZE FOR PLACING NUMBERS ON THE CONTOURS *****
       PLACE = .FALSE.
       SEP = ABS( VAL )
       IF( SEP .LT. 0.5 ) GO TO 195
       PLACE = .TRUE.

C If CVAL = 0 then generate label from contour level
      IF(CVAL.EQ.0.) GO TO 190
C If 0 < CVAL< 1 then contour label is "0"
      IF(CVAL.LT.1.)THEN
        XVAL=0.
        TEMP=1.
        GO TO 185
      ENDIF
C
C****** CVAL IS THE NUMBER TO BE PLACED ON THE CONTOURS *****
       XVAL = CVAL
C**** CALCULATE THE NUMBER OF DIGITS IN THE NUMBER *****
       TEMP = INT( ALOG10( ABS( CVAL ) ) )
       TEMP = TEMP + 1.0
C***** IF MORE THAN 6 DIGITS USE THE OTHER METHOD *****
       IF( TEMP .GT. 6.0 ) GO TO 190
C**** THE WIDTH OF THE NUMBER IN PLOT CELLS *****
185    XSEP = TEMP * 6. + 4.
       IF( CVAL .GT. 0.0 ) GO TO 194
       GO TO 1935

C**** WE PLOT THE FIRST 3 SIGNIFIGANT DIGITS OF THE NUMBER *****
190    CONTINUE
       XVAL = 0.0
       XSEP = 11.
       IF( TOUR .EQ. 0.0 ) GO TO 194
       XSEP = 22.
       TEMP = ALOG10( ABS( TOUR ))
       TEMP = TEMP - FLOAT( INT( TEMP ) ) + 2.0
       IF( TEMP .LT. 2.0 ) TEMP = TEMP + 1.0
       XVAL = 10.0 ** TEMP
       XVAL = INT( XVAL + 0.5 )
       IF( TOUR .GT. 0.0 ) GO TO 194
193    XVAL = -XVAL

1935   XSEP = XSEP + 6.
194    XSEP2 = XSEP * 0.5 - 2.
195    CONTINUE
       POS = .FALSE.
       IF( VAL .GE. 0.0 ) POS = .TRUE.
C
C      THIS SUBROUTINE INITIALIZES AND CONDUCTS THE SEARCH
C              F I R S T  C L E A R  A L L  S W I T C H E S
C
       ITEMP = ISON( NX , NY , -1 )
C
C     S E A R C H  F O R  A  B O T T O M  E D G E  C O N T O U R
C
       JRP = 1
       JSP = 1
       DO 1 I = 2 , NX
       IF( ZP( I , 1 ) .LE. TOUR ) GO TO 1
       J = I - 1
       IF( ZP( J , 1 ) .GT. TOUR ) GO TO 1
       IRP = I
       ISP = J
       CALL TOURA(   IDIMX ,  XP , YP , ZP )
1      CONTINUE
C
C      S E A R C H  T H E  R I G H T  E D G E
C
       ISP = NX
       IRP = NX
       DO 15 I = 2 , NY
       IF( ZP( NX , I ) .LE. TOUR ) GO TO 15
       J = I - 1
       IF( ZP( NX , J ) .GT. TOUR ) GO TO 15
       JSP = J
       JRP = I
       CALL TOURA(   IDIMX ,  XP , YP , ZP )
15     CONTINUE
C
C      S E A R C H  T H E  T O P  E D G E
C
       ITEMP = NX - 1
       JRP = NY
       JSP = NY
       DO 2 I = 1 , ITEMP
       II = NX - I
       IF( ZP( II , NY  ) .LE. TOUR ) GO TO 2
       J = II + 1
       IF( ZP(   J , NY ) .GT. TOUR ) GO TO 2
       IRP = II
       ISP = J
       CALL TOURA(   IDIMX ,  XP , YP , ZP )
2      CONTINUE
C
C      S E A R C H  F O R  A  L E F T  E D G E  C O N T O U R
C
       JTEMP = NY - 1
       IRP = 1
       ISP = 1
       DO 25 I = 1 , JTEMP
       II = NY - I
       IF( ZP( 1 , II ) .LE. TOUR ) GO TO 25
       J = II + 1
       IF( ZP( 1 , J ) .GT. TOUR ) GO TO 25
       JRP = II
       JSP = J
       CALL TOURA(   IDIMX ,  XP , YP , ZP )
25     CONTINUE
C
C      S E A R C H  T H E  R E S T  O F  T H E  A R R A Y
C
       DO 30 I = 2 , JTEMP
       DO 26 J = 2 , ITEMP
       JJ = J - 1
       IF( ZP( J , I ) .LE. TOUR)GO TO 26
       IF( ZP( JJ , I ) .GT. TOUR ) GO TO 26
       IF( ISON( J , I , 0 ) .EQ. 1 ) GO TO 26
       IRP = J
       ISP = JJ
       JRP = I
       JSP = I
       CALL TOURA(   IDIMX ,  XP , YP , ZP )
26     CONTINUE
30     CONTINUE
       RETURN
       END

