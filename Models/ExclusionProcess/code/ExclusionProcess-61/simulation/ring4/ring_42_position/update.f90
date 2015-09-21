subroutine update(L, i, j, p, q, prand, chain, chain_old, icurrent)
    implicit none
    integer, intent(in) :: i, j, L
    real, intent(in) :: p, q, prand
    logical, dimension(L), intent(in out) :: chain, chain_old, icurrent
    real :: prob
    if (chain_old(j)) then
       prob = q
    else
       prob = p
    endif
    if (chain(i).and..not.chain(j).and.prand.lt.prob) then
      ! Transition
      chain(j) = .true.
      chain(i) = .false.
      chain_old(i) = .true.
      icurrent(j) = .true.
   else
      icurrent(j) = .false.
   endif
end subroutine update
