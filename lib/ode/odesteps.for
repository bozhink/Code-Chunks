      subroutine LFVVS(F,h,idimv,x0,v0,F0,x,v,F1)
* subroutine name: LeapFrog Velocity Verlet Step
*
* 'F'     -- input; external; subroutine F(idimv,x,xdot)
* 'h'     -- input; time step
* 'idimv' -- input; dimension of vector space
* 'x0'    -- input; vector; initial positions
* 'v0'    -- input; vector; initial velocities
* 'F0'    -- input; vector; F0 = F(x0)
* 'x'     -- output; vector; next-step positions
* 'v'     -- output; vector; next-step velocities
* 'F1'    -- output; vector; F1 = F(x,t)
      implicit real*8(a-h,o-z),integer(i-n)
      external F
      dimension x0(idimv),v0(idimv),x(idimv),v(idimv)
      dimension F0(idimv),F1(idimv)
      hh=0.5d0*h
      do i=1,idimv
         v(i)=v0(i)+hh*F0(i)
         x(i)=x0(i)+h*v(i)
      enddo
      call F(idimv,x,F1)
      do i=1,idimv
         v(i)=v(i)+hh*F1(i)
      enddo
      return
      end

      subroutine LFPVS(F,h,idimv,x0,v0,x,v)
* subroutine name: LeapFrog Position Verlet Step
*
* 'F'     -- input; external; subroutine F(idimv,x,xdot)
* 'h'     -- input; time step
* 'idimv' -- input; dimension of vector space
* 'x0'    -- input; vector; initial positions
* 'v0'    -- input; vector; initial velocities
* 'x'     -- output; vector; next-step positions
* 'v'     -- output; vector; next-step velocities
      implicit real*8(a-h,o-z),integer(i-n)
      external F
      dimension x0(idimv),v0(idimv),x(idimv),v(idimv)
      dimension F1(idimv)
      hh=0.5d0*h
      do i=1,idimv
         x(i)=x0(i)+hh*v0(i)
      enddo
      t = t0+h
      call F(idimv,x,F1)
      do i=1,idimv
         v(i)=v0(i)+h*F1(i)
         x(i)=x(i)+hh*v(i)
      enddo
      return
      end

      subroutine FRS(F,h,idimv,x0,v0,x,v)
* subroutine name: Forest-Ruth Step
*
* 'F'     -- input; external; subroutine F(idimv,x,xdot)
* 'h'     -- input; time step
* 'idimv' -- input; dimension of vector space
* 'x0'    -- input; vector; initial positions
* 'v0'    -- input; vector; initial velocities
* 'x'     -- output; vector; next-step positions
* 'v'     -- output; vector; next-step velocities
      implicit real*8(a-h,o-z),integer(i-n)
      external F
      parameter(th0= 1.351207191959657d0)
      parameter(th1= 0.6756035959798288d0)
      parameter(th2=-0.1756035959798288d0)
      parameter(th3=-1.702414383919315d0)
      dimension x0(idimv),v0(idimv),x(idimv),v(idimv)
      dimension F1(idimv)
      do i=1,idimv
         x(i) = x0(i) + th1*h*v0(i)
      enddo
      call F(idimv,x,F1)
      do i=1,idimv
         v(i)=v0(i)+th0*h*F1(i)
         x(i)=x(i)+th2*h*v(i)
      enddo
      call F(idimv,x,F1)
      do i=1,idimv
         v(i)=v(i)+th3*h*F1(i)
         x(i)=x(i)+th2*h*v(i)
      enddo
      call F(idimv,x,F1)
      do i=1,idimv
         v(i)=v(i)+th0*h*F1(i)
         x(i)=x(i)+th1*h*v(i)
      enddo
      return
      end

      subroutine VEFRLS(F,h,idimv,x0,v0,F0,x,v,F1)
* subroutine name: Velocity-Enhanced Forest-Ruth Step
*
* 'F'     -- input; external; subroutine F(idimv,x,xdot)
* 'h'     -- input; time step
* 'idimv' -- input; dimension of vector space
* 'x0'    -- input; vector; initial positions
* 'v0'    -- input; vector; initial velocities
* 'F0'    -- input; vector; F0 = F(x0)
* 'x'     -- output; vector; next-step positions
* 'v'     -- output; vector; next-step velocities
* 'F1'    -- output; vector; F1 = F(x,t)
      implicit real*8(a-h,o-z),integer(i-n)
      external F
      parameter(xi1= 0.1644986515575760D+00)
      parameter(xi2=-0.2094333910398989D-01)
      parameter(xi3= 0.1235692651138917D+01)
      parameter(xi4= 0.5209433391039899D+00)
      parameter(xi5=-0.1800382605392986D+01)
      dimension x0(idimv),v0(idimv),x(idimv),v(idimv)
      dimension F0(idimv),F1(idimv)
      do i=1,idimv
         v(i) = v0(i) + xi1 * h * F0(i)
         x(i) = x0(i) + xi4 * h * v(i)
      enddo
      call F(idimv,x,F1)
      do i=1,idimv
         v(i) = v(i) + xi3 * h * F1(i)
         x(i) = x(i) + xi2 * h * v(i)
      enddo
      call F(idimv,x,F1)
      do i=1,idimv
         v(i) = v(i) + xi5 * h * F1(i)
         x(i) = x(i) + xi2 * h * v(i)
      enddo
      call F(idimv,x,F1)
      do i=1,idimv
         v(i) = v(i) + xi3 * h * F1(i)
         x(i) = x(i) + xi4 * h * v(i)
      enddo
      call F(idimv,x,F1)
      do i=1,idimv
         v(i) = v(i) + xi1 * h * F1(i)
      enddo
      return
      end

      subroutine PEFRLS(F,h,idimv,x0,v0,x,v)
* subroutine name: Position-Enhanced Forest-Ruth Step
*
* 'F'     -- input; external; subroutine F(idimv,x,xdot)
* 'h'     -- input; time step
* 'idimv' -- input; dimension of vector space
* 'x0'    -- input; vector; initial positions
* 'v0'    -- input; vector; initial velocities
* 'x'     -- output; vector; next-step positions
* 'v'     -- output; vector; next-step velocities
      implicit real*8(a-h,o-z),integer(i-n)
      external F
      parameter(xi1= 0.1644986515575760D+00)
      parameter(xi2=-0.2094333910398989D-01)
      parameter(xi3= 0.1235692651138917D+01)
      parameter(xi4= 0.5209433391039899D+00)
      parameter(xi5=-0.1800382605392986D+01)
      dimension x0(idimv),v0(idimv),x(idimv),v(idimv)
      dimension F1(idimv)
      do i=1,idimv
         x(i) = x0(i) + v0(i) * xi1 * h
      enddo
      call F(idimv,x,F1)
      do i=1,idimv
         v(i) = v0(i) + F1(i) * xi4 * h
         x(i) = x(i) + v(i) * xi3 * h
      enddo
      call F(idimv,x,F1)
      do i=1,idimv
         v(i) = v(i) + F1(i) * xi2 * h
         x(i) = x(i) + v(i) * xi5 * h
      enddo
      call F(idimv,x,F1)
      do i=1,idimv
         v(i) = v(i) + F1(i) * xi2 * h
         x(i) = x(i) + v(i) * xi3 * h
      enddo
      call F(idimv,x,F1)
      do i=1,idimv
         v(i) = v(i) + F1(i) * xi4 * h
         x(i) = x(i) + v(i) * xi1 * h
      enddo
      return
      end

