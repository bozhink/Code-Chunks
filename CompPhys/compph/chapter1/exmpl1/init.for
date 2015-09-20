cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine init
C initializes constants, displays header screen,
C initializes menu arrays for input parameters
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C Global variables:
      include 'io.all'
      include 'menu.all'
      include 'param.e1'
C Local parameters
      character*80 descrp                 ! program description
      dimension descrp(20)
      integer nhead,ntext,ngraph          ! number of lines for each description
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C     get environment parameters
      call setup
C
C     display header screen
      descrp(1)='EXAMPLE 1'
      descrp(2)='Bohr-Sommerfeld quantization for bound state'
      descrp(3)='energies of the 6-12 potential'
      nhead=3
C
C     text output description
      descrp(4)='energy and classical turning points for each state'
      ntext=1
C
C     graphics output description
      descrp(5)='phase space (wavenumber vs. position) portrait'
      descrp(6)='of classical trajectories'
      ngraph=2
C
      call header(descrp,nhead,ntext,ngraph)
C
C     calculate constants
      pi=4*atan(1.0)
      potmin=2**(1.0/6.0)
C
C     setup menu arrays, beginning with constant part
      call menu
C
      mtype(13)=float
      mprmpt(13)='Enter gamma=sqrt(2*m*a**2*V/hbar**2) (dimensionless)'
      mtag(13)='Gamma (dimensionless)'
      mlolim(13)=1.
      mhilim(13)=500.
      mreals(13)=50.
C
      mtype(14)=skip
      mreals(14)=35.
C
      mtype(38)=float
      mprmpt(38)='Enter tolerance for energy search (scaled units)'
      mtag(38)='Energy search tolerance (scaled units)'
      mlolim(38)=.00001
      mhilim(38)=.01
      mreals(38)=.0005
C
      mtype(39)=float
      mprmpt(39)=
     +'Enter tolerance for turning point search (scaled units)'
      mtag(39)= 'Turning point search tolerance (scaled units)'
      mlolim(39)=.00001
      mhilim(39)=.01
      mreals(39)=.0005
C
      mtype(40)=num
      mprmpt(40)='Enter number of points for action integral'
      mtag(40)='Number of quadrature points for action integral'
      mlolim(40)=20.
      mhilim(40)=5000.
      mints(40)=100
C
      mtype(41)=skip
      mreals(41)=60.
C
      mstrng(mints(75))='exmpl1.txt'
C
      mtype(76)=skip
      mreals(76)=80.
C
      mstrng(mints(86))='exmpl1.grf'
C
      mtype(87)=num
      mprmpt(87)='Enter number of points to be used in graphing'
      mtag(87)=10.
      mlolim(87)=10.
      mhilim(87)=maxgrf-2
      mints(87)=80
C
      mtype(88)=skip
      mreals(88)=90.
C
      return
      end

