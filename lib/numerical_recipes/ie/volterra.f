      subroutine voltra(n,m,t0,h,f,g,ak)
      implicit none
      integer m,n,mmax
      double precision h,t0,f(m,n),t(n),g,ak
      external ak,g
      parameter (mmax=5)
c uses ak,g,lubksb,ludcmp
      integer i,j,k,l,indx(mmax)
      double precision d,sum,a(nmax,nmax),b(nmax)
      t(1)=t0
      do k=1,m
         f(k,1)=g(k,t(1))
      enddo
      do i=2,n
         t(i)=t(i-1)+h
         do k=1,m
            sum=g(k,t(i))
            do l=1,m
               sum=sum+h*ak(k,l,t(i),t(1)) * f(l,1)
               do j=2,i-1
                  sum=sum+h*ak(k,l,t(i),t(j)) * f(l,j)
               enddo
               if (k.eq.l) then
                  a(k,l)=1.d0
               else
                  a(k,l)=0.d0
               endif
               a(k,l)=a(k,l)-0.5d0*h*ak(k,l,t(i),t(i))
            enddo
            b(k)=sum
         enddo
         call ludcmp(a,m,mmax,indx,d) !????????????
         call lubksb(a,m,mmax,indx,b)
         do k=1,m
            f(k,i)=b(k)
         enddo
      enddo
      return
      end
