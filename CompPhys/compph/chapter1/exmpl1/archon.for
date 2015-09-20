cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine archon
C finds the bound states of the Lennard-Jones potential
C from the Bohr-Sommerfeld quantization rule
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C Global variables:
      include 'io.all'
      include 'param.e1'
C Local variables:
      real S                              ! current value of action
      real e1                             ! current value of energy
      real x1,x2                          ! current turnung points
      real f1                             ! f=action/2-pi/2-ilevel*pi
      integer ilevel                      ! current level
      real energy(0:maxlvl)               ! energy og bound state
      real xin(0:maxlvl)                  ! inner turning point
      real xout(0:maxlvl)                 ! outer turning point
      integer nlines                      ! number of lines printed to terminal
      integer screen                      ! send to terminal
      integer paper                       ! make a hardcopy
      integer file                        ! send to a file
      data screen,paper,file/1,2,3/
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C output summary of parameters
      if (tterm) call prmout(ounit,nlines)
      if (tfile) call prmout(tunit,nlines)
      if (gfile) call prmout(dunit,nlines)
C
C     search for bound states
      e1=-1.                              ! begin at the well bottom
      f1=-pi/2                            ! the action is zero there
C
C     find the NLEVEL bound states
      do 100 ilevel=0,nlevel-1
C
         call search(ilevel,e1,f1,x1,x2)  ! search  for eigenvalue
         energy(ilevel)=e1                ! store values for this state
         xin(ilevel)=x1
         xout(ilevel)=x2
C
C        text output
         if (tterm) call txtout(ounit,ilevel,e1,x1,x2,nlines)
         if (tfile) call txtout(tunit,ilevel,e1,x1,x2,nlines)
C
         f1=f1-pi                         ! guess to begin search for next level
C
  100 continue
C
      if (tterm) call pause('to continue...',1)
      if (tterm) call clear
C
C     graphics output
      if (gterm)  call grfout(screen,energy,xin,xout)
      if (gfile)  call grfout(file,energy,xin,xout)
      if (ghrdcp) call grfout(paper,energy,xin,xout)
C
      return
      end

