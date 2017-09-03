program path_in_lattice
   implicit none
   integer, parameter :: idimx = 5, idimy = 6
   integer, dimension(idimx, idimy) :: lattice
   integer :: x, y

   call create_random_lattice(lattice, idimx, idimy)
   call print_lattice(lattice, idimx, idimy)
   
   y = 1
   do x = 1, idimx
      print *
      if (lattice(x, y).eq.1) then
         call walk(lattice, idimx, idimy, x, y)
      endif
      call reset_lattice(lattice, idimx, idimy)
   enddo

   print *
   call print_lattice(lattice, idimx, idimy)
   stop

contains

   subroutine create_random_lattice(lattice, idimx, idimy)
      implicit none
      integer, intent(in) :: idimx, idimy
      integer, intent(out), dimension(idimx, idimy) :: lattice
      integer, allocatable, dimension(:) :: seed
      integer :: n, values(1:8)
      real, dimension(idimx, idimy) :: a

      call date_and_time(values = values)
      call random_seed(size = n)
      allocate(seed(n))
      !call random_seed(get = seed)
      seed(:) = values(8)
      call random_seed(put = seed)
      call random_number(a)
      lattice = floor(2*a)
   end subroutine create_random_lattice
   
   subroutine print_lattice(lattice, idimx, idimy)
      implicit none
      integer, intent(in) :: idimx, idimy
      integer, intent(in out), dimension(1:idimx, 1:idimy) :: lattice
      integer :: x, y
      character(len=5) :: frmt
      
      write (unit = frmt, fmt = '("(",i1, "i1", ")")') idimy
      do x = 1, idimx
         print frmt, (lattice(x, y), y = 1, idimy)
      enddo
   end subroutine print_lattice
   
   subroutine reset_lattice(lattice, idimx, idimy)
      implicit none
      integer, intent(in) :: idimx, idimy
      integer, intent(in out), dimension(1:idimx, 1:idimy) :: lattice
      integer :: x, y
      do x = 1, idimx
         do y = 1, idimy
            if (lattice(x, y).gt.0) lattice(x, y) = 1
         enddo
      enddo
   end subroutine reset_lattice
   
   subroutine walk(lattice, idimx, idimy, xin, yin)
      use path_constants
      implicit none
      integer, intent(in) :: idimx, idimy
      integer, intent(in out), dimension(1:idimx, 1:idimy) :: lattice
      integer, intent(in) :: xin, yin
      integer, dimension(number_of_neighbours) :: xout, yout
      integer :: i, x, y
      logical :: isnext
      
      x = xin
      y = yin
      isnext = .true.
      do while (isnext)
         isnext = .false.
         if (lattice(x, y).eq.1) then
            print *, x, y
            lattice(x, y) = 2
            call test_state(lattice, idimx, idimy, x, y, xout, yout)
            do i = 1, number_of_neighbours
               if (xout(i).gt.0.and.yout(i).gt.0) then
                  x = xout(i)
                  y = yout(i)
                  isnext = .true.
                  exit
               endif
            enddo
         endif
         if (y.eq.idimy) then
            print '(//,"Path is found!",//)'
            return
         endif
      enddo
   end subroutine walk

   subroutine test_state(lattice, idimx, idimy, xin, yin, xout, yout)
      use path_constants
      implicit none
      integer, intent(in) :: idimx, idimy
      integer, dimension(idimx, idimy), intent(in) :: lattice
      integer, intent(in) :: xin, yin
      integer, dimension(number_of_neighbours), intent(out) :: xout, yout
      logical :: isnext, lx, ly
      integer :: x, y, i

      do i = 1, number_of_neighbours
         x = xin + dx(i)
         y = yin + dy(i)
         lx = (x.ge.1).and.(x.le.idimx)
         ly = (y.ge.1).and.(y.le.idimy)
         if (lx.and.ly) then
            isnext = is_next(lattice, x, y)
            if (isnext) then
               xout(i) = x
               yout(i) = y
            else
               xout(i) = 0
               yout(i) = 0
            endif
         endif
      enddo
   end subroutine test_state
   
   function is_next(lattice, x, y) result (isnext)
      implicit none
      integer, dimension(:, :), intent(in) :: lattice
      integer, intent(in) :: x, y
      logical :: isnext

      isnext = lattice(x, y).eq.1
   end function is_next

end program path_in_lattice

