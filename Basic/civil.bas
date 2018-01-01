REM ---------------------------------------------------
REM DATA STORE SECTION
REM ---------------------------------------------------
DATA 18000,18500,1967,2708,1,1,0
DATA 40000,44894,10699,13047,3,2,0
DATA 95000,115000,20614,15849,3,3,0
DATA 54000,63000,10000,14000,2,4,0
DATA 40000,50000,10000,12000,3,5,0
DATA 75000,120000,5377,12653,1,6,0
DATA 38000,45000,11000,12000,1,7,0
DATA 32000,90000,13000,17197,2,8,0
DATA 50000,70000,12000,19000,1,9,0
DATA 72500,85000,20000,23000,3,10,0
DATA 66000,60000,18000,16000,2,11,0
DATA 37000,60000,6700,5800,2,12,0
DATA 62000,110000,17723,18000,2,13,0
DATA 65000,100000,8500,3700,1,14,0
REM ---------------------------------------------------
REM PROGRAM CODE STARTS HERE ...
REM ---------------------------------------------------
1 L=0 : W=0 : R1=0 : P1=0 : Q1=0 : M3=0 : M4=0 : P2=0 : T1=0 : T2=0
2 REM PROGRAM BY L. CRAM , L. GOODIE , AND D. HIBBARD 
3 REM ADAPTED FOR MBASIC BY ANDRE MURTA.
4 REM AT CENTRO DE ENSINO SUPERIOR DO PARA
6 PRINT "DO YOU WANT DESCRIPTIONS " NONEWLINE
7 INPUT $Z
8 IF (LEFT(Z, 1) = "Y") || (LEFT(Z, 1) = "y") THEN Z = 0 ELSE Z = 1
9 FOR U=1 TO 6
10 PRINT " "
11 NEXT
13 IF Z=1 THEN GOTO 100 
15 PRINT "THIS IS A CIVIL WAR SIMULATION."
20 PRINT "TO PLAY, TYPE A RESPONSE WHEN THE COMPUTER ASKS."
30 PRINT "REMEMBER THAT ALL FACTORS ARE INTERRELATED AND THAT YOUR"
35 PRINT "RESPONSES COULD CHANGE HISTORY. FACTS AND FIGURES USED ARE"
40 PRINT "BASED ON THE ACTUAL OCCURENCE. MOST BATTLES TEND TO RESULT"
45 PRINT "AS THEY DID IN THE CIVIL WAR, BUT IT ALL DEPENDS ON YOU!!"
50 PRINT " "
51 PRINT "THE OBJECT OF THE GAME IS TO WIN AS MANY BATTLES AS POSSIBLE"
52 PRINT " "
53 MYKEY = INKEY
55 PRINT "YOUR CHOICES FOR DEFENSIVE STRATEGY ARE:"
60 PRINT "       (1) ARTILLERY ATTACK"
65 PRINT "       (2) FORTIFICATION AGAINST FRONTAL ATTACK"
70 PRINT "       (3) FORTIFICATION AGAINST FLANKING MANUEVERS"
75 PRINT "       (4) FALLING BACK"
80 PRINT "YOUR CHOICES FOR OFFENSIVE STRATEGY ARE:"
85 PRINT "       (1) ARTILLERY ATTACK"
86 PRINT "       (2) FRONTAL ATTACK"
87 PRINT "       (3) FLANKING MANUEVERS"
88 PRINT "       (4) ENCIRCLEMENT"
89 PRINT "YOU MAY SURRENDER BY TYPING A '5' FOR YOUR STRATEGY."
90 PRINT " "
91 PRINT "YOU ARE THE CONFEDERACY.       GOOD LUCK!"
99 MYKEY = INKEY
100 READ M1,M2,C1,C2,M,A,U
101 LET I1=10+(L-W)*2
102 LET I2=10+(W-L)*2
103 LET D1=100*INT((M1*(100-I1)/2000)*(1+(R1-Q1)/(R1+1))+0.5)
104 LET D2=100*INT(M2*(100-I2)/2000+0.5)
105 LET F1=5*M1/6
106 LET A1=Z
107 FOR U=1 TO 4
108 PRINT " "
109 NEXT
110 PRINT "THIS IS THE BATTLE OF " NONEWLINE
115 GOSUB 800 
120 PRINT " ","CONFEDERACY","  UNION"
130 PRINT "MEN"," ";INT(M1*(1+(P1-T1)/(M3+1)))," " NONEWLINE
131 PRINT INT(M2*(1+(P2-T2)/(M4+1)))
140 PRINT "MONEY","$";D1,"$";D2
150 PRINT "INFLATION"," ";I1+15;"%"," ";I2;"%"
160 PRINT " "
170 PRINT "HOW MUCH DO YOU WISH TO SPEND FOR FOOD" NONEWLINE
180 INPUT F
185 IF F<0 THEN GOTO 750 
190 PRINT "HOW MUCH DO YOU WISH TO SPEND FOR SALARIES" NONEWLINE
200 INPUT S
205 IF S<0 THEN GOTO 750 
210 PRINT "HOW MUCH DO YOU WISH TO SPEND FOR AMMUNITION" NONEWLINE
220 INPUT B
221 IF B<0 THEN GOTO 750 
222 PRINT " "
224 IF F+S+B<=D1 THEN GOTO 230 
226 PRINT "THINK AGAIN!   YOU HAVE ONLY $"D1
228 GOTO 160 
230 LET O=((2*F^2+S^2)/F1^2+1)
235 IF O<10 THEN GOTO 260 
240 PRINT "MORALE IS HIGH"
250 GOTO 300 
260 IF O<5 THEN GOTO 290 
270 PRINT "MORALE IS FAIR"
280 GOTO 300 
290 PRINT "MORALE IS POOR"
300 IF M<>3 THEN GOTO 330 
310 PRINT "YOU ARE ON THE OFFENSIVE"
320 GOTO 370 
330 IF M<>1 THEN GOTO 360 
340 PRINT "YOU ARE ON THE DEFENSIVE"
350 GOTO 370 
360 PRINT "BOTH SIDES ARE ON THE OFFENSIVE"
370 PRINT " "
380 PRINT "YOUR STRATEGY" NONEWLINE
390 INPUT Y
391 IF Y=5 THEN GOTO 1487 
392 IF ABS(Y-3)<3 THEN GOTO 395 
393 PRINT "YOU JERK!  USE THE OTHER SET OF STRATEGIES!!"
394 GOTO 370 
395 PRINT " "
400 PRINT " ","CONFEDERACY","UNION"
410 LET C5=(2*C1/5)*(1+1/(2*(ABS(INT(4*RND(1)+1)-Y)+1)))
412 LET C5=INT(C5*(1+1/O)*(1.28+F1/(B+1))+0.5)
414 IF C5+100/O<M1*(1+(P1-T1)/(M3+1)) THEN GOTO 424 
416 LET C5=INT(13*M1/20*(1+(P1-T1)/(M3+1)))
418 LET E=7*C5/13
420 LET U=1
422 GOTO 426 
424 LET E=100/O
426 PRINT "CASUALTIES",C5,INT(17*C2*C1/(C5*20)+0.5)
430 PRINT "DESERTIONS",INT(E),INT(5*O)
432 PRINT " "
433 IF C5-C1>=0 THEN GOTO 439 
435 PRINT "YOUR CASUALTIES WERE ";INT(100*(C1-C5)/C1+0.5);"% LESS THAN"
437 GOTO 441 
439 PRINT "YOUR CASUALTIES WERE ";INT(100*(C5-C1)/C1+0.5);"% MORE THAN"
441 PRINT "THE ACTUAL CASUALITIES AT " NONEWLINE
443 LET A1=1
445 GOSUB 800 
450 IF U=1 THEN GOTO 470 
460 IF C5+E<17*C2*C1/(C5*20)+5*O THEN GOTO 490 
470 PRINT "YOU LOSE " NONEWLINE
471 LET L=L+1
480 GOTO 555 
490 PRINT "YOU WIN " NONEWLINE
491 LET W=W+1
555 GOSUB 800 
556 IF W=8 THEN GOTO 1490
580 LET T1=T1+C5+E
590 LET T2=T2+17*C2*C1/(C5*20)+5*O
600 LET P1=P1+C1
610 LET P2=P2+C2
620 LET Q1=Q1+(F+S+B)
630 LET R1=R1+M1*(100-I1)/20
635 LET M3=M3+M1
637 LET M4=M4+M2
650 IF A=14 THEN GOTO 1500 
660 GOTO 100 
REM DATA code was transported to the beggining of code
750 PRINT "GOTO JAIL."
752 PRINT "GO DIRECTLY TO JAIL."
754 PRINT "DO NOT PASS GO."
756 PRINT "DO NOT COLLECT $200"
758 GOTO 107 
800 IF A<>1 THEN GOTO 850 
810 PRINT "BULL RUN"
820 IF A1=1 THEN GOTO 1480 
830 PRINT "JULY 21,1861    GEN. BEAUREGARD COMMANDING THE SOUTH MET THE"
832 PRINT "UNION FORCES WITH GEN MCDOWELL IN A PREMATURE BATTLE AT BULL"
834 PRINT "RUN.  GEN. JACKSON HELPED PUSH BACK THE UNION ATTACK."
840 GOTO 1480 
850 IF A<>2 THEN GOTO 900 
860 PRINT "SHILOH"
870 IF A1=1 THEN GOTO 1480 
880 PRINT "APRIL 6-7,1862    THE CONFEDERATE SURPRISE ATTACK AT SHILOH"
882 PRINT "FAILED DUE TO POOR ORGANIZATION."
890 GOTO 1480 
900 IF A<>3 THEN GOTO 950 
910 PRINT "SEVEN DAYS"
920 IF A1=1 THEN GOTO 1480 
930 PRINT "JUNE 25-JULY 1,1862    GENERAL LEE (CSA) UPHELD THE OFFENSIVE"
932 PRINT "THROUGHOUT THE BATTLE AND FORCED GEN. MCCLELLAN AND THE UNION"
934 PRINT "FORCES AWAY FROM RICHMOND."
940 GOTO 1480 
950 IF A<>4 THEN GOTO 1000 
960 PRINT "THE SECOND BULL RUN"
970 IF A1=1 THEN GOTO 1480 
980 PRINT "AUG 29-30,1862    THE COMBINED CONFEDERATE FORCES UNDER LEE AND"
982 PRINT "JACKSON DROVE THE UNION FORCES BACK INTO WASHINGTON."
990 GOTO 1480 
1000 IF A<>5 THEN GOTO 1050 
1010 PRINT "ANTIETAM"
1020 IF A1=1 THEN GOTO 1480 
1030 PRINT "SEPT 17,1862    THE SOUTH FAILED TO INCORPORATE MARYLAND INTO"
1032 PRINT "THE CONFEDERACY."
1040 GOTO 1480 
1050 IF A<>6 THEN GOTO 1100 
1060 PRINT "FREDERICKSBURG"
1070 IF A1=1 THEN GOTO 1480 
1080 PRINT "DEC 13,1862 THE CONFEDERACY UNDER LEE SUCESSFULLY REPULSED"
1082 PRINT "AN ATTACK BY THE UNION UNDER GEN. BURNSIDE."
1090 GOTO 1480 
1100 IF A<>7 THEN GOTO 1150 
1110 PRINT "MURFREESBORO"
1120 IF A1=1 THEN GOTO 1480 
1130 PRINT "DEC 31,1862    THE SOUTH UNDER GEN. BRAGG WON A CLOSE BATTLE"
1140 GOTO 1480 
1150 IF A<>8 THEN GOTO 1200 
1160 PRINT "CHANCELLORSVILLE"
1170 IF A1=1 THEN GOTO 1480 
1180 PRINT "MAY 1-6,1863    THE SOUTH HAD A COSTLY VICTORY AND LOST ONE"
1182 PRINT "OF THEIR OUTSTANDING GENERALS, 'STONEWALL' JACKSON."
1190 GOTO 1480 
1200 IF A<>9 THEN GOTO 1250 
1210 PRINT "VICKSBURG"
1220 IF A1=1 THEN GOTO 1480 
1230 PRINT "JULY 4,1863    VICKSBURG WAS A COSTLY DEFEAT FOR THE SOUTH"
1232 PRINT "BECAUSE IT GAVE THE UNION ACCESS TO THE MISSISSIPPI."
1240 GOTO 1480 
1250 IF A<>10 THEN GOTO 1300 
1260 PRINT "GETTYSBURG"
1270 IF A1=1 THEN GOTO 1480 
1280 PRINT "JUNE 30,1863    A SOUTHERN MISTAKE BY GEN. LEE AT GETTYSBURG"
1282 PRINT "COST THEM ONE OF THE MOST CRUCIAL BATTLES OF THR WAR."
1290 GOTO 1480 
1300 IF A<>11 THEN GOTO 1350 
1310 PRINT "CHICKAMAUGA"
1320 IF A1=1 THEN GOTO 1480 
1330 PRINT "NOV 25,1863    AFTER THE SOUTH HAD SIEGED GEN. ROSENCRANS'"
1332 PRINT "ARMY FOR THREE MONTHS, GEN. GRANT BROKE THE SIEGE."
1340 GOTO 1480 
1350 IF A<>12 THEN GOTO 1400 
1360 PRINT "CHATTANOOGA"
1370 IF A1=1 THEN GOTO 1480 
1380 PRINT "SEPT 15,1863    CONFUSION IN A FOREST NEAR CHICKAMAUGA LED"
1382 PRINT "TO A COSTLY SOUTHERN VICTORY."
1390 GOTO 1480 
1400 IF A<>13 THEN GOTO 1450 
1410 PRINT "SPOTSYLVANIA"
1420 IF A1=1 THEN GOTO 1480 
1430 PRINT "MAY 5,1864    GRANT'S PLAN TO KEEP LEE ISOLATED BEGAN TO FAIL"
1432 PRINT "HERE, AND CONTINUED AT COLD HARBOR AND PETERSBURG."
1440 GOTO 1480 
1450 PRINT "ATLANTA"
1460 IF A1=1 THEN GOTO 1480 
1470 PRINT "AUGUST, 1864   SHERMAN AND THREE VETERAN ARMIES CONVERGED ON"
1472 PRINT "ATLANTA AND DEALT THE DEATH BLOW TO THE CONFEDERACY."
1480 PRINT " "
1485 RETURN
1487 PRINT "THE CONFEDERACY HAS SURRENDERED"
1488 GOTO 1500 
1490 PRINT "THE UNION HAS SURRENDERED"
1500 PRINT " "
1510 PRINT "YOU HAVE WON ";W;" BATTLES AND LOST ";L;" BATTLES."
1515 IF Y=5 THEN GOTO 1550 
1520 IF W<=L THEN GOTO 1550 
1530 PRINT "THE CONFEDERACY HAS WON THE WAR"
1540 END
1550 PRINT "THE UNION HAS WON THE WAR"
1560 END
