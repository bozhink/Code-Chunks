subroutine fconfig(L, K, C, chain, iprob)
! This subroutine finds the final configuration
! and returns the result in the array iprob
   implicit none
   integer, intent(in) :: L, K
   integer, dimension(K, L), intent(in) :: C
   integer, dimension(L), intent(in) :: chain
   integer, dimension(L), intent(out) :: iprob
   integer :: i, j
   logical, dimension(L) :: check
   logical :: chk
   do i = 1, K
      check = chain .eq. C(i,:)
      chk = .true.
      do j = 1, L
         chk = chk.and.check(j)
      enddo
      if (chk) then
         iprob(i) = 1
         exit
      else
         iprob(i) = 0
      endif
   enddo
end subroutine fconfig

