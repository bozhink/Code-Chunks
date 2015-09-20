cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c file util.for
c COMPUTATIONAL PHYSICS (FORTRAN VERSION)
c by Steven E. Koonin and Dawn C. Meredith
c Copyright 1989, Addison-Wesley Publishing Company
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine header(descrp,nhead,ntext,ngraph)
c displays header and description of output to screen
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c Global variables:
      include 'io.all'
c Input variables:
      character*(*) descrp(20)                                           !description of program and output
      integer nhead,ntext,ngraph                                         !number of lines for each description
c Local varibles:
      integer n                                                          !current line number
      integer length                                                     !true length of character strings
      integer nblnks                                                     !num of blanks needed to center string
      character*80 blanks                                                !array of blanks for centering
c Function:
      integer lentru                                                     !true length of character string
      data blanks/' '/
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      call clear                                                         ! vertically center output
      do 190 n=1,(trmlin-18-nhead-ngraph-ntext)/2
         write (ounit,20)
  190 continue
c
c     write out constant part of header
      write (ounit,40)
      write (ounit,50)
      write (ounit,60)
      write (ounit,80)
      write (ounit,20)
      write (ounit,20)
c
c     write out character dependent section of the header
      do 140 n=1,nhead+ntext+ngraph
         if (n.eq.nhead+1) then                                          !text output header
            write (ounit,110)
         endif
         if (n.eq.nhead+ntext+1) then
            write (ounit,115)                                            !graphics output header
         endif
         length=lentru(descrp(n))                                        !horizontally center output
         nblnks=(80-length)/2
         write (ounit,120) blanks(1:nblnks),descrp(n)(1:lenght)
  140 continue
c
      call pause('to begin the program...',1)
      call clear
c
   20 format(' ')
   40 format(/,30x,'COMPUTATIONAL PHYSICS')
   50 format(/,32x,'(FORTRAN VERSION)')
   60 format(/,20x,'by Steven E. Koonin and Dawn C. Meredith')
   80 format(/,14x,
     +  'Copyright 1989, Benjamin/Cummings Publishink Company')
  110 format(/,30x,'Text output displays')
  115 format(/,28x,'Grpahics output displays')
  120 format(a,a)
c
      return
      end
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine menu
c sets up the part of the menu that is the same for all programs
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c Global variables:
      include 'menu.all'
      include 'io.all'
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c     main menu
      mtype(1)=clrtrm
c
      mtype(2)=mtitle
      mprmpt(2)='MAIN MENU'
      mlolim(2)=2
      mhilim(2)=1
c
      mtype(3)=mtitle
      mprmpt(3)='(1) Change physical parameters'
      mlolim(3)=0
      mhilim(3)=0
c
      mtype(4)=mtitle
      mprmpt(4)='(2) Change numerical parameters'
      mlolim(4)=0
      mhilim(4)=0
c
      mtype(5)=mtitle
      mprmpt(5)='(3) Change output parameters'
      mlolim(5)=0
      mhilim(5)=0
c
      mtype(6)=mtitle
      mprmpt(6)='(4) Display physical and numerical parameters'
      mlolim(6)=0.
      mhilim(6)=0.
c
      mtype(7)=mtitle
      mprmpt(7)='(5) Display output parameters'
      mlolim(7)=0.
      mhilim(7)=0.
c
      mtype(8)=mtitle
      mprmpt(8)='(6) Run program'
      mlolim(8)=0
      mhilim(8)=0
c
      mtype(9)=mtitle
      mprmpt(9)='(7) Stop program'
      mlolim(9)=0
      mhilim(9)=1
c
      mtype(10)=mchoic
      mprmpt(10)='Make a menu choise'
      mtag(10)='11 36 61 91 94 99 99'
      mlolim(10)=1
      mhilim(10)=7
      mints(10)=6
      mreals(10)=-6
c
c     physical parameters
      mtype(11)=clrtrm
c
      mtype(12)=title
      mprmpt(12)='PHISICAL PARAMETERS'
      mlolim(12)=2.
      mhilim(12)=1.
c
      mtype(35)=skip
      mreals(35)=1.
c
c     numerical parameters
      mtype(36)=clrtrm
c
      mtype(37)=title
      mprmpt(37)='NUMERICAL PARAMETERS'
      mlolim(37)=2.
      mhilim(37)=1.
c
      mtype(60)=skip
      mreals(60)=1.
c
c     output menu
      mtype(61)=clrtrm
c
      mtype(62)=mtitle
      mprmpt(62)='OUTPUT MENU'
      mlolim(62)=0.
      mhilim(62)=1.
c
      mtype(63)=mtitle
      mprmpt(63)='(1) Change text output parameters'
      mlolim(63)=0.
      mhilim(63)=0.
c
      mtype(64)=mtitle
      mprmpt(64)='(2) Change graphics output parameeters'
      mlolim(64)=0.
      mhilim(64)=0.
c
      mtype(65)=mtitle
      mprmpt(65)='(3) Return to main menu'
      mlolim(65)=0.
      mhilim(65)=1.
c
      mtype(66)=mchoic
      mprmpt(66)='Make menu choice and press Return'
      mtag(66)='71 81 01'
      mlolim(66)=1.
      mhilim(66)=3.
      mints(66)=3.
