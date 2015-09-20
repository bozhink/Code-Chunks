c file: comulative_integral.f
c author: Bozhin Karaivanov
c date: 29.07.2013
c last modified: 11.08.2013
c
c This subroutine calculates the comulative integral
c F(T) = \int_{T}^{x_max} f(t)dt
c
      subroutine comulint (n, ft)
c n = dimension of the vector ft
c ft = tabulated values of the function f(t),
c      where it is supposed that the t-stride
c      is equal to 1;
c      the result distribution is returned in ft
      implicit none
      integer n, i
      double precision ft(n)
      do i = n-1, 1, -1
         ft(i) = ft(i+1) + ft(i)
      enddo
      return
      end
c
      subroutine comulint2 (n, ft, f)
c n = dimension of the vector ft
c ft = tabulated values of the function f(t),
c      where it is supposed that the t-stride
c      is equal to 1;
c      the result distribution is returned in ft
      implicit none
      integer n, i
      double precision ft(n), f(n)
      f(n) = ft(n)
      do i = n-1, 1, -1
         f(i) = f(i+1) + ft(i)
      enddo
      return
      end

