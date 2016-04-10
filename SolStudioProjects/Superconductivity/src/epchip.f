      subroutine epchip(H,ep,chip,chip2,info)
      implicit double precision(a-h,o-z),integer(i-n)
*
* This subroutine calculates parameter ep, chip and chip^2 for the Bloch-Huckel hamiltonian H,
*      calculated in the corresponding point,
*      where ep, etc. is corresponding to the 3rd eigenvalue, etc.
*
*       'H' -- input; Bloch-Huckel hamiltonian, calculated in the required point
*      'ep' -- output; returned eigenvalue #3
*    'chip' -- output; Sp*Dp, where (Dp,Sp,Xp,Yp) is the 3rd eigenvector
*   'chip2' -- output; (Sp*Dp)^2, where (Dp,Sp,Xp,Yp) is the 3rd eigenvector
*    'info' -- output; error flag
*
      character*1 jobz,uplo
      parameter (uplo='L',jobz='V')
      parameter (itype=1,lwork=1024)
      parameter (n=4,lda=n)
      dimension H(lda,n),B(lda,n),evector(n)
      dimension w(n), work(lwork)
      data B /1.d0, 0.d0, 0.d0, 0.d0,
     *        0.d0, 1.d0, 0.d0, 0.d0,
     *        0.d0, 0.d0, 1.d0, 0.d0,
     *        0.d0, 0.d0, 0.d0, 1.d0/
      ep=0.d0
      chip=0.d0
      chip2=0.d0
      info=0
      call dsygv(itype,jobz,uplo,n,H,lda,B,lda,w,work,lwork,info)
      if (info.ne.0) goto 20
      ep=w(3)
      chip=H(1,3)*H(2,3)
      chip2=chip*chip
      return
   20 write(unit=0,fmt=200,err=1000) info
      return
  200 format('ERROR in epchip: There is a problem in calculation of ',
     +       'the eigensystem',/,'dsygv returned error code',i7)
 1000 print*, 'epchip: connot write to STDERR'
      end
