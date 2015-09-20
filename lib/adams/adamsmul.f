      subroutine adm4(idimv,t0,x0,n,t,x,h,func,eps)
c Adams-Moulton of order 4
c func must have the proto
c    subroutine func(idimv,t,x,result)
      implicit double precision (a-h,o-z),integer(i-n)
      parameter (mmax=30)
      dimension x0(5,idimv),t0(5)
      dimension x(n,idimv),t(n)
      dimension a(5), f(n,idimv)
      dimension xnew(idimv)
      external func
      iorder  = 4
      iorder1 = iorder + 1
      a(1) = -19.d0/720.d0
      a(2) =  106.d0/720.d0
      a(3) = -264.d0/720.d0
      a(4) =  646.d0/720.d0
      a(5) =  251.d0/720.d0
c Initialization
      do i=1, iorder
      x(i,:) = x0(i,:)
      t(i)   = t0(i)
      call func(idimv,t(i),x(i,:),f(i,:))
      enddo
      x(iorder1,:) = x0(iorder1,:)
c
      do i = iorder1, n
c        First predictor step using Euler
         x(i,:) = x(i-1,:) + h*f(i-1,:)
c        Corrector algorithm using Adams-Moulton
         iter = 0
         t(i) = t(i-1) + h
         xnew(:) = x(i,:)
    1    call func(idimv,t(i),xnew(:),f(i,:))
         iter = iter + 1
         xnew(:)  = 0.d0
         do j=1,iorder1
            xnew(:) = xnew(:) + a(j)*f(i+j-iorder1,:)
         enddo
         xnew(:) = x(i-1,:) + h * xnew(:)
         derr = maxval(abs( ( xnew(:)-x(i,:) ) / xnew(:) ))
         if (derr.gt.eps.and.iter.lt.mmax) then
            goto 1
         else
            if (iter.ge.mmax) then
            write(unit=0,fmt=*) "Exceeded maximum iterations in adm ",
     *                    "in position ",i," of array X. DERR = ",derr
            !return
            endif
         endif
         x(i,:) = xnew(:)
      enddo
      return
      end

      
      
      