c
c     text output parameters
      mtype(71)=clrtrm
c
      mtype(72)=title
      mprmpt(72)='TEXT OUTPUT PARAMETERS'
      mlolim(72)=2.
      mhilim(72)=1.
c
      mtype(73)=boolen
      mprmpt(73)='Do you want text output displayed on screen?'
      mtag(73)='Text output to screen'
      mints(73)=txttrm
c
      mtype(74)=noskip
      mprmpt(74)='Do you want text output sent to a file?'
      mtag(74)='Text output to file'
      mreals(74)=76.
      mints(74)=txtfil
c
      mtype(75)=chstr
      mprmpt(75)='Enter name of file for text output'
      mtag(75)='File name for text output'
      mlolim(75)=1.
      mhilim(75)=12.
      mints(75)=1
      mstrng(mints(75))='cmphys.txt'
c
      mtype(80)=skip
      mreals(80)=61.
c
c     graphics output parameters
      mtype(81)=clrtrm
c
      mtype(82)=title
      mprmpt(82)='GRAPHICS OUTPUT PARAMETERS'
      mlolim(82)=2.
      mhilim(82)=1.
c
      mtype(83)=boolen
      mprmpt(83)='Do you want graphics sent to the terminal?'
      mtag(83)='Graphics output to terminal'
      mints(83)=grftrm
c
      mtype(84)=boolen
      mprmpt(84)='Do you want graphics sent to the hardcopy device?'
      mtag(84)='Graphics output to hardcopy device'
      mints(84)=grfhrd
c
      mtype(85)=noskip
      mprmpt(85)='Do you want data for graphing sent to a file?'
      mtag(85)='Data for graphing sent to file'
      mreals(85)=87.
      mints(85)=grffil
c
      mtype(86)=chstr
      mprmpt(86)='Enter name of file for graphincs data'
      mtag(86)='File for graphics data'
      mlolim(86)=2.
      mhilim(86)=12.
      mints(86)=2.
      mstrng(mints(86))='cmphys.grf'
c
      mtype(90)=skip
      mreals(90)=61.
c
c     printing numerical and physical parameters
      mtype(91)=pprint
      mlolim(91)=11.
      mhilim(91)=60.
c
      mtype(92)=skip
      mreals(92)=1.
c
c     printing output parameters
      mtype(94)=pprint
      mlolim(94)=71.
      mhilim(94)=90.
c
      mtype(95)=skip
      mreals(95)=1.
c
      return
      end
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine ask(start,end)
c executes menu item from START to END;
c see Appendix A for a description of the menu
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c Global variables:
      include 'menu.all'
      include 'io.all'
c Input variables:
      integer start,end                                                  !starting/ending menu items to execute
c Local variables:
      integer i                                                          !current menu item
      integer ilow,ihigh                                                 !integer limits for NUM type
      integer numskp                                                     !number of blank lines to print
      integer ichoic                                                     !current menu chioce
c Functions
      character*40 charac                                                !character input
      real getflt                                                        !real input
      integer getint                                                     !integer input
      integer parse                                                      !determines menu branching
      integer yesno                                                      !boolean input
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      i=start
 1000 continue
      if (mtype(i).eq.float) then
         mreals(i)=
     +      getflt(mreals(i),mlolim(i),mhilim(i),mprmpt(i))
c
      else if (mtype(i).eq.num) then
         ilow=mlolim(i)
         ihigh=mhilim(i)
         mints(i)=getint(mints(i),ilow,ihigh,mprmpt(i))
c
      else if (mtype(i).eq.boolen) then
         mints(i)=yesno(mints(i),mprmpt(i))
