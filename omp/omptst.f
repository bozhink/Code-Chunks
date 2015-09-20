      program hello90
      use omp_lib
      integer :: id, nthr
      !$omp parallel private(id)
      id = omp_get_thread_num()
      write(*,*) 'Hello World from thread ', id
      !$omp barrier
      if (id==0) then
         nthr = omp_get_num_threads()
         write(*,*) 'There are ', nthr, ' threads'
      endif
      !omp end parallel
      stop
      end

