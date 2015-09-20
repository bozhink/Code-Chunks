cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine grfout(device,energy,xin,xout)
C outputs phase space portraits of the bound states to the terminal
C and/or a file
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C Global parameters:
      include 'io.all'
      include 'param.e1'
      include 'grfdat.all'
C Input variables:
      integer device                      ! which device is being used?
      real energy(0:maxlvl)               ! energy of bound state
      real xin(0:maxlvl)                  ! inner turning point
      real xout(0:maxlvl)                 ! outer turning point
C Local parameters:
      integer ilevel                      ! level index
      real h                              ! step size for x
      integer ix                          ! x index
      real e                              ! current energy
      real k(maxgrf)                      ! current wavenumber
      real x(maxgrf)                      ! current position
      character*9 cgamma,cn               ! Gamma, nlevel as a character string
      real pot                            ! potential (function)
      integer len,nlen                    ! length of character data
      integer screen                      ! send to terminal
      integer paper                       ! make a hardcopy
      integer file                        ! send to a file
      data screen,paper,file/1,2,3/
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C     messages for the impatient
      if (device.ne.screen) erite(ounit,100)
C
C     calculate parameters for graphing
      if (device.ne.file) then
         nplot=1                          ! how many plots
         iplot=1
C
         ymax=gamma*sqrt(1.+energy(nlevel-1)) ! limits on data points
         ymin=-ymax
         xmin=xin(nlevel-1)
         xmax=xout(nlevel-1)
         y0val=xmin
         x0val=0.
C
         if (mod(ngrf,2).eq.0) mgrf=ngrf+1
         npoints=ngrf                     ! keep number of points odd
C
         iline=1                          ! line and symbol styles
         isym=1
         ifreq=0
         nxtick=5
         nytick=5
C
         call convrt(gamma,cgamma,len)    ! titles and labels
         call icnvrt(nlevel,cn,nlen)
         info=' nlevel = '//CN(1:nlen)
         title='Semiclassically Quantized Trajectories, Gamma='//gamma
         label(1)='scaled position'
         label(2)='scaled wave number'
C
         call gtdev(device)               ! device nomination
         if (device.eq.screen) call gmode ! change to grafics mode
         call lnlnax                      ! draw axes
      endif
C
C     calculate classical phase space trajectory for each bound state
C     by finding the scaled wavenumber as a function of X and Energy
      do 50 ilevel=0,nlevel-1
         e=energy(ilevel)
         h=(xout(ilevel)-xin(ilevel))/((ngrf-1)/2) ! step size
         x(1)=xin(ilevel)
         k(1)=0.
C
         do 20 ix=1,(ngrf-1)/2
            x(ix+1)=xin(ilevel)+(ix)*h
            k(ix+1)=(e-pot(x(ix+1)))      ! scaled wave number
            if (k(ix).le.0) then
               k(ix)=0.
            else
               k(ix)=gamma*sqrt(k(ix))
            endif
   20    continue
C
         do 30 ix=(ngrf+1)/2,ngrf-1       ! graph is symmetric about x-axis
            x(ix+1)=x(ngrf-ix)
            k(ix+1)=-k(ngrf-ix)
   30    continue
C
C        output result
         if (device.eq.file) then
            write (gunit,75) e
            write (gunit,70) (x(ix,k(ix),ix=1,ngrf)
         else
            call xyplot(x,k)
         endif
   50 continue
C
C     end graphing sessin
      if (device.ne.file) call gpage(device) ! close graphing package
      if (device.eq.screen) call tmode       ! switch to text mode
C
   70 format (2(5x,e11.3))
   75 format (/,' Position vs. wave number for Energy =',1pe11.3)
  100 format (/,' Patience, please; output going to a file.')
C
      return
      end

