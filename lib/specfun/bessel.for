      subroutine dsbesj(l,x,res)
      implicit double precision(a-h,o-z),integer(i-n)
      dimension res(l+1)
      d0=dsin(x)/x
      d1=(d0-dcos(x))/x
      goto 10
c
      entry dsbesn(l,x,res)
      d0=-dcos(x)/x
      d1=(d0-dsin(x))/x
      goto 10
c
   10 if (l.lt.0) then
         print 100
      elseif (l.eq.0) then
         res(1)=d0
      elseif (l.eq.1) then
         res(1)=d0
         res(2)=d1
      else
         res(1)=d0
         res(2)=d1
         y=1.d0/x
         do i=3,l+1
            res(i)=dble(2*i-1)*res(i-1)*y-res(i-2)
         enddo
      endif
c
      return
  100 format('Bessel: l must be non-negative')
      end


      subroutine zsbesj(l,x,res)
      implicit double complex(a-h,o-z),integer(i-n)
      dimension res(l+1)
      d0=cdsin(x)/x
      d1=(d0-cdcos(x))/x
      goto 10
c
      entry zsbesn(l,x,res)
      d0=-cdcos(x)/x
      d1=(d0-cdsin(x))/x
      goto 10
c
   10 if (l.lt.0) then
         print 100
      elseif (l.eq.0) then
         res(1)=d0
      elseif (l.eq.1) then
         res(1)=d0
         res(2)=d1
      else
         res(1)=d0
         res(2)=d1
         y=1.d0/x
         do i=3,l+1
            res(i)=dble(2*i-1)*res(i-1)*y-res(i-2)
         enddo
      endif
c
      return
  100 format('Bessel: l must be non-negative')
      end
