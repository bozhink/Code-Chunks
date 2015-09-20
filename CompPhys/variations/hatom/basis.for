      block data initalph
      double precision alpha(4)
      common /setalpha/ alpha
      data alpha /13.00773d0,
     *            1.962079d0,
     *            0.444529d0,
     *            0.1219492d0/
      end

      subroutine bfchi(n,r,chi,iflag)
c
c Calculates 4 basis function \chi_n=e^{-\alpha_n r^2}
c
      double precision r,chi(4),alpha(4)
      common /setalpha/ alpha
      if (n.gt.4) then
         print*,'ERROR in hatoms: n must be less than 5'
         iflag=-1
         return
      elseif (n.lt.1) then
         print*,'ERROR in hatoms: n must be greather than 0'
         iflag=-1
         return
      endif
      do i=1,n
         chi(i)=dexp(-alpha(i)*r*r)
      enddo
      return
      end

      subroutine hatoms(idimv,smatrix,iflag)
      double precision smatrix(idimv,idimv),alpha(4),pi
      parameter (pi=3.141592653589793d0)
      common /setalpha/ alpha
      iflag=0
      if (idimv.gt.4) then
         print*,'ERROR in hatoms: idimv must be less than 5'
         iflag=-1
         return
      elseif (idimv.lt.1) then
         print*,'ERROR in hatoms: idimv must be greather than 0'
         iflag=-1
         return
      endif
      do i=1,idimv
         do j=1,idimv
            smatrix(i,j) = (pi/(alpha(i)+alpha(j)))**1.5d0
         enddo
      enddo
      return
      end

      subroutine hatomh(idimv,hmatrix,iflag)
      double precision hmatrix(idimv,idimv),alpha(4),pi,pi3,pi2,a
      parameter (pi=3.141592653589793d0)
      common /setalpha/ alpha
      iflag=0
      if (idimv.gt.4) then
         print*,'ERROR in hatoms: idimv must be less than 5'
         iflag=-1
         return
      elseif (idimv.lt.1) then
         print*,'ERROR in hatoms: idimv must be greather than 0'
         iflag=-1
         return
      endif
      pi2=2.d0*pi
      pi3=3.d0*pi**1.5d0
      do i=1,idimv
         do j=1,idimv
            a=alpha(i)+alpha(j)
            hmatrix(i,j)=alpha(i)*alpha(j)*pi3/a**2.5d0-pi2/a
         enddo
      enddo
      return
      end

      subroutine PSI(n,A,lda,x,DPSI)
      implicit double precision(a-h,o-z),integer(i-n)
c 'n'    -- input; number of wave functions to be calculated
c 'A'    -- input; matrix(lda,n); coefficients of the wave function
c 'lda'  -- input; leading dimension of A
c 'x'    -- input; point to be function calculated
c 'DPSI' -- output; returned result
      dimension A(lda,n),DPSI(n),chi(lda)
      call bfchi(lda,x,chi,iflag)
      if (iflag==-1) stop "Invalid dimension in PSI"
      do j=1,n
         DPSI(j)=0.d0
         do i=1,lda
            DPSI(j)=DPSI(j)+A(i,j)*chi(i)
         enddo
      enddo
      return
      end

