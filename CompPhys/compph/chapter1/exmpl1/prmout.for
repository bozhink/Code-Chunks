cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine prmout(munit,nlines)
C outputs parameter summary to the specified unit
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
C Global variables:
      include 'io.all'
      include 'param.e1'
C Input/Output variables:
      integer munit                       ! unit number for output (input)
      integer nlines                      ! number of lines written so far (output)
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      if (munit.eq.ounit) call clear
C
      write (munit,2)
      write (munit,4)
      write (munit,6) etol,xtol
      write (munit,8) npts
      write (munit,10) gamma,nlevel
      write (munit,12)
      write (munit,2)
C
      if (munit.ne.gunit) then
         write (munit,20)
         write (munit,25)
      endif
C
      nlines=7
C
    2 format (' ')
    4 format (' Output from example 1: Bohr Sommerfeld Quantization')
    6 format (' Energy tolerance =',e12.5,
     +        '   position tolerance =',e12.5)
    8 format (' number of quadrature points =',i4)
   10 format (' For gamma =',F8.2,' there are ',I4,' levels:')
   12 format (' (all quantities are expressed in scaled units)')
   20 format (8x,'Level',8x,'Energy',12x,'Xmin',12x,'Xmax')
   25 format (8x,'-----',8x,'------',12x,'----',12x,'----')
C
      return
      end

