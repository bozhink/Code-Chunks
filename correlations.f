      program Correlations
      character*255 arg
      if (iargc().lt.1) then
         write(unit=0,fmt=*) "Usage: corr <number-of-data-points>"
         stop "Correlations"
      endif
      
      call getarg(1,arg)
      read(unit=arg,fmt=*,err=10) n
      
      call correl(n)
      
      stop
   10 write(unit=0,fmt=*)"Error: Incorrect argument"
      stop "Incorrect argument"
      end

      subroutine correl(n)
      implicit double precision(a-h,o-z),integer(i-n)
      dimension x(n),y(n)
      
      do i=1,n
      read(unit=*,fmt=*,iostat=ierr,err=100) x(i),y(i)
      enddo
      
      call corr(n,x,y,xmean,ymean,cor,cov,sigmax,sigmay)
      
      print*,"# Number of points N = "
      print*,n
      print*,"# Xmean = "
      print*,xmean
      print*,"# Ymean = "
      print*,ymean
      print*,"# SigmaX = "
      print*,sigmax
      print*,"# SigmaY = "
      print*,sigmay
      print*,"# Cov = "
      print*,cov
      print*,"# Correlation = "
      print*,cor
      return
  100 write(unit=0,fmt=*)"Error in 'correl': Cannot read input data:"
      write(unit=0,fmt=*)"                   Invalid data type"
      end
