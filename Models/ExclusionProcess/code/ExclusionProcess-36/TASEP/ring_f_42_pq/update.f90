subroutine update(L, i, j, p, prand, chain, icurrent, moved)
    implicit none
    integer, intent(in) :: i, j, L
    real, intent(in) :: p
    real, dimension(L), intent(in) :: prand
    integer, dimension(L), intent(in out) :: chain, icurrent
    logical, intent(out) :: moved
    if (chain(i).eq.1.and.chain(j).eq.0.and.prand(i).lt.p) then
      ! Transition
      chain(j) = 1
      chain(i) = 0
      icurrent(j) = 1
      moved = .true.
   else
      icurrent(j) = 0
      moved = .false.
   endif
end subroutine update

subroutine updateq(L, i, j, p, q, prand, chain, chain_old, icurrent, moved)
    implicit none
    integer, intent(in) :: i, j, L
    real, intent(in) :: p, q
    real, dimension(L), intent(in) :: prand
    integer, dimension(L), intent(in out) :: chain, chain_old, icurrent
    logical, intent(out) :: moved
    real :: prob
    if (chain_old(j).eq.1) then
       prob = q
    else
       prob = p
    endif
    if (chain(i).eq.1.and.chain(j).eq.0.and.prand(i).lt.prob) then
      ! Transition
      chain(j) = 1
      chain(i) = 0
      icurrent(j) = 1
      moved = .true.
   else
      icurrent(j) = 0
      moved = .false.
   endif
end subroutine updateq
