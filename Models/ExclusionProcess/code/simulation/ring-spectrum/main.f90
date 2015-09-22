! file main.f90
! author: Bozhin Karaivanov
! date: 03.08.2013

program ring_spectrum
    use spectrum
    use backward_sequental
    implicit none
    integer, parameter :: L = 1000 ! Number of positions on the lattice
    integer, parameter :: N = 500  ! Number of particles on the lattice
    integer, parameter :: T = 1000 ! Duration in time
    integer, parameter :: TL = T*L
    integer, dimension(T,L) :: t_chain, t_current
    double complex, dimension(T,L) :: sf
    double precision, dimension(L) :: sp, spc
    integer, dimension(L) :: chain, chain_old
    integer, dimension(L) :: icurrent
    integer :: iclock, i
    real :: p, q
    data chain /L*0/, chain_old /L*0/, t_chain /TL*0/
    data t_current /TL*0/, icurrent /L*0/
    data sp /L*0.d0/, spc /L*0.d0/
    data sf /TL*(0.d0,0.d0)/
    data p /1.5/, q /0.0/

    call system_clock(iclock)
    call srand(iclock)
    call init_array(L, N, chain)

    t_chain(1,:) = chain
    chain_old = chain

    do i = 2, T
        call bs_update_all_site(L, L/10, p, q, chain, chain_old, icurrent)
        t_chain(i,:) = chain
        t_current(i,:) = icurrent
        chain_old = chain
    enddo

    call fourier(T, L, t_chain, sf)
    call spec(T, L, sf, sp)
    call fourier(T, L, t_current, sf)
    call spec(T, L, sf, spc)

    do i = 1, L
        print*,i,sp(i),spc(i)
    enddo


end program ring_spectrum

subroutine init_array(L, N, chain)
    implicit none
    integer, intent(in) :: L, N
    integer, dimension(L), intent(in out):: chain
    integer :: i, j

    do i = 1, N
 10     j = int(L*rand()) + 1
        if (chain(j).eq.0) then
            chain(j) = 1
        else
            goto 10
        endif
    enddo

end subroutine init_array
