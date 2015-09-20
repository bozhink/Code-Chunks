cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine txtout(munit,ilevel,e,x1,x2,nlines)
C writes results for one state to the requested unit
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C Global variables:
      include 'io.all'
C Input variables:
      integer munit                       ! output unit specified
      integer ilevel                      ! current level
      real e                              ! eigen energy
      real x1,x2                          ! classical turning points
      integer nlines                      ! number of lines printed so far
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C     if screen is full, clear screen and retype headings
      if ((mod(nlines,trmlin-6).eq.0)
     +    .and.(munit.eq.ounit)) then
         call pause('to continue...',1)
         call clear
         write (munit,20)
         write (munit,25)
      endif
C
      write (munit,30) ilevel,e,x1,x2
C
C     keep track of printed lines only for terminal output
      if (munit.eq.ounit) nlines=nlines+1
C
   20 format (8x,'Level',8x,'Energy',12x,'Xmin',12x,'Xmax')
   25 format (8x,'-----',8x,'------',12x,'----',12x,'----')
   30 format (8x,i4,3(8x,f8.5))
C
      return
      end

