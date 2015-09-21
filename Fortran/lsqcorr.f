      subroutine lsqcorr(idimv,x,y,m,A,sum0,sumr,r)
*
* Calculates correlation coefficients for
* polynomial regression
*
* 'idimv' -- input; dimension of 'x' and 'y'; number of data points
* 'x', 'y' -- input; vectors; data points; y=f(x)
* 'm' -- input; order of polynomial
* 'A' -- input; vector; Polynomial's coefficients
* 'sum0' -- output;
* 'sumr' -- output;
* 'r'    -- output; correlation coefficient
*
      implicit double precision(a-h,o-z),integer(i-n)
      dimension x(idimv),y(idimv),A(0:m)
      ymean=y(1)
      do i=2,idimv
         ymean=ymean+y(i)
      enddo
      ymean=ymean/dble(idimv)

      sum0=0.d0
      do i=1,idimv
         dy=y(i)-ymean
         sum0=sum0-dy*dy
      enddo

      sumr=0.d0
      do j=1,idimv
         sum1=A(m)
         do i=m-1,0,-1
            sum1=sum1*x(j)+A(i)
         enddo
         dy=y(j)-sum1
         sumr=sumr+dy*dy
      enddo
      r=dsqrt((sum0-sumr)/sum0)
      return
      end
