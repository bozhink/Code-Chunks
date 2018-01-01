    REM ---------------------------------------------------
    REM
    REM LUNAR.BAS
    REM
    REM LUNAR LANDING GAME
    REM
    REM AUTHOR: ANDRE MURTA
    REM DATE: 20/12/1992
    REM 
    REM DEVELOPED AT CENTRO DE ENSINO SUPERIOR DO PARA
    REM
    REM ---------------------------------------------------
    CLS
    PRINT tab(30); "LUNAR LANDER"
    PRINT " "
    PRINT tab(29); "by Andre Murta"
    PRINT chr(7)
    FOR i=1 TO 10 : PRINT " " : NEXT
    INPUT "Do you want instructions (y/n): ",$a
    IF (left(a,1) <> "Y") && (left(a, 1) <> "y") THEN GOTO 390
    PRINT " "
    PRINT "You are landing on the moon and and have taken over manual"
    PRINT "control 1000 feet above a good landing spot. You have a down-"
    PRINT "ward velocity of 50 feet/sec. 150 units of fuel remain."
    PRINT " "
    PRINT "Here are the rules that govern your APOLLO space-craft:" : print " "
    PRINT "(1) After each second the height, velocity, and remaining fuel"
    PRINT "    will be reported via DIGBY your on-board computer."
    PRINT "(2) After the report a '?' will appear. Enter the number"
    PRINT "    of units of fuel you wish to burn during the next"
    PRINT "    second. Each unit of fuel will slow your descent by"
    PRINT "    1 foot/sec."
    PRINT "(3) The maximum thrust of your engine is 30 feet/sec/sec"
    PRINT "    or 30 units of fuel per second."
    PRINT "(4) When you contact the lunar surface. your descent engine"
    PRINT "    will automatically shut down and you will be given a"
    PRINT "    report of your landing speed and remaining fuel."
    PRINT "(5) If you run out of fuel the '?' will no longer appear"
    PRINT "    but your second by second report will continue until"
    PRINT "    you contact the lunar surface." : print " "
    c = INKEY
390 PRINT "Beginning landing procedure.........." : PRINT " "
    PRINT "DIGBY WISHES YOU GOOD LUCK !!!!!!!"
    PRINT " " : PRINT " "
    PRINT "SEC     FEET    SPEED   FUEL"
    PRINT " "
    t=0 : h=1000 : v=50 : f=150
490 PRINT t;tab(6);h;tab(16);v;tab(26);f;tab(35);("I");tab(h/15);"*"
    INPUT b
    IF b<0 THEN GOTO 650
    IF b>30 THEN b=30
    IF b>f THEN b=f
540 v1=v-b+5
    f=f-b
    h=h- 0.5*(v+v1)
    IF h<=0 THEN GOTO 670
    t=t+1
    v=v1
    IF f>0 THEN GOTO 490
    IF b=0 THEN GOTO 640
    PRINT "**** OUT OF FUEL ****";chr(7);chr(7);chr(7)
640 PRINT t;tab(6);h;tab(16);v;tab(26);f;tab(35);("I");tab(h/15);"*"
650 b=0
    GOTO 540
670 PRINT "***** CONTACT *****"
    h=h+ 0.5*(v1+v)
    IF b=5 THEN GOTO 720
    d=(-v+sqr(v*v+h*(10-2*b)))/(5-b)
    GOTO 730
720 d=h/v
730 v1=v+(5-b)*d
    PRINT "Touchdown at ";t+d;" seconds."
    PRINT "Landing velocity = ";v1;" feet/sec."
    PRINT f;" units of fuel remaining."
    IF v1<>0 THEN GOTO 810
    PRINT "Congratulations! A perfect landing!!"
    PRINT "Your license will be renewed.............later."
810 IF abs(v1) < 2 THEN GOTO 840
    IF v1>50 THEN PRINT "You totalled an entire mountain !!!!!" : GOTO 830
    IF v1>30 && v1<50 THEN PRINT "Your ship is a wreck !!!!!" : GOTO 830
    IF v1>10 && v1<30 THEN PRINT "You blasted a huge crater !!!!!" : GOTO 830
    IF v1>5 && v1<10 THEN PRINT "Your ship is a heap of junk !!!!!" : GOTO 830
    PRINT "You blew it!!!!!!"
830 PRINT "Your family will be notified..............by post."
840 PRINT " " : print " " : print " "
    INPUT $a
    INPUT "Another mission (y/n): ", $a
    IF (left(a,1)<>"N") && (left(a, 1) <> "n") THEN GOTO 390
    PRINT " " : PRINT "Control out." : PRINT " "
    END
