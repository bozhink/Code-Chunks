cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine param
C gets parameters from screen
C ends program on request
C closes old files
C maps menu variables to program variables
C opens new files
C calculates all derivative parameters
C performs checks on parameters
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C Global variables:
      include 'menu.all'
      include 'io.all'
      include 'param.e1'
      include 'map.e1'
C Local variables:
      real S                              ! current value of action
      real e1                             ! current value of energy
      real x1,x2                          ! current turning points
C Function:
      logical logcvt                      ! converts 1 and 0 to true and false
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C     get input from terminal
      call clear
      call ask(1,istop)
C
C     stop program if requested
      if (mreals(imain).eq.stop) call finish
C
C     close files if necessary
      if (tname.ne.mstrng(mints(itname)))
     +   call flclos(tname,tunit)
      if (gname.ne.mstrng(mints(igname)))
     +   call flclos(gname,gunit)
C
C     physical and numericcal parameters
      gamma=mreals(igamma)
      etol=mreals(ietol)
      xtol=mreals(ixtol)
      npts=mints(inpts)
C
C     text output parameters
      tterm=logcvt(mints(itterm))
      tfile=logcvt(mints(itfile))
      tname=mstrng(mints(itname))
C
C     graphics output parameters
      gterm=logcvt(mints(igterm))
      ghrdcp=logcvt(mints(ighrd))
      gfile=logcvt(mints(igfile))
      gname=mstrng(mints(igname))
      ngrf=mints(ingrf)
C
C     open files
      if (tfile) call flopen(tname,tunit)
      if (gfile) call flopen(gname,gunit)
C     files may have been renamed
      mstrng(mints(itname))=tname
      mstrng(mints(igname))=gname
C
C     calculate total number of levels
      e1=-etol
      call action(e1,x1,x2,s)
      nlevel=int(s/pi-.5)+1
C     check value of GAMMA
      call pcheck
C
      call clear
C
      return
      end

