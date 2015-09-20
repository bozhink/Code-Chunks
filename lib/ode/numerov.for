      subroutine numerov1(func,h,n,y0,y1,t0,t1,y,t)
c 'func' -- subroutine func(idimv,t,result)
c Integration of ODE
c
c /   2           \
c |  d            |
c | --- + func(t) | y(t) = 0
c |   2           |
c \ dt            /
c
c using Numerov method
c
      implicit double precision(a-h,o-z),integer(i-n)
      dimension y(n),t(n),f0(1),f1(1),f2(1)
      external func
      y(1)=y0
      y(2)=y1
      t(1)=t0
      t(2)=t1
      goto 100
c
      entry numerov2(func,h,n,y,t)
      goto 100
c
  100 h0=h*h*5.d0/6.d0
      h1=h*h/12.d0
c
      idimv=1
c
      call func(idimv,t(1),f0)
      call func(idimv,t(2),f1)
c
      do 1000 i=3,n
         t(i)=t(i-1)+h
         call func(idimv,t(i),f2)
         y(i)=( (2.d0-h0*f1(1))*y(i-1) - (1.d0+h1*f0(1))*y(i-2) )
     *        / (1.d0+h1*f2(1))
         f0(1)=f1(1)
         f1(1)=f2(1)
 1000 continue
      return
      end



      subroutine numerovs(h,idimv,x0,x1,f0,f1,f2,x2)
c name: Numerov Step
c
c              'h' -- input; time step
c          'idimv' -- dimension of vector space
c       'x0', 'x1' -- input; vectors; initial position vectors
c                     x0 = x(t-h)
c                     x1 = x(t)
c 'f0', 'f1', 'f2' -- input; scalars; potential values
c                     f0 = f(t-h)
c                     f1 = f(t)
c                     f2 = f(t+h)
c             'x2' -- output; vector; new position
c                     x2 = x(t+h)
c
      implicit double precision(a-h,o-z),integer(i-n)
      dimension x0(idimv), x1(idimv), x2(idimv)
      hh=h*h/12.d0
      h2=10.d0*hh
      df=1.d0/(1.d0-hh*f2)
      do i=1,idimv
         x2(i)=df*((2.d0-h2*f1)*x1(i) - (1.d0-hh*f0)*x0(i))
      enddo
      return
      end
