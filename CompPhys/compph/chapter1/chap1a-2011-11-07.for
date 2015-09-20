c chap1a.for
      x=1.
      exact=cos(x)
   10 print*,'Enter value of H (.le. 0 to stop)'
      read*,h
      if (h.le.0) stop
      fprime=(sin(x+h)-sin(x-h))/(2*h)
      diff=exact-fprime
      print 20,h,diff
   20 format(' h=',e15.8,5x,'error=',e15.8)
      goto 10
      end

