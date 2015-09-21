      program ThermoDynamics_Main
      implicit none
      integer,parameter :: idimx=32, idimy=32, n=200
      integer           :: S(idimx,idimy)
      double precision  :: Ti, Tf, B, dT, J, T
      double precision  :: M, E, chi, C
      integer           :: ii,jj,ierr
      real              :: tstart,tstop

      J  = 40.d0
      B = 0.001d0
      Ti = 0.05d0
      Tf = 4.d2
      dT = (Tf-Ti)/dble(n)
      T  = Ti

      open(unit=11,file='dat',status='replace',iostat=ierr,err=200)

      call cpu_time(tstart)

      call stateGen(idimx, idimy, S)

      do while (T.le.Tf)
      call TD(J/T, B/T, idimx, idimy, S, n, M, E, chi, C)
      T = T + dT
      write(unit=11,fmt=100,iostat=ierr,err=200) T, M, E, chi, C
      enddo

      call cpu_time(tstop)

      write(unit=0,fmt=*) 'Time to execute: ' ,tstop-tstart

      close(unit=11,iostat=ierr,err=200)

      stop
  100 format(f9.3,4(1x,e12.5))
  200 stop 'Error in I/O function'
      end
