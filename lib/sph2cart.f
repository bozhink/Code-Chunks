      program Sph2Cart
c Spherical coordinates-to-cartesian
      implicit double precision(a-h,o-z),integer(i-n)
      do
      read(unit=*,fmt=*,iostat=ierr,err=100,end=90)
     * r,t,p
      x=r*dsin(t)*dcos(p)
      y=r*dsin(t)*dsin(p)
      z=r*dcos(t)
      print*,x,y,z
      enddo
   90 stop
  100 write(unit=0,fmt=*) 'Error reading input data'
      stop
      end

