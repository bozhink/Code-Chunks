c chap1c.for
      func(x)=x*x-5.                        ! function whose root is sought
      tolx=1.e-06                           ! tolerance for the search
      x=1.                                  ! initial guess
      fold=func(x)                          ! initial function
      dx=.5                                 ! initial step
      iter=0                                ! initialize count
   10 continue
         iter=iter+1                        ! increment iteration count
         x=x+dx                             ! step X
         print*,iter,x,sqrt(5.)-x           ! output current values
         if ((fold*func(x)).lt.0) then
            x=x-dx                          ! if sign change, back up
            dx=dx/2                         ! and halve the step
         endif
      if (abs(dx).gt.tolx) goto 10
      stop
      end

