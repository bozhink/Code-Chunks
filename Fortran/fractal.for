c FRACTAL DIMENSION
c
c       We cover with grids of different sizes, and we count the number of
c       squares N(b) needed to cover the structure with sqares of size b x b.
c       This number then scales with b as
c               N(b) ~ b^(-Df), small b,
c       and the exponent Df is then the fractal dimension
      subroutine fractal1(b,m,x,y,Nb,Df)
c
c This subroutine calculates number of occurencies in 2d array
c and fractal dimension
c
c
c
c 2D HISTOGRAM
c Slow version algorithm
c
c 'b'  -- input; size of covering sqare
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
c 'ibool' -- output; 2D array: histogram data
c 'Nb'    -- output; number of occupied squares
c           -----
c           \
c            >   ibool(k) = Nb
c           /
c           -----
c            k
c 'Df'    -- output; fractal dimension;
c                 log Nb
c           Df = ---------
c                 log b
c
      implicit none
      integer nx,ny,m,Nb
      double precision x(m),y(m),b,Df,hx,hy
      double precision xmin,xmax,ymin,ymax
      integer i
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
      nx = int((xmax-xmin)/b) + 1
      ny = int((ymax-ymin)/b) + 1
      hx = (xmax-xmin)/dble(nx)
      hy = (ymax-ymin)/dble(ny)
      call fcount(nx,ny,m,x,y,hx,hy,xmin,ymin,Nb)
      Df = dlog(dble(Nb))/dlog(b)
      return
      end



      subroutine fractal0(b,m,x,y,Nb,Df)
c
c This subroutine calculates number of occurencies in 2d array
c and fractal dimension
c
c
c
c 2D HISTOGRAM
c Slow version algorithm
c
c 'b'  -- input; size of covering sqare
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
c 'ibool' -- output; 2D array: histogram data
c 'Nb'    -- output; number of occupied squares
c           -----
c           \
c            >   ibool(k) = Nb
c           /
c           -----
c            k
c 'Df'    -- output; fractal dimension;
c                 log Nb
c           Df = ---------
c                 log b
c
      implicit none
      integer n,m,Nb
      double precision x(m),y(m),b,Df,h
      double precision xmin,xmax,ymin,ymax,dmin,dmax
      integer i
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
c
      dmin = xmin
      if (ymin.lt.xmin) dmin=ymin
      dmax = xmax
      if (ymax.gt.xmax) dmax=ymax
c
      n = int((dmax-dmin)/b) + 1
      h = (dmax-dmin)/dble(n)
      call fcount0(n,m,x,y,h,dmin,Nb)
      Df = -dlog(dble(Nb))/dlog(b)
      return
      end

      subroutine fcount(nx,ny,m,x,y,hx,hy,xmin,ymin,Nb)
      implicit none
      integer nx,ny,m,Nb
      double precision x(m),y(m),hx,hy,hx2,hy2,xmin,ymin
      double precision bordx(nx),bordy(ny),brdx
      integer i, j, ix, iy
      Nb = 0
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
      if ((bordx(ix)-hx2).le.X(j).and.(bordx(ix)+hx2).gt.X(j).and.
     *    (bordy(iy)-hy2).le.Y(j).and.(bordy(iy)+hy2).gt.Y(j)) then
          Nb = Nb + 1
          goto 100
      endif
      enddo
      enddo
  100 continue
      enddo
      return
      end

      subroutine fcount0(n,m,x,y,h,dmin,Nb)
      implicit none
      integer n,m,Nb
      double precision x(m),y(m),h,h2,dmin
      double precision bord(n),brdx
      integer i, j, ix, iy
      Nb = 0
      h2 = 0.5d0*h
      bord(1) = dmin + h2
      do i=2,n
         bord(i) = bord(i-1) + h
      enddo
c
      do j = 1, m
      do ix = 1, n
      do iy = 1, n
      if ((bord(ix)-h2).le.X(j).and.(bord(ix)+h2).gt.X(j).and.
     *    (bord(iy)-h2).le.Y(j).and.(bord(iy)+h2).gt.Y(j)) then
          Nb = Nb + 1
          goto 100
      endif
      enddo
      enddo
  100 continue
      enddo
      return
      end
