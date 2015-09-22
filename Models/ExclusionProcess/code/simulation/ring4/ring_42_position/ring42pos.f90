program ring42pos
    implicit none
    integer, parameter :: NITER = 10000
    integer, parameter :: L = 4 ! Chain positions
    integer, parameter :: N = 2 ! Number of particles
    integer, parameter :: K = 6 ! Number of configurations
    logical, dimension(K, L) :: C
    logical, dimension(L) :: chain, chain_old, icurrent
    integer, dimension(L) :: hist, chist
    integer, dimension(L) :: current, ccurrent
    logical, dimension(K) :: prob
    integer, dimension(K) :: cprob
    integer :: i, j, kk, iter, curr, next, iargc
    real :: p, q, prand, riter
    character (len=255) :: arg
    data chist /L*0/, ccurrent /L*0/, cprob /K*0/
    C(1,:) = (/ .true., .true., .false., .false. /)
    C(2,:) = (/ .false., .true., .true., .false. /)
    C(3,:) = (/ .false., .false., .true., .true. /)
    C(4,:) = (/ .true., .false., .false., .true. /)
    C(5,:) = (/ .true., .false., .true., .false. /)
    C(6,:) = (/ .false., .true., .false., .true. /)

    call init_random_seed()
    if (iargc().lt.2) then
       print "('Usage: ring42pos <p> <p tilde>')"
       stop 'ARGV'
    endif
    call getarg(1, arg)
    read(unit=arg, fmt=*) p
    call getarg(2, arg)
    read(unit=arg, fmt=*) q
    1 format('Totally asymmetric exclusion process',/,&
             'with backward-sequental update rule',/,&
             'on ring with L=4 positions and N=2 particles.',//,&
             'Transition probability p=',f5.3,' and p_tilde=',f5.3)
    print 1, p, q

    !do j = L, 1, -1
     do j = L, L, -1
       print "(//,'Initial bound: (',i1,',',i1,')',/)", mod(L + j - 1, L) + 1, mod(L + j, L) + 1
       do kk = 1, K
          hist    = (/ 0, 0, 0, 0 /)
          current = (/ 0, 0, 0, 0 /)
          do iter = 1, NITER
             ! Reinitialization of the chain
             chain     = C(kk,:)
             icurrent  = (/ .false., .false., .false., .false. /)
             chain_old = (/ .false., .false., .false., .false. /)
             prob      = (/ .false., .false., .false., .false., .false., .false. /)
             do i = L, 1, -1
                call random_number(prand)
                curr = mod(i-1 + L + j, L) + 1
                next = mod(i   + L + j, L) + 1
                call update(L, curr, next, p, q, prand, chain, chain_old, icurrent)
             enddo
             call fconfig(L, K, C, chain, prob)

             do i = 1, L
                if (chain(i))    hist(i)    = hist(i)    + 1
                if (icurrent(i)) current(i) = current(i) + 1
             enddo
             do i = 1, K
                if (prob(i)) cprob(i) = cprob(i) + 1
             enddo
          enddo
          chist = chist + hist
          ccurrent = ccurrent + current

          print*
          print 10
          print "('Position      |',4(1x,i5,1x,'|'))", (/1,2,3,4/)
          print "('Configuration |',4(1x,l5,1x,'|'))", C(kk,:)
          print 10
          print "('Current J     |',4(1x,i5,1x,'|'))", current
          print "('Occurrences   |',4(1x,i5,1x,'|'))", hist
          print 10
          print "('Check sum of occurrences:',1x,i5)",sum(hist)
          print "('Number of iterations:    ',1x,i5)", NITER
   10     format(14('-'),'+',4(7('-'),'+'))
!          print "('Out configurations ',6(2x,i5))", prob
       enddo
    enddo

    riter = float ( L * K * NITER )

    print "(/,'Summary:')"
    print 20
    print "('J   |',4(1x,f5.3,1x,'|'))",float(ccurrent)/riter
    print "('DOS |',4(1x,f5.3,1x,'|'))",float(chist)/riter
    print 20
   20 format(4('-'),'+',4(7('-'),'+'))
    print "('Out configurations ',6(2x,f5.3))", float(cprob)/riter
    print "('Check sum: ', f5.3)", sum(float(cprob)/riter)
end program ring42pos
