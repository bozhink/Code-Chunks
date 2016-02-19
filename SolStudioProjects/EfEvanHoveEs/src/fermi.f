      doubleprecision function fdist(px,py)
      implicit none
c
c This function calculates Fermi distribution function for
c Bloch-Huckel hamiltonian
c
c (exp((ep-Ef)/T)+1)^{-1}
c
c where ep is the third eigenvalue of Bloch-Huckel (BH) hamiltonian
c
c Parameter list
c px, py -- input; scalars; components of the wave-vector
c Temp   -- scalar; temperature (in eV)
c Ef     -- scalar; Fermi energy level
c fidst  -- scalar; value of Fermi-distribution function
c info   -- scalar; error flag of dsygv
      double precision px, py
      double precision Temp, Ef
      double precision Ed, Es, Ep, Tpd, Tsp, Tpp
      double precision sx, sy
      integer ieigen, info
      character*1 jobz, uplo
      parameter (uplo='L',jobz='N')
      integer itype, lwork, n, lda
      parameter (itype=1, lwork=1024)
      parameter (n=4, lda=n, ieigen=3)
      double precision H(lda,n), EYE4(lda,n)
      double precision w(n), work(lwork)
c Common block Superconductivity Bloch-Huckel hamiltonian
      common /SCBHH/ H, EYE4, w, work
c Common block: parameters of Bloch-Huckel hamiltonian
      common /BHPARAMS/ Ed,Es,Ep,Tpd,Tsp,Tpp
c Common block: Temperature [in eV] and Fermi Energy [in eV]
      common /TEMPEF/ Temp, Ef
c Common block: Error flag
      common /EINFO/ info
      info=0
c Calculation of BH hamiltonian matrix
      sx=2.d0*dsin(0.5*px)
      sy=2.d0*dsin(0.5*py)
      H(1,1)=Ed
      H(2,2)=Es
      H(3,3)=Ep
      H(4,4)=Ep
      H(1,2)=0
      H(1,3)= Tpd*sx
      H(1,4)=-Tpd*sy
      H(2,3)= Tsp*sx
      H(2,4)= Tsp*sy
      H(3,4)=-Tpp*sx*sy
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

      doubleprecision function finteg()
      implicit none
c This function calculates the Fermi integral:
c 2D integral of Fermi distribution function over
c First zone of Brillouin
c
c This function has no input psrameters: They are passed through
c common blocks
      double precision fdist
      external fdist
      double precision res, pi
      parameter (pi=3.1415926535897932D0)
      integer nevals, iflag
      logical ifprint
      common /LPRINT/ ifprint
      call integ2d(fdist,0.d0,0.d0,pi,pi,1.d-4,res,nevals,iflag)
      finteg=res/(pi*pi)
      if (ifprint) write(unit=0,fmt=100) finteg, nevals, iflag
      return
  100 format('finteg:',e10.4,1x,i7,1x,i7)
      end
      

      subroutine fermi(px,py,Temp,Ef,e,t,fdst,info)
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
c fdst  -- output; scalar; value of Fermi-distribution function
c info   -- output; scalar; error flag of dsygv
      double precision px,py,Temp,Ef,e(3),t(3),fdst
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
      fdst=1.d0/(dexp((w(ieigen)-Ef)/Temp)+1.d0)
      return
      end

      subroutine nfermi(nx,px,ny,py,Temp,Ef,e,t,fdst,info)
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
c fdst  -- output; matrix of size (nx,ny); value of Fermi-distribution function
c info   -- output; scalar; error flag
      integer nx,ny,info
      double precision px(nx),py(ny),Temp,Ef,e(3),t(3),fdst(nx,ny)
      integer ix,iy,inf
      info=0
      do ix=1,nx
         do iy=1,ny
            call fermi(px(ix),py(iy),Temp,Ef,e,t,fdst(ix,iy),inf)
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

      DOUBLEPRECISION FUNCTION FINDEF(ESS,FILLINGF)
      IMPLICIT NONE
C NOTE THAT FILLINGF IS THE FOLLOWING FILLING FACTOR
C   FILLINGF = 1/2 - P
      DOUBLE PRECISION ESS, FILLINGF, EFERMI
      DOUBLE PRECISION FINTEG
      EXTERNAL FINTEG
      LOGICAL IFPRINT
      INTEGER NMAX,ITER,IERR,I,J
      DOUBLE PRECISION RELERR,ABSERR
      DOUBLE PRECISION EF0,F0,EF1,F1,DF
      DOUBLE PRECISION KELVIN, PI, ZERO
      PARAMETER (KELVIN=1.D0/11604.D0)
      PARAMETER (PI=3.1415926535897932D0)
      PARAMETER (ZERO=1.D-300)
      DOUBLE PRECISION Ed, Es, Ep, Tpd, Tsp, Tpp
      DOUBLE PRECISION TEMP, EF
      COMMON /BHPARAMS/ Ed, Es, Ep, Tpd, Tsp, Tpp
      COMMON /TEMPEF/ TEMP, EF
      COMMON /LPRINT/ IFPRINT
C
      TEMP = 90*KELVIN
      NMAX = 30
      RELERR = 0.001D0
      ABSERR = 0.001D0
      IFPRINT = .FALSE.
      Es  = ESS
      EF0 = 0.1D0
      EF  = EF0
      F0  = FINTEG() - FILLINGF
      EF1 = 3.0D0
      EF  = EF1
      F1  = FINTEG() - FILLINGF
      ITER = 0
      ! SECANT METHOD STARTS HERE
      DO J=1,NMAX
         ITER = ITER+1                        ! NUMBER OF ITERATIONS
         DF = F1 - F0                         ! THIS PARAMETER GOES IN DENOMINATOR
         IF (DABS(DF).LT.ZERO) THEN           ! SO IT MUST NOT BE ZERO
            IERR=1                            ! BUT IF IT IS ZERO
            IF (IFPRINT) WRITE(UNIT=0,FMT=10) ! ERROR IS RAISED
            EFERMI=0.D0                       ! AND EFERMI IS SET TO ZERO
            GOTO 1
         ENDIF
         EFERMI = EF1 - F1*(EF1-EF0)/DF       ! NET APPROXIMATION: SECANT STEP
         IF (DABS(EF1).LT.ZERO) THEN
            IF (IFPRINT) WRITE(UNIT=0,FMT=11)
            IF (DABS(EFERMI-EF1).LT.ABSERR) GOTO 1
         ELSE
            IF (DABS((EFERMI-EF1)/EF1).LT.ABSERR) GOTO 1
         ENDIF
         EF0 = EF1
         F0  = F1
         EF1 = EFERMI
         EF  = EF1
         F1  = FINTEG() - FILLINGF
      ENDDO
    1 CONTINUE
      ! SECANT METHOD ENDS HERE
      !
      FINDEF=EFERMI
      RETURN
   10 FORMAT('FINDESEF: ERROR: function finteg is ',
     * 'too slowly changing by EF')
   11 FORMAT('FINDESEF: WARNING: old approximation ',
     * 'is too close to zero')
      END
