subroutine init_random_seed()
    implicit none
    integer :: i, n, clock
    integer, dimension(:), allocatable :: seed
    call random_seed(size=n)
    allocate(seed(n))
    call system_clock(count=clock)
    seed = clock + 37 * (/ (i-1, i=1,n) /)
    call random_seed(put=seed)
    deallocate(seed)
end subroutine init_random_seed

