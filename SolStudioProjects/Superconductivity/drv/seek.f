      program seek
      implicit double precision(a-h,o-z),integer(i-n)
      parameter(n=4)
      dimension h(n,n)
      dimension evector(n)
      parameter(pi = 3.141592653589792d0)
      data pmin/0.d0/
      data pmax/pi/
      data ph/1.d-8/
      data ieigen/3/

      px=0.d0
      py=0.d0
      call bhhamilt(px,py,h)
      call eigen4(h,ieigen,evalue,evector,info)
      print*,'eigenvalue:  ',evalue
      print*,'eigenvector: ',evector
      print*,info
      print*

      px=pi
      py=pi
      call bhhamilt(px,py,h)
      call eigen4(h,ieigen,evalue,evector,info)
      print*,'eigenvalue:  ',evalue
      print*,'eigenvector: ',evector
      print*,info
      print*
      stop
   10 format(4(1x,e16.7))
      end
