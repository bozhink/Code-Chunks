      program ThermoDynamics_Main
      implicit none
      integer,parameter :: idimx=32, idimy=32, n=200
      integer           :: S(idimx,idimy)
      double precision  :: Ji, Jf, B, dJ, J
      double precision  :: M, E, chi, C
      integer           :: ii,jj,ierr
      real              :: tstart,tstop

      Ji = -2.d0
      Jf =  2.d0
      dJ = (Jf-Ji)/dble(n)
      B = 0.001d0
      J = Ji

      open(unit=11,file='dat',status='replace',iostat=ierr,err=200)

      call cpu_time(tstart)

      call stateGen(idimx, idimy, S)

      do while (J.le.Jf)
      call TD(J, B, idimx, idimy, S, n, M, E, chi, C)
      J = J + dJ
      write(unit=11,fmt=100,iostat=ierr,err=200) J, M, E, chi, C
      enddo

      call cpu_time(tstop)

      write(unit=0,fmt=*) 'Time to execute: ' ,tstop-tstart

      close(unit=11,iostat=ierr,err=200)

      stop
  100 format(f6.3,4(1x,e10.3))
  200 stop 'Error in I/O function'
      end
