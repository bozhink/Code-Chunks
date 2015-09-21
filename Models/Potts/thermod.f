      subroutine TD(J,B,idimx,idimy,S,n,M,E,chi,C)
c Calculates Thermodynamical Characteristics
c M_{i} = \sum_{j} S_{j}
c E_{i} = -J\sum_{<i,j>} S_{i}S_{j} + B.M_{i}
c <M> = \frac{\sum_{i}^{n} M_{i}}{n}
c <E> = \frac{\sum_{i}^{n} E_{I}}{n}
c \chi = <M^2> - <M>^2
c C = <E^2> - <E>^2
c 'n' - number of  samplings
      implicit none
      double precision :: J, B, M, E, chi, C, R(-1:1,-4:4)
      integer :: idimx, idimy, S(idimx,idimy), n
      integer :: ii, jj, i, ns
      double precision :: MM, EE, dn, dns
      double precision :: SM, SM2, SE, SE2

      call setR(J,B,R)

      ns = idimx*idimy
      SM=0.d0
      SM2=0.d0
      SE=0.d0
      SE2=0.d0

      do i = 1,n
         call mcmks(ns, idimx, idimy, S, R)
         call Hamilton(J, B, idimx, idimy, S, EE, MM)
         SM  = SM  + MM
         SM2 = SM2 + MM*MM
         SE  = SE  + EE
         SE2 = SE2 + EE*EE
      enddo

      dn  = 1.d0 / dble(n)
      dns = 1.d0 / dble(ns)
      M   = SM  * dn
      E   = SE  * dn
      C   = (SE2 * dn - E)*dns
      chi = (SM2 * dn - M)*dns
      E = E*dns
      M=M*dns
      return
      end

      subroutine MMoment(idimx,idimy,S,M)
c Calsulates Magnetic Moment of Spin Lattice
c 'M' - output : Calculated Magmetic Moment
      implicit none
      integer :: idimx, idimy, S, M, i, j
      M=0
      do i=1,idimx
      do j=1,idimy
         M = M + S(i,j)
      enddo
      enddo
      return
      end

      subroutine Hamilton(J, B, idimx, idimy, S, E, M)
c Calculates Hamiltonian and Magnetic Moment of the system
c 'M' - Magnetic Moment
c E = -J\sum_{<i,j>} S_{i}S_{j} + B.M
      implicit none
      double precision :: J, B, E, M
      integer :: idimx, idimy, S(idimx,idimy)
      integer :: ii, jj, I, IM, ni, nj

      I  = 0
      IM = 0
      do ii=1,idimx
         do jj=1,idimy
         ni = idimx + ii -1
         nj = idimy + jj -1
         IM = IM + S(ii,jj)
         I  = I + S(ii,jj) *
     1      ( S( mod(ni+1,idimx)+1, jj ) + S( mod(ni-1,idimx)+1, jj )
     2      + S( ii, mod(nj+1,idimy)+1 ) + S( ii, mod(nj-1,idimy)+1 ) )
         enddo
      enddo

      M = dble(IM)
      E = -J*dble(I) + B * M

      return
      end
