      block data initcb
      parameter (idimv=10)
      dimension a(idimv), b(idimv)
      common /cb/ a, b
      data a/idimv*1.0/, b/idimv*2.0/
      end
      
      program cbtest
      dimension a(10),b(10)
      common /cb/ a,b
      do 10 i=1,10
      print*,a(i),b(i)
   10 continue
      pause 'Press any key...'
      stop 'Program exiting..'
      end
