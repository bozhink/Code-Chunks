! file: main-42.f90
! author: Bozhin Karaivanov
! date created: 01.10.2013
! last modified: 02.10.2013

program ring_driver
   use tasep_ring
   implicit none
   integer, parameter :: nn = 2 ! number of particles
   integer, parameter :: ll = 4 ! lattice size
   integer, parameter :: kk = 6 ! number of states
   integer, parameter :: niter = 10000 ! number of iterations
   integer, dimension(kk, kk) :: t_matrix
   integer, dimension(ll, kk) :: j_matrix
   real, dimension(kk, kk)    :: ft_matrix
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
      print "(f6.4,5(1xf6.4))", t_matrix(i,:)/(1.0*niter)
   enddo
   print*
   print "('J-matrix:')"
   print "('^^^^^^^^^')"
   do i = 1, ll
      print "(f6.4,5(1xf6.4))", j_matrix(i, :)/(1.0*niter)
   enddo
   
   call teoretical_values_42(p, q, ft_matrix)
   print*
   print "('teoretical T-matrix:')"
   print "('^^^^^^^^^^^^^^^^^^^^')"
   do i = 1, kk
      print "(f6.4,5(1xf6.4))", ft_matrix(i,:)
   enddo
   
   call finalize()
end program ring_driver

subroutine teoretical_values_42(p, q, t_matrix)
! This subroutine calculates the teoretical values of the elements
! of the transfer matrix. The returned result, t_matrix,
! is the transposed matrix, used for determination of the
! probabilities of the stationary state.
   implicit none
   real, intent(in) :: p, q
   real, dimension(6,6), intent(out) :: t_matrix
   ! row #1
   t_matrix(1,1) = 1.0-p
   t_matrix(1,2) = p*p*(1.0-q)
   t_matrix(1,3) = 0.0
   t_matrix(1,4) = p*q
   t_matrix(1,5) = p*p*q
   t_matrix(1,6) = p*(1-p)
   ! row #2
   t_matrix(2,1) = t_matrix(1,4)
   t_matrix(2,2) = t_matrix(1,1)
   t_matrix(2,3) = 0.0
   t_matrix(2,4) = 0.0
   t_matrix(2,5) = t_matrix(1,6)
   t_matrix(2,6) = 0.0
   ! row #3
   t_matrix(3,1) = 0.0
   t_matrix(3,2) = t_matrix(2,1)*t_matrix(1,1)
   t_matrix(3,3) = t_matrix(1,1)
   t_matrix(3,4) = 0.0
   t_matrix(3,5) = 0.0
   t_matrix(3,6) = t_matrix(1,6)
   ! row #4
   t_matrix(4,1) = 0.0
   t_matrix(4,2) = 0.0
   t_matrix(4,3) = 0.0
   t_matrix(4,4) = t_matrix(1,1)
   t_matrix(4,5) = t_matrix(1,6)
   t_matrix(4,6) = 0.0
   ! row #5
   t_matrix(5,1) = p*(1.0-q)
   t_matrix(5,2) = p*p*q
   t_matrix(5,3) = p
   t_matrix(5,4) = 0.0
   t_matrix(5,5) = t_matrix(1,1)*t_matrix(1,1)
   t_matrix(5,6) = p*p
   ! row #6
   t_matrix(6,1) = 0.0
   t_matrix(6,2) = t_matrix(5,1)*t_matrix(1,1)
   t_matrix(6,3) = 0.0
   t_matrix(6,4) = t_matrix(1,5)
   t_matrix(6,5) = t_matrix(1,2)
   t_matrix(6,6) = t_matrix(5,5)
end subroutine teoretical_values_42

