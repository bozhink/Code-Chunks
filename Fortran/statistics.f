      program statistics
      implicit double precision(a-h,o-z),integer(i-n)
      character*256 arg
      if (iargc().lt.1) then
      write(unit=0,fmt="(""Usage: program <number-of data>"")")
      stop "Error 0"
      endif
      call getarg(1,arg)
      read(unit=arg,fmt=*,iostat=ierr,err=10,end=20) n
      call main(n)
      stop
   10 write(unit=0,fmt="(""Invalid argument <number-of data>"")")
      stop "Error 1"
   20 write(unit=0,fmt="(""Unexpected end-of-file"")")
      stop "Error 2"
      end
      
      subroutine main(n)
      implicit double precision(a-h,o-z),integer(i-n)
      dimension A(n)
      read(unit=*,fmt=*,iostat=ierr,err=100,end=200) A
   90 DSUM=0.d0
      do i=1,n
         DSUM = DSUM + A(i)
      enddo
      DMEAN = DSUM/dble(n)
      DVAR = 0.d0
      do i=1,n
         DVAR = DVAR + A(i)*A(i)
      enddo
      DVARN = (DVAR - DMEAN*DMEAN) / dble(n)
      DVARNM1 = (DVAR - DMEAN*DMEAN) / dble(n-1)
      DVARNNM1 = (DVAR - DMEAN*DMEAN) / dble(n*(n-1))
      STDEVN = sqrt(DVARN)
      STDEVNM1 = sqrt(DVARNM1)
      STDEVNNM1 = sqrt(DVARNNM1)
      print*,'Number of data points:          ', n
      print*,'Total sum:                      ', DSUM
      print*,'Average:                        ', DMEAN
      print*,'Sum x**2:                       ', DVAR
      print*,'Variance (n):                   ', DVARN
      print*,'Variance (n-1):                 ', DVARNM1
      print*,'Variance (n*(n-1)):             ', DVARNNM1
      print*,'Standart deviation (n):         ', STDEVN
      print*,'Standart deviation (n-1):       ', STDEVNM1
      print*,'Standart deviation (n*(n-1)):   ', STDEVNNM1      
      return
  100 print*,'Error reading input data'
      return
  200 goto 90
      end

