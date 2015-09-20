      program ball
c
c solves ball fly problem
c
      parameter (nmax=10000)
      dimension y(4,nmax)
c get input
    1 call init(dt,y,tmax,nmax,n)
c
c document input
      write(*,*) 'solving ball fly problem for dt=',dt
      write(*,*) '                     up tp tmax=',tmax
      write(*,*) '            resulting in nsteps=',n
      write(*,*) '         for initial velocities=',y(3,1),y(4,1)
c
c call problem solution code
      call nsteps(dt,n,y)
c
c write out results
      write(*,234) (n-1)*dt,(y(i,n),i=1,4)
  234 format (' at tmax='f10.3,' y=',f15.6,'  x=',f15.6,/,
     *          19x,' vy=',f15.6,' vx=',f15.6)
c
c draw graph of flight path
      call plobal(y,n)
      goto 1
      end

      subroutine plobal(y,n)
c plot results from ball problem
      dimension y(4,n),xx(10000),yy(10000)
      do i=1,n
      xx(i)=y(2,i)
      yy(i)=y(1,i)
      enddo
      call plotfu(xx,yy,n,1,1,-.5,10.5,-3.5,5.)
      return
      end

      subroutine init(dt,y,tmax,nmax,n)
      dimension y(4)
c
c this subroutine initializes the ball fly problem
c by obtaining user input
c
    2 write (*,*) 'enter end-time'
      read (*,*) tmax
      if (tmax.le.0.0) then
      write (*,*) 'illegal end-time, must be >0'
      goto 2
      endif
    1 write (*,*) 'enter time step'
      read (*,*) dt
      if (dt.le.0.0) then
      write (*,*) 'illegal rime step, must be > 0'
      goto 1
      endif
      if (dt.gt.tmax) then
      write (*,*) 'illegal rime step,  > tmax'
      goto 1
      endif
      n=tmax/dt+0.1+1.
c added 1 for initial t=0 storage
      if (n.gt.nmax) then
      write(*,*) 'too many time steps'
      goto 1
      endif
c
    3 write (*,*) 'enter velocity'
      read (*,*) v
      if (v.le.0.0) then
      write (*,*) 'illegal velocity, must be >0'
      goto 3
      endif
    4 write (*,*) 'enter angle in degrees'
      read (*,*) angdeg
      if (angdeg.le.0.0.or.angdeg.ge.90.0) then
      write(*,*) 'illegal angle, must be > 0 and < 90'
      goto 4
      endif
      angrad=angrad*3.141592654/180.0
c
      y(1)=0.0
      y(2)=0.0
      y(3)=v*sin(anggrad)
      y(4)=v*cos(anggrad)
c
      return
      end
      
      
      subroutine derivs(t,y,dydt)
      dimension y(4), dydt(4)
c
c this subroutine computes the right-hand-sides for ball flying problem
c variables are y(1)=y,y(2)=x,y(3)=y',y(4)=x'
c r.h.s. are y'=y' x'=x' y''=-g-y'cv**.87 x''=0-x'cv**.87
c
c first, compute velocity
      v=sqrt(y(3)**2+y(4)**2)
      cv87=0.5*v**0.87
c
      dydt(1)=y(3)
      dydt(2)=y(4)
      dydt(3)=-10.0-y(3)*cv87
      dydt(4)=0.0-y(4)*cv87
c
      return
      end
      
      subroutine tstep(t0,dt,y0,y)
      dimension y0(4), y(4), dydt(4)
c
c this subroutine steps the vector y through one time step
c    from t0 t0 t0+dt
      call derivs(t0,y0,dydt)
      do i=1,4
      y(i)=y0(i)+dt*dydt(i)
      enddo
c
      return
      end
      
      subroutine nsteps(dt,n,y)
      dimension y(4,n)
c this subroutine solves the ball fly problem for n-1 time steps
c     given initial conditions at t=0 in y(*,1)
      t=0.0
      do i=2,n
      call tstep(t,dt,y(1,i-1),y(1,i))
      t=t+dt
      enddo
c
      return
      end

