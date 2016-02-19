      subroutine eigen(n,A,lda,ieigen,evalue,evector,info)
      implicit double precision(a-h,o-z),integer(i-n)
*
* This subroutine returns the 'ieigen'th eigenvalue & eigenvector of a matrix A
*
*       'n' -- input; dimension of vector space
*       'A' -- input; matrix A(lda,n)
*     'lda' -- input; leading dimension of A
*  'ieigen' -- input; order of required eigenvalue to be returned
*  'evalue' -- output; returned eigenvalue
* 'evector' -- output; returned eigenvector
*    'info' -- output; error flag
*
      character*1 jobz,uplo
      parameter(uplo='L',jobz='V')
      parameter (itype=1,lwork=1024)
      dimension A(lda,n),B(lda,n),evector(n)
      dimension w(n), work(lwork)
      do i=1,lda
         do j=1,n
            B(i,j)=0.d0
         enddo
         B(i,i)=1.d0
      enddo
      if (ieigen.lt.1.or.ieigen.gt.n) goto 10
      call dsygv(itype,jobz,uplo,n,A,lda,B,lda,w,work,lwork,info)
      if (info.ne.0) goto 20
      evalue=w(ieigen)
      do i=1,n
         evector(i)=A(i,ieigen)
      enddo
      return
   10 write(unit=0,fmt=100,err=1000) ieigen
      goto 30
   20 write(unit=0,fmt=200,err=1000) info
   30 print*, 'ERROR IN EIGEN'
      return
  100 format('ERROR in eigen: <ieigen> must be integer between 1 and n',
     +       /,'but you entered ',i7)
  200 format('ERROR in eigen: There is a problem in calculation of',
     +       'the eigensystem',/,'dsygv returned error code',i7)
 1000 stop 'eigen: connot write to STDERR'
      end

      subroutine eigen4(A,ieigen,evalue,evector,info)
      implicit double precision(a-h,o-z),integer(i-n)
*
* This subroutine returns the 'ieigen'th eigenvalue & eigenvector of a matrix A
* This subroutine works only with 4x4 matrices
*
*       'A' -- input; matrix A(4,4)
*  'ieigen' -- input; order of required eigenvalue to be returned
*  'evalue' -- output; returned eigenvalue
* 'evector' -- output; returned eigenvector
*    'info' -- output; error flag
*
      character*1 jobz,uplo
      parameter (uplo='L',jobz='V')
      parameter (itype=1,lwork=1024)
      parameter (n=4,lda=n)
      dimension A(lda,n),B(lda,n),evector(n)
      dimension w(n), work(lwork)
      data B /1.d0, 0.d0, 0.d0, 0.d0,
     *        0.d0, 1.d0, 0.d0, 0.d0,
     *        0.d0, 0.d0, 1.d0, 0.d0,
     *        0.d0, 0.d0, 0.d0, 1.d0/
      if (ieigen.lt.1.or.ieigen.gt.n) goto 10
      call dsygv(itype,jobz,uplo,n,A,lda,B,lda,w,work,lwork,info)
      if (info.ne.0) goto 20
      evalue=w(ieigen)
      do i=1,n
         evector(i)=A(i,ieigen)
      enddo
      return
   10 write(unit=0,fmt=100,err=1000) ieigen
      goto 30
   20 write(unit=0,fmt=200,err=1000) info
   30 print*,'ERROR IN EIGEN4'
      return
  100 format('ERROR in eigen4: <ieigen> must be integer between ',
     +       '1 and n but you entered ',i7)
  200 format('ERROR in eigen4: There is a problem in calculation of ',
     +       'the eigensystem',/,'dsygv returned error code',i7)
 1000 stop 'eigen4: connot write to STDERR'
      end
