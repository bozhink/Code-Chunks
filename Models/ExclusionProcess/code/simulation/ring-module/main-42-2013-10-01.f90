! file: main-42.f90
! author: Bozhin Karaivanov
! date created: 01.10.2013
! last modified: 01.10.2013

program ring_driver
   use tasep_ring
   implicit none
   integer, parameter :: nn = 2 ! number of particles
   integer, parameter :: ll = 4 ! lattice size
   integer, parameter :: kk = 6 ! number of states
   integer, parameter :: niter = 10000 ! number of iterations
   integer, dimension(kk, kk) :: t_matrix
   integer, dimension(ll, kk) :: j_matrix
   integer :: i, j
   real :: p, q
   double precision :: dm, dstd
   character(len=13) :: frmt, frmt1
   write (unit=frmt, fmt="('(i6,'i2'(1xi6))')") kk - 1
   
   p = 0.5
   q = 0.5
   
   call system_clock (i)
   call srand(i)
   
   call init(ll, nn, p, q, p, p)
   
   call bsu_periodic_position_t_matrix_42 (4, niter, t_matrix, j_matrix)
   
   print "('T-matrix:')"
   print "('^^^^^^^^^')"
   do i = 1, kk
      print frmt, t_matrix(i,:)
   enddo
   print*
   print "('J-matrix:')"
   print "('^^^^^^^^^')"
   do i = 1, ll
      print frmt, j_matrix(i, :)
   enddo

   
   call finalize()
end program ring_driver

