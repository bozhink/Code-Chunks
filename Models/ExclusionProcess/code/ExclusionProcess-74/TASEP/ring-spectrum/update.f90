subroutine update(L, i, j, p, q, chain, chain_old, icurrent)
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
end subroutine update
