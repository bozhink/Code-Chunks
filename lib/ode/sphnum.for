c Spherically simmetrin Shrodinger's equation
c using Numerov method
c (d2 u)/(dr2) = func(r)*u(r)
c func(x) = V(x) + l(l+1)/r^2 - E
      subroutine sphnum(V,L,E,h,n,x,u)
      implicit real*8(a-h,o-z),integer(i-n)
      parameter (eps=1.d-14)
      external V
      dimension x(n), u(n)
      if (n.le.2) then
         print 100
         return
      endif
      if (dabs(u(1)).le.eps.and.dabs(u(2)).le.eps) print 110
      if (h.le.eps) print 120
c      
      hh=h*h
      h2=hh/12.d0
c      
      do 10 i=2,n-1
         field=V(x(i))+dble(L*(L+1))/(x(i)*x(i))-E
         u(i+1)=2.d0*u(i)-u(i-1)+hh*field*u(i)/(1.d0-h2*field)
         x(i+1)=x(i)+h
   10 continue
c 
      return
  100 format('sphnum: Numerov algorithm needs at least three points')
  110 format('sphnum: initial values probably not initialized')
  120 format('sphnum: stride h probaly not initialized')
      end

      
