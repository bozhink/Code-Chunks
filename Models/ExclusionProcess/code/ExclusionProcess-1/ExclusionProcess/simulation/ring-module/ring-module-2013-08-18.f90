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
   private :: chain_old
   private :: N, L, p, q
   integer :: N ! Number of particles in the chain
   integer :: L ! Number of lattice positions
   real :: p ! Probability for transition to next position
   real :: q ! Secondary probability for transition (senseless in parallel update)
   integer, allocatable, dimension (:) :: chain     ! The main chain array
   integer, allocatable, dimension (:) :: chain_old ! Auxiliary chain array
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
   end subroutine init
   subroutine finalize ()
   ! This subroutine deallocates allocated memory
      deallocate (chain, chain_old, icurrent, histogram, current)
      deallocate (cumulative_histogram)
      deallocate (cumulative_current)
   end subroutine finalize
   
   subroutine randomize()
   ! This subroutine creates the initial state of the chain
      implicit none
      integer :: i, k
      if (N.gt.L) call error_ngl
      do i = 1, L
         chain (i) = 0
      enddo
      i = 1
      do while (i.le.N)
         k = int(L*rand()) + 1
         if (chain(k).eq.0) then
            chain(k) = 1
            i = i + 1
         endif
      enddo
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
      endif
      if ((chain(i).eq.1).and.(chain(j).eq.0).and.(rand().lt.prob)) then
         ! Transition
         chain(j) = 1
         chain(i) = 0
         chain_old(i) = 1
         icurrent(j) = 1
      else
         icurrent(j) = 0
      endif
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
      endif
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
      enddo
   end subroutine chain_reset
   
   subroutine backward_sequental_position_update_42 (initial_state, niter)
   ! This subroutine performs Backward Sequental Update rule by position
   ! for system with L=4 and N=2
      implicit none
      integer, intent (in) :: initial_position ! initial position to start the update
      integer, intent (in) :: niter ! number of iterations
      integer :: i, j, k
      call chain_reset ()
      do k = 1, n_states_42
         chain = C42 (:, k)
         icurrent = (/ 0, 0, 0, 0 /)
         chain_old = (/ 0, 0, 0, 0 /)
      enddo
   end subroutine backward_sequental_position_update_42




end module tasep_ring

