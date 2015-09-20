      subroutine numerov1(func,h,n,y0,y1,t0,t1,y,t)
c 'func' -- subroutine func(idimv,t,result)
      implicit real*8(a-h,o-z),integer(i-n)
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
         y(i)=( (2.d0-h0*f1)*y(i-1) - (1.d0+h1*f0)*y(i-2) )
     *        / (1.d0+h1*f2)
         f0=f1
         f1=f2
 1000 enddo
      return
      end

