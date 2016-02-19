      SUBROUTINE RELAX(V,IMAX,JMAX,KMAX,IJKDIM)
C======================================================================C
C  Problem set-up and command processor
C======================================================================C
      COMMON/SOLN/LL,MAXX,MAXY,MAXZ
      COMMON/BLOCK1/HX,HY,HZ,WX,WY,WZ,COMFI,WYROT,WXAX,WYAX,COMFAX
      COMMON/BLOCK2/TOLER,IADRESS,MULT,OFF,OFF0,IOPT,BMAX
      DATA IADRESS/0/
      COMMON/RELAX3D_TIME/TSTART,TMAX
      COMMON/RELAX3D_SWEEP/ALTERNATE,ITCOUNT
      LOGICAL ALTERNATE
      COMMON/RELAX3D_POLAR/NSYMM,IJ0,IJ90,IJ180,IJ270
      COMMON/RELAX3D_POLAR1/POLAR,HYDEG,THMAX
      LOGICAL POLAR
      COMMON/RELAX3D_ALPHA/ALPHA

      COMMON/SLICES/ISLICE(101),NSLICE,ISLCURRENT,PLANE
      CHARACTER*1 PLANE
      COMMON/LEVELS/CLEV(101),NCLEV,PCTLAB
      LOGICAL PCTLAB

      COMMON/PLOTMONITOR/IMONITOR,IOUTM

      COMMON/DEVICE/TERMTYPE,HARDTYPE
      CHARACTER*15 TERMTYPE,HARDTYPE

      COMMON/CTRLC/CTRLC_FLAG
      LOGICAL CTRLC_FLAG

      REAL*4 V(1)
      BYTE LINE(132)
      CHARACTER*132 CLINE
      EQUIVALENCE(LINE,CLINE)
      BYTE ANS
      BYTE GS/29/,ESC/27/,FF/12/,CAN/29/
      CHARACTER*60 FNAME,BNDNAME
      REAL*4 COMAND
      CHARACTER*4 COMANDC
      EQUIVALENCE(COMAND,COMANDC)
      REAL*4 FIELDS(8)
      INTEGER ITYPE(8) 
      LOGICAL QUIT
      LOGICAL ALPHAVMS
      CHARACTER*4 BIND

C g77 has intrinsic by this name
#ifdef g77
      EXTERNAL CPU_TIME
#endif

#ifdef VMS
      EXTERNAL LIB$GET_INPUT,LIB$PUT_OUTPUT
C     LOGICAL TRAPON/.TRUE./
      INCLUDE '($SYIDEF)'
#else
      CHARACTER*80 RELAXDIR
C     CHARACTER*80 OUTPNAME
C     LOGICAL OUTPEXIST
C     LOGICAL TRAPON/.FALSE./
#endif

C Statement function ICHK checks that I falls on a usable (active) 
C mesh point when the grid is reduced.
      ICHK(I,INC)=(I-1)/INC*INC+1

      IJKMAX=IMAX*JMAX*KMAX

      TSTART=CPU_TIME(0.)
      TOLD=TSTART
C 10 hour nominal time limit:
      TMAX=TSTART+36000.
C Allow 60-second safety zone with respect to process time limit:
      CPUL=CPU_LIMIT(DUM)
      IF(CPUL.GT.0..AND.TMAX.GT.CPUL-60.)TMAX=CPUL-60.

      IJMAX=IMAX*JMAX
      I1=1
      I2=IMAX
      J1=1
      J2=JMAX
      K1=1
      K2=KMAX
      INC=1
      IMAXP1=IMAX+1
      JMAXP1=JMAX+1
      KMAXP1=KMAX+1
      QUIT=.FALSE.
      OFF=0.
      TOLER=1.E-6
      IFLAG=0
      IOPT=-1

C If dynamic BND loading is not available, set IADRESS flag
#ifdef VMS
      ISTAT=LIB$GETSYI(SYI$_ARCH_TYPE,IARCH)
      ALPHAVMS=(IARCH.EQ.2)
      IF(ALPHAVMS)IADRESS=1      
#else
      IADRESS=1
#endif

C Initialize slice list and contour list
      PLANE='K'
      NSLICE=1
      ISLICE(1)=1
      NCLEV=21
      DO I=1,21
        CLEV(I)=(I-1)*5.
      ENDDO

C======================================================================C
C           COMMAND RECYCLE POINT                                
C======================================================================C
10    TNEW=CPU_TIME(0.)
      CALL TRANSPARENT_MODE(0)

C Call trap routine to go to 10 on attention interrupt or error.
C This is a VAX supported feature and will require 
C appropriate system subroutines for other installations.
#ifdef VMS
C     IF(TRAPON)CALL T$RAP(&10)
#endif

      TSTEP=TNEW-TOLD
      TOLD=TNEW
      TLEFT=TMAX-TNEW

      WRITE(6,20)COMAND,TSTEP,TNEW-TSTART,TLEFT
