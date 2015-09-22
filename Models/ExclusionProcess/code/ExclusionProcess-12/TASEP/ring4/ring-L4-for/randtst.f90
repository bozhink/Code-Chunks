program rt
    implicit none
    integer, parameter :: L = 4
    real, dimension(L) :: fsalt
    integer, dimension(L) :: salt
    call init_random_seed()
    call random_number(fsalt)
    salt = int(float(L) * fsalt)+1
    print*,salt
    print*,fsalt
    print*,fsalt(salt)
end program rt

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
