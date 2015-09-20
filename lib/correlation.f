      subroutine pearcorr (idimv, x, y, r)
c This subroutine calculates the sample Pearson correlation coefficient
c See http://en.wikipedia.org/wiki/Pearson_product-moment_correlation_coefficient
c
c author: Bozhin Karaivanov
c date: 28.07.2013
c last modified: 28.07.2013
c
c Dummy arguments:
c idimv = dimension of input arrays x and y
c x, y  = input arrays.
c r     = sample Pearson correlation coefficient
      implicit double precision(a-h,o-z),integer(i-n)
      dimension x(*), y(*)
c      common /dpearson/ avx, avy, sigmax, sigmay, cov
c      data avx, avy /0.d0, 0.d0/
c      data sigmax, sigmay /0.d0, 0.d0/
c      data cov /0.d0/
      avx = 0.d0
      avy = 0.d0
      sigmax = 0.d0
      sigmay = 0.d0
      cov = 0.d0
c
c     Calculation of mean values of x anf y
      do i = 1, idimv
         avx = avx + x(i)
         avy = avy + y(i)
      enddo
      dn = dfloat(idimv)
      dn1 = dfloat(idimv-1)
      avx = avx / dn
      avy = avy / dn
c
c     Calculation of standard deviations and covariance
      do i = 1, idimv
         xx = x(i) - avx
         yy = y(i) - avy
         cov = cov + xx*yy
         sigmax = sigmax + xx*xx
         sigmay = sigmay + yy*yy
      enddo
      sigmax = dsqrt(sigmax)
      sigmay = dsqrt(sigmay)
c
c     Calculation of the correlation coefficient
      r = cov / (sigmax*sigmay)
c
c     Some additional normalizations
      cov = cov / dn
      dn1 = dsqrt(dn1)
      sigmax = sigmax / dn1
      sigmay = sigmay / dn1
      return
      end

