      program btw drv
      implicit integer(a-z)
      parameter (l=1001)
      parameter (lhalf=l/2)
      parameter (niter=4*l)
      dimension a(l,l)
      character*17 frmt
      call system_clock(tic)
      call btw(l, lhalf, a, niter)
      write (unit=frmt, fmt=100) l
      open (unit=10, file='out.dat', status='replace')
      do i = 1, l
         write (unit=10,fmt=frmt) (a(i,j),j=1,l)
      enddo
      close (unit=10)
      call system_clock(toc)
      print*,'Time: ',1.0*(toc-tic)/1000.0,' s.'
      stop
  100 format('(i1,',i5,'(1x,i1))')
      end
