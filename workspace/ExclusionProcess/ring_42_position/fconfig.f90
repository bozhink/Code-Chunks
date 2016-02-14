subroutine fconfig(L, K, C, chain, prob)
! This subroutine finds the final configuration
! and returns the result in the array iprob
   implicit none
   integer, intent(in) :: L, K
   logical, dimension(K, L), intent(in) :: C
   logical, dimension(L), intent(in)    :: chain
   logical, dimension(L), intent(out)   :: prob
   integer :: i, j
   logical :: chk
   do i = 1, K
      chk = .true.
      do j = 1, L
         chk = chk.and.(chain(j).eqv.C(i,j))
      enddo
      if (chk) then
         prob(i) = .true.
      else
         prob(i) = .false.
      endif
   enddo
end subroutine fconfig

