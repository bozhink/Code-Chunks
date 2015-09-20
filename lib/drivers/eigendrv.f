      program EigenDrive
      implicit double precision(a-h,o-z),integer(i-n)
      parameter (n=4,nm=n)
      parameter (lda=n)
      parameter (ldb=n)
      parameter (itype=1)
      parameter (lwork=1024)
      character*1 jobz,uplo
      parameter(uplo='L')
      dimension A(lda,n),B(ldb,n)
      dimension w(n), work(lwork)
      integer is1,is2,ierr,matz
      double precision wr(n),wi(n),z(nm,n),fv1(n),fv2(n)
      integer iv1(n)
      do i=1,ldb
         do j=1,n
            B(i,j)=0.d0
         enddo
         B(i,i)=1.d0
      enddo

      x0 = 0.d0
      x1 = 1.d0
      NN = 1 000 000
      h  = dabs(x1-x0)/dble(NN)

! !       call setA(0.4d0,n,A,lda)
! !       call dsygv(itype,"V",uplo,n,A,lda,B,ldb,w,work,lwork,info)
! !       print*
! !       print*,w
! !       print*
! !       print*,A
! !       print*
! !       print*,work(1)


      jobz='N'
      call cpu_time(dstart)
      x=x0
      do k=1,NN
      call setA(x,n,A,lda)
      call dsygv(itype,jobz,uplo,n,A,lda,B,ldb,w,work,lwork,info)
      x = x + h
      enddo
      call cpu_time(dstop)
      print*,'without eigenvectors:'
      print*,dstop-dstart
      print*,(dstop-dstart)/dble(NN)
      print*

      jobz='V'
      call cpu_time(dstart)
      x=x0
      do k=1,NN
      call setA(x,n,A,lda)
      call dsygv(itype,jobz,uplo,n,A,lda,B,ldb,w,work,lwork,info)
      x = x + h
      enddo
      call cpu_time(dstop)
      print*,'with eigenvectors:'
      print*,dstop-dstart
      print*,(dstop-dstart)/dble(NN)
      print*

!       matz=0
!       call cpu_time(dstart)
!       x=x0
!       do k=1,NN
!       call setA(x,n,A,lda)
!       call rg(nm,n,a,wr,wi,matz,z,iv1,fv1,ierr)
!       x = x + h
!       enddo
!       call cpu_time(dstop)
!       print*,'without eigenvectors:'
!       print*,dstop-dstart
!       print*,(dstop-dstart)/dble(NN)
!       print*
!
!       matz=1
! !       call cpu_time(dstart)
! !       x=x0
! !       do k=1,NN
! !       call setA(x,n,A,lda)
!       call setA(0.4d0,n,A,lda)
!       call rs(nm,n,a,wr,matz,z,fv2,fv1,ierr)
!       print*,ierr
!       print*,wr
!       print*
!       print*,z
!       x = x + h
!       enddo
!       call cpu_time(dstop)
!       print*,'with eigenvectors:'
!       print*,dstop-dstart
!       print*,(dstop-dstart)/dble(NN)
!       print*
      stop
      end

      subroutine setA(x,n,A,lda)
      implicit double precision (a-h,o-z),integer(i-n)
      dimension A(lda,n)
      parameter(pi=3.1415926535897932)
      do i=1,lda
         do j=1,n
            A(i,j)=dsin(2.d0*pi*x*dble(i+j-1)/dble(n))
         enddo
      enddo
      return
      end
