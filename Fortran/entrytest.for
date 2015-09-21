      program entrytest
      implicit real*8(a-h,o-z),integer(i-n)
      common /ca/ a
      call sub2(x)
      print*,x
      call sub1(x,y)
      print*,x,y
      pause
      print*,a,n
      pause
      stop
      end
      
      subroutine sub1(x,y)
      implicit real*8(a-h,o-z),integer(i-n)
      x=1.
      y=2.
      goto 30
      entry sub2(x)
      x=1.5
   30 return
      end
 
      block data cb
      implicit real*8(a-h,o-z),integer(i-n)
      parameter (n=10)
      common /ca/ a
      data a /1.d0/
      end
