* fdlluse.for
*
*$pragma aux PADD "padd" parm( value )
      integer padd, x, y
      external padd
      x=1
      y=2
      print 10, x, y, padd(x,y)
   10 format(i1,' + ',i1,' = ',i1)
      stop
      end

