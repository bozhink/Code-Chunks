      program Helium
      implicit double precision(a-h,o-z),integer(i-n)
      parameter (n=4)
      parameter (lda=n)
      parameter (ldb=n)
      parameter (itype=1)
      parameter (lwork=1024)
      character*1 jobz,uplo
      parameter(jobz='V',uplo='U')
      dimension H(lda,n),F(lda,n),S(ldb,n),Q(n,n,n,n),C(n)
      dimension w(n), work(lwork)

      call hes(S)
      call heh(H)
      call heq(Q)
*
* Initial values to vector C
      do i=1,n
         C(i)=1.d0
      enddo

      ii=0

  100 ii=ii+1
*
* Normalisation
      call normc(S,C)
      print*,C

      call heEG(H,Q,C,EG)
      print*,EG
*
* Matrix F
      call hef(H,Q,C,F)
*
* Solving General eigenvalue problem
      call dsygv(itype,jobz,uplo,n,F,lda,S,ldb,w,work,lwork,info)
*      print*,work(1),info
      print*,w

      do i=1,n
         C(i)=F(i,1)
      enddo
      call heEG(H,Q,C,EG)
      print*,".......",C
      print*,".......",EG

      if (ii.lt.10) goto 100

      stop
      end
