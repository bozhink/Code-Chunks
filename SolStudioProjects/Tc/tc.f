c This program calculates T-Critical on given Jds, es, EFermi
      program tc
      implicit none
      double precision Kelvin, pi
      parameter (Kelvin=1.d0/11604d0, pi=3.1415926535897932d0)
      double precision findtc
      external findtc
      double precision Jsd, es, EFermi
      double precision T
      character*256 arg
      integer iargc
      intrinsic iargc
      integer ierr

      call setriang(0.d0,0.d0,pi,pi)

      if (iargc().lt.3) then
         write(unit=0,fmt=100)
         stop 'incorrect number of arguments'
      else
         call getarg(1,arg)
         read(unit=arg,fmt='(f5.2)',iostat=ierr,err=500) Jsd
         call getarg(2,arg)
         read(unit=arg,fmt='(f7.3)',iostat=ierr,err=500) es
         call getarg(3,arg)
         read(unit=arg,fmt='(f7.3)',iostat=ierr,err=500) EFermi
      endif

      T = findtc(Jsd, es, EFermi)

      print 10,Jsd,es,EFermi,T,T/Kelvin

      stop
   10 format(f5.3,1x,f7.3,1x,f7.3,1x,f9.6,1x,f6.1)
  100 format("Usage: tc <Jsd> <es> <EFermi>")
  500 write(unit=0,fmt=501) ierr
  501 format("Incorrect type of argument: ",i6)
      stop 'Incorrect argument'
      end

