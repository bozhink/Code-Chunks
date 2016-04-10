      subroutine bhhamilt(px,py,hbh)
*
* This subroutine calculates the Bloch-Huckel Hamiltonian
*
* 'px' 'py' -- input; values of wave-vector coordinates in 2D
* 'hbh'     -- output; matrix hbh(4,4) - the calculated hamiltonian matrix
*
      implicit double precision(a-h,o-z),integer(i-n)
      parameter(n=4)
      dimension hbh(n,n)
      common /BHPARAMS/ Ed,Es,Ep,Tpd,Tsp,Tpp
      Sx=2.d0*dsin(px*0.5d0)
      Sy=2.d0*dsin(py*0.5d0)
      hbh(1,1)=Ed
      hbh(2,2)=Es
      hbh(3,3)=Ep
      hbh(4,4)=Ep
      hbh(1,2)=0.d0
              hbh(2,1)=hbh(1,2)
      hbh(1,3)=Tpd*Sx
              hbh(3,1)=hbh(1,3)
      hbh(1,4)=-Tpd*sy
              hbh(4,1)=hbh(1,4)
      hbh(2,3)=Tsp*Sx
              hbh(3,2)=hbh(2,3)
      hbh(2,4)=Tsp*Sy
              hbh(4,2)=hbh(2,4)
      hbh(3,4)=-Tpp*Sx*Sy
              hbh(4,3)=hbh(3,4)
      return
      end
