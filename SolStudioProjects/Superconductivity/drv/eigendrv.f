      program drive
      implicit double precision(a-h,o-z),integer(i-n)
      parameter(n=4)
      dimension h(n,n)
      dimension evector(n)
      parameter(pi = 3.141592653589792d0)
      px=pi/2.d0
      py=pi/3.d0
      call bhhamilt(px,py,h)
      print*
      print*,'Hamiltonian'
      do i=1,4
      print10,(h(j,i),j=1,n)
      enddo
      print*
      ieigen=3
      call eigen4(h,ieigen,evalue,evector,info)
      print*,'Eigen'
      print*,'eigenvalue:  ',evalue
      print*,'eigenvector: ',evector
      print*,info
      print*
      di=dinteg(px,py,0.5d0,100.d0)
      print*,di,px,py
      stop
   10 format(4(1x,e16.7))
      end
