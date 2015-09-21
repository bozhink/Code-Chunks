! file: ring-module.f90
! author: Bozhin Karaivanov
! date created: 17.08.2013
! last modified: 30.09.2013
module tasep_ring
   implicit none
   ! Variables
   public :: C41, C42, C43
   public :: n_states_41, n_states_42, n_states_43
   public :: chain, histogram, cumulative_histogram
   public :: icurrent, current, cumulative_current
   public :: out_flux, iout_flux
   public :: in_flux, iin_flux
   private :: chain_old, position
   private :: N, L, p, q, alpha, beta
   integer :: N ! Number of particles in the chain
   integer :: L ! Number of lattice positions
   real :: p ! Probability for transition to next position
   real :: q ! Secondary probability for transition(senseless in parallel update)
   real :: alpha ! Probability to enter a particle from the left side
   real :: beta  ! Probability to exit a particle from the right side
   integer, allocatable, dimension(:) :: chain     ! The main chain array
   integer, allocatable, dimension(:) :: chain_old ! Auxiliary chain array
   integer, allocatable, dimension(:) :: position  ! Array of particles positions
   integer, allocatable, dimension(:) :: icurrent  ! Current array
   integer, allocatable, dimension(:) :: histogram ! Histogram of output states
   integer, allocatable, dimension(:) :: current   ! Current distribution
   integer, allocatable, dimension(:) :: cumulative_histogram
   integer, allocatable, dimension(:) :: cumulative_current
   integer :: out_flux, iout_flux ! Particles gone through the open boundary
   integer :: in_flux,  iin_flux  ! Particles came through the open boundary
   integer, parameter :: n_states_41 = 4 ! number of states for L=4, N=1
   integer, parameter :: n_states_42 = 6 ! number of states for L=4, N=2
   integer, parameter :: n_states_43 = 4 ! number of states for L=4, N=3
   ! state matrix for system of L=4 positions with 1 particle
   integer, dimension(4,n_states_41), parameter :: C41 = reshape( &
                                 (/ (/ 1, 0, 0, 0 /),    & ! column 1
                                    (/ 0, 1, 0, 0 /),    & ! column 2
                                    (/ 0, 0, 1, 0 /),    & ! colimn 3
                                    (/ 0, 0, 0, 1 /) /), & ! column 4
                                    (/ 4, 4 /))            ! shape
   ! state matrix for system of L=4 positions with 2 particles
   integer, dimension(4,n_states_42), parameter :: C42 = reshape( &
                                 (/ (/ 1, 1, 0, 0 /),    & ! column 1
                                    (/ 0, 1, 1, 0 /),    & ! column 2
                                    (/ 0, 0, 1, 1 /),    & ! column 3
                                    (/ 1, 0, 0, 1 /),    & ! column 4
                                    (/ 1, 0, 1, 0 /),    & ! column 5
                                    (/ 0, 1, 0, 1 /) /), & ! column 6
                                    (/ 4, 6 /))            ! shape
   ! state matrix for system of L=4 positions with 3 particles
   integer, dimension(4,n_states_43), parameter :: C43 = reshape( &
                                 (/ (/ 0, 1, 1, 1 /),    & ! column 1
                                    (/ 1, 0, 1, 1 /),    & ! column 2
                                    (/ 1, 1, 0, 1 /),    & ! column 3
                                    (/ 1, 1, 1, 0 /) /), & ! column 4
                                    (/ 4, 4 /))            ! shape
   
   ! Subroutines and functions
   public :: init, finalize, randomize
   private :: error_ngl, error_l1
   
