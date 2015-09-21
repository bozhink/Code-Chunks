program ring_L_41_smooth
    implicit none
    integer, parameter :: NITER = 2500
    integer, parameter :: L = 4 ! Chain positions
    integer, parameter :: N = 1 ! Number of particles
    integer, parameter :: K = 4 ! Number of configurations
    integer, dimension(K, L) :: C
    integer, dimension(L) :: chain
    integer, dimension(L) :: hist, chist
    integer, dimension(L) :: current, ccurrent, icurrent
    integer, dimension(K) :: prob, cprob, iprob
    integer, dimension(L) :: order, shifted
    integer :: i, kk, ll, iter, shift
    real :: p, fshift
    real, dimension(L) :: prand
    logical :: moved
    character (len=255) :: arg
    integer :: iargc
    real :: riter, dJ, dos, ddos, ddJ
    data chist /L*0/, ccurrent /L*0/, cprob /K*0/
    data order /1, 2, 3, 4/
    data C /0, 0, 0, 1, &
            0, 0, 1, 0, &
            0, 1, 0, 0, &
            1, 0, 0, 0 /

    call init_random_seed()
    if (iargc().lt.1) then
       print "('Usage: ring4 <p>')"
       stop 'ARGV'
    endif
    call getarg(1,arg)
    read(unit=arg,fmt=*) p
    1 format('Totally asymmetric exclusion process',/,&
             'with backward-sequental update rule',/,&
             'on ring with L=4 positions and N=1 particles',//,&
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
          ! First update the last position
          call update(L, L, 1, p, prand, chain, icurrent, moved)
          !
          ! Next, update all other positions
          if (moved) then
             ll = 2
          else
             ll = 1
          endif
          do i = L-1, ll, -1
             call update(L, i, i+1, p, prand, chain, icurrent, moved)
          enddo
          !
          ! Find the final configuration
          call fconfig(L, K, C, chain, iprob)
          !
          ! Do shift
          call random_number(fshift)
          shift = int(float(L) * fshift)
          shifted = mod(order + shift, L) + 1

          current(order) = current(order) + icurrent(shifted)
          hist(order)    = hist(order)    + chain(shifted)
          prob(order)    = prob(order)    + iprob(shifted)
       enddo
       chist    = chist    + hist
       ccurrent = ccurrent + current
       cprob    = cprob    + prob
    enddo

    riter = float ( K * NITER )

    dJ = sum(float(ccurrent)/riter/L)
    dos = sum(float(chist)/riter/L)
    ddos = sqrt(sum(float(chist*chist)/(riter*riter*L)) - dos*dos)
    ddJ  = sqrt(sum(float(ccurrent*ccurrent)/(riter*riter*L)) - dJ*dJ)

    print "('J=',f5.3,' +- ',f7.5)", dJ, ddJ
    print "('rho=',f5.3,' +- ',f7.5)", dos, ddos
end program ring_L_41_smooth


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
   integer, dimension(K), intent(out) :: iprob
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
