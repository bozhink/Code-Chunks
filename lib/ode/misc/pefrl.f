      implicit double precision(a-h,o-z),integer(i-n)
      parameter (xi1=+0.1786178958448091d+00)
      parameter (xi2=-0.2123418310626054d+00)
      parameter (xi3=-0.6626458266981849d-01)
      print 100,1,xi1
      print 100,2,xi2
      print 100,3,xi3
      print 100,4,(1.d0-2.d0*xi2)/2.d0
      print 100,5,(1.d0-2.d0*(xi3+xi1))
      stop
  100 format(6x,'parameter(xi',i1,'=',d23.16,')')
      end
