      program prg
      i=1
      j=2
      print 10, i, j, add(i,j)
   10 format(i1,' + ',i1,' = ',i1)
      stop
      end
      
      function add(i, j)
      add=i+j
      end
