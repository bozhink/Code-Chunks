      subroutine hist2d(nx,ny,m,x,y,
     *      xmin,xmax,ymin,ymax,bordx,bordy,icount)
c
c This subroutine calculates number of occurencies in 2d array
c 2D HISTOGRAM
c
c 'nx' -- input; number of intervals in x dirextion
c 'ny' -- input; number of intervals in y direction
c 'm'  -- input; number of input data points
c 'x'  -- input; x-axis data points
c 'y'  -- input; y-axis data points
c WARNING: It is supposes data points are sorted in 'x' - array
c 'xmin' -- output; minimal x-value; xmin = x(1)
c 'xmax' -- output; maximal x-value; xmax = x(m)
c 'ymin' -- output; minimal y-value
c 'ymax' -- output; maximal y-value
c 'bordx' -- output; array of x-mid-interval values
c 'bordy' -- output; array of y-mid-interval values
c 'icount' -- output; 2D array: histogram data
c
      implicit none
      integer nx,ny,m,icount(nx,ny)
      double precision xmin,xmax,ymin,ymax,x(m),y(m),
     *      bordx(nx),bordy(ny),hx,hy,hx2,hy2,
     *      brdx
      integer i, j, k, ix, iy
      do i=1,nx
         do j=1,ny
            icount(i,j)=0
         enddo
      enddo
      xmin=x(1)
      xmax=x(m)
      ymin=y(1)
      ymax=y(1)
      do i=2,m
         if (ymin.gt.y(i)) ymin=y(i)
         if (ymax.lt.y(i)) ymax=y(i)
      enddo
      hx = (xmax-xmin)/dble(nx)
      hy = (ymax-ymin)/dble(ny)
      hx2 = 0.5d0*hx
      hy2 = 0.5d0*hy
      bordx(1) = xmin+hx2
      bordy(1) = ymin+hy2
      do i=2,nx
         bordx(i) = bordx(i-1) + hx
      enddo
      do i=2,ny
         bordy(i) = bordy(i-1) + hy
      enddo
c
      k = m
      do ix = nx,1,-1
         brdx = bordx(ix) - hx2
         do j = k,1,-1
            if (X(j).ge.brdx) then
               do iy = 1,ny
                  if ((bordy(iy)-hy2).le.Y(j).and.
     *                (bordy(iy)+hy2).gt.Y(j)) then
                     icount(ix,iy) = icount(ix,iy)+1
                     goto 10
                  endif
               enddo
   10          continue
            else
               k = j
               goto 20
            endif
         enddo
   20    continue
      enddo
      return
      end

      subroutine hist2ds(nx,ny,m,x,y,
     *      xmin,xmax,ymin,ymax,bordx,bordy,icount)
c
c This subroutine calculates number of occurencies in 2d array
c 2D HISTOGRAM
c Slow version algorithm
c
c 'nx' -- input; number of intervals in x dirextion
c 'ny' -- input; number of intervals in y direction
c 'm'  -- input; number of input data points
c 'x'  -- input; x-axis data points
c 'y'  -- input; y-axis data points
c WARNING: It is not supposes data points are sorted in 'x' - array
c 'xmin' -- output; minimal x-value; xmin = x(1)
c 'xmax' -- output; maximal x-value; xmax = x(m)
c 'ymin' -- output; minimal y-value
c 'ymax' -- output; maximal y-value
c 'bordx' -- output; array of x-mid-interval values
c 'bordy' -- output; array of y-mid-interval values
c 'icount' -- output; 2D array: histogram data
c
      implicit none
      integer nx,ny,m,icount(nx,ny)
      double precision xmin,xmax,ymin,ymax,x(m),y(m),
     *      bordx(nx),bordy(ny),hx,hy,hx2,hy2,
     *      brdx
      integer i, j, k, ix, iy
      do i=1,nx
         do j=1,ny
            icount(i,j)=0
         enddo
      enddo
      xmin=x(1)
      xmax=x(1)
      ymin=y(1)
      ymax=y(1)
      do i=2,m
         if (xmin.gt.x(i)) xmin=x(i)
         if (xmax.lt.x(i)) xmax=x(i)
         if (ymin.gt.y(i)) ymin=y(i)
         if (ymax.lt.y(i)) ymax=y(i)
      enddo
      hx = (xmax-xmin)/dble(nx)
      hy = (ymax-ymin)/dble(ny)
      hx2 = 0.5d0*hx
      hy2 = 0.5d0*hy
      bordx(1) = xmin+hx2
      bordy(1) = ymin+hy2
      do i=2,nx
         bordx(i) = bordx(i-1) + hx
      enddo
      do i=2,ny
         bordy(i) = bordy(i-1) + hy
      enddo
c
      do j = 1, m
         do ix = 1, nx
            do iy = 1, ny
               if ((bordx(ix)-hx2).le.X(j).and.
     *             (bordx(ix)+hx2).gt.X(j).and.
     *             (bordy(iy)-hy2).le.Y(j).and.
     *             (bordy(iy)+hy2).gt.Y(j)) then
                  icount(ix,iy)=icount(ix,iy)+1
               endif
            enddo
         enddo
      enddo
      return
      end

