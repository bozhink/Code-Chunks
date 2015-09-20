CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      SUBROUTINE INIT
C INITIALIZES CONSTANTS, DISPLAYS HEADER SCREEN,
C INITIALIZES MENU ARRAYS FOR INPUT PARAMETERS
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C GLOBAL VARIABLES:
      INCLUDE 'IO.ALL'
      INCLUDE 'MENU.ALL'
      INCLUDE 'PARAM.E1'
C LOCAL PARAMETERS:
      CHARACTER*80 DESCRP                ! PROGRAM DESCRIPTION
      DIMENSION DESCRP(20)
      INTEGER NHEAD,NTEXT,NGRAPH         ! NUMBER OF LINES FOR EACH DESCRIPTION
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
C     DET ENVIRONMENT PARAMETERS
      CALL SETUP
C
C     DISPLAYS HEADER SCREEN
      DESCRP(1)='EXAMPLE 1'
      DESCRP(2)='Bohr-Sommerfeld quantization for bound state'
      DESCRP(3)='energies of the 6-12 potential'
      NHEAD=3
C
C     TEXT OUTPUT DESCRIPTION
      DESCRP(4)='energy and classical turning points for each state'
      NTEXT=1
C
C     GRAPHICS OUTPUT DESCRIPTION
      DESCRP(5)='phase space (wavenumber vs. position) portrait'
      DESCRP(6)='of classical trajectories'
      NGRAPH=2
C
      CALL HEADER(DESCRP,NHEAD,NTEXT,NGRAPH)
C
C     CALCULATE CONSTANTS
      PI=4*ATAN(1.0)
      POTMIN=2**(1.0/6.0)
C
C     SETUP MENU ARRAYS, BEGINNING WITH CONSTANT PART
      CALL MENU
C
      MTYPE(13)=FLOAT
      MPRMPT(13)=
     +'Enter gamma=sqrt(2*m*a**2*V)/hbar**2) (dimensionless)'
      MTAG(13)='Gamma (dimensionless)'
      MLOLIM(13)=1.
      MHILIM(13)=500.
      MREALS(13)=50.
C
      MTYPE(14)=SKIP
      MREALS(14)=35.
C
      MTYPE(38)=FLOAT
      MPRMPT(38)='Enter tolerance for energy search (scaled units)'
      MTAG(38)='Energy search tolerance (scaled units)'
      MLOLIM(38)=.00001
      MHILIM(38)=.01
      MREALS(38)=.0005
C
      MTYPE(39)=FLOAT
      MPRMPT(39)=
     +'Enter tolerance for turning point search (scaled units)'
      MTAG(39)='Turning point search tolerance (scaled units)'
      MLOLIM(39)=.00001
      MHILIM(39)=.01
      MREALS(39)=.0005
C
      MTYPE(40)=NUM
      MPRMPT(40)='Enter number of points for action integral'
      MTAG(40)='Number of quadrature points for action integeral'
      MLOLIM(40)=20.
      MHILIM(40)=5000.
      MINTS(40)=100
C
      MTYPE(41)=SKIP
      MREALS(41)=60.
C
      MSTRNG(MINTS(75))='exampl1.txt'
C
      MTYPE(76)=SKIP
      MREALS(76)=80.
C
      MSTRNG(MINTS(86))='exmpl1.grf'
C
      MTYPE(87)=NUM
      MPRMPT(87)='Enter number of points to be used in graphing'
      MTAG(87)='Number of graphing points'
      MLOLIM(87)=10.
      MHILIM(87)=MAXGRF-2
      MINTS(87)=80
C
      MTYPE(88)=SKIP
      MREALS(88)=90.
C
      RETURN
      END

