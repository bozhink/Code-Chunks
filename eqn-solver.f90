      subroutine gaussian_elimination(a,b,n,np1,eps)
      implicit none
      integer n,np1
      double precision a(n,np1), b(n), eps
      integer i,j,k,ii,jj,ji,kj,ll,nn,npivot
      double precision y,con
      !
      ! Last column matrix a set equal to vector b
      do i=1,n
          a(i,np1)=b(i)
      enddo
      ! Selecting proper pivot row
      do ii=2,n
         i=ii-1
         npivot=i
         do jj=ii,n
            if (dabs(a(npivot,i)).lt.dabs(a(jj,i))) then
               npivot=jj
            endif
         enddo
         !
         ! Checking for singularity of matrix a
         if (dabs(a(npivot,i)).lt.eps) then
            print*,'Diagonal element zero,'
            print*,'matrix may be  singular'
            return
         endif
         if (npivot.ne.i) then
            do jj=1,np1
               y=a(i,jj)
               a(i,jj)=a(npivot,jj)
               a(npivot,jj)=y
            enddo
         endif
         do ji=ii,n
            if (dabs(a(ji,i)).ge.eps) then
               con=a(ji,i)/a(i,i)
               a(ji,i)=con
               do kj=ii,np1
                  a(ji,kj)=a(ji,kj)-con*a(i,kj)
               enddo
            endif
         enddo
      enddo
      !
      if (dabs(a(n,n)).lt.eps) then
         print*,'Diagonal element zero,'
         print*,'matrix may be singular'
         return
      endif
      !
      ! Back substitution
      a(n,np1)=a(n,np1)/a(n,n)
      do j=2,n
         nn=np1-j
         ll=nn+1
         con=a(nn,np1)
         do k=ll,n
            con=con-a(nn,k)*a(k,np1)
         enddo
         a(nn,np1)=con/a(nn,nn)
      enddo
      do i=1,n
         b(i)=a(i,np1)
      enddo
      end

