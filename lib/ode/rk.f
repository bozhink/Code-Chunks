      subroutine rkb(t0,y0,h,s,bt,func,t,y)
c Performs Runge-Kutta algorithm 1 step
c Uses Butcher tableau -- 'bt'
c      +----+-------------------------+
c bt = | c2 | a21                     |
c      | c3 | a31 a32                 |
c      | .. | ... ... ...             |
c      | cs | as1 as2 ... a{s}{s-1}   |
c      +----+-------------------------+
c      |    | b1  b2  ... b{s-1}   bs |
c      +----+-------------------------+
c
c external function must be of the type
c     double precision function func(t,x)
      implicit none
      external  func
      integer  s
      double precision  t0,y0,h,bt(2:s+1,0:s)
      double precision  func,t,y
      double precision  k(s)
      integer  i,j
      t = t0
      y = y0
      k(1) = func(t,y)
      do i=2,s
         t = t0 + bt(i,0) * h
         y = y0
         do j=1,i-1
            y = y + h * bt(i,j) * k(j)
         enddo
         k(i) = func(t,y)
      enddo
      t = t0 + h
      y = y0
      i = s+1
      do j = 1, s
         y = y + h * bt(i,j) * k(j)
      enddo
      return
      end
