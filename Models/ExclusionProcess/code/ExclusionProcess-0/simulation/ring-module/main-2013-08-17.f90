! file: main.f90
! author: Bozhin Karaivanov
! date created: 17.08.2013
! last modified: 17.08.2013

program ring_driver
   use tasep_ring
   implicit none
   integer, parameter :: nn = 2 ! number of particles
   integer, parameter :: ll = 4 ! lattice size
   integer, parameter :: kk = 6 ! number of states
   integer :: i, j
   
   call system_clock (i)
   call srand(i)
   
   call init(ll, nn, 1.0, 0.0)

   do i = 1, kk
      print "(i1,3(1x,i1))", C42(:,i)
   enddo
   
   call randomize()
   
   print*, chain

   call finalize()









end program ring_driver

