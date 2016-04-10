      blockdata initial
      implicit double precision(a-h,o-z),integer(i-n)
      parameter(n=4,lda=n,lwork=1024)
      double precision H(lda,n),EYE4(lda,n)
      double precision w(n), work(lwork)
c Common block Superconductivity Bloch-Huckel hamiltonian
      common /SCBHH/ H,EYE4,w,work
      common /BHPARAMS/ Ed,Es,Ep,Tpd,Tsp,Tpp
      data EYE4 /1.d0, 0.d0, 0.d0, 0.d0,
     *           0.d0, 1.d0, 0.d0, 0.d0,
     *           0.d0, 0.d0, 1.d0, 0.d0,
     *           0.d0, 0.d0, 0.d0, 1.d0/
      data Ed /0.d0/
      data Es /3.934d0/
      data Ep /-1.d0/
      data Tpd /1.5d0/
      data Tsp /2.d0/
      data Tpp /0.2d0/
      save
      end
