      subroutine rk4(y,dydx,n,x,h,yout,derivs)
      implicit none
      integer n,nmax
      double precision h,x,dydx(n),y(n),yout(n)
      external derivs
      parameter (nmax=50)
      integer i
      double precision h6,hh,xh,dym(nmax),dyt(nmax),yt(nmax)
      hh=h*0.5d0
      h6=h/6.d0
      xh=x+hh
      do i=1,n
         yt(i)=y(i)+hh*dydx(i)
      enddo
      call derivs(xh,yt,dyt)
      do i=1,n
         yt(i)=y(i)+hh*dyt(i)
      enddo
      call derivs(xh,yt,dym)
      do i=1,n
         yt(i)=y(i)+h*dym(i)
         dym(i)=dyt(i)+dym(i)
      enddo
      call derivs(x+h,yt,dyt)
      do i=1,n
         yout(i)=y(i)+h6*(dydx(i)+dyt(i)+2.d0*dym(i))
      enddo
      return
      end
      
      subroutine rkdumb(vstart,nvar,x1,x2,nstep,derivs)
c driver subroutine
      implicit none
      integer nstep,nvar,nmax,nstpmx
      parameter (nmax=50,nstpmx=200)
      double precision x1,x2,vstart(nvar),xx(nstpmx),y(nmax,nstpmx)
      external derivs
      common /path/ xx,y
      integer i,k
      double precision h,x,dv(nmax),v(nmax)
      do i=1,nvar
         v(i)=vstart(i)
         y(i,1)=v(i)
      enddo
      xx(1)=x1
      x=x1
      h=(x2-x1)/nstep
      do k=1,nstep
         call derivs(x,v,dv)
         call rk4(v,dv,nvar,x,h,v,derivs)
         if (x+h.eq.x) write(unit=0,fmt=100)
         x=x+h
         xx(k+1)=x
         do i=1,nvar
            y(i,k+1)=v(i)
         enddo
      enddo
      return
  100 format('stepsize not significant in rkdumb')
      end
      