      program isum
      implicit integer*8(a-z)
      nsum=0
      i=1
      do
         read(unit=*,fmt=*,iostat=ierr,end=10) k
         if (ierr.ne.0) then
            write(unit=0,fmt=100) i
            cycle
         endif
         i=i+1
         nsum=nsum+k
      enddo
   10 continue
      print*,nsum,i
      stop
  100 format("isum: Entry #",i10," is not an integer.",/,
     *       "It will be skipped")
      end

