      subroutine adams(idimv,t0,x0,n,t,x,h,eps,func,ierr)
      implicit double precision(a-h,o-z),integer(i-n)
      external func
      dimension t0(3),x0(3,idimv)
      dimension t(n),x(n,idimv),xn(idimv)
      dimension f(n,idimv), a(6)
      a1=5.d0/12.d0
      a2=-16.d0/12.d0
      a3=23.d0/12.d0
      b1=1.d0/24.d0
      b2=-5.d0/24.d0
      b3=19.d0/24.d0
      b4=9.d0/24.d0

      itmax=5

      do i=1,3
      x(i,:)=x0(i,:)
      t(i)=t0(i)
      call random_number(a)
      call func(t(i),x(i,:),a(:),f(i,:),ierr)
      enddo

      do i=3,n-1
      t(i+1) = t(i) + h
      x(i+1,:) = x(i,:) + h*( a1*f(i-2,:) + a2*f(i-1,:) + a3*f(i,:) )
      it=0
    1 a(:) = (x(i+1,7:12) - x(i-1,7:12))/h
      it=it+1
      xn(:)=x(i+1,:)
      call func(t(i+1),x(i+1,:),a(:),f(i+1,:),ierr)
      if (ierr.ne.0.and.it.le.itmax) then
         goto 1
      else
         write(unit=0,fmt=*)'ERROR: V>C'
         stop
      endif
      x(i+1,:)=x(i,:)+h*(b1*f(i-2,:)+b2*f(i-1,:)+b3*f(i,:)+b4*f(i+1,:))
      if(maxval(abs((xn-x(i+1,:))/xn)).gt.eps.and.it.lt.itmax)then
         goto 1
      endif
      enddo
      return
      end
