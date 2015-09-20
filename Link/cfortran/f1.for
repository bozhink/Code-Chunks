      program prg1
c$pragma aux cadd "!_"
      integer cadd
      i=1
      j=2
      print 10, i, j, cadd(i,j)
   10 format(i1,' + ',i1,' = ',i1)
      stop
      end
