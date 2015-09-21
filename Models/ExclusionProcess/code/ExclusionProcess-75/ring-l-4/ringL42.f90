program ring_L_42
    implicit none
    integer, parameter :: NITER = 300
    integer, parameter :: L = 4 ! Chain positions
    integer, parameter :: N = 2 ! Number of particles
    integer, parameter :: K = 6 ! Number of configurations
    integer, dimension(K, L) :: C
    integer, dimension(L) :: chain, hist, chist, current, ccurrent
    logical, dimension(L) :: check
    integer, dimension(K) :: prob, cprob
    integer :: i, j, kk, ll, iclock, iter
    real :: p 
    logical :: moved, chk
    character (len=255) :: arg
    integer :: iargc
    real :: riter
    data chist /L*0/, ccurrent /L*0/, cprob /K*0/
    C(1,:) = (/0, 0, 1, 1/)
    C(2,:) = (/1, 0, 0, 1/)
    C(3,:) = (/1, 1, 0, 0/)
    C(4,:) = (/0, 1, 1, 0/)
    C(5,:) = (/1, 0, 1, 0/)
    C(6,:) = (/0, 1, 0, 1/)
    call system_clock(iclock)
    call srand(iclock)
    if (iargc().lt.1) then
       print "('Ussage: ring4 <p>')"
       stop 'ARGV'
    endif
    call getarg(1,arg)
    read(unit=arg,fmt=*) p
    1 format('Totally asymmetric exclusion process',/,&
             'with backward-sequental update rule',/,&
             'on ring with L=4 positions and N=2 particles',//,&
             'Transition probability p=',f5.3)
    print 1, p
    
    do kk = 1, K
       hist = (/ 0, 0, 0, 0/)
       current = (/ 0, 0, 0, 0/)
       prob = (/ 0, 0, 0, 0, 0, 0 /)
       do iter = 1, NITER
          ! Reinitialization of the chain
          chain = C(kk,:)
          ! First update the last position
          i = L
          j = 1
          moved = .false.
          if (chain(i).eq.1.and.chain(j).eq.0.and.rand().lt.p) then
             ! Transition
             chain(j) = 1
             chain(i) = 0
             current(j) = current(j) + 1
             moved = .true.
          endif
          !
          ! Next, update all other positions
          ll = 1
          if (moved) ll = 2
          do i = L-1, ll, -1
             j = i + 1
             if (chain(i).eq.1.and.chain(j).eq.0.and.rand().lt.p) then
                ! Transition
                chain(j) = 1
                chain(i) = 0
                current(j) = current(j) + 1
             endif
          enddo
          hist = hist + chain
          !
          ! Find the final configuration
          do i = 1, K
             check = chain .eq. C(i,:)
             chk = .true.
             do j = 1, L
                chk = chk.and.check(j)
             enddo
             if (chk) then
                prob(i) = prob(i) + 1
                exit
             endif
          enddo
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
       print "('Out configurations ',6(2x,i3))", prob
    enddo
    
    riter = float ( K * NITER )
    
    print "(/,'Summary:')"
    print 20
    print "('J   |',4(1x,f5.3,1x,'|'))",float(ccurrent)/riter
    print "('DOS |',4(1x,f5.3,1x,'|'))",float(chist)/riter
    print 20
   20 format(4('-'),'+',4(7('-'),'+'))
    print "('Out configurations ',6(2x,f5.3))", float(cprob)/riter
    print "('Check sum: ', f5.3)", sum(float(cprob)/riter)
end program ring_L_42

