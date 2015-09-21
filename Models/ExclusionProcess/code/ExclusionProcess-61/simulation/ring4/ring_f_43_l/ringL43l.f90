program ring_L_43l
    implicit none
    integer, parameter :: NITER = 250
    integer, parameter :: L = 4 ! Chain positions
    integer, parameter :: N = 1 ! Number of particles
    integer, parameter :: K = 4 ! Number of configurations
    integer, dimension(K, L) :: C
    integer, dimension(L) :: chain
    integer, dimension(L) :: hist, chist
    integer, dimension(L) :: current, ccurrent, icurrent
    integer, dimension(K) :: prob, cprob, iprob
    integer :: i, kk, iter
    real :: p
    real, dimension(L) :: prand
    logical :: moved, moved0
    character (len=255) :: arg
    integer :: iargc
    real :: riter
    data chist /L*0/, ccurrent /L*0/, cprob /K*0/
    data C /0, 1, 1, 1, &
            1, 0, 1, 1, &
            1, 1, 0, 1, &
            1, 1, 1, 0 /

    call init_random_seed()
    if (iargc().lt.1) then
       print "('Usage: ring4 <p>')"
       stop 'ARGV'
    endif
    call getarg(1,arg)
    read(unit=arg,fmt=*) p
    1 format('Totally asymmetric exclusion process',/,&
             'with backward-sequental update rule',/,&
             'on ring with L=4 positions and N=3 particles',//,&
             'Transition probability p=',f5.3)
    print 1, p

    do kk = 1, K
       hist = (/ 0, 0, 0, 0/)
       current = (/ 0, 0, 0, 0/)
       prob = (/ 0, 0, 0, 0 /)
       do iter = 1, NITER
          ! Reinitialization of the chain
          chain = C(kk,:)
          icurrent = (/ 0, 0, 0, 0/)
          iprob = (/ 0, 0, 0, 0/)
          call random_number(prand)
          ! Update positions
          call update(L, L-1, L, p, prand, chain, icurrent, moved0)
          do i = L-1, 2, -1
             call update(L, i-1, i, p, prand, chain, icurrent, moved)
          enddo
          ! Lastly, update bound (L, 1)
          if (.not.moved0) then
             call update(L, L, 1, p, prand, chain, icurrent, moved)
          endif
          !
          ! Find the final configuration
          call fconfig(L, K, C, chain, iprob)

          current = current + icurrent
          hist = hist + chain
          prob = prob + iprob
       enddo
       chist = chist + hist
       ccurrent = ccurrent + current
       cprob = cprob + prob
       print*
       print 10
       print "('Position      |',4(1x,i3,1x,'|'))", (/1,2,3,4/)
       print "('Configuration |',4(1x,i3,1x,'|'))", C(kk,:)
       print 10
       print "('Current J     |',4(1x,i3,1x,'|'))", current
       print "('Occurrences   |',4(1x,i3,1x,'|'))", hist
       print 10
       print "('Check sum of occurrences:',1x,i4)",sum(hist)
       print "('Number of iterations:    ',1x,i4)", NITER
   10  format(14('-'),'+',4(5('-'),'+'))
       print "('Out configurations ',4(2x,i3))", prob
    enddo

    riter = float ( K * NITER )

    print "(/,'Summary:')"
    print 20
    print "('J   |',4(1x,f5.3,1x,'|'))",float(ccurrent)/riter
    print "('DOS |',4(1x,f5.3,1x,'|'))",float(chist)/riter
    print 20
   20 format(4('-'),'+',4(7('-'),'+'))
    print "('Out configurations ',4(2x,f5.3))", float(cprob)/riter
    print "('Check sum: ', f5.3)", sum(float(cprob)/riter)
end program ring_L_43l


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