contains
   
   subroutine error_ngl()
      write(unit=0, fmt="('Number of particles can not be greater than the number of positions')")
      stop 'ERROR: N > L'
   end subroutine error_ngl
   subroutine error_l1()
      write(unit=0, fmt="('Length of the chain must be grater than 1')")
      stop 'ERROR: L <= 1'
   end subroutine error_l1
   
   
   subroutine init(chain_size, particles_num, primary_p, secondary_p, a, b)
   ! This subroutine allocates needed memory by the arrays
      implicit none
      integer, intent(in) :: chain_size    ! Size of the chain
      integer, intent(in) :: particles_num ! Number of particles
      real, intent(in) :: primary_p     ! Primary probability
      real, intent(in) :: secondary_p   ! Secondary probability
      real, intent(in) :: a ! Probability to enter particles from the left side
      real, intent(in) :: b ! Probability to exit particles from right side
      L = chain_size
      N = particles_num
      p = primary_p
      q = secondary_p
      alpha = a
      beta = b
      if(N.gt.L) call error_ngl()
      allocate(chain(chain_size), chain_old(chain_size), icurrent(chain_size))
      allocate(histogram(chain_size), current(chain_size))
      allocate(cumulative_histogram(chain_size))
      allocate(cumulative_current(chain_size))
      allocate(position(particles_num))
   end subroutine init
   subroutine finalize()
   ! This subroutine deallocates allocated memory
      deallocate(chain, chain_old, icurrent, histogram, current)
      deallocate(cumulative_histogram)
      deallocate(cumulative_current)
      deallocate(position)
   end subroutine finalize
   subroutine reset_probabilities(primary_p, secondary_p, a, b)
   ! This subroutine allocates needed memory by the arrays
      implicit none
      real, intent(in) :: primary_p     ! Primary probability
      real, intent(in) :: secondary_p   ! Secondary probability
      real, intent(in) :: a ! Probability to enter particles from the left side
      real, intent(in) :: b ! Probability to exit particles from right side
      p = primary_p
      q = secondary_p
      alpha = a
      beta = b
   end subroutine reset_probabilities
   
   subroutine randomize()
   ! This subroutine creates the initial state of the chain
      implicit none
      integer :: i, k
      if (N.gt.L) call error_ngl
      do i = 1, L
         chain(i) = 0
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
      if(chain_old(j).eq.1) then
         prob = q
      else
         prob = p
      end if
      if((chain(i).eq.1).and.(chain(j).eq.0).and.(rand().lt.prob)) then
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
      if((chain_old(i).eq.1).and.(chain_old(j).eq.0).and.(rand().lt.p)) then
         ! Transition
         chain(j) = 1
         chain(i) = 0
         icurrent(j) = 1
      else
         icurrent(j) = 0
      end if
   end subroutine update_parallel_step
   
   subroutine chain_reset()
      implicit none
      integer :: i
      do i = 1, L
         chain(i) = 0
         chain_old(i) = 0
         icurrent(i) = 0
         histogram(i) = 0
         current(i) = 0
      end do
   end subroutine chain_reset
   subroutine chain_reset_memory()
      implicit none
      integer :: i
      do i = 1, L
         chain_old(i) = 0
         icurrent(i) = 0
      enddo
   end subroutine chain_reset_memory
   subroutine get_positions()
   ! This subroutine calculates the positions of particles on the chain
      implicit none
      integer :: i, j
      i = 1
      do j = 1, L
         if(chain(j).eq.1) then
            position(i) = j
            i = i + 1
         end if
      end do
   end subroutine get_positions
   
   subroutine backward_sequental_position_update_periodic(start_position)
   ! This subroutine performs Backward Sequental Update rule by position
   ! with periodic boundary conditions
   ! WARNING: you must previously set the initial state of the chain array
      implicit none
      integer, intent(in) :: start_position ! initial position to start the update algorithm
      integer :: i, j, k
      ! First: reset the auxiliary('memory') array
      ! and the 'instant' current array
      call chain_reset_memory()
      do k = start_position + L, start_position + 1, -1
         i = mod(k - 1 + L, L) + 1
         j = mod(k + L, L) + 1
         call update_sequental_step(i, j)
      end do
   end subroutine backward_sequental_position_update_periodic

   subroutine backward_sequental_particle_update_periodic(start_position)
   ! This subroutine performs Backward Sequental Update rule by particles
   ! with periodic boundary conditions
   ! WARNING: you must previously set the initial state of the chain array
      implicit none
      integer, intent(in) :: start_position ! initial position to start the update algorithm
      integer :: i, j, k, kk, k1
      ! First: reset the auxiliary ('memory') array
      ! and the 'instant' current array
      call chain_reset_memory()
      ! Next: Get positions of particles
      call get_positions()
      ! Next: Find the 'start' particle
      kk = N
      do k = N, 1, -1
         i = start_position - position(k)
         if(i.ge.0) then
            kk = k
            exit
         end if
      end do
      ! Now kk is the particle which is the nearest to start_position
      do k = kk + N, kk + 1, -1
         k1 = mod(k - 1 + N, N) + 1
         i = mod(position(k1) - 1 + L, L) + 1
         j = mod(position(k1) + L, L) + 1
         call update_sequental_step(i, j)
      end do
   end subroutine backward_sequental_particle_update_periodic

   subroutine backward_sequental_update_open()
   ! This subroutine performs Backward Sequental Update rule (by position)
   ! with open boundary conditions.
   ! WARNING: you must previously set the initial state of the chain array
      implicit none
      integer :: k
      ! First: reset the auxiliary ('memory') array
      ! and the 'instant' current array
      call chain_reset_memory()
      ! Update the right boundary:
      iout_flux = 0
      if((chain(L).ne.0).and.(rand().lt.beta)) then
         chain(L) = 0
         chain_old(L) = 1
         iout_flux = 1
      endif
      ! Update the body of the chain
      do k = L-1, 1, -1
         call update_sequental_step(k, k+1)
      end do
      ! Update the left boundary of the chain
      iin_flux = 0
      if((chain(1).eq.0).and.(rand().lt.alpha)) then
         chain(1) = 1
         icurrent(1) = 1
         iin_flux = 1
      endif
   end subroutine backward_sequental_update_open

   subroutine bsu_open_multiple(number_of_iterations)
   ! This subroutine performs multiple runs of the
   ! subroutine backward_sequental_update_open
   ! using random initial seed on the chain
   ! and calculating the cumulative histogram and current
      implicit none
      integer, intent(in) :: number_of_iterations ! The number of required iterations
      integer :: i
      ! First do an initialization
      in_flux = 0
      out_flux = 0
      do i = 1, L
         cumulative_histogram(i) = 0
         cumulative_current(i) = 0
      enddo
      ! Next perform the iterations
      do i = 1, number_of_iterations
         call randomize()
         call backward_sequental_update_open()
         in_flux = in_flux + iin_flux
         out_flux = out_flux + iout_flux
         cumulative_histogram = cumulative_histogram + chain
         cumulative_current = cumulative_current + icurrent
      enddo
   end subroutine bsu_open_multiple
   
   subroutine bsu_periodic_position_multiple(number_of_iterations)
   ! This subroutine performs multiple runs of the
   ! subroutine backward_sequental_position_update_periodic
   ! using random initial seed on the chain
   ! and calculating the cumulative histogram and current
      implicit none
      integer, intent(in) :: number_of_iterations ! The total number of iterations
      integer :: i, k, niter, kniter
      ! First do an initialization
      do i = 1, L
         cumulative_histogram(i) = 0
         cumulative_current(i) = 0
      enddo
      ! Next perform the iterations
      kniter = number_of_iterations/L
      niter = number_of_iterations - L*kniter
      kniter = kniter + niter
      niter = L*kniter
      write(unit=0,fmt="('BSU: number of iterations used = ',i8)") niter
      do i = 1, L ! Choose different initial position
         !do k = 1, kniter ! Do kniter iterations starting from current position i
         !   call randomize()
         !   call backward_sequental_position_update_periodic(i)
         !   cumulative_histogram = cumulative_histogram + chain
         !   cumulative_current = cumulative_current + icurrent
         !enddo
         call bsu_periodic_position_i_multiple (i, kniter)
      enddo
   end subroutine bsu_periodic_position_multiple
   
   subroutine bsu_periodic_position_i_multiple (initial_position, number_of_iterations)
   ! This subroutine performs multiple runs of the
   ! subroutine backward_sequental_position_update_periodic
   ! using random initial seed on the chain
   ! and calculates the cumulative histogram and current
   ! without reinitialization of the 'memory' arrays
      implicit none
      integer, intent(in) :: initial_position ! Initial position to start the update algorithm
      integer, intent(in) :: number_of_iterations ! The number of runs (iterations) of the subroutine backward..
      integer :: i
      do i = 1, number_of_iterations
         call randomize()
         call backward_sequental_position_update_periodic(i)
         cumulative_histogram = cumulative_histogram + chain
         cumulative_current = cumulative_current + icurrent
      enddo
   end subroutine bsu_periodic_position_i_multiple
   
   ! Here comes some specific subroutines, related to the problem of
   ! a chain with length L=4 with N=1,2,3 particles on it
   
   subroutine bsu_periodic_position_i_multiple_42 (initial_position, initial_state, number_of_iterations, final_state)
   ! This subroutine performs multiple runs of the
   ! subroutine backward_sequental_position_update_periodic
   ! for the problem of a chain with length L=4 with N=2 particles on it
   ! using a fixed initial state initial_state=1,2,...,6
   ! and calculates the cumulative histogram and current
   ! without reinitialization of the 'memory' arrays
      implicit none
      integer, intent(in) :: initial_position ! Initial position to start the update algorithm
      integer, intent(in) :: initial_state ! The number of the state to initialize the chain
      integer, intent(in) :: number_of_iterations ! The number of runs (iterations) of the subroutine backward...
      integer, dimension (n_states_42), intent(out) :: final_state ! histogram of final states
      integer :: i, j
      if (initial_state.lt.1.or.initial_state.gt.n_states_42) then
         stop 'Invalid initial state in the 42 model'
      endif
      do j = 1, n_states_42 ! reset of the final_state array
         final_state(j) = 0
      enddo
      do i = 1, number_of_iterations
         chain = C42(:,initial_state)
         call backward_sequental_position_update_periodic(i)
         cumulative_histogram = cumulative_histogram + chain
         cumulative_current = cumulative_current + icurrent
         do j = 1, n_states_42 ! get the out state
            if (all( C42(:,j) == chain)) then
               final_state(j) = final_state(j) + 1
               exit
            endif
         enddo
      enddo
   end subroutine bsu_periodic_position_i_multiple_42
   
   subroutine bsu_periodic_position_t_matrix_42 (initial_position, number_of_iterations, t_matrix, j_matrix)
   ! This subroutine calculate the elements of the matrix of transition (T-matrix)
   ! in a model of a chain with length L=4 with N=2 on it.
   ! This subroutine returns as result the 6x6 T-matrix (t_matrix) and
   ! the 4x6 matrix of all currents in this model. The returned values
   ! are not normalized, i.e. t_matrix contains the number of occurences
   ! of a given state, not the probability of this state.
      implicit none
      integer, intent(in) :: initial_position ! Initial position to start the update algorithm
      integer, intent(in) :: number_of_iterations ! The number of iterations FOR EACH INITIAL STATE
      integer, dimension(n_states_42, n_states_42), intent(out) :: t_matrix ! The unnormalized matrix of the transitions
      integer, dimension(4, n_states_42), intent(out) :: j_matrix ! The unnormalize matrix of currents
      integer, dimension(n_states_42) :: final_states
      integer :: i, j
      do i = 1, n_states_42 ! iterations over all posible initial states
         do j = 1, L ! reset of the 'memory arrays'
            cumulative_histogram(j)=0
            cumulative_current(j)=0
         enddo
         call bsu_periodic_position_i_multiple_42 (initial_position, i, number_of_iterations, final_states)
         t_matrix(:,i) = final_states
         j_matrix(:,i) = cumulative_current
      enddo
   end subroutine bsu_periodic_position_t_matrix_42
   

end module tasep_ring

