      subroutine calcnb(n,x,y,x0,x1,nx,y0,y1,ny,nb,ierr)
c
c This subroutine claculates the number of SQUARES, needed to cover a
c 2D structure, situated in a range x0 < x < x1, y0 < y < y1
c using division on nx X ny squares of the same sizes b = bx = by
c Actually it is required
c ny = ( (y1-y0) / (x1-x0) ) * nx,
c where b = (x1-x0)/nx
c
c Parameters
c 'n'    -- input; number of data points
c 'x'    -- input; array of x-coordinates of data points
c 'y'    -- input; array of y-coordinates of data points
c 'x0'   -- input; left boundary of x
c 'x1'   -- input; right boundary of x
c 'y0'   -- input; left boundary of y
c 'y1'   -- input; right boundary of y
c 'nx'   -- input; number of intervals of (x0,x1)
c 'ny'   -- input; number of intervals of (y0,y1)
c 'nb'   -- output; number of squares, needed to cover the structure
c 'ierr' -- output; error flag
c
      implicit none
      integer n, nx, ny, ierr, nb
      character*1 matrix(nx,ny)
      double precision x(n), y(n), x0, x1, y0, y1
      double precision bx, bx2, by, by2, xpoint, ypoint
      integer i, ix, iy
      ierr=0
      bx=(x1-x0)/dble(nx)
      by=(y1-y0)/dble(ny)
      if(dabs((dabs(bx)-dabs(by))/(dabs(bx)+dabs(by))).gt.1.d-4)then
         write(unit=0,fmt=100) bx,by
         nb=0
         ierr=1
         return
      endif
* Initialisation of matrix
      do ix=1,nx
         do iy=1,ny
            matrix(ix,iy)='0'
         enddo
      enddo
* Calculating the matrix distribution
      bx2=0.5d0*bx
      by2=0.5d0*by
      do i=1,n
         do ix=1,nx
            do iy=1,ny
               xpoint = x0 + dble(2*ix-1)*bx2
               ypoint = y0 + dble(2*iy-1)*by2
               if (x(i).ge.(xpoint-bx2) .and.
     *             x(i).lt.(xpoint-bx2) .and.
     *             y(i).ge.(ypoint-by2) .and.
     *             y(i).lt.(ypoint+by2)) then
                   matrix(ix,iy) = '1'
                   goto 10
                endif
            enddo
         enddo
   10 continue
      enddo
* Counting the number of squared to cover the fractal structure
      nb=0
      do ix=1,nx
         do iy=1,ny
            if (matrix(ix,iy).eq.'1') nb=nb+1
         enddo
      enddo
      return
  100 format("calcnb: Error: Elementary cell is not square: ",
     * "bx=",e12.3," by=",e12.3)
      end

      subroutine fracdim(n,x,y,x0,x1,y0,y1,b0,b1,m,Dr,ierr)
c
c This usbroutine calculates the fractal dimension Dr of structure,
c given in arrays x and y of dimension n
c
c Parameters
c 'n'   -- input; number of data points
c 'x'   -- input; x-coordinates array
c 'y'   -- input; y-coordinates array
c 'x0'   -- input; left boundary of x
c 'x1'   -- input; right boundary of x
c 'y0'   -- input; left boundary of y
c 'y1'   -- input; right boundary of y
c 'b0'   -- input; min value of b
c 'b1'   -- input; max value of b
c 'm'    -- input; number of samplings
c 'Dr'   -- output; fractal dimension
c 'ierr' -- output; error flag
      implicit none
      integer n, m, ierr, nx, ny, i, nb
      double precision x(n),y(n),x0,x1,y0,y1
      double precision b, h, Dr, b0, b1
      double precision xx, yy, bx, by
      double precision logb(m), logNb(m)
      double precision sx, sy, sxy, sx2
      h = (b1-b0)/dble(m)
      xx = dabs(x1-x0)
      yy = dabs(y1-y0)
      do i = 1, m
         b = b0 + dble(i-1)*h
         nx = int((x1-x0)/b)
         ny = int((y1-y0)/b)
         bx = dabs(dble(nx)*b)
         by = dabs(dble(ny)*b)
         if (dabs((bx-xx)/(bx+xx)).gt.1.d-9) nx=nx+1
         if (dabs((by-yy)/(by+yy)).gt.1.d-9) ny=ny+1
         call calcnb(n,x,y,x0,x1,nx,y0,y1,ny,nb,ierr)
         if (ierr.ne.0) then
            print*,"fracdim: ERROR"
            Dr=0
            return
         endif
         logb(i) = dlog(b)
         logNb(i)= dlog(dble(nb))
      enddo

      sx=0.d0
      sy=0.d0
      sxy=0.d0
      sx2=0.d0
      do i=1,m
         sx = sx + logb(i)
         sy = sy + logNb(i)
         sxy = sxy + logb(i)*logNb(i)
         sx2 = sx2 + logb(i)*logb(i)
      enddo
      Dr = - (sx*sy - dble(m)*sxy)/(sx*sx-dble(m)*sx2)
      ierr=0
      return
      end