      module eqn_solver
         public :: gauss_elimination
      contains
      
      subroutine gauss_elimination(a, b, n, np1, eps)
      implicit none
      real*8, dimension(:,:),intent(in out) :: a
      real*8, dimension(:), intent(in out)  :: b
      real*8, intent(in)                    :: eps
      integer, intent(in)                   :: n, np1
      integer ::i,j,k,ii,jj,ji,kj,ll,nn,npivot
      real*8 :: y, con
      !
      ! Last column of matrix a set equal to vector b
      a(:,np1) = b(:)
      ! Selecting proper pivot row
      do ii=2,n
         i=ii-1
         npivot=i
         do jj=ii,n
            if (abs(a(npivot,i)) < abs(a(jj,i))) then
               npivot=jj
            endif
         enddo
         !
         ! Checking for singularity of matrix a
         if (abs(a(npivot,i)) < eps) then
            print*,"Diagonal element zero,"
            print*,"matrix may be singular"
            return
         endif
         if (npivot .ne. i) then
            do jj=1,np1
               y=a(i,jj)
               a(i,jj)=a(npivot,jj)
               a(npivot,jj)=y
            enddo
         endif
         do ji=ii,n
            if (abs(a(ji,i)) >= eps) then
               con=a(ji,i)/a(i,i)
               a(ji,i)=con
               do kj=ii, np1
                  a(ji,kj)=a(ji,kj)-con*a(i,kj)
               enddo
            endif
         enddo
      enddo
      
      if (abs(a(n,n)) < eps) then
         print*, "Diagonal element zero,"
         print*, "matrix may be singular"
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
      b(:) = a(:,np1)
      end subroutine gauss_elimination
      
      end module eqn_solver

         
