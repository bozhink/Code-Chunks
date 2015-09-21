! file: main.f90
! author: Bozhin Karaivanov
! date created: 17.08.2013
! last modified: 18.08.2013

program ring_driver
   use tasep_ring
   implicit none
   integer, parameter :: nn = 2 ! number of particles
   integer, parameter :: ll = 8 ! lattice size
   integer, parameter :: kk = 6 ! number of states
   integer :: i, j
   character(len=13) :: frmt
   write (unit=frmt, fmt="('(i1,'i2'(1xi1))')") ll - 1
   
   call system_clock (i)
   call srand(i)
   
   call init(ll, nn, 1.0, 0.0)

   do i = 1, kk
      print "(i1,3(1x,i1))", C42(:,i)
   enddo
   print*
   call randomize()
   print frmt, chain
   call backward_sequental_position_update(4)
   print frmt, chain
   call backward_sequental_position_update(4)
   print frmt, chain
   call backward_sequental_position_update(4)
   print frmt, chain
   call backward_sequental_position_update(4)
   print frmt, chain
   print*
   call randomize()
   print frmt, chain
   call backward_sequental_particle_update(4)
   print frmt, chain
   call backward_sequental_particle_update(4)
   print frmt, chain
   call backward_sequental_particle_update(4)
   print frmt, chain
   call backward_sequental_particle_update(4)
   print frmt, chain

   call finalize()

end program ring_driver

