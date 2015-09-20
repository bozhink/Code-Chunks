cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine pcheck
C ensure that the number of states is not greater than the size of
C the data arrays; if so prompt for smaller GAMMA
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C Global parameters:
      include 'param.e1'
      include 'menu.all'
      include 'io.all'
      include 'map.e1'
C Local parameters:
      real S                              ! action
      real E                              ! small negative energy
      real x1,x2                          ! classical turning points
C Function:
      real getflt                         ! returns a floating point varable
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
   10 if ((nlevel-1).gt.maxlvl) then
         write(ounit,15) nlevel,maxlvl
         mhilim(igamma)=gamma
         mreals(igamma)=getflt(mreals(igamma)/2,mlolim(igamma),
     +                 mhilim(igamma),'Enter a smaller gamma')
         gamma=mreals(igamma)
C
         e=-etol
         call action(e,x1,x2,s)
         nlevel=int(s/pi+.5)+1
      goto 10
      endif
C
   15 format(' Total number of levels (=',i5,
     +       ') is larger than maximun allowable (=',i3,')')
C
      return
      end

