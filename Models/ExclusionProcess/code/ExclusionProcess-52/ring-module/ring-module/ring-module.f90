! file: ring-module.f90
! author: Bozhin Karaivanov
! date created: 17.08.2013
! last modified: 18.08.2013
module tasep_ring
   implicit none
   ! Variables
   public :: C41, C42, C43, n_states_41, n_states_42, n_states_43
   public :: chain, icurrent, histogram, current, &
             cumulative_histogram, cumulative_current
   private :: chain_old, position
   private :: N, L, p, q
   integer :: N ! Number of particles in the chain
   integer :: L ! Number of lattice positions
   real :: p ! Probability for transition to next position
   real :: q ! Secondary probability for transition (senseless in parallel update)
   integer, allocatable, dimension (:) :: chain     ! The main chain array
   integer, allocatable, dimension (:) :: chain_old ! Auxiliary chain array
   integer, allocatable, dimension (:) :: position  ! Array of particles positions
   integer, allocatable, dimension (:) :: icurrent  ! Current array
   integer, allocatable, dimension (:) :: histogram ! Histogram of output states
   integer, allocatable, dimension (:) :: current   ! Current distribution
   integer, allocatable, dimension (:) :: cumulative_histogram
   integer, allocatable, dimension (:) :: cumulative_current
   integer, parameter :: n_states_41 = 4 ! number of states for L=4, N=1
   integer, parameter :: n_states_42 = 6 ! number of states for L=4, N=2
   integer, parameter :: n_states_43 = 4 ! number of states for L=4, N=3
   ! state matrix for system of L=4 positions with 1 particle
   integer, dimension(4,n_states_41), parameter :: C41 = reshape ( &
                                 (/ (/ 1, 0, 0, 0 /),    & ! column 1
                                    (/ 0, 1, 0, 0 /),    & ! column 2
                                    (/ 0, 0, 1, 0 /),    & ! colimn 3
                                    (/ 0, 0, 0, 1 /) /), & ! column 4
                                    (/ 4, 4 /))            ! shape
   ! state matrix for system of L=4 positions with 2 particles
   integer, dimension(4,n_states_42), parameter :: C42 = reshape ( &
                                 (/ (/ 1, 1, 0, 0 /),    & ! column 1
                                    (/ 0, 1, 1, 0 /),    & ! column 2
                                    (/ 0, 0, 1, 1 /),    & ! column 3
                                    (/ 1, 0, 0, 1 /),    & ! column 4
                                    (/ 1, 0, 1, 0 /),    & ! column 5
                                    (/ 0, 1, 0, 1 /) /), & ! column 6
                                    (/ 4, 6 /))            ! shape
   ! state matrix for system of L=4 positions with 3 particles
   integer, dimension(4,n_states_43), parameter :: C43 = reshape ( &
                                 (/ (/ 0, 1, 1, 1 /),    & ! column 1
                                    (/ 1, 0, 1, 1 /),    & ! column 2
                                    (/ 1, 1, 0, 1 /),    & ! column 3
                                    (/ 1, 1, 1, 0 /) /), & ! column 4
                                    (/ 4, 4 /))            ! shape
   
   ! Subroutines and functions
   public :: init, finalize, randomize
   private :: error_ngl
   
