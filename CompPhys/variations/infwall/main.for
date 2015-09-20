      program InifiniteWall
      implicit double precision(a-h,o-z),integer(i-n)
      parameter (pi=3.1415926535897932d0)
      parameter(n=16)
      parameter(lda=n,ldb=n)
      parameter(itype=1)
      parameter(lwork=1088)
      character*1 jobz,uplo
      parameter(jobz='V',uplo='U')
      dimension H(lda,n),S(lda,n),w(n),work(lwork)
      dimension DPSI(n)
      xmin=-10.d0
      xmax=10.d0
      xh  =0.05d0
      info=0
c
c Initialization of H and S matrices
c
      call infwalls(n,S)
      call infwallh(n,H)
*      do i=1,lda
*         print 100,"H: ",(H(i,j),j=1,n)
*      enddo
*      do i=1,ldb
*         print 100,"S: ",(S(i,j),j=1,n)
*      enddo
c
c
c
      call dsygv(itype,jobz,uplo,n,H,lda,S,ldb,w,work,lwork,info)
c
c
c
      print*,"info=",info," work(1)=",work(1)
*      print 100,"w: ",(w(i),i=1,n)
*      do i=1,lda
*         print 100,"H: ",(H(i,j),j=1,n)
*      enddo
*      do i=1,ldb
*         print 100,"S: ",(S(i,j),j=1,n)
*      enddo

      open(unit=10,file="infwall-spec",status="unknown",
     *     iostat=ierr,err=1000)
      do i=1,n
      write(unit=10,fmt=*,iostat=ierr,err=2000)i,w(i)
      enddo
      close(unit=10,iostat=ierr,err=1010)

      open(unit=11,file="infwall-psi",status="unknown",
     *     iostat=ierr,err=1100)
      open(unit=12,file="infwall-sin",status="unknown",
     *     iostat=ierr,err=1200)
      x=xmin
      do while (x.le.xmax)
      call PSI(n,H,lda,x,DPSI)
      write(unit=11,fmt=*,iostat=ierr,err=2100)x,(DPSI(i),i=1,n)
      call XSIN(n,x,DPSI)
      write(unit=12,fmt=*,iostat=ierr,err=2200)x,(DPSI(i),i=1,n)
      x=x+xh
      enddo
      close(unit=11,iostat=ierr,err=1110)
      close(unit=12,iostat=ierr,err=1210)

      stop
  100 format(a3,10(1x,e11.3))

 1000 write(unit=0,fmt=*)"Error opening spec file: ",ierr
      stop "spec"
 1010 write(unit=0,fmt=*)"Error closing spec file: ",ierr
      stop "spec"
 1100 write(unit=0,fmt=*)"Error opening psi file: ",ierr
      stop "psi"
 1110 write(unit=0,fmt=*)"Error closing psi file: ",ierr
      stop "psi"
 1200 write(unit=0,fmt=*)"Error opening sin file: ",ierr
      stop "sin"
 1210 write(unit=0,fmt=*)"Error closing sin file: ",ierr
      stop "sin"
 2000 write(unit=0,fmt=*)"Error writing spec file: ",ierr," : ",i
      stop "spec"
 2100 write(unit=0,fmt=*)"Error writing psi file: ",ierr," : ",x
      stop "psi"
 2200 write(unit=0,fmt=*)"Error writing sin file: ",ierr," : ",x
      stop "sin"
      end

      subroutine XSIN(n,x,W)
      implicit double precision(a-h,o-z),integer(i-n)
      parameter (pi2=1.5707963267948966193d0)
      dimension W(n)
      do i=1,n,2
         W(i)=dcos(pi2*dfloat(i)*x)
      enddo
      do i=2,n,2
         W(i)=dsin(pi2*dfloat(i)*x)
      enddo
      return
      end
