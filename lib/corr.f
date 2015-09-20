      subroutine corr(idimv,x,y,xmean,ymean,cor,cov,sigmax,sigmay)
      implicit double precision(a-h,o-z),integer(i-n)
      dimension x(idimv),y(idimv),xx(idimv),yy(idimv)
      dx=0.d0
      dy=0.d0
      dn=dble(idimv)
      do i=1,idimv
         dx=dx+x(i)
         dy=dy+y(i)
      enddo
      xmean=dx/dn
      ymean=dy/dn
      do i=1,idimv
         xx(i)=x(i)-xmean
         yy(i)=y(i)-ymean
      enddo
      cov=0.d0
      sigmax=0.d0
      sigmay=0.d0
      do i=1, idimv
         cov=cov+xx(i)*yy(i)
         sigmax=sigmax+xx(i)*xx(i)
         sigmay=sigmay+yy(i)*yy(i)
      enddo
      sigmax=dsqrt(sigmax)
      sigmay=dsqrt(sigmay)
      cor=cov/(sigmax*sigmay)
      cov=cov/dn
      dsn=dsqrt(dble(idimv*(idimv-1)))
      sigmax=sigmax/dsn
      sigmay=sigmay/dsn
      return
      end
