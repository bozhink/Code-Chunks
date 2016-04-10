      
      function tcintgnd(px,py)
      implicit none
c
c This subroutine calculates Tc-integrand function for
c Bloch-Huckel hamiltonian
c
c chip^2*(td((ep-Ef)/2T)+1)
c
c where ep is the third eigenvalue of Bloch-Huckel (BH) hamiltonian
c and chip = Dp*Sp, where wave-vector is psi_p=(Dp,Sp,Xp,Yp)
c
c Parameter list
c px, py -- input; scalars; components of the wave-vector
c Temp   -- scalar; temperature (in eV)
c Ef     -- scalar; Fermi energy level
c e      -- vector; List of diagonal components of BH hamiltonian
c           e = (ed, es, ep)
c t      -- vector; List of hopping parameters
c           t = (tpd, tsp, tpp)
c tcintgnd -- output; scalar; value of Tc-integrand function
c info   -- scalar; error flag of dsygv
      double precision px,py,tcintgnd
      double precision Temp,Ef,ed,es,ep,tpd,tsp,tpp
      integer itype,lwork,n,lda,ieigen,info
      double precision sx,sy,chip,td
      character*1 jobz,uplo
      parameter (uplo='L',jobz='V')
      parameter (itype=1,lwork=1024)
      parameter (n=4, lda=n, ieigen=3)
      double precision H(lda,n),EYE4(lda,n)
      double precision w(n), work(lwork)
c Common block Superconductivity Bloch-Huckel hamiltonian
      common /SCBHH/ H,EYE4,w,work
      common /BHPARAMS/ ed,es,ep,tpd,tsp,tpp
      common /tctempef/ Temp, Ef
      info=0
c Calculation of BH hamiltonian matrix
      sx=2.d0*dsin(0.5*px)
      sy=2.d0*dsin(0.5*py)
      H(1,1)=ed
      H(2,2)=es
      H(3,3)=ep
      H(4,4)=ep
      H(1,2)=0
      H(1,3)= tpd*sx
      H(1,4)=-tpd*sy
      H(2,3)= tsp*sx
      H(2,4)= tsp*sy
      H(3,4)=-tpp*sx*sy
      H(2,1)=H(1,2)
      H(3,1)=H(1,3)
      H(3,2)=H(2,3)
      H(4,1)=H(1,4)
      H(4,2)=H(2,4)
      H(4,3)=H(3,4)
c Calculation of Eigenvalues and eigenvectors
c using LAPACK's function dsygv
      call dsygv(itype,jobz,uplo,n,H,lda,EYE4,lda,w,work,lwork,info)
      if (info.ne.0) write(unit=0,fmt=10) info,px,py
      chip=H(1,ieigen)*H(2,ieigen)
      tcintgnd=chip*chip*td(0.5d0*(w(ieigen)-Ef)/Temp)
      return
   10 format('tcintgnd: WARNING: dsygv returned error flag=',i4,
     * 'at point (',f5.2,',',f5.2,')')
      end

      function i1(Temp,ess,Ef,ifprint)
      implicit none
c This function calculates integral over tcintgnd
c
c Parameters
c 'Temp' -- input; temperature in [eV]
c 'ess'   -- input; BH hamiltonian parameter es
c 'Ef'   -- input; fermi energy level in [eV]
c 'ifprint' -- input; logical; prints information
      double precision i1, Temp, ess, Ef
      logical ifprint
      double precision tcintgnd
      external tcintgnd
      double precision pi
      parameter (pi=3.1415926535897932d0)
      double precision eps
      parameter (eps=1.d-4)
      double precision res
      integer nevals, iflag
      double precision ed,es,ep,tpd,tsp,tpp
      double precision tc, efermi
      common /BHPARAMS/ ed,es,ep,tpd,tsp,tpp
      common /tctempef/ tc, efermi
      tc=Temp
      efermi=Ef
      es=ess
      call integ2d(tcintgnd,0.d0,0.d0,pi,pi,eps,res,nevals,iflag)
      i1=res/(pi*pi)
      if (ifprint) write(unit=0,fmt=100)Temp,es,Ef,i1,nevals,iflag
      return
  100 format('i1: Temp= ',f9.6,' es= ',f7.3,' Ef= ',f7.3,
     * ' i1= ',f12.6,' nevals= ',i5,' iflag= ',i4)
      end
