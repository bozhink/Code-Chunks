      subroutine odemd(F,idimv,x0,v0,h,n,x,v,method,iflag)
c name: ODE MD-algorithms interface
c
c 'F'      -- external; subroutine F(idimv,x,xdot)
c 'idimv'  -- input; dimenstion of vector space
c 'x0'     -- input; vector; initial positions
c 'v0'     -- input; vector; initial velocities
c 'h'      -- input; time step
c 'n'      -- input; requitred number of points
c 'x'      -- output; matrix: x(n,idimv); positions
c 'v'      -- output; matrix; v(n,idimv); velocities
c 'method' -- input; string; Method to be used; Allowed values
c                            1 -- 'lfvv'
c                            2 -- 'lfpv'
c                            3 -- 'fr'
c                            4 -- 'vefrl'
c                            5 -- 'pefrl'
c
      implicit real*8(a-h,o-z),integer(i-n)
      external F
      dimension x0(idimv),v0(idimv),x(n,idimv),v(n,idimv)
      dimension x1(idimv),v1(idimv),x2(idimv),v2(idimv)
      dimension F0(idimv),F1(idimv)
c
      do i=1,idimv
         x1(i)=x0(i)
         v1(i)=v0(i)
      enddo
c
      iflag=0
c      print*,'Called method: ',method
c
      if (method.eq.1) then
         call F(idimv,x1,F0)
         do k=1,n
            call LFVVS(F,h,idimv,x1,v1,F0,x2,v2,F1)
            do i=1,idimv
c              Exporting data
               x(k,i)=x2(i)
               v(k,i)=v2(i)
c              Data shift
               x1(i)=x2(i)
               v1(i)=v2(i)
               F0(i)=F1(i)
            enddo
         enddo
         iflag=1
      elseif (method.eq.2) then
         do k=1,n
            call LFPVS(F,h,idimv,x1,v1,x2,v2)
            do i=1,idimv
c              Exporting data
               x(k,i)=x2(i)
               v(k,i)=v2(i)
c              Data shift
               x1(i)=x2(i)
               v1(i)=v2(i)
               F0(i)=F1(i)
            enddo
         enddo
         iflag=2
      elseif (method.eq.3) then
         do k=1,n
            call FRS(F,h,idimv,x1,v1,x2,v2)
            do i=1,idimv
c              Exporting data
               x(k,i)=x2(i)
               v(k,i)=v2(i)
c              Data shift
               x1(i)=x2(i)
               v1(i)=v2(i)
               F0(i)=F1(i)
            enddo
         enddo
         iflag=3
      elseif (method.eq.4) then
         call F(idimv,x1,F0)
         do k=1,n
            call VEFRLS(F,h,idimv,x1,v1,F0,x2,v2,F1)
            do i=1,idimv
c              Exporting data
               x(k,i)=x2(i)
               v(k,i)=v2(i)
c              Data shift
               x1(i)=x2(i)
               v1(i)=v2(i)
               F0(i)=F1(i)
            enddo
         enddo
         iflag=4
      elseif (method.eq.5) then
         do k=1,n
            call PEFRLS(F,h,idimv,x1,v1,x2,v2)
            do i=1,idimv
c              Exporting data
               x(k,i)=x2(i)
               v(k,i)=v2(i)
c              Data shift
               x1(i)=x2(i)
               v1(i)=v2(i)
               F0(i)=F1(i)
            enddo
         enddo
         iflag=5
      else
         write(unit=0,fmt=100,iostat=ierr,err=10) method
         iflag=-1
      endif
      return
   10 print 200,ierr
      return
  100 format('ERROR in ODEMD: <<',i8,'>> is not a valid method name')
  200 format('ERROR: cannot write to STDERR',3x,i12)
      end
