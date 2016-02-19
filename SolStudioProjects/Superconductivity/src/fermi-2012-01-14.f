      subroutine fermi(px,py,Temp,Ef,e,t,fdist,info)
      implicit none
c
c This subroutine calculates fermi distribution function for
c Bloch-Huckel hamiltonian
c
c (exp((ep-Ef)/T)+1)^{-1}
c
c where ep is the third eigenvalue of Bloch-Huckel (BH) hamiltonian
c
c Parameter list
c px, py -- input; scalars; components of the wave-vector
c Temp   -- input; scalar; temperature (in eV)
c Ef     -- input; scalar; Fermi energy level
c e      -- input; vector; List of diagonal components of BH hamiltonian
c           e = (ed, es, ep)
c t      -- input; vector; List of hopping parameters
c           t = (tpd, tsp, tpp)
c fdist  -- output; scalar; value of Fermi-distribution function
c info   -- output; scalar; error flag of dsygv
      double precision px,py,Temp,Ef,e(3),t(3),fdist
      integer itype,lwork,n,lda,ieigen,info
      double precision sx,sy
      character*1 jobz,uplo
      parameter (uplo='L',jobz='N')
      parameter (itype=1,lwork=1024)
      parameter (n=4, lda=n, ieigen=3)
      double precision H(lda,n),EYE4(lda,n)
      double precision w(n), work(lwork)
c Common block Superconductivity Bloch-Huckel hamiltonian
      common /SCBHH/ H,EYE4,w,work
*      save
*      data EYE4 /1.d0, 0.d0, 0.d0, 0.d0,
*     *           0.d0, 1.d0, 0.d0, 0.d0,
*     *           0.d0, 0.d0, 1.d0, 0.d0,
*     *           0.d0, 0.d0, 0.d0, 1.d0/
      info=0
c Calculation of BH hamiltonian matrix
      sx=2.d0*dsin(0.5*px)
      sy=2.d0*dsin(0.5*py)
      H(1,1)=e(1)
      H(2,2)=e(2)
      H(3,3)=e(3)
      H(4,4)=e(3)
      H(1,2)=0
      H(1,3)= t(1)*sx
      H(1,4)=-t(1)*sy
      H(2,3)= t(2)*sx
      H(2,4)= t(2)*sy
      H(3,4)=-t(3)*sx*sy
      H(2,1)=H(1,2)
      H(3,1)=H(1,3)
      H(3,2)=H(2,3)
      H(4,1)=H(1,4)
      H(4,2)=H(2,4)
      H(4,3)=H(3,4)
c Calculation of Eigenvalues and eigenvectors
c using LAPACK's function dsygv
      call dsygv(itype,jobz,uplo,n,H,lda,EYE4,lda,w,work,lwork,info)
      fdist=1.d0/(dexp((w(ieigen)-Ef)/Temp)+1.d0)
      return
      end

      subroutine nfermi(nx,px,ny,py,Temp,Ef,e,t,fdist,info)
      implicit none
c
c This subroutine tabulates fermi distribution function for
c Bloch-Huckel hamiltonian over net (px,py) with (nx,ny)
c
c (exp((ep-Ef)/T)+1)^{-1},
c
c where ep is the third eigenvalue of Bloch-Huckel (BH) hamiltonian
c
c Parameter list
c nx, ny -- input; scalars; dimension for vectors px and py
c px, py -- input; vectors; components of the wave-vector
c Temp   -- input; scalar; temperature (in eV)
c Ef     -- input; scalar; Fermi energy level
c e      -- input; vector; List of diagonal components of BH hamiltonian
c           e = (ed, es, ep)
c t      -- input; vector; List of hopping parameters
c           t = (tpd, tsp, tpp)
c fdist  -- output; matrix of size (nx,ny); value of Fermi-distribution function
c info   -- output; scalar; error flag
      integer nx,ny,info
      double precision px(nx),py(ny),Temp,Ef,e(3),t(3),fdist(nx,ny)
      integer ix,iy,inf
      info=0
      do ix=1,nx
         do iy=1,ny
            call fermi(px(ix),py(iy),Temp,Ef,e,t,fdist(ix,iy),inf)
            if (inf.ne.0) then
               write(unit=0,fmt=100)ix,iy,px(ix),py(iy),inf
               info=inf
            endif
         enddo
      enddo
      return
  100 format("nfermi:Error in dsygv at point (",i5,1x,i5,")=(",
     *  f5.2,1x,f5.2,").",/,"Error flag:",i7)
      end
