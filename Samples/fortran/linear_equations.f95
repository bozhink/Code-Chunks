module solve_module
public :: solve_linear_equations
contains
subroutine solve_linear_equations (a, x, b, error)

   real, dimension (:, :), intent (in) :: a
   real, dimension (:), intent (out) :: x
   real, dimension (:), intent (in) :: b
   logical, intent (out) :: error
   real, dimension (:, :), allocatable :: m
   real, dimension (:), allocatable :: temp_row
   integer, dimension (1) :: max_loc
   integer :: n, k, k_swap

   n = size (b)
   error = size (a, dim=1) /= n .or.  &
           size (a, dim=2) /= n
   if (error) then
      x = 0.0
   else

      allocate (m (n, n + 1))
      allocate (temp_row (n + 1))
      m (1:n, 1:n) = a
      m (1:n, n+1) = b

      ! Triangularization phase
      triang_loop: do k = 1, n

         ! Move largest possible element to diagnoal
         max_loc = maxloc (abs (m (k:n, k)))
         k_swap = k - 1 + max_loc (1)
         temp_row (k:n+1) = m (k, k:n+1)
         m (k, k:n+1) = m (k_swap, k:n+1)
         m (k_swap, k:n+1) = temp_row (k:n+1)

         if (m (k, k) == 0) then
            error = .true.
            exit triang_loop
         else
            m (k, k:n+1) = m (k, k:n+1) / m (k, k)
            m (k+1:n, k+1:n+1) = m (k+1:n, k+1:n+1) -  &
               spread (m (k, k+1:n+1), 1, n-k) *  &
               spread (m (k+1:n, k), 2, n-k+1)
         end if

      end do triang_loop

      ! Back substitution phase
      if (error) then
         x = 0.0
      else
         do k = n, 1, -1
            x (k) = m (k, n+1) -  &
                  sum (m (k, k+1:n) * x (k+1:n))
         end do
      end if

      deallocate (m, temp_row)

   end if

end subroutine solve_linear_equations

end module solve_module

program p_solve
use solve_module
real, dimension(3,3) :: a
real, dimension(3) :: b, x
integer :: i, j
logical :: error

do i = 1,3
   do j = 1,3
      a(i,j) = i+j
   end do
end do
a(3,3)=-a(3,3)
b=(/20,26,-4/)

call solve_linear_equations (a, x, b, error)

print*, error
print*, x

end program p_solve
