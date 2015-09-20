      program adams moulton test drive
      implicit double precision(a-h,o-z),integer(i-n)
      parameter(n=200,idimv=2)
      dimension x(n,idimv),t(n),x0(5,idimv),t0(5)
      dimension f(idimv)
      external func
      h  = 0.01d0
      x0(1,1)=0.d0
      x0(1,2)=1.d0
      t0(1)  =0.d0
      do i=2,5
         t0(i)=t0(i-1)+h
         call func(idimv,t0(i-1),x0(i-1,:),f)
         x(i,:)=x(i-1,:)+h*f
      enddo
      
      
      call adm4(idimv,t0,x0,n,t,x,h,func,1.d-6)
      
      do i = 1, n
        print*,t(i),(x(i,j),j=1,idimv)
      enddo
      stop
      end
      
      
      subroutine func(idimv,t,x,z)
      integer idimv
      double precision t, x(*), z(*)
      z(1)=x(2)
      z(2)=-x(1)
      return
      end

