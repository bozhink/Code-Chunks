      subroutine dludcmp(a,n,np,indx,d)
      implicit none
      integer n,np,indx(n),nmax
      double precision d,a(np,np),tiny
      parameter (nmax=500,tiny=1.d-20)
      integer i,imax,j,k
      double precision aamax,dum,sum,vv(nmax)
      d=1.d0
      do i=1,n
         aamax=0.d0
         do j=1,n
            if (dabs(a(i,j)).gt.aamax) aamax=dabs(a(i,j))
         enddo
         if (aamax.eq.0.d0) write(unit=0,fmt=100)
         vv(i)=1.d0/aamax
      enddo
      do j=1,n
         do i=1,j-1
            sum=a(i,j)
            do k=1,i-1
               sum=sum-a(i,k)*a(k,j)
            enddo
            a(i,j)=sum
         enddo
         aamax=0.d0
         do i=j,n
            sum=a(i,j)
            do k=1,j-1
               sum=sum-a(i,k)*a(k,j)
            enddo
            a(i,j)=sum
            dum=vv(i)*dabs(sum)
            if (dum.ge.aamax) then
               imax=i
               aamax=dum
            endif
         enddo
         if (j.ne.imax) then
            do k=1,n
               dum=a(imax,k)
               a(imax,k)=a(j,k)
               a(j,k)=dum
            enddo
            d=-d
            vv(imax)=vv(j)
         endif
         indx(j)=imax
         if (a(j,j).eq.0.d0) a(j,j)=tiny
         if (j.ne.n) then
            dum=1.d0/a(j,j)
            do i=j+1,n
               a(i,j)=a(i,j)*dum
            enddo
         endif
      enddo
      return
  100 format('singular matrix in dludcmp')
      end
      
      subroutine dlubksub(a,n,np,indx,b)
      implicit none
      integer n,np,indx(n)
      double precision a(np,np),b(n)
      integer i,ii,j,ll
      double precision sum
      ii=0
      do i=1,n
         ll=indx(i)
         sum=b(ll)
         b(ll)=b(i)
         if (ii.ne.0) then
            do j=ii,i-1
               sum=sum-a(i,j)*b(j)
            enddo
         elseif (sum.ne.0.d0) then
            ii=i
         endif
         b(i)=sum
      enddo
      do i=n,1,-1
         sum=b(i)
         do j=i+1,n
            sum=sum-a(i,j)*b(j)
         enddo
         b(i)=sum/a(i,i)
      enddo
      return
      end
