! file dla.f90
! date created: 31.07.2014
! last modified: 01.08.2014
! author: Bozhin Karaivanov
!
! Diffusion limited aggregation simulation
!
program dla
   implicit none
   integer, parameter :: N = 10000 ! number of iterations
   integer, parameter :: L = 1000 ! size of lattice
   integer, dimension(L,L) :: lattice ! array for the lattice
   integer :: iclock, iclock1
   integer :: iter, x, y
   integer :: x_first, y_first ! coordinates of the first particle
   logical :: running

   x_first = L / 2 + 1
   y_first = L / 2 + 1

   ! Initialization of the pseudorandom generator
   call system_clock(iclock)
   call srand(iclock)

   ! Initialization of the lattice
   do x = 1, L
      do y = 1, L
         lattice(x, y) = 0
      enddo
   enddo
   lattice(x_first, y_first) = 1

   ! Main part of the simulation
!call system_clock(iclock)
   do iter = 1, N
!call system_clock(iclock1)
!write(unit=0, fmt=*) iter, iclock1-iclock
!iclock = iclock1
      call startpos(L, x, y)
      running = .true.
      do
         ! Test if there is non-zero neighbour
         ! East
         call testneigh(L, lattice, x, y, x+1, y, running)
         if (.not.running) exit
         ! West
         call testneigh(L, lattice, x, y, x-1, y, running)
         if (.not.running) exit
         ! North
         call testneigh(L, lattice, x, y, x, y+1, running)
         if (.not.running) exit
         ! South
         call testneigh(L, lattice, x, y, x, y-1, running)
         if (.not.running) exit
         !
         ! If there is no any non-zero neighbour, make a step to
         ! a random neighbour
         call nextpos(x, y)
      enddo
   enddo

   ! Print result
   do x = 1, L
      do y = 1, L
         if (lattice(x, y).ne.0) then
            print *, x, y, lattice(x, y)
         endif
      enddo
   enddo

contains

subroutine testneigh(L, lattice, x, y, x1, y1, running)
   implicit none
   logical, intent(out) :: running
   integer, intent(in) :: L, x, y, x1, y1
   integer, dimension(:,:), intent(in out) :: lattice
   running = .true.
   if (lattice(x,y).ne.0) then
      running = .false.
      return
   endif
   if (x1.ge.1.and.x1.le.L.and.y1.ge.1.and.y1.le.L) then
      if (lattice(x1,y1).ne.0) then
         running = .false.
         lattice(x,y) = 1
      endif
   endif
end subroutine testneigh

subroutine startpos(L, x, y)
   implicit none
   integer, intent(in) :: L
   integer, intent(out) :: x, y
   integer :: iside, ipos ! choose the side and the position for
                          ! the new particle added to the system
   ipos = int(L*rand()) + 1
   iside = int(4.0*rand())
   select case (iside)
      case (0)
         x = 1
         y = ipos
      case (1)
         x = L
         y = ipos
      case(2)
         x = ipos
         y = 1
      case default
         x = ipos
         y = L
   end select
end subroutine startpos


subroutine nextpos(x,y)
   implicit none
   integer, intent(in out) :: x, y
   integer :: x1, y1
   integer :: idirect, imagn ! direction and magnitude of the new
                             ! randomly chosen position
   idirect = int(2.0*rand())     ! Choose the direction: X or Y
   imagn = 2*int(2.0*rand()) - 1 ! Choose a neighbour in this direction
   select case(idirect)
      case (0)     ! X direction
         x1 = x + imagn
         if (x1.ge.1.and.x1.le.L) then
            x = x1
         else
            x = x - imagn
         endif
      case default ! Y direction
         y1 = y + imagn
         if (y1.ge.1.and.y1.le.L) then
            y = y1
         else
            y = y - imagn
         endif
   end select
end subroutine nextpos

end program dla

