      program Duffing Oscillator One
      implicit none
      external duffosc, rk4f0, rk4f1, fractal1
      integer idimv,n,ierr
      parameter(idimv=2,n=25 000)
      double precision t0,x0(idimv)
      double precision t(n),x(n,idimv)
      double precision h, Side, Df
      integer i, j, Nb
      double precision m,gamma,a,b,f0,omega
      common /params/ m,gamma,a,b,f0,omega
      data m /1.d0/, a /0.25d0/, b /0.5d0/
      data f0 /2.d0/
      data omega /2.4d0/
      data gamma /0.1d0/
      save
      data h /0.004d0/
      data t0/0.d0/, x0 /0.5001d0, 0.d0/
      call RK4F1(IDIMV,T0,X0,H,N,duffosc,T,X)
*
      open(unit=10,file='duffing.dat',status='replace',iostat=ierr,
     *     err=100)
*      open(unit=10,file='/dev/fd0',status='old',iostat=ierr,
*     *     err=100,form="unformatted")
      do i=1,n
      write(unit=10,fmt=10,iostat=ierr,err=110),t(i), (x(i,j),j=1,idimv)
      enddo
      close(unit=10,iostat=ierr,err=120)
*
* Calculation of fractal dimension
*
      Side = 0.5d0
      call fractal0(Side,n,x(:,1),x(:,2),Nb,Df)
      print*,Nb, Df
*
      stop
   10 format(e15.8,2(1x,e15.8))
  100 stop 'ERROR OPENING FILE'
  110 stop 'ERROR WRITING TO FILE'
  120 stop 'ERROR CLOSING FILE'
      end