contains
   
   subroutine error_ngl ()
      write (unit=0, fmt="('Number of particles can not be greater than the number of positions')")
      stop 'ERROR: N > L'
   end subroutine error_ngl
   
   
   subroutine init (chain_size, particles_num, primary_p, secondary_p)
   ! This subroutine allocates needed memory by the arrays
      implicit none
      integer, intent(in) :: chain_size    ! Size of the chain
      integer, intent(in) :: particles_num ! Number of particles
      real, intent(in) :: primary_p     ! Primary probability
      real, intent(in) :: secondary_p   ! Secondary probability
      L = chain_size
      N = particles_num
      p = primary_p
      q = secondary_p
      if (N.gt.L) call error_ngl ()
      allocate (chain(chain_size), chain_old(chain_size), icurrent(chain_size))
      allocate (histogram(chain_size), current(chain_size))
      allocate (cumulative_histogram(chain_size))
      allocate (cumulative_current(chain_size))
      allocate (position(particles_num))
   end subroutine init
   subroutine finalize ()
   ! This subroutine deallocates allocated memory
      deallocate (chain, chain_old, icurrent, histogram, current)
      deallocate (cumulative_histogram)
      deallocate (cumulative_current)
      deallocate (position)
   end subroutine finalize
   
   subroutine randomize()
   ! This subroutine creates the initial state of the chain
      implicit none
      integer :: i, k
      if (N.gt.L) call error_ngl
      do i = 1, L
         chain (i) = 0
      end do
      i = 1
      do while (i.le.N)
         k = int(L*rand()) + 1
         if (chain(k).eq.0) then
            chain(k) = 1
            i = i + 1
         end if
      end do
   end subroutine randomize

   subroutine update_sequental_step(i, j)
   ! This subroutine performs step from position i to position j
   ! in sequental update modes
      implicit none
      integer, intent(in) :: i ! Current position
      integer, intent(in) :: j ! Next position
      real :: prob
      if (chain_old(j).eq.1) then
         prob = q
      else
         prob = p
      end if
      if ((chain(i).eq.1).and.(chain(j).eq.0).and.(rand().lt.prob)) then
         ! Transition
         chain(j) = 1
         chain(i) = 0
         chain_old(i) = 1
         icurrent(j) = 1
      else
         icurrent(j) = 0
      end if
   end subroutine update_sequental_step
   subroutine update_parallel_step(i, j)
   ! This subroutine performs step from position i to position j
   ! in parallel update modes
      implicit none
      integer, intent(in) :: i ! Current position
      integer, intent(in) :: j ! Next position
      if ((chain_old(i).eq.1).and.(chain_old(j).eq.0).and.(rand().lt.p)) then
         ! Transition
         chain(j) = 1
         chain(i) = 0
         icurrent(j) = 1
      else
         icurrent(j) = 0
      end if
   end subroutine update_parallel_step
   
   subroutine chain_reset ()
      implicit none
      integer :: i
      do i = 1, L
         chain(i) = 0
         chain_old(i) = 0
         icurrent (i) = 0
         histogram (i) = 0
         current (i) = 0
      end do
   end subroutine chain_reset
   
   subroutine backward_sequental_position_update(start_position)
   ! This subroutine performs Backward Sequental Update rule by position
   ! WARNING: you must previously set the initial state of the chain-array
      implicit none
      integer, intent (in) :: start_position ! initial position to start the update algorithm
      integer :: i, j, k
      ! First: reset the auxiliary ('memory') array
      ! and the 'instant' current array
      do k = 1, L
         chain_old(k) = 0
         icurrent(k) = 0
      end do
      do k = L + start_position, start_position, -1
         i = mod (k - 1 + L, L) + 1
         j = mod (k + L, L) + 1
         call update_sequental_step(i, j)
      end do
   end subroutine backward_sequental_position_update
   
   subroutine get_positions()
   ! This subroutine calculates the positions of particles on the chain
      implicit none
      integer :: i, j
      i = 1
      do j = 1, L
         if (chain(j).eq.1) then
            position(i) = j
            i = i + 1
         end if
      end do
   end subroutine get_positions
   
   subroutine backward_sequental_particle_update(start_position)
   ! This subroutine performs Backward Sequental Update rule by particles
   ! WARNING: you must previously set the initial state of the chain-array
      implicit none
      integer, intent (in) :: start_position ! initial position to start the update algorithm
      integer :: i, j, k, kk, k1
      ! First: reset the auxiliary ('memory') array
      ! and the 'instant' current array
      do k = 1, L
         chain_old(k) = 0
         icurrent(k) = 0
      end do
      ! Next: Get positions of particles
      call get_positions()
      ! Next: Get start particle
      kk = N
      do k = N, 1, -1
         i = start_position - position(k)
         if (i.ge.0) then
            kk = k
            exit
         end if
      end do
      ! Now kk is the particle which is the nearest to start_position
      do k = kk + N, kk, -1
         k1 = mod (k - 1 + N, N) + 1
         i = mod (position(k1) - 1 + L, L) + 1
         j = mod (position(k1) + L, L) + 1
         call update_sequental_step(i, j)
      end do
   end subroutine backward_sequental_particle_update




end module tasep_ring

