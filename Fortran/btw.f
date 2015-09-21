      subroutine btw(l, lhalf, a, niter)
      implicit integer(a-z)
      logical itoppled
      parameter (zcrit=4)
      dimension a(-lhalf:lhalf, -lhalf:lhalf)
      do i = -lhalf, lhalf
         do j = -lhalf, lhalf
            a(i,j) = zcrit/2
         enddo
      enddo
      do iter = 1, niter
         a(0,0) = a(0,0) + 1
         itoppled = .true.
         do while (itoppled)
            itoppled = .false.
            do i = -lhalf+1, lhalf-1
               do j = -lhalf+1, lhalf-1
                  if (a(i,j).ge.zcrit) then
                     itoppled = .true.
                     a(i,j) = a(i,j) - zcrit
                     a(i+1,j) = a(i+1,j) + 1
                     a(i-1,j) = a(i-1,j) + 1
                     a(i,j+1) = a(i,j+1) + 1
                     a(i,j-1) = a(i,j-1) + 1
                  endif
               enddo
            enddo
            do j = -lhalf+1, lhalf-1
               i = lhalf
               if (a(i,j).ge.zcrit) then
                  itoppled = .true.
                  a(i,j) = a(i,j) - zcrit
                  a(i-1,j) = a(i-1,j) + 1
                  a(i,j+1) = a(i,j+1) + 1
                  a(i,j-1) = a(i,j-1) + 1
               endif
               i = -lhalf
               if (a(i,j).ge.zcrit) then
                  itoppled = .true.
                  a(i,j) = a(i,j) - zcrit
                  a(i+1,j) = a(i+1,j) + 1
                  a(i,j+1) = a(i,j+1) + 1
                  a(i,j-1) = a(i,j-1) + 1
               endif
            enddo
            if (a(lhalf,lhalf).ge.zcrit) then
               itoppled = .true.
               a(lhalf,lhalf) = a(lhalf,lhalf) - zcrit
               a(lhalf-1,lhalf) = a(lhalf-1,lhalf) + 1
               a(lhalf,lhalf-1) = a(lhalf,lhalf-1) + 1
            endif
            if (a(-lhalf,lhalf).ge.zcrit) then
               itoppled = .true.
               a(-lhalf,lhalf) = a(-lhalf,lhalf) - zcrit
               a(-lhalf+1,lhalf) = a(-lhalf+1,lhalf) + 1
               a(-lhalf,lhalf-1) = a(-lhalf,lhalf-1) + 1
            endif
            if (a(lhalf,-lhalf).ge.zcrit) then
               itoppled = .true.
               a(lhalf,-lhalf) = a(lhalf,-lhalf) - zcrit
               a(lhalf-1,-lhalf) = a(lhalf-1,-lhalf) + 1
               a(lhalf,-lhalf+1) = a(lhalf,-lhalf+1) + 1
            endif
            if (a(-lhalf,-lhalf).ge.zcrit) then
               itoppled = .true.
               a(-lhalf,-lhalf) = a(-lhalf,-lhalf) - zcrit
               a(-lhalf+1,-lhalf) = a(-lhalf+1,-lhalf) + 1
               a(-lhalf,-lhalf+1) = a(-lhalf,-lhalf+1) + 1
            endif
         enddo
      enddo
      end
