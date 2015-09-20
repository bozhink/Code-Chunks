      subroutine lhist(n,m,x,xmin,bord,icount)
c name: Left HISTogram
c
c 'n' -- input; number of intervals
c 'm' -- input; number of data points
c 'x' -- input; array(dim=m), containing data points.
c               It is supposed 'x' is sorted asc.
c 'xmin' -- output; minimal 'x'-value; zeroth border
c 'bord' -- output; array(dim=n), containing right borders
c 'icount' -- output; array(dim=n), containing number of
c             elements of 'x' in given interval:
c
c       icount(i) -- number of elements of 'x' in interval
c                 (bord(i-1),bord(i)],
c                 where bord(0) == xmin
c
c       icount(i) = #x(j) :: bord(i-1) < x(j) <= bord(i)
      implicit none
      integer n, m, icount(n)
      double precision x(m), xmin, xmax, bord(n)
      integer i, j, k
      double precision h
      xmin = x(1)
      xmax = x(m)
      h = (xmax-xmin)/dble(n)
      bord(1) = xmin+h
      icount(1) = 0
      do i=2,n
         bord(i) = bord(i-1) + h
         icount(i) = 0
      enddo
c
      k = 1
      do i=1,n
         do j=k,m
            if (x(j).le.bord(i)) then
               icount(i) = icount(i)+1
            else
               k=j
               goto 10
            endif
         enddo
   10    continue
      enddo
      return
      end

      subroutine rhist(n,m,x,xmax,bord,icount)
c name: Right HISTogram
c
c 'n' -- input; number of intervals
c 'm' -- input; number of data points
c 'x' -- input; array(dim=m), containing data points.
c               It is supposed 'x' is sorted asc.
c 'xmax' -- output; maximal 'x'-value; (n+1)st border
c 'bord' -- output; array(dim=n), containing right borders
c 'icount' -- output; array(dim=n), containing number of
c             elements of 'x' in given interval:
c
c       icount(i) -- number of elements of 'x' in interval
c                 [bord(i),bord(i+1)),
c                 where bord(n+1) == xmax
c
c       icount(i) = #x(j) :: bord(i) <= x(j) < bord(i+1)
      implicit none
      integer n, m, icount(n)
      double precision x(m), xmin, xmax, bord(n)
      integer i, j, k
      double precision h
      xmin = x(1)
      xmax = x(m)
      h = (xmax-xmin)/dble(n)
      bord(1) = xmin
      icount(1) = 0
      do i=2,n
         bord(i) = bord(i-1) + h
         icount(i) = 0
      enddo
c
      k = m
      do i=n,1,-1
         do j=k,1,-1
            if (x(j).ge.bord(i)) then
               icount(i) = icount(i)+1
            else
               k=j
               goto 20
            endif
         enddo
   20    continue
      enddo
      return
      end

      subroutine hist(n,m,x,xmin,xmax,bord,icount)
c name: Right HISTogram
c
c 'n' -- input; number of intervals
c 'm' -- input; number of data points
c 'x' -- input; array(dim=m), containing data points.
c               It is supposed 'x' is sorted asc.
c 'xmin' -- output; minimal 'x'-value; zeroth border
c 'xmax' -- output; maximal 'x'-value; (n+1)st border
c 'bord' -- output; array(dim=n), containing right borders
c 'icount' -- output; array(dim=n), containing number of
c             elements of 'x' in given interval:
c
c       icount(i) -- number of elements of 'x' in interval
c                 [bord(i),bord(i+1)),
c                 where bord(n+1) == xmax
c
c       icount(i) = #x(j) :: bord(i) <= x(j) < bord(i+1)
      implicit none
      integer n, m, icount(n)
      double precision x(m), xmin, xmax, bord(n)
      integer i, j, k
      double precision h, h2, brd
      xmin = x(1)
      xmax = x(m)
      h = (xmax-xmin)/dble(n)
      h2 = 0.5d0*h
      bord(1) = xmin+h2
      icount(1) = 0
      do i=2,n
         bord(i) = bord(i-1) + h
         icount(i) = 0
      enddo
c
      k = m
      do i=n,1,-1
         brd=bord(i)-h2
         do j=k,1,-1
            if (x(j).ge.brd) then
               icount(i) = icount(i)+1
            else
               k=j
               goto 20
            endif
         enddo
   20    continue
      enddo
      return
      end
