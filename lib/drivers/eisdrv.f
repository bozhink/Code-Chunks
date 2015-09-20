      implicit double precision (a-h,o-z),integer(i-n)
      parameter (nm=3)
      parameter (n=nm)
      parameter (matz=1)
      
      dimension a(nm,n),w(n),z(nm,n),fv1(n),fv2(n)
      data a / 1.d0, 3.d0, 7.d0,
     +         3.d0, 5.d0,11.d0,
     +         7.d0,11.d0,13.d0/
      
      call rs(nm,n,a,w,matz,z,fv1,fv2,ierr)
      print*
      print*,'a=',a
      print*
      print*,'matz=',matz
      print*
      print*,'w=',w
      print*
      print*,'z=',z
      print*
      print*,'ierr=',ierr
      print*
      stop
      end
