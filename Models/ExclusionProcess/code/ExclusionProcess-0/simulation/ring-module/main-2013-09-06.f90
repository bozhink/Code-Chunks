! file: main.f90
! author: Bozhin Karaivanov
! date created: 17.08.2013
! last modified: 06.09.2013

program ring_driver
   use tasep_ring
   use statistics
   implicit none
   integer, parameter :: nn = 2 ! number of particles
   integer, parameter :: ll = 4 ! lattice size
   integer, parameter :: kk = 6 ! number of states
   integer, parameter :: niter = 10000 ! number of iterations
   integer :: i, j
   real :: p, q
   double precision :: dm, dstd
   character(len=13) :: frmt, frmt1
   write (unit=frmt, fmt="('(i1,'i2'(1xi1))')") ll - 1
   write (unit=frmt1, fmt="('(i6,'i2'(1xi6))')") ll - 1
   
   p = 1.0
   q = 0.0
   
   call system_clock (i)
   call srand(i)
   
   call init(ll, nn, p, q, p, p)

   !do i = 1, kk
   !   print "(i1,3(1x,i1))", C42(:,i)
   !enddo
   !print*
   !call randomize()
   !print frmt, chain
   !do i = 1, 5
   !   print*
   !   call backward_sequental_position_update_periodic(4)
   !   print frmt, chain
   !   print frmt, icurrent
   !enddo
   !print*
   !print*
   !call randomize()
   !print frmt, chain
   !do i = 1, 5
   !   print*
   !   call backward_sequental_particle_update_periodic(4)
   !   print frmt, chain
   !   print frmt, icurrent
   !enddo
   
   call bsu_open_multiple(niter)
   print*
   print "('BSU histogram')"
   print frmt1, cumulative_histogram
   print "('Cumulative histogram sum: ',i6)", sum(cumulative_histogram)
   print*
   print "('BSU current')"
   print frmt1, cumulative_current
   print "('Cumulative current sum: ',i6)", sum(cumulative_current)
   print*
   print "('Out flux: ',i6)", out_flux
   print "('In flux:  ',i6)", in_flux
   print "('Summary:  ',i6)", sum(cumulative_histogram)+out_flux-in_flux
   print*
   print*
   call bsu_periodic_position_multiple(niter)
   print*
   print "('BSU histogram')"
   print frmt1, cumulative_histogram
   print "('Cumulative histogram sum: ',i6)", sum(cumulative_histogram)
   dm = damean(ll, cumulative_histogram)
   dstd = dastdev(ll, cumulative_histogram)
   print "('Average histogram value:  ',f11.4)", dm
   print "('Standard deviation value: ',f11.4)", dstd
   print "('Relative deviation value: ',f11.4)", dstd/dm
   print*
   print "('BSU current')"
   print frmt1, cumulative_current
   print "('Cumulative current sum:   ',i6)", sum(cumulative_current)
   dm = damean(ll, cumulative_current)
   dstd = dastdev(ll, cumulative_current)
   print "('Average current value:    ',f11.4)", dm
   print "('Standard deviation value: ',f11.4)", dstd
   print "('Relative deviation value: ',f11.4)", dstd/dm
   
   call finalize()
end program ring_driver

