      implicit real*16(a-z)
      theta = 1.q0/(2.q0 - 2.q0**(1.q0/3.q0))
      print*,theta
      print*,theta/2.q0
      print*,(1.q0-theta)/2.q0
      print*,(1.q0-2.q0*theta)
      stop
      end
