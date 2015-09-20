program omp_do
integer,parameter::n=100
double precision :: a(n,n,n)
integer ::i,j,k
real :: fstart,fstop
   call cpu_time(fstart)

   do i=1,n
      do j=1,n
         do k=1,n
            a(i,j,k)=dble(i*j*k)
            print*,a(i,j,k)
         enddo
      enddo
   enddo

   call cpu_time(fstop)
   
   write(unit=0,fmt=*) 'Time: ',fstop-fstart
stop
end

