      program LJMAIN
c name: Lenard-Jones Main program
c
      implicit real*8(a-h,o-z),integer(i-n)
      parameter(idimv=1, n=10000)
      dimension x0(idimv),v0(idimv),x(n,idimv),v(n,idimv)
      external LJF1
      character*8 fname
      data x0 /0.d0/
      data v0 /1.d0/
      data t0 /0.d0/, h/0.01d0/
c
      iunt=10
      do i=1,5
         junt=iunt+i
         write(unit=fname,fmt=100) i
c
         open(unit=junt,
     *        file=fname,
     *        status='unknown',
     *        access='sequential',
     *        form='formatted',
     *        iostat=ierr,
     *        err=1000
     *   )
         call odemd(LJF1,idimv,x0,v0,h,n,x,v,i,iflag)
         if (iflag.lt.0) stop 'Invalid method'
c
         t=t0
         print*,'Writing to ',fname
         do k=1,n
            t=t+h
            write(unit=junt,fmt=200,iostat=ierr)
     *            t,(x(k,j),j=1,idimv),(v(k,j),j=1,idimv)
         enddo
         close(unit=junt,iostat=ierr,err=1100)
      enddo

      stop
  100 format('lj',i2.2,'.dat')
  200 format(f12.6,6(1x,e16.8))
 1000 print*,'ERROR in LJMAIN: Cannot open file ',fname,' :: ',ierr
      stop 1000
 1100 print*,'ERROR in LJMAIN: Cannot close file ',fname,' :: ',ierr
      stop 1100
      end
