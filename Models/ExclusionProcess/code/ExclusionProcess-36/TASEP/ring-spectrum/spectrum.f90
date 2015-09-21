! file: spectrum.f90
! author: Bozhin Karaivanov
! date: 28.07.2013
!
! This module contains subroutines for calculation
! of power spectrum, described in arXiv:1307.4938
! Eqs (3) and (4)

module spectrum

   public :: fourier, spec
   double precision, parameter :: pi = 4.d0*datan(1.d0)
   double precision, parameter :: twopi = 8.d0*datan(1.d0)

contains

   subroutine fourier (T, N, st, sf)
   ! This subroutine performs the discrete Fourier transformation.
   ! See Eq. (3)
   !
   ! Dummy variables:
   ! T = time length: t = 0, ..., T-1, f = 0, ..., T-1
   ! N = Lattice size
   ! st = input vector of size T: time series of states s_x(t)
   !      of site x for moment t
   ! sf = output vector of size T; the Fourier-tranformed image of st
      implicit none
      integer, intent (in) :: T, N
      integer, dimension(T, N), intent (in) :: st
      double complex, dimension(T, N), intent(out) :: sf
      double complex :: zT
      double precision :: dT, tpdt
      double complex :: phase, zxp
      integer :: f, i, x

      dT = dfloat(T)
      zT = (1.d0, 0.d0) / dcmplx(dT, 0.d0)
      tpdt = twopi / dT
      ! Initialization
      do x = 1, N
         do f = 1, T
            sf(f,x) = (0.d0, 0.d0)
         enddo
      enddo
      ! Calculation
      do i = 1, T
         do f = 1, T
            phase = dcmplx(0.d0, -tpdt*dfloat((f-1)*(i-1)))
            zxp = cdexp (phase) * zT ! zT here means normaization
            do x = 1, N
               sf(f, x) = sf(f, x) + dcmplx(st(i, x),0) * zxp
            enddo
         enddo
      enddo
   end subroutine fourier

   subroutine spec(T, N, sf, s)
   ! This subroutine calculates the spectrum distribution.
   ! See Eq. (4)
      implicit none
      integer, intent (in) :: T
      integer, intent (in) :: N
      double complex, dimension(T, N), intent(in) :: sf
      double precision, dimension(N), intent(out) :: s
      !double precision :: amp
      integer :: f, x

      do f = 1, T
         s(f) = 0.d0
         do x = 1, N
            s(f) = s(f) + dble(dconjg(sf(f,x))*sf(f,x))
         enddo
      enddo
   end subroutine spec

end module spectrum

