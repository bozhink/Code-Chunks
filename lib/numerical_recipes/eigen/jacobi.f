      subroutine jacobi(a,n,np,d,v,nrot)
      implicit none
      integer n,np,nrot,NMAX
      real a(np,np),d(np),v(np,np)
      parameter(NMAX=500)
c Computes all eigenvalues and eigenvectors of a real symmetric matrix a,
c which is of size n by n, stored in a physical np by np array.
c On output, elements of a above the diagonal are destroyed.
c d returns the eigenvalues of a in its first n elements.
c v is a matrix with the same logical and physical dimensions as a,
c whose columns contain, on output, the normalized eigenvectors of s.
c nrot returns the nubmer of Jacobi rotations that were required.
      integer i,ip,iq,j
      real c,g,h,s,sm,t,tau,theta,tresh,b(NMAX),z(NMAX)
c Initialize to the identity matrix
      do ip=1,n
         do iq=1,n
            v(ip,iq)=0.0
         enddo
         v(ip,ip)=1.0
      enddo
c Initialize b and d to the diagonal of a
      do ip=1,n
         b(ip)=a(ip,ip)
         d(ip)=b(ip)
         z(ip)=0.0        !This vector accumulate terms of the form t*a_{pq}
      enddo
      nrot=0
      do i=1,50
         sm=0.0
         do ip=1,n-1      ! Sum off-diagonal elements
            do iq=ip+1,n
               sm=sm+abs(a(ip,iq))
            enddo
         enddo
c The normal returnq which relies on quadratic convergence to machine underflow.
         if (sm.eq.0.0) return
         if (i.lt.4) then
            tresh=0.2*sm/n**2 ! ...on first three sweeps.
         else
            tresh=0.0         ! ... thereafter.
         endif
         do ip=1,n-1
            do iq=ip+1,n
               g=100.0*abs(a(ip,iq))
               ! After four sweeps, skip the rotation if the off-diagonal element is small.
               if ((i.gt.4).and.(abs(d(ip))+g.eq.abs(d(ip)))
     *             .and.(abs(d(iq))+g.eq.abs(d(iq)))) then
                  a(ip,iq)=0.0
               elseif (abs(a(ip,iq)).gt.tresh) then
                  h=d(iq)-d(ip)
                  if (abs(h)+g.eq.abs(h)) then
                     t=a(ip,iq)/h
                  else
                     theta=0.5*h/a(ip,iq)
                     t=1./(abs(theta)+sqrt(1.0+theta*theta))
                     if (theta.lt.0.0) t=-t
                  endif
                  c=1.0/sqrt(1+t*t)
                  s=t*c
                  tau=s/(1.0+c)
                  h=t*a(ip,iq)
                  z(ip)=z(ip)-h
                  z(iq)=z(iq)+h
                  d(ip)=d(ip)-h
                  d(iq)=d(iq)+h
                  a(ip,iq)=0.0
c                 Case of rotations 1<=j<p
                  do j=1,ip-1
                     g=a(j,ip)
                     h=a(j,iq)
                     a(j,ip)=g-s*(h+g*tau)
                     a(j,iq)=h+s*(g-h*tau)
                  enddo
c                 Case or rotations p<j<q
                  do j=ip+1,iq-1
                     g=a(ip,j)
                     h=a(j,iq)
                     a(ip,j)=g-s*(h+g*tau)
                     a(j,iq)=h+s*(g-h*tau)
                  enddo
c                 Case of rotations q<j<=n.
                  do j=iq+1,n
                     g=a(ip,j)
                     h=a(iq,j)
                     a(ip,j)=g-s*(h+g*tau)
                     a(iq,j)=h+s*(g-h*tau)
                  enddo
                  do j=1,n
                     g=v(j,ip)
                     h=v(j,iq)
                     v(j,ip)=g-s*(h+g*tau)
                     v(j,iq)=h+s*(g-h*tau)
                  enddo
                  nrot=nrot+1
               endif
            enddo
         enddo
         do ip=1,n
            b(ip)=b(ip)+z(ip)
            d(ip)=b(ip)
            z(ip)=0.0
         enddo
      enddo
      Write(unit=0,fmt=*)"too many iterations in jacobi"
      return
      end
      
      subroutine eigstr(d,v,n,np)
      implicit none
      integer n,np
      real d(np),v(np,np)
c Given the eigenvalues d and eigenvectors v as output from jacobi or tqli
c this routine sorts the eigenvalues into descending order, and rearranges 
c the colimns of ycorrespondingly. The method is straight insertion.
      integer i,j,k
      real p
      do i=1,n-1
         k=i
         p=d(i)
         do j=i+1,n
            if (d(j).ge.p) then
               k=j
               p=d(j)
            endif
         enddo
         if (k.ne.i) then
            d(k)=d(i)
            d(i)=p
            do j=1,n
               p=v(j,i)
               v(j,i)=v(j,k)
               v(j,k)=p
            enddo
         endif
      enddo
      return
      end
