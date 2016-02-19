      PROGRAM TC EFERMI WITH Z FACTOR RENORMALIZATION
      IMPLICIT NONE
      DOUBLE PRECISION KELVIN, PI
      PARAMETER(KELVIN=1.D0/11604.D0)
      INTEGER N, I, NMAX
      PARAMETER (N=100, NMAX=15)
      DOUBLE PRECISION TCRIT
      DOUBLE PRECISION Z, TC, E(3), T(3), JSD, FILLING
      DOUBLE PRECISION GETJSD, FINDEF, FINDTC
      INTEGER IERR
      CHARACTER*256 arg, fname
      DOUBLE PRECISION Ef, efmin, efmax, Efermi(n)
      DOUBLE PRECISION ed, es, ep, tpd, tsp, tpp
      COMMON /BHPARAMS/ ed, es, ep, tpd, tsp, tpp
      DATA E /0.d0,  3.934d0, -1.d0 /
      DATA T /1.5d0, 2.d0,     0.2d0/
c
      pi=4.d0*datan(1.d0)
      call setriang(0.d0,0.d0,pi,pi)
c
      if (iargc().lt.4) then
         write(unit=0,fmt=500)
         stop 'invalid arguments'
      else
         call getarg(1,fname)
         call getarg(2,arg)
         read(unit=arg,fmt=*,iostat=ierr,err=600) TC
         call getarg(3,arg)
         read(unit=arg,fmt=*,iostat=ierr,err=600) z
         call getarg(4,arg)
         read(unit=arg,fmt=*,iostat=ierr,err=600) es
      endif
c
      efmin=0.6d0/Z
      efmax=2.4d0/Z
      call linspace(efmin,efmax,n,Efermi)

      FILLING=0.5D0-0.16D0

!      Z = 2.D0
      ED=E(1)/Z
      ES=E(2)/Z
      EP=E(3)/Z
      TPD=T(1)/Z
      TSP=T(2)/Z
      TPP=T(3)/Z

      TC=TC*KELVIN

      EF = FINDEF(E(2)/Z, FILLING)
      
      JSD = GETJSD(TC, EF, Z, E, T)

!      TCRIT=FINDTC(JSD,E(2)/Z,EF)

      PRINT 10, Z
      PRINT 11, ES
      PRINT 12, EF
      PRINT 13, JSD
      PRINT 14, TC/KELVIN
!      print*,tcrit
c
      open(unit=20,file=fname,status='replace')

      WRITE(UNIT=20,FMT=10) Z
      WRITE(UNIT=20,FMT=11) ES
      WRITE(UNIT=20,FMT=12) EF
      WRITE(UNIT=20,FMT=13) JSD
      WRITE(UNIT=20,FMT=14) TC/KELVIN
      do i=1,n
         tcrit=findtc(Jsd, e(2)/z, Efermi(i))
         print 200, Efermi(i), tcrit, tcrit/Kelvin
         write(unit=20,fmt=200) Efermi(i), tcrit, tcrit/Kelvin
      enddo

      close(unit=20)
!
      STOP
   10 FORMAT('#   Z=',F6.3)
   11 FORMAT('#  ES=',F6.3,' EV')
   12 FORMAT('#  EF=',F6.3,' EV')
   13 FORMAT('# JSD=',F6.3,' EV')
   14 FORMAT('#  TC=',F6.1,' K')
  100 format(f6.3,1x,f9.6,1x,f6.1,1x,i4,1x,i4)
  200 format(f6.3,1x,f9.6,1x,f6.1)
  500 format('Usage: tcefz <fname> <Tc> <z> <es>')
  600 write(unit=0,fmt=601) ierr
  601 format('tcef: invalid input argument: ',i6)
      stop 'invalid arguments'
      END

