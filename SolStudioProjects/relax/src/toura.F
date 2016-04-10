       SUBROUTINE TOURA( NNX ,  XP , YP , ZP )
C
C     AUXILIARY-LIBRARY-ROUTINE FOR CNTOUR
C
C                                                05/AUG/1980
C                                                C.J. KOST SIN
C
C  
C     reqd. KOSTL: routines - ISON,TOURB1
C
C     PLACE PARAMETERS WE CAN IN COMMON
C
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
       COMMON / TOUR1C / TOUR , IIRP , JJRP , IISP , JJSP , NX , NY
       COMMON /TOUR2C/ IPEN, VAL, XVAL, SEP, PLACE, POS, XSEP, XSEP2
C
C      TOUR = THE CONTOUR VALUE
C      IRP , JRP  = REFERENCE POINT
C      ISP , JSP  = POINT WE ARE CONTOURING TO
C
       DIMENSION XP( 2 ) , YP( 2 ) , ZP( NNX , 2 )
       DIMENSION IT( 9 )  , JT( 9 )
       DATA IT / 0 , 1 , 1 , 0 , 9 , 0 , -1 , -1 , 0 /
       DATA JT / -1 , 0 , 0 , -1 , 9 , 1 , 0 , 0 , 1 /
       LOGICAL DTEST( 9 )
       DATA DTEST / .FALSE. , .TRUE. , .FALSE. , .TRUE. , .FALSE. ,
     1  .TRUE. , .FALSE. , .TRUE. , .FALSE.                      /
       IRP = IIRP
       JRP = JJRP
       ISP = IISP
       JSP = JJSP
       IPEN = +3
       GO TO 5
C
C      S W I T C H  P O I N T S
C
95     IRP = IN
       JRP = JN
5      CONTINUE
       CALL TOURB1( XP( IRP ) , YP( JRP ) , ZP( IRP , JRP ) ,
     1  XP( ISP ) , YP( JSP ) , ZP( ISP , JSP )  )
C
C      FIND THE NEXT POINT TO CHECK THROUGH A TABLE LOOKUP
C
       LOCATE = 3*( JRP - JSP ) + IRP - ISP + 5
C
C      IN , JN = THE NEW POINT
C
       IN = ISP + IT( LOCATE )
       JN = JSP + JT( LOCATE )
C
C      T E S T  F O R  A N  E D G E
C
       IF( IN .GT. NX .OR. IN .LT. 1 .OR. JN .GT. NY .OR. JN .LT. 1 )
     1  RETURN
C
C      I T  M A Y  B E  A  D I A G O N A L
C
       IF( LOCATE .NE. 6 ) GO TO 60
       IF( ISON( IRP , JRP , +1 ) .EQ. 1 ) RETURN
60     IF( DTEST( LOCATE ) ) GO TO 97
C
C      DETERMINE IF IT IS A CONTOUR OR SWITCH POINTS
C
       ZPP = ZP( IN , JN )
       IF( ZPP .GT. TOUR ) GO TO 95
       ISP = IN
       JSP = JN
       GO TO 5
C
C      D I A G O N A L S  G E T  S P E C I A L  T R E A T M E N T
C
C      CALCULATE THE HEIGHT AND LOCATION OF THE MIDPOINT
C
97     CONTINUE
       VX = ( XP( IRP ) + XP( IN )  )*0.5
       VY = ( YP( JRP ) + YP( JN )  )*0.5
       LOCATE = 3*( JRP - JN ) + IRP - IN + 5
       INN = IN + IT( LOCATE )
       JNN = JN + JT( LOCATE )
       HTM = ( ZP( IRP , JRP ) + ZP( ISP , JSP ) + ZP( IN , JN ) +
     1 ZP( INN , JNN )  )/4.0
       IF( HTM .GT. TOUR ) GO TO 975
C
C      M I D P O I N T  L E S S  T H A N  C O N T O U R
C
       CALL TOURB1( XP( IRP ) , YP( JRP ) , ZP( IRP , JRP ) ,
     1  VX , VY , HTM  )
       IF( ZP( INN , JNN ) .GT. TOUR ) GO TO 9715
C      T U R N O F F  S H A R P  R I G H T
       ISP = INN
       JSP = JNN
       GO TO 5
9715   CONTINUE
       CALL TOURB1( XP( INN ) , YP( JNN ) , ZP( INN , JNN ) ,
     1  VX , VY , HTM  )
       IF( ZP( IN , JN ) .GT. TOUR ) GO TO 9716
C      C O N T I N U E  S T R A I G H T  T H R O U G H
       IRP = INN
       JRP = JNN
       ISP = IN
       JSP = JN
       GO TO 5
C      W I D E  L E F T  T U R N
9716   CONTINUE
       CALL TOURB1( XP( IN ) , YP( JN ) , ZP( IN , JN ) , VX, VY, HTM)
       GO TO 95
C
C       M I D P O I N T  G R E A T E R  T H A N  C O N T O U R
C
975    CONTINUE
       CALL TOURB1( VX , VY , HTM , XP( ISP ) , YP( JSP ) , ZP( ISP ,
     1  JSP )  )
C      I T  M A Y  B E  A  S H A R P  L E F T  T U R N
       IF( ZP( IN  , JN  ) .GT. TOUR ) GO TO 95
       CALL TOURB1( VX , VY , HTM , XP( IN ) , YP( JN ) , ZP( IN , JN))
       IF( ZP( INN , JNN ) .GT. TOUR ) GO TO 976
C      W I D E  R I G H T  T U R N
       CALL TOURB1( VX , VY , HTM , XP( INN ) , YP( JNN ) ,
     1  ZP( INN , JNN )  )
       ISP = INN
       JSP = JNN
       GO TO 5
C      C O N T I N U E  S T R A I G H T  T H R O U G H
976    ISP = IN
       JSP = JN
       IRP = INN
       JRP = JNN
       GO TO 5
       END
