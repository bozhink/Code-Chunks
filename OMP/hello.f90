program hello
use omp_lib
integer :: id, nthreads
!$omp parallel private(id)
id = omp_get_thread_num()
write(*,*) 'Hello World form thread',id
!$omp barrier
if (id==0) then
   nthreads=omp_get_num_threads()
   write(*,*) 'There are',nthreads,'threads'
endif
!$omp end parallel
!$omp parallel do
do id=1,20
print*,id
enddo
end program

