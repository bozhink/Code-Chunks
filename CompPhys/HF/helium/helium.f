      block data inialpha
      double precision alpha(4)
      common /healpha/ alpha
      data alpha / 0.297104,
     *             1.236745,
     *             5.749982,
     *            38.216677/
      end

      subroutine basis(x,chi)
*
* returns the basis function chi(i)=exp(-alpha(i)*x^2)
*
      double precision x,chi(4),alpha(4)
      common /healpha/ alpha
      do i=1,4
         chi(i)=dexp(-alpha(i)*x*x)
      enddo
      return
      end

      subroutine hes(S)
*
* Returns the S matrix
*
      parameter (pi=3.141592653589793d0)
      double precision S(4,4),alpha(4)
      common /healpha/ alpha
      do i=1,4
      do j=1,4
         S(i,j) = (pi/(alpha(i)+alpha(j)))**1.5d0
      enddo
      enddo
      return
      end

      subroutine heh(H)
*
* Returns the H matrix
*
      parameter (pi=3.141592653589793d0)
      double precision H(4,4),alpha(4)
      common /healpha/ alpha
      do i=1,4
      do j=1,4
      H(i,j)=
     *   3.0d0*alpha(i)*alpha(j)*pi**1.5d0/(alpha(i)+alpha(j))**2.5d0
     *  +4.d0*pi/(alpha(i)+alpha(j))
      enddo
      enddo
      return
      end

      subroutine heq(Q)
*
* Returns the Q hypermatrix
*
      parameter (pi=3.141592653589793d0)
      double precision Q(4,4,4,4),alpha(4),a,b,p
      common /healpha/ alpha
      p=2.d0*pi**2.5d0
      do i1=1,4
      do i2=1,4
      do i3=1,4
      do i4=1,4
         a=alpha(i1)+alpha(i3)
         b=alpha(i2)+alpha(i4)
         Q(i1,i2,i3,i4) = p/(a*b*dsqrt(a+b))
      enddo
      enddo
      enddo
      enddo
      return
      end

      subroutine hef(H,Q,C,F)
*
* Calculate the F matrix
*
* 'H' -- input; matrix
* 'Q' -- input; hypermatrix
* 'C' -- iput; vector
* 'F' -- output; matrix
      double precision H(4,4),Q(4,4,4,4),C(4),F(4,4)
      do i=1,4
      do j=1,4
         F(i,j)=H(i,j)
         do k1=1,4
         do k2=1,4
            F(i,j)=F(i,j)+Q(i,k1,j,k2)*C(k1)*C(k2)
         enddo
         enddo
      enddo
      enddo
      return
      end

      subroutine heEG(H,Q,C,EG)
*
* Calculate Ground energy
*
* 'H' -- input; matrix
* 'Q' -- input; hypermatrix
* 'C' -- input; vector
* 'EG' -- output; Ground Energy
*
      double precision H(4,4),Q(4,4,4,4),C(4),EG,a
      EG=0.d0
      do i=1,4
      do j=1,4
         a=2.d0*H(i,j)
         do k1=1,4
         do k2=1,4
            a=a+Q(i,k1,j,k2)*C(k1)*C(k2)
         enddo
         enddo
         EG=EG+a*C(i)*C(j)
      enddo
      enddo
      return
      end

      subroutine normC(S,C)
*
* Normalises the C vector using the S matrix:
* \sum_{p,q} C_{p} S_{pq} C_{q} = 1
*
* 'S' -- input; the S matrix
* 'C' -- input output; The vector to be normalised C
*
      double precision S(4,4), C(4), a
      a=0.d0
      do i=1,4
      do j=1,4
        a=a+S(i,j)*C(i)*C(j)
      enddo
      enddo
      a=dsqrt(a)
      do i=1,4
         C(i)=C(i)/a
      enddo
      return
      end
