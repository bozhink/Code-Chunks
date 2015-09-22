! file: backward_sequental.f90
! author: Bozhin Karaivanov
! date: 03.08.2013

module backward_sequental
    implicit none
    public :: bs_update_all_site, bs_update_step

contains

    subroutine bs_update_step(L, i, j, p, q, chain, chain_old, icurrent)
        implicit none
        integer, intent(in) :: i, j, L
        real, intent(in) :: p, q
        integer, dimension(L), intent(in out) :: chain, chain_old, icurrent
        real :: prob, rand
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
    end subroutine bs_update_step

    subroutine bs_update_all_site(L, M, p, q, chain, chain_old, icurrent)
        implicit none
        ! L is the chain length
        ! M is the initital position to start the update algorithm
        integer, intent(in) :: L, M
        real, intent(in) :: p, q
        integer, dimension(:), intent(in out) :: chain, chain_old, icurrent
        integer :: i, j, j1

        do i = L+M-1, M-1, -1
            j = mod(i+L,L)+1
            j1 = j + 1
            if (j1.gt.L) j1 = 1 ! periodic boundary conditions
            call bs_update_step(L, i, j, p, q, chain, chain_old, icurrent)
        enddo

    end subroutine bs_update_all_site
end module backward_sequental
