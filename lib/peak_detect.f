      subroutine pkdtc(n,signal,thrs,peaks)
      implicit none
      integer n, i, j, nm1, peaks(n)
      double precision signal(n),thrs
      double precision ds(n), dds(n), ddds(n), z(n)
      nm1=n-1
      do i=1,nm1
         ds(i) = signal(i+1)-signal(i)
      enddo
      dds(1)=ds(1)
      do i=1,nm1
         dds(i+1)=ds(i)
      enddo
      ds(n)=ds(nm1)
      ddds(1)=dds(1)
      do i=1,nm1
         ddds(i+1)=dds(i)
      enddo
      do i=1,n
         z(i)=ds(i)*dds(i)
         peaks(i)=0
      enddo
      j=1
      do i=1,n
         if (
     *    ((z(i).lt.0.d0 .and. ds(i).lt.0.d0) .or.
     *    (z(i).eq.0.d0 .and. ds(i).lt.0.d0 .and. ddds(i).gt.0.d0))
     *    .and. signal(i).gt.thrs
     *   ) then
            peaks(j)=i
            j=j+1
         endif
      enddo
      return
      end
