program ring42
    implicit none
    integer, parameter :: NITER = 10000
    integer, parameter :: L = 4 ! Chain positions
    integer, parameter :: N = 2 ! Number of particles
    integer, parameter :: K = 6 ! Number of configurations
    integer, dimension(K, L) :: C
    integer, dimension(L) :: chain
    integer, dimension(L) :: hist, chist
    integer, dimension(L) :: current, ccurrent, icurrent
    integer, dimension(K) :: prob, cprob, iprob
    integer :: i, j, kk, iter, curr, next
    real :: p
    real, dimension(L) :: prand
    logical :: moved, moved0
    character (len=255) :: arg
    integer :: iargc
    real :: riter
    data chist /L*0/, ccurrent /L*0/, cprob /K*0/
    C(1,:) = (/1, 1, 0, 0/)
    C(2,:) = (/0, 1, 1, 0/)
    C(3,:) = (/0, 0, 1, 1/)
    C(4,:) = (/1, 0, 0, 1/)
    C(5,:) = (/1, 0, 1, 0/)
    C(6,:) = (/0, 1, 0, 1/)

    call init_random_seed()
    if (iargc().lt.1) then
       print "('Usage: ring4 <p>')"
       stop 'ARGV'
    endif
    call getarg(1,arg)
    read(unit=arg,fmt=*) p
    1 format('Totally asymmetric exclusion process',/,&
             'with backward-sequental update rule',/,&
             'on ring with L=4 positions and N=2 particles',//,&
             'Transition probability p=',f5.3)
    print 1, p

    do j = L, 1, -1
       print "(//,'New update initial point l=',i1)", j
       do kk = 1, K
          hist = (/ 0, 0, 0, 0/)
          current = (/ 0, 0, 0, 0/)
          prob = (/ 0, 0, 0, 0, 0, 0 /)
          do iter = 1, NITER
             ! Reinitialization of the chain
             chain = C(kk,:)
             icurrent = (/ 0, 0, 0, 0/)
             iprob = (/ 0, 0, 0, 0, 0, 0/)
             call random_number(prand)
             ! Update
             curr = mod(L-1+L+j, L) + 1
             next = mod(L  +L+j, L) + 1
             call update(L, curr, next, p, prand, chain, icurrent, moved0)
             do i = L-1, 2, -1
                curr = mod(i-1+L+j, L) + 1
                next = mod(i  +L+j, L) + 1
                call update(L, curr, next, p, prand, chain, icurrent, moved)
             enddo
             if (.not.moved0) then
                curr = mod(L+L+j, L) + 1
                next = mod(1+L+j, L) + 1
                call update(L, curr, next, p, prand, chain, icurrent, moved)
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
          print "('Position      |',4(1x,i5,1x,'|'))", (/1,2,3,4/)
          print "('Configuration |',4(1x,i5,1x,'|'))", C(kk,:)
          print 10
          print "('Current J     |',4(1x,i5,1x,'|'))", current
          print "('Occurrences   |',4(1x,i5,1x,'|'))", hist
          print 10
          print "('Check sum of occurrences:',1x,i5)",sum(hist)
          print "('Number of iterations:    ',1x,i5)", NITER
   10     format(14('-'),'+',4(7('-'),'+'))
          print "('Out configurations ',6(2x,i5))", prob
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

    !print "(///)"
    !do kk = L, 1, -1
    !   print*
    !   do i = L, 1, -1
    !      print*, i, mod(i-1+L+kk,L)+1, mod(i+L+kk,L)+1
    !   enddo
    !enddo
end program ring42
