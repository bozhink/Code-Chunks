*$pragma aux RAND "!_"
*$pragma aux SRAND "!_"
**$pragma aux XXX "!" parm(value)
      integer rand
      external rand, srand
      i=102
      !call srand(i)
      do 10 k=1, 100
      j=rand()
      print*,j
   10 continue
      stop
      end
