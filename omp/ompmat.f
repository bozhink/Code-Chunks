      program open mp matrices test
      implicit double precision(a-h,o-z),integer(i-n)
      parameter(n=1000)
      dimension a(n,n),b(n,n),c(n,n)
c$OMP PARALLEL PRIVATE(id)
      call init_random_seed()
      
      call random_number(a)
      call random_number(b)
      
      c=0.d0
      i=1
      j=1
      k=1
      
      call cpu_time(dstart)
c$OMP PARALLEL DO
      do 10 i=1,n
c      do 10 j=1,n
c      do 10 k=1,n
         c(i,j) = c(i,j) + a(i,k)*b(k,j)
   10 continue
c$OMP END PARALLEL DO
      call cpu_time(dstop)
      
      print *, 'Time elapsed: ', dstop-dstart, dstart,dstop
c$OMP END PARALLEL
      stop
      end

      
      