c
      else if (mtype(i).eq.chstr) then
         mstrng(mints(i))=
     +      charac(mstrng(mints(i)),int(mhilim(i),mprmpt(i))
c
      else if (mtype(i).eq.mchoic) then
         ilow=mlolim(i)
         ihigh=mhilim(i)
         ichoic=getint(mints(i),ilow,ihigh,mprmpt(i))
c        if mreals is > 0, save ichoic and default
         if (mreals(i).gt.0) then
            mreals(i)=real(ichoic)
            mints(i)=ichoic
c        if mreals is < 0, save ichoic but leave default the same
         else if (mreals(i).lt.0) then
            mreals(i)=-real(ichoic)
         endif
         i=parse(mtag(i),ichoic)-1
c
      else if (mtype(i).eq.title.or.mtype(i).eq.mtitle) then
         numskp=mlolim(i)
         call prblks(numskp)
         write (ounit,10) mprmpt(i)
         numskp=mhilim(i)
         call prblks(numskp)
c
      else if (mtype(i).eq.yeskip) then
         mints(i)=yesno(mints(i),mprmpt(i))
         if (mints(i).ne.0) then
            i=mreals(i)-1
         end if
c
      else if (mtype(i).eq.noskip) then
         mints(i)=yesno(mints(i),mprmpt(i))
         if (mints(i).eq.0) then
            i=mreals(i)-1
         end if
c
      else if (mtype(i).eq.skip) then
         i=mreals(i)-1
c
      else if (mtype(i).eq.wait) then
         write (ounit,10) mprmpt(i)
         call pause('to continue',1)
c
      else if (mtype(i).eq.clrtrm) then
         call clear
c
      else if (mtype(i).eq.quit) then
         i=end
c
      else if (mtype(i).eq.pprint) then
         ilow=mlolim(i)
         ihigh=mhilim(i)
         call clear
         call prtags(ilow,ihigh)
         call pause('to see the Main Menu...',1)
         call clear
c
      end if
c     display info about defaults
      if (i.eq.1) then
         write (ounit,*) ' '
         write (ounit,100)
         write (ounit,101)
      end if
c
      i=i+1
      if (i.le.end) goto 1000
c
   10 format(1x,a)
   11 format(1x,a,1pe11.3)
   12 format(1x,a,i6)
  100 format(' To accept the default value [in brackets] for any item')
  101 format(' just press Return at the prompt')
      return
      end
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine prtags(start,end)
c prints menu prompts and default values for items start to end
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c Global variables:
      include 'menu.all'
      include 'io.all'
c Input variables:
      integer start,end                                                  !limiting indices of printed menu items
c Local varaibles:
      integer i                                                          !menu items index
      integer numskp                                                     !number of lines to skip
      integer index                                                      !subindex for menu items
      integer plen                                                       !length of prompt
      integer ichoic                                                     !menu/parameter choice
c Functions:
      integer lentry                                                     !true lenght of character string
      integer parse                                                      !menu choise
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      i=start
 1000 continue
      if (mtype(i).eq.float) then
         write (ounit,11) mtag(i),mreals(i)
c
      else if (mtype(i).eq.num) then
         write (ounit,12) mtag(i), mints(i)
c
      else if (mtype(i).eq.boolen) then
         call pryorn(mtag(i),mints(i))
c
      else if (mtype(i).eq.chstr) then
         write (ounit,13) mtag(i),mstrng(mints(i))
c
      else if (mtype(i).eq.title) then
         numskp=mlolim(i)
         call prblks(numskp)
         write (ounit,10) mprmpt(i)
         numskp=mhilihm(i)
         call prblks(numskp)
c
      else if (mtype(i).eq.yeskip) then
         call pryorn(mtag(i),mints(i))
         if (mints(i).ne.0 .and. mreals(i).gt.i) then
            i=mreals(i)-1
         end if
c
      else if (mtype(i).eq.noskip) then
         call pryorn(mtag(i),mints(i))
         if (mints(i).eq.0 .and. mreals(i).gt.i) then
            i=mreals(i)-1
         end if
c
      else if (mtype(i).eq.skip) then
         if (mreals(i).gt.i) i=mreals(i)-1                               !don't skip backwards
c
      else if (mtype(i).eq.mchoic) then
         if (mreals(i).gt.0) then
c        for menu choices that are parameter choices, print out
c        choice, but first you must find it
            do 20 index=i-mhilhim(i),i-1
               if ((i-mreals(i)-mhilim(i)-1).eq.index) then
                  plen=lentru(mprmpt(index))
                  write (ounit,10) mprmpt(index)(4:plen)
               end if
   20       continue
         end if
         if (mreals(i).ne.0) then
c           branch to chosen parameter
            ichoic=abs(int(mreals(i)))
            i=parse(mtag(i),ichoic)-1
         end if
c
      end if
      i=i+1
      if (i.le.end) goto 1000
c
   10 format(1x,a)
   11 format(1x,a,1pe11.3)
   12 format(1x,a,16)
   13 format(1x,a,5x,a)
      return
      end
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine pryorn(pmpt,yorn)
c print a 'yes' or 'no'
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c Global variables:
      include 'io.all'
c Input variables:
      integer yorn                                                       !1=='YES', 0=='NO'
      character*(*) pmpt                                                 !string to print before y/n
c Functions:
      integer lentru                                                     !actual length of prompt
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      if (yorn.eq.0) then
         write(ounit,10) pmpt(1:lentru(pmpt))
      else
         write(ounit,11) pmpt(1:lentru(pmpt))
      end if
   10 format(1x,a,': no')
   11 format(1x,a,': yes')
      return
      end
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      SUBROUTINE PRBLKS(NUMLIN) 
C prints NUMLIN blank lines on terminal 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
C Global variables: 
      INCLUDE 'IO.ALL' 
C Passed variables: 
      INTEGER NUMLIN                                                     !number of blank lines to print 
C Local variables: 
      INTEGER I                                                          !dummy index 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      DO 1000 I=l,NUMLIN 
         WRITE( OUNIT,*) ' ' 
 1000 CONTINUE 
      RETURN 
      END 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      SUBROUTINE PAUSE(PHRASE,NSKIP) 
C gives user time to read screen by waiting for dummy input; 
C allows for printing of PHRASE to screen; 
C skips NSKIP lines before printing PHRASE 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
C Global variables: 
      INCLUDE 'IO.ALL' 
C Passed variables: 
      CHARACTER*(*) PHRASE                                               !phrase to be printed 
      INTEGER NSKIP                                                      !number of lines to skip 
C Local variables: 
      CHARACTER*1 DUMMY                                                  !dummy variable 
      INTEGER ISKIP                                                      !NSKIP index 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
      DO 10 ISKIP=l,NSKIP                                                !skip lines 
         WRITE (OUNIT,5) 
   10 CONTINUE 
    5 FORMAT (' ') 
      WRITE (OUNIT,15) PHRASE                                            !write phrase 
      READ (IUNIT,20) DUMMY                                              !wait for dummy input 
   15 FORMAT (' Press return ',A) 
   20 FORMAT (A1) 
      RETURN 
      END 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
      SUBROUTINE FLOPEN(FNAME,FUNIT) 
C opens a new file, unless one by the same name already exists 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
C Global variables: 
      INCLUDE 'IO.ALL' 
C Input variables: 
      CHARACTER*(*) FNAME                                                !file name 
      INTEGER FUNIT                                                      !unit number 
C Local variables: 
      LOGICAL OPN                                                        !is the file open? 
      LOGICAL EXST                                                       !does it exist? 
      CHARACTER*40 CHARAC                                                !function that return character input 
      INTEGER LENTRU 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
   10 INQUIRE(FILE=FNAME,EXIST=EXST,OPENED=OPN) 
C 
      IF (OPN) RETURN 
C 
      IF (EXST) THEN 
         WRITE (OUNIT,20) FNAME(l:LENTRU(FNAME)) 
   20    FORMAT (' Output file ',A,' already exists') 
         FNAME=CHARAC(FNAME,12, 'Enter another filename') 
      ELSE 
         OPEN(UNIT=FUNIT,FILE=FNAME,STATUS='NEW') 
         RETURN 
      END IF 
      GOTO 10 
      END 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      SUBROUTINE FLOPN2(FNAME,FUNIT,SUCESS) 
C opens an existing file for input data 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
C Global variables: 
      INCLUDE 'IO.ALL' 
C Input variables: 
      CHARACTER*(*) FNAME                                                !file name 
      INTEGER FUNIT                                                      !unit number 
      LOGICAL SUCESS                                                     !did we find an existing file to open? 
C Local variables: 
      LOGICAL OPN                                                        !is the file open? 
      LOGICAL EXST                                                       !does it exist? 
      CHARACTER*40 CHARAC                                                !function that return character input 
      INTEGER CHOICE                                                     !choice for continuing 
C Functions: 
      INTEGER YESNO                                                      !get yes or no input 
      INTEGER LENTRU 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
   10 INQUIRE(FILE=FNAME,EXIST=EXST,OPENED=OPN) 
C 
      IF ((.NOT. EXST) .OR. (OPN)) THEN 
         WRITE (OUNIT,20) FNAME(l:LENTRU(FNAME)) 
   20    FORMAT(' Input file ',A,' does not exist or is already open') 
         CHOICE=YESNO(l,' Would you like to try another file name?') 
C 
         IF (CHOICE .EQ. 0) THEN 
            SUCESS=.FALSE. 
            RETURN                                                       !leave without opening file for reading 
         ELSE 
            FNAME=CHARAC(FNAME,12, 'Enter another filename') 
         END IF 
      ELSE 
         OPEN(UNIT=FUNIT,FILE=FNAME,STATUS='OLD') 
         SUCESS=.TRUE. 
         RETURN 
      END IF 
      GOTO 10 
      END 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      SUBROUTINE FLCLOS(FNAME,FUNIT) 
C checks on file status of file, and closes if open 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
C Global variables: 
      INCLUDE 'IO.ALL' 
C Input variables: 
      CHARACTER*(*) FNAME                                                !file name 
      INTEGER FUNIT                                                      !unit number 
C Local variables: 
      LOGICAL OPN                                                        !is the file open 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      INQUIRE(FILE=FNAME,OPENED=OPN) 
      IF (OPN) CLOSE(UNIT=FUNIT) 
      RETURN 
      END 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
      SUBROUTINE FINISH 
C closes files and stops execution 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
C Global variables: 
      INCLUDE 'IO.ALL' 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
      CALL FLCLOS(TNAME,TUNIT) 
      CALL FLCLOS(GNAME,GUNIT) 
      STOP 
      END 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
      SUBROUTINE FLTDEF(XPRMPT,X) 
C prints prompt for floating number 
C and displays default X in a format dictated by size of X 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
C Global variables: 
      INCLUDE 'IO.ALL' 
C Input variables: 
      CHARACTER*(*) XPRMPT                                               !prompt string 
      REAL X                                                             !default value 
C Function: 
      INTEGER LENTRU                                                     !true length of string 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
C positive numbers (leave no room for a sign) 
      IF (X .GT. 0) THEN 
         IF ((ABS(X) .LT. 999.49) .AND. (ABS(X) .GE. 99.949)) THEN 
            WRITE (OUNIT,5) XPRMPT(l:LENTRU(XPRMPT)),X 
         ELSE IF ((ABS(X) .LT. 99.949) .AND. (ABS(X) .GE. 9.9949)) THEN 
            WRITE (OUNIT,10) XPRMPT(l:LENTRU(XPRMPT)),X 
         ELSE IF ((ABS(X) .LT. 9.9949) .AND. (ABS(X) .GE. .99949)) THEN 
            WRITE (OUNIT,15) XPRMPT(l:LENTRU(XPRMPT)),X 
         ELSE IF ((ABS(X) .LT. .99949) .AND. (ABS(X) .GE. 
            WRITE (OUNIT,20) XPRMPT(l:LENTRU(XPRMPT)),X 
         ELSE 
            WRITE (OUNIT,25) XPRMPT(l:LENTRU(XPRMPT)),X 
         END IF 
C
C        negative numbers (leave toom for the sign
      ELSE
         IF ((ABS(X).LT.999.49).AND.(ABS(X).GE.99.949)) THEN
            WRITE (OUNIT,105) XPRMPT(1:LENTRU(XPRMPT)),X
         ELSE IF ((ABS(X).LT.99.949).AND.(ABS(X).GE.9.9949)) THEN
            WRITE (OUNIT,110) XPRMPT(1:LENTRU(XPRMPT)),X
         ELSE IF ((ABS(X).LT.9.9949).AND.(ABS(X).GE..99949)) THEN
            WRITE (OUNIT,115) XPRMPT(1:LENTRU(XPRMPT)),X
         ELSE IF ((ABS(X).LT..99949).AND.(ABS(X).GE..099949)) THEN
            WRITE (OUNIT,120) XPRMPT(1:LENTRU(XPRMPT)),X
         ELSE
            WRITE (OUNIT,125) XPRMPT(1:LENTRU(XPRMPT)),X
         END IF
      END IF
C
    5 FORMAT (1X,A,1X,'[',F4.0,']')
   10 FORMAT (1X,A,1X,'[',F4.1,']')
   15 FORMAT (1X,A,1X,'[',F4.2,']')
   20 FORMAT (1X,A,1X,'[',F4.3,']')
   25 FORMAT (1X,A,1X,'[',1PE8.2,']')
  105 FORMAT (1X,A,1X,'[',F5.0,']')
  110 FORMAT (1X,A,1X,'[',F5.1,']')
  115 FORMAT (1X,A,1X,'[',F5.2,']')
  120 FORMAT (1X,A,1X,'[',F5.3,']')
  125 FORMAT (1X,A,1X,'[',1PE9.2,']')
C
      RETURN
      END
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      SUBROUTINE INTDEF(KPRMPT,K) 
C prints prompt for integer input from screen 
C and default value in appropriate format 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
C Global variables: 
      INCLUDE 'IO.ALL' 
c Input variables: 
      CHARACTER *(*) KPRMPT                                              !prompt string 
      INTEGER K                                                          !default values 
c Function: 
      INTEGER LENTRU                                                     !true length of string
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
C positive numbers (leave no room for a sign) 
      IF (K .GE. 0 ) THEN 
         IF ((IABS(K) .LE. 9999) .AND. (IABS(K) .GE. 1000)) THEN 
            WRITE (OUNIT,10) KPRMPT(l:LENTRU(KPRMPT)),K 
         ELSE IF ((IABS(K) .LE. 999) .AND. (IABS(K) .GE. 100)) THEN 
            WRITE (OUNIT,20) KPRMPT(l:LENTRU(KPRMPT)),K 
         ELSE IF ((IABS(K) .LE. 99) .AND. (IABS(K) .GE. 10)) THEN 
            WRITE (OUNIT,30) KPRMPT(l:LENTRU(KPRMPT)),K 
         ELSE IF ((IABS(K) .LE. 9) .AND. (IABS(K) .GE. 0)) THEN 
            WRITE (OUNIT,40) KPRMPT(l:LENTRU(KPRMPT)), 
         ELSE 
            WRITE (OUNIT,50) KPRMPT(l:LENTRU(KPRMPT)), 
         END IF
C
C     negative numbers (leave room for the sign) 
      ELSE 
         IF ((IABS(K) .LE. 9999) .AND. (IABS(K) .GE. 1000)) THEN 
            WRITE (OUNIT,110) KPRMPT(l:LENTRU(KPRMPT)),K 
         ELSE IF ((IABS(K) .LE. 999) .AND. (IABS(K) .GE. 100)) THEN 
            WRITE (OUNIT,120) KPRMPT(l:LENTRU(KPRMPT)),K 
         ELSE IF ((IABS(K) .LE. 99) .AND. (IABS(K) .GE. 10)) THEN
            WRITE (OUNIT,130) KPRMPT(l:LENTRU(KPRMPT)),K 
         ELSE IF ((IABS(K) .LE. 9) .AND. (IABS(K) .GE. 1)) THEN
            WRITE (OUNIT,140) KPRMPT(l:LENTRU(KPRMPT)),K 
         ELSE 
            WRITE (OUNIT,150) KPRMPTA(LENTRU(KPRMPT)),K 
         END IF 
      END IF
C
   10 FORMAT (1X,A,1X,'[',I4,']')
   20 FORMAT (1X,A,1X,'[',I3,']')
   30 FORMAT (1X,A,1X,'[',I2,']')
   40 FORMAT (1X,A,1X,'[',I1,']')
   50 FORMAT (1X,A,1X,'[',I10,']')
  110 FORMAT (1X,A,1X,'[',I5,']')
  120 FORMAT (1X,A,1X,'[',I4,']')
  130 FORMAT (1X,A,1X,'[',I3,']')
  140 FORMAT (1X,A,1X,'[',I2,']')
  150 FORMAT (1X,A,1X,'[',I10,']')
C
      RETURN
      END
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      SUBROUTINE CONVRT(X,STRING,LEN) 
C converts a real number x to a character variable string of length LEN 
C for printing; the format is chosen according to the value of X, 
C taking roundoff into account 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
C Passed variables: 
      CHARACTER*9 STRING                                                 !routine output 
      REAL X                                                             !routine input 
      INTEGER LEN                                                        !string length 
C Function 
      INTEGER LENTRU                                                     !gets string length 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
C positive numbers (leave no room for a sign) 
      IF (X.GT.0) THEN
         IF ((ABS(X).LT.999.4).AND.(ABS(X).GE.99.94)) THEN
            WRITE (STRING,5) X
         ELSE IF ((ABS(X).LT.99.94).AND.(ABS(X).GE.9.994)) THEN
            WRITE (STRING,10) X
         ELSE IF ((ABS(X).LT.9.994).AND.(ABS(X).GE..9994)) THEN
            WRITE (STRING,15) X
         ELSE IF ((ABS(X).LT..9994).AND.(ABS(X).GE..09994)) THEN
            WRITE (STRING,20) X
         ELSE
            WRITE (STRING,25) X
         ENDIF
C
C     negative numbers (leave room for the sign)
      ELSE
         IF ((ABS(X).LT.999.4).AND.(ABS(X).GE.99.94)) THEN
            WRITE (STRING,105) X
         ELSE IF ((ABS(X).LT.99.94).AND.(ABS(X).GE.9.994)) THEN
            WRITE (STRING,110) X
         ELSE IF ((ABS(X).LT.9.994).AND.(ABS(X).GE..9994)) THEN
            WRITE (STRING,115) X
         ELSE IF ((ABS(X).LT..9994).AND.(ABS(X).GE..09994)) THEN
            WRITE (STRING,120) X
         ELSE
            WRITE (STRING,125) X
         ENDIF
      ENDIF
C
      LEN=LENTRU(STRING)
C
    5 FORMAT (F4.0)
   10 FORMAT (F4.1)
   15 FORMAT (F4.2)
   20 FORMAT (F4.3)
   25 FORMAT (1PE8.2)
  105 FORMAT (F5.0)
  110 FORMAT (F5.1)
  115 FORMAT (F5.2)
  120 FORMAT (F5.3)
  125 FORMAT (1PE9.2)
C
      RETURN
      END
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      SUBROUTINE ICNVRT(I,STRING,LEN) 
C converts an integer I to a character variable STRING for 
C printing; the format is chosen according to the value of I 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
C Passed variables: 
      CHARACTER*9 STRING                                                 !routine output 
      INTEGER I                                                          !routine input 
      INTEGER LEN                                                        !length of string 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC( 
C positive numbers (leave no room for a sign) 
      IF (I .GE. 0) THEN 
         IF ((ABS(I) .LE. 9) .AND. (ABS(I) .GE. 0)) THEN 
            WRITE(STRING,5) I 
            LEN=1 
         ELSE IF ((ABS(I) .LE. 99) .AND. (ABS(I) .GE. 10)) THEN 
            WRITE(STRING,10) I 
            LEN=2 
         ELSE IF ((ABS(I) .LE. 999) .AND. (ABS(I) .GE. 100)) THEN 
            WRITE (STRING,15) I 
            LEN=3 
         ELSE IF ((ABS(I) .LE. 9999) .AND. (ABS(I) .GE. 1000)) THEN 
            WRITE (STRING,20) I 
            LEN=4 
         ELSE 
            WRITE (STRING,25) REAL(I) 
            LEN=8 
         END IF
C 
C negative numbers (leave room for the sign) 
      ELSE 
         IF ((ABS(I) .LE. 9) .AND. (ABS(I) .GE. 1)) THEN 
            WRITE(STRING,105) I 
            LEN=2 
         ELSE IF ((ABS(I) .LE. 99) .AND. (ABS(I) .GE. 10)) THEN 
            WRITE(STRING,110) I 
            LEN=3 
         ELSE IF ((ABS(I) .LE. 999) .AND. (ABS(I) .GE. 100)) THEN 
            WRITE (STRING,115) I 
            LEN=4 
         ELSE IF ((ABS(I) .LE. 9999) .AND. (ABS(I) .GE. 1000)) THEN 
            WRITE (STRING,120) I 
            LEN=5 
         ELSE 
            WRITE (STRING,125) REAL(I) 
            LEN=9 
         END IF 
      END IF 
C
    5 FORMAT (I1)
   10 FORMAT (I2)
   15 FORMAT (I3)
   20 FORMAT (I4)
   25 FORMAT (1PE8.2)
  105 FORMAT (I2)
  110 FORMAT (I3)
  115 FORMAT (I4)
  120 FORMAT (I5)
  125 FORMAT (1PE9.2)
C
      RETURN
      END
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      INTEGER FUNCTION PARSE(STRING,CHOICE) 
C determines branching in menu list 
C 
C breaks STRING (of the form 'nn nn nn nn nn nn ....') into pieces, and 
C returns the integer value represented by the CHOICE group of digits 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
C Input variables: 
      CHARACTER*(*) STRING                                               !string to look at 
      INTEGER CHOICE                                                     !specific number to look at 
C Local variables: 
      INTEGER IPOS                                                       !current character position in string 
      INTEGER IGROUP                                                     !current group of digits in string 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
      IP0S=1 
      DO 20 IGROUP = l,CHOICE-l 
   40    IF ( STRING(IPOS:IPOS) .NE. ' ' ) THEN 
            IPOS = IPOS+1 
         GOTO 40 
         END IF 
         IPOS=IPOS+1
   20 CONTINUE 
      READ ( STRING(IPOS:IPOS+2),10) PARSE 
   10 FORMAT( I2 ) 
      RETURN 
      END 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      INTEGER FUNCTION LENTRU(CHARAC) 
C finds the true length of a character string by searching 
C backward for first nonblank character 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
C Input variables: 
      CHARACTER *(*) CHARAC                                              !string whose length we are finding 
C Local variables: 
      INTEGER ISPACE                                                     !ascii value of a blank 
      INTEGER I                                                          !index of elements in CHARAC 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      ISPACE=ICHAR(' ') 
      I=LEN(CHARAC) 
   10 IF (ICHAR(CHARAC(I:I)) .EQ. ISPACE) THEN 
         I=I-1 
      ELSE 
         LENTRU=I 
         RETURN 
      END IF 
      IF (I .GT. 0) GOTO 10 
      LENTRU=0 
      RETURN 
      END 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      REAL FUNCTION GETFLT(X,XMIN,XMAX,XPRMPT) 
C get a floating point number GETFLT; make sure it is between XMIN 
C and XMAX and prompt with XPRMPT 
C 
C If your compiler accepts (FMT=*) to an internal unit, comment out 
C lines 3 and 5, and uncomment lines 2 and 4 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
C Global variables: 
      INCLUDE 'IO.ALL' 
C Input variables: 
      CHARACTER*(*) XPRMPT                                               !prompt 
      REAL X                                                             !default value 
      REAL XMIN,XMAX                                                     !limits on input 
C Local variables: 
      CHARACTER*40 STRING                                                !internal unit 
C Function 
      INTEGER LENTRU                                                     !returns true length of string 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
C prompt for float, display default value 
   10 CALL FLTDEF(XPRMPT,X) 
      READ (IUNIT,35,ERR=10) STRING 
C 
C accept default value X if STRING is empty 
      IF (LENTRU(STRING) .EQ. 0) THEN 
         GETFLT=X 
      ELSE
C    2    READ (UNIT=STRING,FMT=*,ERR=10) GETFLT 
    3    READ (UNIT=STRING,FMT=l,ERR=10) GETFLT 
    1    FORMAT (E9.2) 
      END IF 
C 
C make sure GETFLT is between XMIN and XMAX 
   40 IF ((GETFLT .LT. XMIN) .OR. (GETFLT .GT. XMAX)) THEN 
   50    WRITE (OUNIT,60) XMIN,XMAX 
         READ (IUNIT,35,ERR=50) STRING 
         IF (LENTRU(STRING) .EQ. 0) THEN 
            GETFLT=X 
         ELSE 
C    4       READ(UNIT=STRING,FMT=*,ERR=50) GETFLT
    5       READ (UNIT=STRING,FMT=1,ERR=50) GETFLT
         END IF
      GOTO 40
      END IF
C
   35 FORMAT (A40)
   60 FORMAT (' Try again: input outside of range = [',1PE11.3,
     +         1PE11.3,']')
  100 FORMAT (1PE9.2)
      RETURN
      END
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
      INTEGER FUNCTION GETINT(K,KMIN,KMAX,KPRMPT) 
C get an integer value GETINT; 
C check that it lies between KMIN and KMAX and prompt with KPRMPT 
C This function allows input of integers in a natural way (i.e., without 
C preceding blanks or decimal points) even though we cannot use list 
C directed READ (i.e., FMT=*) from internal units 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
C Global variables: 
      INCLUDE 'IO.ALL' 
C Input variables: 
      CHARACTER*(*) KPRMPT                                               !string prompt 
      INTEGER K                                                          !default value 
      INTEGER KMIN,KMAX                                                  !upper and lower limits 
C Local variables: 
      CHARACTER*40 STRING                                                !internal unit
      REAL TEMP                                                          !temp var to allow for easier input 
C Functions: 
      INTEGER LENTRU                                                     !returns true length of string 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
C     prompt for input; disply default
   10 CALL INTDEF (KPRMPT,K)
      READ (IUNIT,35,ERR=10) STRING
C
C     accept default value K if STRING is empty
      IF (LENTRU(STRING).EQ.0) THEN
         GETINT=K
      ELSE
C        change the integer into a real number
         STRING=STRING(1:LENTRU(STRING))//'.'
C        read the real number from string
         READ (UNIT=STRING,FMT=1,ERR=10) TEMP
    1    FORMAT (F7.0)
C        change it to an integer
         GETINT=INT(TEMP)
      END IF
C
C     check that GETINT lies between KMIN and KMAX
   40 IF ((GETINT.LT.KMIN).OR.(GETINT.GT.KMAX)) THEN
   50    WRITE (OUNIT,60) KMIN,KMAX
         READ (IUNIT,35,ERR=50) STRING
         IF (LENTRU(STRING).EQ.0) THEN
            GETINT=K
         ELSE
            STRING=STRING(1:LENTRU(STRING))//'.'
            READ (UNIT=STRING,FMT=1,ERR=50) TEMP
            GETINT=INT(TEMP)
         END IF
      GOTO 40
      END IF
C
   35 FORMAT (A40)
   60 FORMAT (' Try again: input is outside of range = [',I6,I6,']')
  100 FORMAT (I10)
C
      RETURN
      END
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      CHARACTER*40 FUNCTION CHARAC(C,CLNGTH,CPRMPT) 
C gets character string CHARAC no longer than CLNGTH from the screen 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
C Global variables: 
      INCLUDE 'IO.ALL' 
C Input variables: 
      CHARACTER*(*) C                                                    !default value 
      CHARACTER*(*) CPRMPT                                               !prompt 
      INTEGER CLNGTH                                                     !max length 
C Local variables: 
      CHARACTER*40 STRING                                                !internal unit 
C Functions: 
      INTEGER LENTRU                                                     !returns true length of string 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
C data can't be longer than 40 characters due to fixed format 
      IF (CLNGTH .GT. 40) CLNGTH=40 
C 
C prompt for string; display default value C 
   10    WRITE (OUNIT,20) CPRMPT(1:LENTRU(CPRMPT)),C(1:LENTRU(C)) 
         READ (IUNIT,35,ERR=10) STRING 
C 
C accept default value C if STRING is empty 
         IF (LENTRU(STRING) .EQ. 0) THEN 
            CHARAC=C 
         ELSE 
            READ (STRING,35,ERR=10) CHARAC 
         END IF 
C 
C find the true length of the input; verify that it is not too long 
   40 IF (LENTRU(CHARAC) .GT. CLNGTH) THEN 
   50    WRITE (OUNIT,60) CLNGTH 
         READ (IUNIT,35,ERR=50) STRING 
         IF (LENTRU(STRING) .EQ. 0) THEN 
            CHARAC=C 
         ELSE 
            READ (STRING,35,ERR=50) CHARAC 
         END IF 
      GOTO 40 
      END IF 
C
   20 FORMAT (1X,A,1X,'[',A,']')
   35 FORMAT (A40)
   60 FORMAT (' Try again: string is too long, maximum length = ',I2)
C
      RETURN
      END
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
      INTEGER FUNCTION YESNO(BINARY,PROMPT) 
C obtains YESNO from the screen; value is 0 for no, 1 for yes 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
C Global variables: 
      INCLUDE 'IO.ALL' 
C Input parameters: 
      CHARACTER*(*) PROMPT                                               !prompt 
      INTEGER BINARY                                                     !default value 
C Local variables: 
      CHARACTER*3 STRING                                                 !internal unit 
C Functions: 
      INTEGER LENTRU                                                     !returns true length of string 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
 1000 CONTINUE
C write prompt and display default values 
      IF (BINARY .EQ. 1) WRITE(OUNIT,10) PROMPT(l:LENTRU(PROMPT)) 
      IF (BINARY .EQ. 0) WRITE(OUNIT,ll) PROMPT(l:LENTRU(PROMPT)) 
C 
      READ (IUNIT,20,ERR=1000) STRING 
C 
C accept default value; check that input is 'y' or 'n' 
      IF (LENTRU(STRING) .EQ. 0) THEN 
         YESNO = BINARY 
      ELSE IF (STRING(1:1) .EQ. 'y' .OR. STRING(1:1) .EQ. 'Y') THEN 
         YESNO = 1 
      ELSE IF (STRING(1:1) .EQ. 'n' .OR. STRING(1:1) .EQ. 'N') THEN 
         YESNO = 0 
      ELSE 
         WRITE (OUNIT,200) 
      GOTO 1000 
      END IF 
C
   10 FORMAT(lX,A,IX,'[yes]') 
   11 FORMAT(lX,A,IX,' [no] ' ) 
   20 FORMAT(A) 
  200 FORMAT (' Try again, answer must be yes or no') 
C 
      RETURN 
      END 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
      LOGICAL FUNCTION LOGCVT(IJK) 
C converts 1 to true and anything else to false 
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC 
      INTEGER IJK                                                        !input 
      IF (IJK .EQ. 1) THEN 
         LOGCVT=.TRUE. 
      ELSE 
         LOGCVT=.FALSE. 
      END IF 
      RETURN 
      END 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      REAL FUNCTION RANNOS(DSEED) 
C returns a uniformly distributed random number between 0 and 1 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      DOUBLE PRECISION DSEED 
      DOUBLE PRECISION D2P3lM,D2P31 
      DATA D2P31M/2147483647.D0/ 
      DATA D2P31 /2147483711.D0/ 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
      DSEED = MOD(16807.D0*DSEED,D2P3lM) 
      RANNOS = DSEED / D2P31 
      RETURN 
      END 
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc 
