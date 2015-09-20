      program adams bashforth driver profram
      implicit double precision(a-h,o-z),integer(i-n)
      external func
      parameter(n=1000)
      dimension t(n),t0(5),x0(5)
      dimension x1(n),x2(n),x3(n),x4(n),x5(n)
      h=0.005d0
      x0(1)=0.1d0
      t0(1)=0.0d0
      do 10 i=2,5
      t0(i)=t0(i-1)+h
      x0(i)=x0(i-1)+h*func(t0(i-1),x0(i-1))
   10 continue
      call adamsb1(n,t0,x0,t,x1,h,func)
      call adamsb2(n,t0,x0,t,x2,h,func)
      call adamsb3(n,t0,x0,t,x3,h,func)
      call adamsb4(n,t0,x0,t,x4,h,func)
      call adamsb5(n,t0,x0,t,x5,h,func)

      do 20 i=1,n
      print*,t(i),x1(i),x2(i),x3(i),x4(i),x5(i)
   20 continue
      stop
      end
      

      function func(t,x)
      double precision func,t,x
      func=1.d0/datan(x)-t/x
      return
      end