20    FORMAT(/' [',A4,' used ',F8.2,' sec.  Total used:',
     # F8.2,' sec.  Remaining:',F8.2,' sec.]'/)
      IF(TNEW.GT.TMAX) GO TO 620

      WRITE(6,30)
30    FORMAT(' Relax3D > ',$)
      READ(5,40,END=900,IOSTAT=IERR)CLINE
40    FORMAT(A)
      IF(IERR.NE.0)THEN
        WRITE(6,*)'Error reading command line.'
        CALL FORMSG
        GO TO 10
      ENDIF
      IF(LENSIG(CLINE).EQ.0)GO TO 10
C Shell command
#ifdef unix
      DO WHILE(CLINE(1:1).EQ.' ')
        CLINE=CLINE(2:)
      ENDDO
      IF(CLINE(1:1).EQ.'%')THEN
        CLINE=CLINE(2:)
        CALL SYSTEM(CLINE)
        GO TO 10
      ENDIF
#endif
      NFIELD=8
      CALL READLN(LINE,FIELDS,ITYPE,NFIELD)
      COMAND=FIELDS(1)
CC      IF(LENSIG(COMANDC).EQ.0)GO TO 10      !COMANDC equiv COMAND
      CALL UPRCASE(COMANDC,COMANDC)

      DO I=2,NFIELD
        IF(ITYPE(I).EQ.1)THEN
          WRITE(6,*)'Error reading command line parameter',I-1
          GO TO 10
        ENDIF
      ENDDO

      PAR1=FIELDS(2)
      PAR2=FIELDS(3)
      PAR3=FIELDS(4)
      PAR4=FIELDS(5)
      PAR5=FIELDS(6)
      PAR6=FIELDS(7)
      PAR7=FIELDS(8)

      IF(COMANDC.EQ.'LOAD')  GO TO 110
      IF(COMANDC.EQ.'INIT')  GO TO 120
      IF(COMANDC.EQ.'REDU')  GO TO 230
      IF(COMANDC.EQ.'LIMI')  GO TO 270
      IF(COMANDC.EQ.'ITER')  GO TO 480
      IF(COMANDC.EQ.'EXPA')  GO TO 520
      IF(COMANDC.EQ.'OUTP')  GO TO 550
      IF(COMANDC.EQ.'PLOT')  GO TO 590
      IF(COMANDC.EQ.'COMP')  GO TO 720
      IF(COMANDC.EQ.'OPT'.OR.COMANDC.EQ.'OPTI')  GO TO 755
      IF(COMANDC.EQ.'TYPE')  GO TO 800
      IF(COMANDC.EQ.'WRIT')  GO TO 800
      IF(COMANDC.EQ.'STAT')  GO TO 850
      IF(COMANDC.EQ.'STOP'.OR.COMANDC.EQ.'QUIT'.OR.COMANDC.EQ.'EXIT')
     &    GO TO 900

C======================================================================C
C  HELP command: accesses help library
C======================================================================C
      IF(COMANDC.EQ.'HELP')THEN
#ifdef VMS
        ISTAT=LIB$ERASE_PAGE(1,1)
        ISTAT=LBR$OUTPUT_HELP(LIB$PUT_OUTPUT,,' ',
     #    'RELAX$DIR:RELAX3D.HLB',,LIB$GET_INPUT)
#else
        CALL GETENV('RELAX_DIR',RELAXDIR)
        LSN=LENSIG(RELAXDIR)
        IF(LSN.GT.0)THEN
          CALL VHELP(RELAXDIR(1:LSN)//'/relax3d',' ')
        ELSE
          CALL VHELP('/usr/local/bin/relax3d',' ')
        ENDIF
#endif

C======================================================================C
C  TIME command
C  Sets cpu time limits (seconds)
C======================================================================C
      ELSE IF(COMANDC.EQ.'TIME')THEN
        CPUL=CPU_LIMIT(DUM)
        IF(NFIELD.GT.1)THEN
          TLIM=PAR1
          IF(CPUL.GT.0..AND.TSTART+TLIM.GT.CPUL-60.)THEN
            WRITE(6,*)'Time limit too large.'
            WRITE(6,*)'Maximum time limit is ',CPUL-TSTART-60.
          ELSE IF(TLIM.LE.TNEW-TSTART)THEN
            WRITE(6,*)'Time limit is less than time used!'
          ELSE
            TMAX=TSTART+TLIM
          ENDIF
        ENDIF
        WRITE(6,*)
        WRITE(6,3000)'Time limit:     ',TMAX-TSTART
        WRITE(6,3000)'Time used:      ',TNEW-TSTART
        WRITE(6,3000)'Time remaining: ',TMAX-TNEW
        WRITE(6,*)
        WRITE(6,3000)'Process cpu time limit:   ',CPUL
        WRITE(6,3000)'Process elapsed cpu time: ',TNEW
3000    FORMAT(1X,A,F8.2)

C======================================================================C
C  TOLER command
C  Sets tolerance for convergence.  Default value = 1.E-6
C======================================================================C
      ELSE IF(COMANDC.EQ.'TOL'.OR.COMANDC.EQ.'TOLE')THEN
        IF(NFIELD.GT.1)TOLER=PAR1
        WRITE(6,*)'Current tolerance is ',TOLER

C======================================================================
C  PRINT command
C  Makes printer-plots of specified slices
C======================================================================
      ELSE IF(COMANDC.EQ.'PRIN')THEN
        LUN=PAR1
D       WRITE(6,*)'PAR1,LUN=',PAR1,LUN
        IF(LUN.EQ.0)THEN
          LUN=6
        ELSE IF(LUN.EQ.5.OR.LUN.EQ.7)THEN
          WRITE(6,*)'Logical units 5 and 7 are reserved'
          GO TO 10
        ENDIF
        CALL PRNT(V,IMAX,JMAX,KMAX,IJKMAX,IJMAX,JMAXP1,INC,LUN)

C=====================================================================
C  SOLU command
C  Puts exact solution into array using calls to BND which should 
C  have been coded to return the exact solution when the parameter 
C  LL has been set to 1.
C======================================================================
      ELSE IF(COMANDC.EQ.'SOLU')THEN
        LL=1
        GO TO 130

C=======================================================================
C  DCL command:  Connects to DCL subprocess.
C=======================================================================
      ELSE IF(COMANDC.EQ.'DCL')THEN
#ifdef VMS
        WRITE(6,*)'Connecting to DCL subprocess...'
        WRITE(6,*)'  (To return to Relax3D, type RESUME)'
        CALL NARGSI(1)
        CALL PUT_DCL(0,&991)
        GO TO 10
991     WRITE(6,*)'Unable to spawn or connect to subprocess.'
#else
        WRITE(6,*)'Use "%command" to execute shell command'
#endif

C=======================================================================
C  CLEAR commands:  Clear alpha and graphics screens.
C=======================================================================
      ELSE IF(COMANDC.EQ.'CLEA'.OR.COMANDC.EQ.'CL')THEN
        CALL CLDISP
        ISLCURRENT=0      !disable CROSS
      ELSE IF(COMANDC.EQ.'ACLE'.OR.COMANDC.EQ.'ACL')THEN
        CALL CLTRANS
        READ(5,*)      !wait for <cr>

C=======================================================================
C  CROSS command:  bring up graphics crosshairs
C=======================================================================
      ELSE IF(COMANDC.EQ.'CROS')THEN
        CALL CROSS(V,IMAX,JMAX,KMAX)

C Temporary hacked CROSS for field readout
      ELSE IF(COMANDC.EQ.'XXXX')THEN
        CALL XXXX(V,IMAX,JMAX,KMAX)

C======================================================================C
C  TRAP command: enable/disable trap handler
C======================================================================C
C     ELSE IF(COMANDC.EQ.'TRAP')THEN
#ifdef VMS
C       TRAPON=.NOT.TRAPON
C       IF(TRAPON)THEN
C         CALL T$RAP(&10)
C         WRITE(6,*)'Trap handler is now ON.'
C       ELSE
C         CALL UNT$RAP
C         WRITE(6,*)'Trap handler is now OFF.'
C       ENDIF
#else
C       WRITE(6,*)'Trap handler is not supported in UNIX versions'
#endif

C======================================================================C
C  ALTERNATE command: enable/disable alternating sweep
C======================================================================C
      ELSE IF(COMANDC.EQ.'ALTE'.OR.COMANDC.EQ.'ALT')THEN
        IF(IOPT.EQ.7.OR.IOPT.EQ.8)THEN
          WRITE(6,*)
     #      'Alternating sweep is not available for this problem type.'
          GO TO 10
        ENDIF
        ALTERNATE=.NOT.ALTERNATE
        IF(ALTERNATE)THEN
          WRITE(6,*)'Alternating sweep is now ON.'
        ELSE
          WRITE(6,*)'Alternating sweep is now OFF.'
        ENDIF

C======================================================================C
C  TERM command: close current input stream and revert to terminal
C======================================================================C
      ELSE IF(COMANDC.EQ.'TERM')THEN
#ifdef VMS
        IF(IBATCH())STOP
        CLOSE(UNIT=5)
        OPEN(UNIT=5,FILE='TT:',STATUS='OLD')
#else
        WRITE(6,*)'TERM command is not yet supported in UNIX versions'
#endif

C======================================================================C
C  BND command:  
C  Do init passing flag to BND.
C======================================================================C
      ELSE IF(COMANDC.EQ.'BND')THEN
        LL=PAR1
        IF(LL.EQ.0)THEN
          WRITE(6,*)'No flag parameter specified.'
          GO TO 10
        ELSE IF(LL.EQ.1)THEN
          WRITE(6,*)'Invalid flag parameter for special processing.'
          GO TO 10
        ENDIF
C Branch to INIT code.  Set PAR1 to zero first.
        PAR1=0.
        GO TO 130

C======================================================================C
C  HARD command:  hardcopy output
C======================================================================C
      ELSE IF(COMANDC.EQ.'HARD')THEN
        CALL NARGSI(1)
        IF(HARDTYPE.EQ.'PRINTRONIX')THEN
          CALL GRAPHICS_HARDCOPY(1)
        ELSE IF(HARDTYPE.EQ.'ZETA')THEN
          CALL GRAPHICS_HARDCOPY(2)
        ELSE IF(HARDTYPE.EQ.'HPA')THEN
          CALL GRAPHICS_HARDCOPY(3)
        ELSE IF(HARDTYPE(1:7).EQ.'HPLASER')THEN
          CALL GRAPHICS_HARDCOPY(4)
        ELSE IF(HARDTYPE.EQ.'HPPAINTJET')THEN
          CALL GRAPHICS_HARDCOPY(11)
        ELSE IF(HARDTYPE.EQ.'POSTSCRIPT')THEN
          CALL GRAPHICS_HARDCOPY(12)
        ENDIF

C======================================================================C
C  DWG command:  open EDGR drawing file
C======================================================================C
      ELSE IF(COMANDC.EQ.'DWG')THEN
        CALL DWG

C======================================================================C
C  VIEW command:  3D view of mesh points
C======================================================================C
      ELSE IF(COMANDC.EQ.'VIEW')THEN
        IF(IFLAG.EQ.0)THEN
          WRITE(6,*)'Array is not initialized!  Use INIT command.'
          GO TO 10
        ENDIF
        IMAXR=SIGN(IMAX,NINT(PAR1))
        JMAXR=SIGN(JMAX,NINT(PAR2))
        KMAXR=SIGN(KMAX,NINT(PAR3))
        V1R=PAR4
        V2R=PAR5
        INCLR=NINT(PAR6)
        write(6,*)IMAXR,JMAXR,KMAXR,V1R,V2R,INCLR
        CALL VIEW(V,IMAXR,JMAXR,KMAXR,I1,I2,J1,J2,K1,K2,V1R,V2R,INCLR)

C======================================================================C
C  RETURN command:  start a new problem
C======================================================================C
      ELSE IF(COMANDC.EQ.'RETU')THEN
        WRITE(6,*)'Starting new problem...'
        RETURN

C======================================================================C
C  Invalid command
C======================================================================C
      ELSE
        WRITE(6,*)'Unrecognized command ... type HELP for assistance.'
      ENDIF
      GO TO 10

C======================================================================
C  LOAD command
C  Dynamically loads a user-specified object module for bnd
C======================================================================
#ifdef VMS
110   IF(ALPHAVMS)THEN
        WRITE(6,*)'LOAD command is only available on VAX/VMS'
        GO TO 10
      ENDIF
      WRITE(6,11000)
11000 FORMAT(' Object file name > ',$)
      READ(5,11001,ERR=10)FNAME
11001 FORMAT(A)
      LSFN=LENSIG(FNAME)
      IF(LSFN.EQ.0)GO TO 10

C Supply file type if missing
      IBRACK=INDEX(FNAME,']')
      IF(INDEX(FNAME(IBRACK+1:),'.').EQ.0)FNAME=FNAME(1:LSFN)//'.OBJ'

      OPEN(UNIT=1,FILE=FNAME,STATUS='OLD',READONLY,IOSTAT=IERR)
      IF(IERR.NE.0)THEN
        WRITE(6,*)'Error opening ',FNAME(1:LENSIG(FNAME))
        CALL FORMSG
        GO TO 110
      ENDIF
      CLOSE(UNIT=1)

C Temporarily disable trapping:
      CALL SYS$SETAST(%VAL(0))

C Link and load the object module:
C Memory allocation is currently set to 2048K ('00200000'X).
      IADRESS=LL$OAD1(FNAME,'00200000'X)
      IF(IADRESS.EQ.0)THEN
        WRITE(6,*)'Unable to load object module ',FNAME(1:LENSIG(FNAME))
      ELSE
        WRITE(6,*)'Loaded object module ',FNAME(1:LENSIG(FNAME))
        BNDNAME=FNAME
      ENDIF

      CALL SYS$SETAST(%VAL(1))

#else
110   WRITE(6,*)'LOAD command is only available on VAX/VMS'
#endif

      GO TO 10

C======================================================================
C  INIT command
C  Initializes main array by calling user defined routine BND
C======================================================================
120   LL=0
130   OFFOLD=OFF
      OFF=0.
      IF(IOPT.EQ.-1)THEN
        WRITE(6,*)'No problem type selected!  Use OPTION command.'
        GO TO 10
      ELSE IF(IOPT.EQ.3.OR.IOPT.EQ.5.OR.IOPT.EQ.8)THEN
        WRITE(6,*)'Initializing for POISSON equation'
        IF(IOPT.EQ.5)WRITE(6,*)' with CYLINDRICAL SYMMETRY'
        IF(IOPT.EQ.8.AND.KMAX.EQ.1)WRITE(6,*)' in POLAR coordinates'
        IF(IOPT.EQ.8.AND.KMAX.GT.1)WRITE(6,*)
     #                              ' in CYLINDRICAL coordinates'
      ELSE
        WRITE(6,*)'Initializing for LAPLACE equation'
        IF(IOPT.EQ.4.OR.IOPT.EQ.6)WRITE(6,*)' in DIELECTRICS'
        IF(IOPT.EQ.2.OR.IOPT.EQ.6)WRITE(6,*)' with CYLINDRICAL SYMMETRY'
        IF(IOPT.EQ.7.AND.KMAX.EQ.1)WRITE(6,*)' in POLAR coordinates'
        IF(IOPT.EQ.7.AND.KMAX.GT.1)WRITE(6,*)
     #                              ' in CYLINDRICAL coordinates'
      ENDIF

      IF(PAR1.NE.0.)GO TO 170      !restoring previous run

#ifdef VMS
C Check that user has loaded a BND routine (IADRESS.NE.0)
      IF(IADRESS.EQ.0)THEN
        WRITE(6,*)'No BND routine loaded!  Use LOAD command.'
        WRITE(6,*)'INIT not performed.'
        GO TO 10
      ENDIF
#endif

C Reset the iteration counter
      ITCOUNT=0

      BMAX=0.
      RHOMAX=0.

C============================================================C
C  Initialization loop begins here
C============================================================C
      DO 160 K=1,KMAX
      WRITE(6,140)K
140   FORMAT(' INITIALIZING SLICE K =',I5)
      DO 160 J=1,JMAX
      DO 160 I=1,IMAX
      M=MULT*(I+(J-1)*IMAX+(K-1)*IJMAX)

C Previous value(s) may be usable by BND for special processing:
      IF(LL.NE.0.AND.LL.NE.1)THEN
        PHI=V(M)
        IF(PHI.GE.0)THEN
          PHI=PHI-OFFOLD
        ELSE
          PHI=PHI+OFFOLD
        ENDIF
        IF(MULT.EQ.2)RHO=V(M-1)
      ENDIF

C Call BND(I,J,K,PHI,RHO,LL):
      CALL EXE_CUT(I,J,K,PHI,RHO,LL,%VAL(IADRESS))
      V(M)=PHI
C Find maximum boundary point:
      IF(PHI.LT.BMAX)BMAX=PHI
C Poisson options:
      IF(IOPT.EQ.3.OR.IOPT.EQ.5.OR.IOPT.EQ.8)THEN
        V(M-1)=RHO
        IF(RHO.GT.RHOMAX)RHOMAX=RHO
      ENDIF

C============================================================C
C  Dielectric boundary preprocessing
C============================================================C
      IF(IOPT.NE.4.AND.IOPT.NE.6)GO TO 160

C Negative permittivity is illegal:
      IF(RHO.LT.0.)THEN
        WRITE(6,*)'Negative permittivity at I,J,K',I,J,K
        WRITE(6,*)'INIT terminated'
        GO TO 10
      ENDIF

C FOR NOW, NO PREPROCESSING FOR 3D!!!
      IF(KMAX.GT.1)THEN
        V(M-1)=RHO
        GO TO 160
      ENDIF

C If not a dielectric boundary point, set RHO to 0.
C (This includes Dirichlet boundary points)
      IF(RHO.GT.0..OR.PHI.LT.0)THEN
        V(M-1)=0.
        GO TO 160
      ENDIF

C============================================================C
C  For dielectric boundary points, set RHO to ratio of 
C  permittivities.  Corner points are not distinguished
C  except in the 2D cartesian case, where they are indicated
C  by making RHO negative.
C============================================================C

C Boundary points are illegal at corners of problem space:
      IF((I.EQ.1.OR.I.EQ.IMAX).AND.(J.EQ.1.OR.J.EQ.JMAX))THEN
        IF(KMAX.EQ.1)GO TO 161
        IF(K.EQ.1.OR.K.EQ.KMAX)GO TO 161
      ENDIF

C Get neighbour points:
      IF(I.EQ.1)RHO1=0.
      IF(I.EQ.IMAX)RHO2=0.
      IF(J.EQ.1)RHO3=0.
      IF(J.EQ.JMAX)RHO4=0.
      IF(I.NE.1)CALL EXE_CUT(I-1,J,K,PHI,RHO1,LL,%VAL(IADRESS))
      IF(I.NE.IMAX)CALL EXE_CUT(I+1,J,K,PHI,RHO2,LL,%VAL(IADRESS))
      IF(J.NE.1)CALL EXE_CUT(I,J-1,K,PHI,RHO3,LL,%VAL(IADRESS))
      IF(J.NE.JMAX)CALL EXE_CUT(I,J+1,K,PHI,RHO4,LL,%VAL(IADRESS))

      IF(KMAX.GT.1)GO TO 150

C 2-D CASES (CARTESIAN & CYLINDRICAL) FOLLOW...

C Horizontal boundary:
      IF(RHO1.EQ.0..AND.RHO2.EQ.0.)THEN
        IF(RHO3.EQ.0..OR.RHO4.EQ.0.)GO TO 161
        V(M-1)=RHO3/RHO4
        IF(IOPT.EQ.6)V(M-1)=RHO4/RHO3
C Vertical boundary:
      ELSE IF(RHO3.EQ.0..AND.RHO4.EQ.0.)THEN
        IF(RHO1.EQ.0..OR.RHO2.EQ.0.)GO TO 161
        V(M-1)=RHO1/RHO2
        IF(IOPT.EQ.6)V(M-1)=RHO2/RHO1
C Cylindrical symmetry: ignore corner points
      ELSE IF(IOPT.EQ.6)THEN
        V(M-1)=0.      
C LL Corner
      ELSE IF(RHO2.EQ.0..AND.RHO4.EQ.0.)THEN
        CALL EXE_CUT(I+1,J+1,K,PHI,RHOI,LL,%VAL(IADRESS))
        IF(RHOI.EQ.0.)GO TO 161
        V(M-1)=-RHOI/RHO1
C LR Corner
      ELSE IF(RHO1.EQ.0..AND.RHO4.EQ.0.)THEN
        CALL EXE_CUT(I-1,J+1,K,PHI,RHOI,LL,%VAL(IADRESS))
        IF(RHOI.EQ.0.)GO TO 161
        V(M-1)=-RHOI/RHO2
C UL Corner
      ELSE IF(RHO2.EQ.0..AND.RHO3.EQ.0.)THEN
        CALL EXE_CUT(I+1,J-1,K,PHI,RHOI,LL,%VAL(IADRESS))
        IF(RHOI.EQ.0.)GO TO 161
        V(M-1)=-RHOI/RHO1
C UR Corner
      ELSE IF(RHO1.EQ.0..AND.RHO3.EQ.0.)THEN
        CALL EXE_CUT(I-1,J-1,K,PHI,RHOI,LL,%VAL(IADRESS))
        IF(RHOI.EQ.0.)GO TO 161
        V(M-1)=-RHOI/RHO2
C Anything else is illegal
      ELSE
        GO TO 161
      ENDIF

C END OF 2-D CASES
      GO TO 160

C 3-D CARTESIAN CASES FOLLOW
C FOR NOW, PREPROCESSING IS DISABLED!!!

 150  IF(K.EQ.1)RHO5=0.
      IF(K.EQ.KMAX)RHO6=0.
      IF(K.NE.1)CALL EXE_CUT(I,J,K-1,PHI,RHO5,LL,%VAL(IADRESS))
      IF(K.NE.KMAX)CALL EXE_CUT(I,J,K+1,PHI,RHO6,LL,%VAL(IADRESS))

      IF(RHO1.GT.0..AND.RHO2.GT.0.)THEN
C        V(M-1)=RHO1/RHO2
      ELSE IF(RHO3.GT.0..AND.RHO4.GT.0.)THEN
C        V(M-1)=RHO3/RHO4
      ELSE IF(RHO5.GT.0..AND.RHO6.GT.0.)THEN
C        V(M-1)=RHO5/RHO6
      ELSE
C        GO TO 161
      ENDIF

C This is too restrictive....
C      IF(RHO1.EQ.0..AND.RHO2.EQ.0.)THEN
C        IF(RHO3.EQ.0..AND.RHO4.EQ.0.)THEN
C          IF(RHO5.EQ.0..OR.RHO6.EQ.0.)GO TO 161
CC IJ-plane boundary
C          V(M-1)=RHO5/RHO6
C        ELSE IF(RHO5.EQ.0..AND.RHO6.EQ.0.)THEN
C          IF(RHO3.EQ.0..OR.RHO4.EQ.0.)GO TO 161
CC IK-plane boundary
C          V(M-1)=RHO3/RHO4
C        ENDIF
C      ELSE IF(RHO3.EQ.0..AND.RHO4.EQ.0.)THEN
C        IF(RHO5.EQ.0..AND.RHO6.EQ.0.)THEN
C          IF(RHO1.EQ.0..OR.RHO2.EQ.0.)GO TO 161
CC JK-plane boundary
C          V(M-1)=RHO1/RHO2
C        ENDIF
C      ELSE
C        GO TO 161
C      ENDIF

C END OF 3-D CASES

C==================================================C
C  End of dielectric preprocessing.
C==================================================C

160   CONTINUE

C============================================================C
C  End of initialization loop.
C============================================================C
      GO TO 165

C Error in dielectric boundary
161   WRITE(6,*)'Illegal dielectric boundary at I,J,K',I,J,K
      WRITE(6,*)'Permittivities at adjacent points are:'
      WRITE(6,*)RHO1,RHO2,RHO3,RHO4
      IF(KMAX.GT.1)WRITE(6,*)RHO5,RHO6
      WRITE(6,*)'INIT terminated.'
      GO TO 10

165   BMAX=ABS(BMAX)
      WRITE(6,*)'Maximum boundary value is ',BMAX
C Finished initialization unless offset needed:
      IFLAG=1
      IF(IOPT.NE.3.AND.IOPT.NE.5.AND.IOPT.NE.8)GO TO 10
      IF(RHOMAX.EQ.0.)GO TO 10

C Poisson eqn: add an offset to potential values
      OFF0=20.*RHOMAX*COMFI      !initial guess
      OFF=OFF0
      WRITE(6,*)'Offset added to array values: ',OFF

      DO M=2,2*IJKMAX,2
        PHI=V(M)
        IF(PHI.GE.0.)THEN
          PHI=PHI+OFF
        ELSE
          PHI=PHI-OFF
        ENDIF
        V(M)=PHI
      ENDDO
      GO TO 10

C======================================================================C
C Initialization using results from previous run
C======================================================================C
170   NUNIT=PAR1
      IF(NUNIT.EQ.5.OR.NUNIT.EQ.6.OR.NUNIT.EQ.7)THEN
        WRITE(6,*)'Units 5, 6 and 7 are reserved.'
        WRITE(6,*)'Please specify another unit number.'
        GO TO 10
      ENDIF
      OPEN(UNIT=NUNIT,STATUS='OLD',FORM='UNFORMATTED',IOSTAT=IERR)
      IF(IERR.NE.0)THEN
        WRITE(6,*)'Error opening unit',NUNIT
        CALL FORMSG
        GO TO 10
      ENDIF

      READ(NUNIT,ERR=210)IIN,JIN,KIN,MULT,OFF,OFF0,IOPTIN,BMAX
      IF(IOPTIN.NE.IOPT)THEN
        WRITE(6,175)IOPTIN,IOPT
175     FORMAT(/' ***ERROR ... DATA OPTION ',I2,
     #         ' IS NOT COMPATIBLE WITH CURRENT OPTION ',I2,'.')
        CLOSE(UNIT=NUNIT)
        GO TO 10
      ENDIF
      WRITE(6,180)NUNIT,IIN,JIN,KIN
180   FORMAT(' MAXIMUM VALUES OF (X,Y,Z) AS READ FROM'/
     +' LOGICAL UNIT ',I2,' ARE :',3I4)
      IF(IIN.NE.IMAX) GO TO 190
      IF(JIN.NE.JMAX) GO TO 190
      IF(KIN.NE.KMAX) GO TO 190
      WRITE(6,*)'Array offset: ',OFF

C Reset the iteration counter
      ITCOUNT=0

      READ(NUNIT,ERR=210) (V(N),N=1,IJKMAX*MULT)
      CLOSE(UNIT=NUNIT)
      IFLAG=1
      GO TO 10

190   WRITE(6,200) IMAX,JMAX,KMAX
200   FORMAT(' BUT GIVEN IMAX JMAX KMAX ARE=',3I5,
     #   ' COMMAND SUPPRESSED ')
      CLOSE(UNIT=NUNIT)
      GO TO 10
210   WRITE(6,220)NUNIT
220   FORMAT(' READ ERROR FROM UNIT=',I5,' COMMAND IGNORED')
      CLOSE(UNIT=NUNIT)
      GO TO 10

C======================================================================
C  REDUCE command:    Take every 2nd grid point in each dimension
C======================================================================
230   IF(IOPT.EQ.4.OR.IOPT.EQ.6)THEN
        WRITE(6,*)'REDUCE not allowed for DIELECTRIC options.'
        GO TO 10
      ELSE IF(IOPT.EQ.7.OR.IOPT.EQ.8)THEN
        WRITE(6,*)'REDUCE not allowed in POLAR coordinates.'
        GO TO 10
      ELSE IF(IADRESS.EQ.0)THEN
        WRITE(6,*)'Cannot perform REDUCE.'
        WRITE(6,*)'No BND routine is loaded.  Use LOAD command.'
        GO TO 10
      ELSE IF(IFLAG.EQ.0)THEN
        WRITE(6,*)'Array is not initialized!  Use INIT command.'
        GO TO 10
      ELSE IF(IOPT.EQ.3.OR.IOPT.EQ.5)THEN
        WRITE(6,*)'WARNING ... density function RHO may be masked.'
      ENDIF

      INC=INC*2
      IERR=0
      IF(ICHK(I1,INC).NE.I1)  IERR=1
      IF(ICHK(I2,INC).NE.I2)  IERR=2
      IF(ICHK(J1,INC).NE.J1)  IERR=3
      IF(ICHK(J2,INC).NE.J2)  IERR=4
      IF(ICHK(K1,INC).NE.K1)  IERR=5
      IF(ICHK(K2,INC).NE.K2)  IERR=6
      IF(IERR .NE. 0)THEN
        WRITE(6,250)IERR
250     FORMAT(' CANNOT REDUCE: ERROR=',I4)
        INC=INC/2
        GO TO 10
      ENDIF
      CALL REDUCE(V,IJKMAX,INC,IMAX,JMAX,KMAX,I1,I2,J1,J2,K1,K2)
      WRITE(6,*)'Array grid is now reduced by factor',INC 
      GO TO 10

C======================================================================
C  LIMIT command
C  Sets limits on volume of sweep (iteration)
C======================================================================
270   ISAVE1=I1
      ISAVE2=I2
      ISAVE3=J1
      ISAVE4=J2
      ISAVE5=K1
      ISAVE6=K2
      I1=PAR1
      I2=PAR2
      J1=PAR3
      J2=PAR4
      K1=PAR5
      K2=PAR6

C Set to max range if 0
      IF(I1.EQ.0)I1=1
      IF(I2.EQ.0)I2=IMAX
      IF(J1.EQ.0)J1=1
      IF(J2.EQ.0)J2=JMAX
      IF(K1.EQ.0)K1=1
      IF(K2.EQ.0)K2=KMAX

C Check for validity of limits on I J & K
      NERR=0
      IF(I1.LE.I2) GO TO 290
      WRITE(6,280)I1,I2
280   FORMAT(' ERROR: Lower limit I=',I5,' exceeds upper limit ',I5)
      NERR=NERR+1
290   IF(J1.LE.J2) GO TO 310
      WRITE(6,300)J1,J2
300   FORMAT(' ERROR: Lower limit J=',I5,' exceeds upper limit ',I5)
      NERR=NERR+1
310   IF(K1.LE.K2) GO TO 330
      WRITE(6,320)K1,K2
320   FORMAT(' ERROR: Lower limit K=',I5,' exceeds upper limit ',I5)
      NERR=NERR+1
330   IF(ICHK(I1,INC).EQ.I1) GO TO 350
      WRITE(6,340)I1,INC
340   FORMAT(' ERROR: lower I limit ',I5,' not compatible with INC',I5)
      NERR=NERR+1
350   IF(ICHK(I2,INC).EQ.I2) GO TO 370
      WRITE(6,360)I2,INC
360   FORMAT(' ERROR: upper I limit ',I5,' not compatible with INC',I5)
      NERR=NERR+1
370   IF(ICHK(J1,INC).EQ.J1) GO TO 390
      WRITE(6,380)J1,INC
380   FORMAT(' ERROR: lower J limit ',I5,' not compatible with INC',I5)
      NERR=NERR+1
390   IF(ICHK(J2,INC).EQ.J2) GO TO 410
      WRITE(6,400)J2,INC
400   FORMAT(' ERROR: upper J limit ',I5,' not compatible with INC',I5)
      NERR=NERR+1
410   IF(ICHK(K1,INC).EQ.K1) GO TO 430
      WRITE(6,420)K1,INC
420   FORMAT(' ERROR: lower K limit ',I5,' not compatible with INC',I5)
      NERR=NERR+1
430   IF(ICHK(K2,INC).EQ.K2) GO TO 450
      WRITE(6,440)K2,INC
440   FORMAT(' ERROR: upper K limit ',I5,' not compatible with INC',I5)
      NERR=NERR+1

450   IF(NERR.EQ.0)THEN
        WRITE(6,*)'Current iteration limits are:'
        WRITE(6,*)'I1,I2',I1,I2
        WRITE(6,*)'J1,J2',J1,J2
        WRITE(6,*)'K1,K2',K1,K2
        IF(I1.EQ.1.AND.I2.EQ.IMAX.AND.J1.EQ.1.AND.J2.EQ.JMAX.AND.
     #     K1.EQ.1.AND.K2.EQ.KMAX)
     #     WRITE(6,*)'Iteration limits are set to maximum.'
        GO TO 10
      ENDIF

      WRITE(6,460)NERR
460   FORMAT(' LIMIT command had ',I5,' errors ---COMMAND SUPPRESSED ')

C On error(s) we restore old limits:
      I1=ISAVE1
      I2=ISAVE2
      J1=ISAVE3
      J2=ISAVE4
      K1=ISAVE5
      K2=ISAVE6
      GO TO 10

C======================================================================
C  ITERATE command 
C  Performs the iteration
C======================================================================
480   IF(IFLAG.EQ.0)THEN
        WRITE(6,*)'Array is not initialized!  Use INIT command.'
        GO TO 10
      ENDIF
      NITER=PAR2
      RELFAC=PAR1
C Default parameters:
      IF(RELFAC.EQ.0.)THEN
        RELFAC=-1.9
        NITER=100
      ENDIF
C Max relaxation factor is 2:
      IF(ABS(RELFAC).GT.2.)RELFAC=2.*SIGN(1.,RELFAC)
C Max iterations is 1000
C     IF(NITER.GT.1000)THEN
C       WRITE(6,*)'Number of iterations reduced to 1000!'
C       NITER=1000
C     ENDIF
      IF(IOPT.NE.11.AND.IOPT.NE.12)THEN
        CALL ITERAT(V,NITER,IMAX,JMAX,KMAX,IJMAX,I1,I2,J1,J2,K1,K2,
     #    INC,RELFAC,IMAXP1,JMAXP1,KMAXP1,IJKMAX,QUIT)
      ELSE
        CALL ITERAT3(V,NITER,IMAX,JMAX,KMAX,IJMAX,I1,I2,J1,J2,K1,K2,
     #    INC,RELFAC,IMAXP1,JMAXP1,KMAXP1,IJKMAX,QUIT)
      ENDIF
      IF(QUIT)GO TO 620
      GO TO 10

C======================================================================
C  EXPAND command
C  Expands # grid points up factor 2 each dimension.
C======================================================================
520   IF(INC.GT.1)THEN
        CALL EXPAND(V,IJKMAX,IMAX,JMAX,KMAX,INC,I1,I2,J1,J2,K1,K2)
        IF(INC.EQ.1)THEN
          WRITE(6,*)'Array grid is now restored to original size.'
        ELSE
          WRITE(6,*)'Array grid is now reduced by factor',INC 
        ENDIF
      ELSE
        WRITE(6,*)'Cannot expand grid beyond original size!'
      ENDIF
      GO TO 10

C======================================================================
C  OUTPUT command
C  Saves the main grid for later use.
C======================================================================
550   IUNIT=PAR1
      IF(IUNIT.EQ.5.OR.IUNIT.EQ.6.OR.IUNIT.EQ.7)THEN
        WRITE(6,*)'Units 5,6,7 are reserved.'
        WRITE(6,*)'Please specify another unit number.'
        GO TO 10
      ENDIF
      OPEN(UNIT=IUNIT,STATUS='NEW',FORM='UNFORMATTED',IOSTAT=IERR)
#ifdef unix
#ifdef MIPSEL
      IF(IERR.EQ.10)THEN
#endif
#ifdef __alpha
      IF(IERR.EQ.10)THEN
#endif
#ifdef sgi
      IF(IERR.EQ.126)THEN
#endif
#ifdef __hpux
      IF(IERR.EQ.918)THEN
#endif
#ifdef g77
      IF(IERR.NE.0)THEN
        WRITE(6,*)'g77 IERR=',IERR
#endif
#ifdef sun
      IF(IERR.NE.0)THEN
        WRITE(6,*)'Sun IERR=',IERR
#endif
        CALL GETANS('Overwrite existing file?  y/N',ANS)
        IF(ANS.NE.ICHAR('Y'))GO TO 10
        OPEN(UNIT=IUNIT,STATUS='UNKNOWN',FORM='UNFORMATTED',IOSTAT=IERR)
      ENDIF
#endif
      IF(IERR.NE.0)THEN
        WRITE(6,*)'Error opening unit',IUNIT
        CALL FORMSG
        GO TO 10
      ENDIF

      WRITE(IUNIT,ERR=570)IMAX,JMAX,KMAX,MULT,OFF,OFF0,IOPT,BMAX
      WRITE(IUNIT,ERR=570) (V(N),N=1,IJKMAX*MULT)
      CLOSE(UNIT=IUNIT)
      WRITE(6,*)'Problem saved on unit',IUNIT
      GO TO 10
570   WRITE(6,*)'Error writing on unit',IUNIT
      CALL FORMSG
      CLOSE(UNIT=IUNIT)
      GO TO 10

C======================================================================
C  PLOT command
C  Makes contour plots of slices of main array
C======================================================================
C PAR1  Controls contour labels spacing (# cells between labels)
C PAR2  # Plot cells/relaxation cell (>=1) (NO SCREEN COPY IF <0)
C PAR3  X origin relaxation cell # (Allows zooming)
C PAR4  Y origin relaxation cell # (Allows zooming)
C PAR5  Optional (FLUX lines if 1. , FIELD if 2.)-not reliable.
C PAR6  Optional (Debug output from FLUX if = 1.0 )
C======================================================================
C Find  plot array dimension IDIMP
590   IJ=IMAX*JMAX
      JK=JMAX*KMAX
      KI=KMAX*IMAX
      IDIMP=IJ
      IF(JK.GT.IDIMP) IDIMP=JK
      IF(KI.GT.IDIMP) IDIMP=KI

      IF(PAR2.LT.0.)THEN      ! suppress screen output
        IMONITOR_SAVE=IMONITOR
        IMONITOR=0
      ENDIF

      SPACEL=PAR1
      IF(SPACEL.EQ.0.)SPACEL=1000.
C NCELLS is the # plot cells/ relaxed grid point
      NCELLS=ABS(PAR2)
      IF(NCELLS.EQ.0)NCELLS=20
      IX0=PAR3
      IY0=PAR4
      IF(IX0.LE.0)IX0=1
      IF(IY0.LE.0)IY0=1
      IFLUX=PAR5
      IDEBUG=PAR6

      CALL PLOT1(V,IMAX,JMAX,KMAX,IDIMP,IJKMAX,NCELLS,
     #  IX0,IY0,SPACEL,IFLUX,IDEBUG)

      IF(PAR2.LT.0.)IMONITOR=IMONITOR_SAVE
      GO TO 10

C======================================================================C
C TIME LIMIT EXCEEDED:
C    Save the main array and quit.
C======================================================================C
620   WRITE(6,*)
      WRITE(6,*)'* TIME LIMIT EXCEEDED *'
      WRITE(6,*)'* SAVING GRID ON UNIT 1 *'

      OPEN(UNIT=1,STATUS='NEW',FORM='UNFORMATTED',IOSTAT=IERR)
      IF(IERR.NE.0)THEN
        WRITE(6,*)'Error opening save file on unit 1'
        CALL FORMSG
        STOP 'Exit from RELAX3D'
      ENDIF

      WRITE(1,ERR=699)IMAX,JMAX,KMAX,MULT,OFF,OFF0,IOPT,BMAX
      WRITE(1,ERR=699) (V(N),N=1,IJKMAX*MULT)
      CLOSE(UNIT=1)
      WRITE(6,*)'Problem saved on unit 1'
      WRITE(6,*)'Use command INIT 1 to restart'
      STOP 'Exit from RELAX3D'

699   WRITE(6,*)'Error writing save file'
      CLOSE(UNIT=1)
      CALL FORMSG
      STOP 'Exit from RELAX3D'

C======================================================================C
C  COMPARE command
C   Compares RELAX3D solution to exact solution (useful for
C   test cases). Uses calls to BND where in COMMON/SOLN/ we
C   set LL=1 so BND returns exact solution not just
C   the initialization of problem.
C======================================================================C
720   IF(IADRESS.EQ.0)THEN
        WRITE(6,*)'No BND routine is loaded!  Use LOAD command.'
        GO TO 10
      ENDIF
      ERMAX=0.
      ERRSUM=0.
      PHISUM=0.
      LL=1
      KOUNT=0

      DO 740 K=K1,K2
      DO 740 J=J1,J2
      DO 740 I=I1,I2
C Call BND(I,J,K,PHI,RHO,LL)
      CALL EXE_CUT(I,J,K,PHI,RHO,LL,%VAL(IADRESS))
      M=MULT*(I+(J-1)*IMAX+(K-1)*IJMAX)
      VCALC=V(M)
      VCALC=ABS(VCALC)-OFF
      DIFF=ABS(VCALC-PHI)
      IF(DIFF .LT. ERMAX)GO TO 730
      IM=I
      JM=J
      KM=K
      V1=PHI
      V2=VCALC
      ERMAX=DIFF
730   ERRSUM=ERRSUM+DIFF**2
      PHISUM=PHISUM+ABS(PHI)
      KOUNT=KOUNT+1
740   CONTINUE

      RMS=SQRT(ERRSUM/KOUNT)
      PHIAV=PHISUM/KOUNT
      FRMS=RMS/PHIAV
      WRITE(6,750)RMS,FRMS,ERMAX,IM,JM,KM,V1,V2
750   FORMAT('  RMS ERR=',E12.4/'  FRACTIONAL RMS ERR=',E12.4/
     # '  MAXIMUM ERR=',E12.4,
     # '  AT LOCATION I J K',3I9/'     PHI(EXACT)=',E20.10,
     # '   PHI(OBTAINED)=',E20.10)
      GO TO 10

C======================================================================C
C  OPTION command -- select problem type
C
C       0 -- display current problem type
C       1 -- LAPLACE equation
C       2 -- LAPLACE equation with CYLINDRICAL SYMMETRY
C       3 -- POISSON equation
C       4 -- LAPLACE equation with DIELECTRIC media
C       5 -- POISSON equation with CYLINDRICAL SYMMETRY
C       6 -- LAPLACE equation in DIELECTRIC media with CYLINDRICAL
C            symmetry.
C       7 -- LAPLACE equation in POLAR and CYLINDRICAL coordinates
C       8 -- POISSON equation in POLAR and CYLINDRICAL coordinates
C======================================================================C
755   IOPNEW=PAR1
C Experimental thermal conductivity coefficient
      ALPHA=PAR2
C Query only:
      IF(IOPNEW.EQ.0)THEN
        WRITE(6,7552)
7552    FORMAT(/' Valid problem types are:'
     #/' 1 -- LAPLACE'/' 2 -- LAPLACE with CYLINDRICAL SYMMETRY'
     #/' 3 -- POISSON'/' 4 -- LAPLACE in DIELECTRICS'
     #/' 5 -- POISSON with CYLINDRICAL_SYMMETRY'
     #/' 6 -- LAPLACE in DIELECTRICS with CYLINDRICAL SYMMETRY'
     #/' 7 -- LAPLACE in POLAR or CYLINDRICAL coordinates'
     #/' 8 -- POISSON in POLAR or CYLINDRICAL coordinates'/)
        IF(IOPT.EQ.-1)THEN
          WRITE(6,*)'No problem type has been selected yet.'
          GO TO 10
        ENDIF
        WRITE(6,*)' Current problem type is:'
        GO TO 75567
      ENDIF

      IF(IOPNEW.LT.0.OR.(IOPNEW.GT.8.AND.IOPNEW.NE.11.AND.
     #   IOPNEW.NE.12))THEN
        WRITE(6,*)'***Invalid problem type number'
        GO TO 10
      ENDIF
      IF((IOPNEW.EQ.2.OR.IOPNEW.EQ.5.OR.IOPNEW.EQ.6).AND.KMAX.GT.1)THEN
        WRITE(6,*)
     #    '***Cylindrical symmetry implies a 2-d problem! (set KMAX=1)'
        GO TO 10
C      ELSE IF(IOPNEW.EQ.4.AND.KMAX.GT.1)THEN
C        WRITE(6,*)
C     #    '***Dielectric option valid only for 2-d problem (KMAX=1)'
C        GO TO 10
      ELSE IF(IOPNEW.EQ.7.OR.IOPNEW.EQ.8)THEN
        NSYMM=PAR2      !reflective symmetry flag
        IF(NSYMM.LT.0)THEN
          WRITE(6,*)'Invalid NSYMM: must be positive'
          GO TO 10
        ENDIF
      ENDIF

C We have a legal problem type
      IOPT=IOPNEW
      MULT=1
C Turn on the interleaving if required:
      IF(IOPT.EQ.3.OR.IOPT.EQ.4.OR.IOPT.EQ.5.OR.IOPT.EQ.6.OR.IOPT.EQ.8)
     #  MULT=2
C Set polar flag for contour plots
      POLAR=(IOPT.EQ.7.OR.IOPT.EQ.8)
C Turn off alternating sweep for polar coordinates
      IF(POLAR)ALTERNATE=.FALSE.

C Check problem size against main array size
75567 IJKLIM=IJKDIM
      IF(IOPT.EQ.3.OR.IOPT.EQ.4.OR.IOPT.EQ.5.OR.IOPT.EQ.6.OR.IOPT.EQ.8)
     #  IJKLIM=IJKDIM/2
      IF(IJKMAX.GT.IJKLIM)THEN
        WRITE(6,*)' IMAX*JMAX*KMAX > ',IJKLIM
        RETURN
      ENDIF

C Display the problem type:
      IF(IOPT.EQ.1)THEN
        WRITE(6,*)'LAPLACE equation'
      ELSE IF(IOPT.EQ.2)THEN
        WRITE(6,*)'LAPLACE equation with CYLINDRICAL symmetry'
      ELSE IF(IOPT.EQ.3)THEN
        WRITE(6,*)'POISSON equation'
      ELSE IF(IOPT.EQ.4)THEN
        WRITE(6,*)'LAPLACE equation in DIELECTRICS'
      ELSE IF(IOPT.EQ.5)THEN
        WRITE(6,*)'POISSON equation with CYLINDRICAL SYMMETRY'
      ELSE IF(IOPT.EQ.6)THEN
        WRITE(6,*)'LAPLACE equation in DIELECTRICS',
     #    ' with CYLINDRICAL SYMMETRY'
      ELSE IF(IOPT.EQ.7)THEN
        IF(KMAX.EQ.1)THEN
          WRITE(6,*)'LAPLACE equation in POLAR coordinates'
        ELSE
          WRITE(6,*)'LAPLACE equation in CYLINDRICAL coordinates'
        ENDIF
      ELSE IF(IOPT.EQ.8)THEN
        IF(KMAX.EQ.1)THEN
          WRITE(6,*)'POISSON equation in POLAR coordinates'
        ELSE
          WRITE(6,*)'POISSON equation in CYLINDRICAL coordinates'
        ENDIF
      ELSE IF(IOPT.EQ.11)THEN
        WRITE(6,*)'LAPLACE equation: experimental 3-d array indexing'
      ELSE IF(IOPT.EQ.12)THEN
        WRITE(6,*)'LAPLACE equation: experimental 27-pt molecule'
      ENDIF

C============================================================C
C  Get grid spacings
C============================================================C
C If this is a query only (OPT 0), jump to parameter display
      IF(IOPNEW.EQ.0)GO TO 765
C Uniform grid for dielectric media:
      IF(IOPT.EQ.4.OR.IOPT.EQ.6)THEN
        WRITE(6,*)'This option uses HX=HY=HZ grid spacing'
        GO TO 10
C Polar coordinates:
      ELSE IF(IOPT.EQ.7.OR.IOPT.EQ.8)THEN
        WRITE(6,*)
C Theta grid is automatic for rotational symmetry cases:
        IF(NSYMM.GT.0)THEN
          HYDEG=360./NSYMM/(JMAX-1)
          HY=0.01745329*HYDEG      !radians
          WRITE(6,*)NSYMM,'-fold rotational symmetry option.'
          WRITE(6,*)
6000      FORMAT(1X,A,$)
          IF(KMAX.EQ.1)THEN
6010        WRITE(6,6000)'Enter grid spacing HR: '
            READ(5,*,ERR=6010)HX
          ELSE
6020        WRITE(6,6000)'Enter grid spacings HR and HZ: '
            READ(5,*,ERR=6020)HX,HZ
          ENDIF
          IFLAG=0
        ELSE IF(KMAX.EQ.1)THEN
6030      WRITE(6,6000)'Enter grid spacings HR and HTHETA(degrees): '
          READ(5,*,ERR=6030)HX,HYDEG
        ELSE
6040      WRITE(6,6000)      
     #      'Enter grid spacings HR, HTHETA(degrees), and HZ: '
          READ(5,*,ERR=6040)HX,HYDEG,HZ
        ENDIF
        HY=0.01745329*HYDEG      !radians
        WRITE(6,*)'  Grid size HTHETA in degrees and radians is',
     #      HYDEG,HY
        THMAX=HYDEG*(JMAX-1)
        WRITE(6,*)'  Maximum theta is',THMAX,HY*(JMAX-1)
C Check for wrap-around:
        IF(NSYMM.EQ.0.AND.ABS(THMAX-360.).LT.0.1)THEN
          NSYMM=1
          WRITE(6,*)'Grid wrap-around will be performed.'
        ENDIF
C Find J addresses needed at polar origin points:
        J90=1+NINT(90./HYDEG)
        J180=1+NINT(180./HYDEG)
        J270=1+NINT(270./HYDEG)
C Apply symmetry if addresses not available
        IF(J90.GT.JMAX)J90=1
        IF(J180.GT.JMAX)J180=1
        IF(J270.GT.JMAX)J270=J90
C Rotational symmetry cases:
        IF(NSYMM.GT.1)THEN
          PHIN=360./NSYMM
          F90=MOD(90.,PHIN)/PHIN
          F180=MOD(180.,PHIN)/PHIN
          F270=MOD(270.,PHIN)/PHIN
          J90=1+NINT(F90*(JMAX-1))
          J180=1+NINT(F180*(JMAX-1))
          J270=1+NINT(F270*(JMAX-1))
        ENDIF
        WRITE(6,*)'ADDRESSES FOR 90,180,270 ARE:',J90,J180,J270
        WRITE(6,*)(J90-1)*HYDEG,(J180-1)*HYDEG,(J270-1)*HYDEG
C IJ portion of scalar array addresses
        IJ0=2
        IJ90=2+(J90-1)*IMAX
        IJ180=2+(J180-1)*IMAX
        IJ270=2+(J270-1)*IMAX
        IFLAG=0
        GO TO 10
      ENDIF

C 2D case
      IF(KMAX.GT.1)GO TO 75595
75591 WRITE(6,75592)
75592 FORMAT(/' Enter GRID spacings HX,HY: ',$)
      READ(5,*,ERR=75591)HX,HY
      GO TO 7610

C 3D case
75595 WRITE(6,75596)
75596 FORMAT(/' Enter GRID spacings HX,HY,HZ: ',$)
      READ(5,*,ERR=75595)HX,HY,HZ
      GO TO 763

C Calculate constants for 2D case
7610  COMF=2./HX/HX + 2./HY/HY
      COMFI=1./COMF
      WX=1./(HX*HX)/COMF
      WY=1./(HY*HY)/COMF
      WZ=0.
      HZ=0.
      IF(IOPT.NE.2.AND.IOPT.NE.5)GO TO 765
C Cylindrical symmetry terms:
      WYROT=WY/2.
C On-axis terms:
      COMFAX=2./(HX*HX) + 4./(HY*HY)
      WXAX=1./(HX*HX)/COMFAX
      WYAX=4./(HY*HY)/COMFAX
      GO TO 765

C Calculate constants for 3d case:
763   COMF=(2./HX/HX+2./HY/HY+2./HZ/HZ)
      COMFI=1./COMF
      WX=1./(HX**2)/COMF
      WY=1./(HY**2)/COMF
      WZ=1./(HZ**2)/COMF

C Display the constants for the grid:
765   WRITE(6,770)HX,HY,HZ,WX,WY,WZ
770   FORMAT(' HX HY HZ =',3E20.10,/,' WX WY WZ =',3E20.10)
      IF(IOPT.EQ.2.OR.IOPT.EQ.5)WRITE(6,780)WYROT,WXAX,WYAX
780   FORMAT(' Cylindrical symmetry terms:  WYROT = ',E20.10/
     # '   WXAX WYAX = ',2E20.10)
C We must now initialize if not a query:
      IF(PAR1.NE.0.)IFLAG=0
      GO TO 10

C=======================================================================
C  TYPE  Command -- for screen dump of array
C  WRITE Command -- formatted output to file
C=======================================================================
800   IF(KMAX.EQ.1.AND.NFIELD.LT.3)THEN
        WRITE(6,*)'Usage:  ',COMANDC,' i j     (0=all)'
        GO TO 10
      ELSE IF(KMAX.GT.1.AND.NFIELD.LT.4)THEN
        WRITE(6,*)'Usage:  ',COMANDC,' i j k   (0=all)'
        GO TO 10
      ENDIF
      IECHO=1
      IF(COMANDC.EQ.'TYPE')GO TO 804
80033 WRITE(6,80035)
80035 FORMAT(' Enter filename: ',$)
      READ(5,80036,ERR=10)FNAME
80036 FORMAT(A)
      OPEN(UNIT=1,FILE=FNAME,STATUS='NEW',IOSTAT=IERR)
      IF(IERR.NE.0)THEN
        WRITE(6,*)'Error opening ',FNAME(1:LENSIG(FNAME))
        CALL FORMSG
        GO TO 80033
      ENDIF
      WRITE(6,80037)
80037 FORMAT(' Screen echo? (y/N) > ',$)
      READ(5,80038,IOSTAT=IERR)ANS
80038 FORMAT(A1)
      IF(ANS.NE.ICHAR('Y').AND.ANS.NE.ICHAR('y'))IECHO=0

804   IF(IECHO.EQ.1)WRITE(6,805)
805   FORMAT(/' ',T6,'I',T12,'J',T18,'K'/)
      LI1=I1
      LI2=I2
      LJ1=J1
      LJ2=J2
      LK1=K1
      LK2=K2
      IR=PAR1
      JR=PAR2
      KR=PAR3
      IF(IR.NE.0)THEN
        LI1=IR
        LI2=IR
      ENDIF
      IF(JR.NE.0)THEN
        LJ1=JR
        LJ2=JR
      ENDIF
      IF(KR.NE.0)THEN
        LK1=KR
        LK2=KR
      ENDIF

      CALL CTRLC_TRAP(IDUM)

      DO 830 IR=LI1,LI2
      DO 830 JR=LJ1,LJ2
      DO 830 KR=LK1,LK2

      IF(CTRLC_FLAG)GO TO 831

      M=MULT*(IR+(JR-1)*IMAX+(KR-1)*IJMAX)
      PHI=V(M)
      BIND='    '
      IF(PHI.LT.0.)BIND='BDRY'      !marker for boundary points
      PHI=ABS(PHI)-OFF
C Non-interleaved case:
      IF(IOPT.EQ.1.OR.IOPT.EQ.2.OR.IOPT.EQ.7.OR.IOPT.EQ.11.OR.
     #   IOPT.EQ.12)THEN
        IF(IECHO.EQ.1)WRITE(6,810)IR,JR,KR,PHI,BIND
        IF(COMANDC.EQ.'WRIT')WRITE(1,810,IOSTAT=IERR)IR,JR,KR,PHI,BIND
810     FORMAT(' ',3I5,5X,1PE14.6,5X,A4)
C Interleaved case:
      ELSE
        RHO=V(M-1)
        IF(IECHO.EQ.1)WRITE(6,811)IR,JR,KR,PHI,BIND,RHO
811     FORMAT(' ',3I5,5X,1PE14.6,5X,A4,5X,1PE14.6)
        IF(COMANDC.EQ.'WRIT')WRITE(1,811,IOSTAT=IERR)IR,JR,KR,
     #    PHI,BIND,RHO
      ENDIF
      IF(COMANDC.EQ.'WRIT'.AND.IERR.NE.0)THEN
        WRITE(6,*)'Error writing to ',FNAME(1:LENSIG(FNAME))
        CALL FORMSG
        CLOSE(UNIT=1)
        GO TO 10
      ENDIF
830   CONTINUE

831   IF(COMANDC.EQ.'WRIT')CLOSE(UNIT=1)
      GO TO 10

C======================================================================C
C  STATUS command:  print out what is going on
C======================================================================C
850   WRITE(6,*)
      WRITE(6,*)'Array size Imax, Jmax, Kmax:',IMAX,JMAX,KMAX
      WRITE(6,*)'Number of array points:',IJKMAX
      WRITE(6,*)'Problem type:'
      IF(IOPT.EQ.1)THEN
        WRITE(6,*)'  LAPLACE equation'
      ELSE IF(IOPT.EQ.2)THEN
        WRITE(6,*)'  LAPLACE equation with CYLINDRICAL symmetry'
      ELSE IF(IOPT.EQ.3)THEN
        WRITE(6,*)'  POISSON equation'
      ELSE IF(IOPT.EQ.4)THEN
        WRITE(6,*)'  LAPLACE equation in DIELECTRIC media'
      ELSE IF(IOPT.EQ.5)THEN
        WRITE(6,*)'  POISSON equation with CYLINDRICAL symmetry'
      ELSE IF(IOPT.EQ.6)THEN
        WRITE(6,*)'  LAPLACE equation in DIELECTRIC media',
     #    ' with CYLINDRICAL symmetry'
      ELSE IF(IOPT.EQ.7)THEN
        IF(KMAX.EQ.1)THEN
          WRITE(6,*)'  LAPLACE equation in POLAR coordinates'
        ELSE
          WRITE(6,*)'  LAPLACE equation in CYLINDRICAL coordinates'
        ENDIF
      ELSE IF(IOPT.EQ.8)THEN
        IF(KMAX.EQ.1)THEN
          WRITE(6,*)'  POISSON equation in POLAR coordinates'
        ELSE
          WRITE(6,*)'  POISSON equation in CYLINDRICAL coordinates'
        ENDIF
      ELSE IF(IOPT.EQ.11)THEN
        WRITE(6,*)'  LAPLACE equation with experimental 3-d indexing'
      ELSE IF(IOPT.EQ.12)THEN
        WRITE(6,*)'  LAPLACE equation, experimental 27-pt molecule'
      ELSE
        WRITE(6,*)'  No problem type has been selected.'
      ENDIF
      IF(IOPT.GT.0)THEN
        IF(KMAX.EQ.1)THEN
          WRITE(6,*)'Grid spacings HX,HY:',HX,HY
        ELSE
          WRITE(6,*)'Grid spacings HX,HY,HZ:',HX,HY,HZ
        ENDIF
      ENDIF
      IF(INC.GT.1)THEN
        WRITE(6,*)'Array grid is reduced by factor',INC 
      ELSE
        WRITE(6,*)'Array grid is not reduced.'
      ENDIF
#ifdef VMS
      IF(.NOT.ALPHAVMS)THEN
        IF(IADRESS.GT.0)THEN
          WRITE(6,*)'BND routine loaded:  ',BNDNAME(1:LENSIG(BNDNAME))
        ELSE
          WRITE(6,*)'BND routine loaded:  ',NONE
        ENDIF
      ENDIF
#endif
      IF(IFLAG.EQ.0)THEN
        WRITE(6,*)'Array has not been initialized.'
      ELSE
        WRITE(6,*)'Maximum boundary value: ',BMAX
        IF(IOPT.EQ.3.OR.IOPT.EQ.5.OR.IOPT.EQ.8)
     #    WRITE(6,*)'Current array offset: ',OFF
      ENDIF
      WRITE(6,*)'Total iterations performed:',ITCOUNT
      IF(I1.GT.1.OR.I2.LT.IMAX.OR.J1.GT.1.OR.J2.LT.JMAX.OR.
     #   K1.GT.1.OR.K2.LT.KMAX)THEN
        WRITE(6,*)'Current iteration limits are'
        WRITE(6,*)'I1,I2',I1,I2
        WRITE(6,*)'J1,J2',J1,J2
        WRITE(6,*)'K1,K2',K1,K2
      ELSE
        WRITE(6,*)'Iteration limits are set to maximum.'
      ENDIF
      IF(ALTERNATE)THEN
        WRITE(6,*)'Alternating sweep is ON.'
      ELSE
        WRITE(6,*)'Alternating sweep is OFF.'
      ENDIF
C     WRITE(6,*)
#ifdef VMS
C     IF(TRAPON)WRITE(6,*)'Trap handler is ON.'
C     IF(.NOT.TRAPON)WRITE(6,*)'Trap handler is OFF.'
#endif
      WRITE(6,*)
      WRITE(6,*)'Terminal type:  ',TERMTYPE
      WRITE(6,*)'Hardcopy type:  ',HARDTYPE
      GO TO 10

C======================================================================C
C  STOP command
C  Exits to operating system
C======================================================================C
900   STOP 'Exit from RELAX3D'

      END !RELAX
