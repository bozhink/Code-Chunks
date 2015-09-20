c file setup.for
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine setup
c allows users to supply i/o parameters for their computing environment
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c Global variables:
      include 'io.all'
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c     fortran unit numbers for i/o
c     unit for text output to a file
      tunit=10
c     unit for graphics output to file
      gunit=20
c     unit for input from keyboard
      iunit=5
c     unit for output to screen
      ounit=6
c     unit for input of data
      dunit=11
c
c     how many lines and columns of text fit on your screen?
      trmlin=24
      trmwid=80
c
c     default output parameters
c     There are five  forms of uotput provided, here you are choosing
c     which forms of output you will want MOST of the time (any
c     combination is possible), you always have the option to change
c     your mind at run time.
c     0=no     1=yes
c     do you want text sent to the screen?
      txttrm=1
c     do you eant graphics sent to the screen?
      grftrm=0
c     do you want graphics sent to a hardcopy device?
      grfhrd=0
c     do you want graphics data sent to a file?
      grffil=0
c
      return
      end
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine clear
c clears text screen by sending an escape sequence;
c check your terminal manual for the correnct sequence
c THIS IS NOT AN ESSENTIAL ROUTINE - YOU CAN LEAVE IT BLANK
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c Global variables:
      include 'io.all'
c Local variables:
      character*1 esc1(4),esc2(6)         ! escape characters
      integer i,i1,i2                     ! index of escape sequence arrays
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c VT200 terminal; text mode
      esc1(1)=char(27)                                                  ! <ESC>[2J
      esc1(2)=char(91)
      esc1(3)=char(50)
      esc1(4)=char(74)
      i1=4
      esc2(1)=char(27)                                                   ! <ESC>11;1f
      esc2(2)=char(91)
      esc2(3)=char(49)
      esc2(4)=char(59)
      esc2(5)=char(49)
      esc2(6)=char(102)
      i2=6
c
c TEK4010
c      esc1(1)=char(27)                                                  ! <ESC><FF>
c      esc1(2)=char(12)
c      i1=2
c      i2=0
c
c PST (Prime)
c      esc1(1)=char(27)                                                  ! <ESC>?
c      esc1(2)=char(63)
c      i1=2
c      i2=0
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      write(ounit,10) (esc1(i),i=1,i1)
c      write(ounit,10) (esc2(i),i=1,i2)
   10 format(1x,6a1)
      return
      end
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine gmode
c switches terminal from text to graphics mode
c by writing harwere dependent escape sequence to the terminal
c This routine contains the escape sequence for a Graphon terminal
c to switch between VT200 and TEK4014 modes
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c Global variables:
      include 'io.all'
c Local varibales:
      character*1 esc(2)
      esc(1)=char(27)                                                    ! ascii code for <ESC> 1
      esc(2)=char(49)
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      write(punit,10) esc(1),esc(2)
   10 format(1x,2a1)
      return
      end
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
      subroutine tmode
c switches terminal from graphics to text mode
c by writing harware dependent escape sequences to the terminal
c This routine contains the escape sequence for a Graphon terminal
c to switch between TEK4014 and VT200 modes
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c Global variables:
      include 'io.all'
c Local variables:
      character*1 esc(2)
      esc(1)=char(27)                                                    ! ascii code <ESC> 2
      esc(2)=char(50)
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c      write(ounit,10) esc(1),esc(2)
   10 format (1x,2a1)
      return
      end
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
