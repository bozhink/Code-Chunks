      program speed
      implicit double precision(a-h,o-z),integer(i-n)
      parameter (n=1000)
      dimension a(n, n),b(n, n),c1(n, n)
      real tstart, tstop

      print *, 'Timing report'

      call system_clock(iclock)
*      call srand(iclock)
      
      do 10 i=1,n
      do 10 j=1,n
         a(i,j) = rand()
         b(i,j) = rand()
   10 continue
   
      call cpu_time(tstart)
      do k=1,n
         do j=1,n
            do i=1,n
               c1(i,j)=c1(i,j)+a(i,k)*b(k,j)
            enddo
         enddo
      enddo
      call cpu_time(tstop)
      print*
      print *,tstop-tstart,' seconds'
      stop
      end

