      program lsq
      integer :: ldx, n, m, mp1
      parameter (n=2)
      double precision, dimension(:,:), allocatable :: x,a
      double precision, dimension(:), allocatable :: b
      double precision :: eps
      parameter (eps=1.d-14)
      character(len=255) :: arg

      if (iargc().lt.1) then
      write(unit=0,fmt=100)
      STOP "Usage"
      endif
*
* Obtaining the number of data points
*
      call getarg(1,arg)
      read(unit=arg,fmt=*,iostat=ierr,err=1000) ldx
*
* Obtaining the order of polinomial
*
      if (iargc().gt.1) then
         call getarg(2,arg)
         read(unit=arg,fmt=*,iostat=ierr,err=2000) m
      else
         m=1
      endif
*
* Allocation of dimensions
*
      mp1=m+1
      allocate( x(ldx,n), a(mp1,mp1+1), b(mp1) )
*
* Rading data
*
      call raddata(ldx,n,x,ierr)
      if (ierr.ne.0) goto 3000
*
* Evaluation of coefficients
*
      if (m.eq.1) then
      call lsqlin( ldx, x(:,1), x(:,2), b(1), b(2) )
      else
      call LSQSETAB( ldx, x(:,1), x(:,2), m, a(1:mp1,1:mp1), b )
      print*,a,x(1:20,2)
      call gauselim(a,b,mp1,mp1+1,eps)
      endif
*
* Freing memory
*
      deallocate(x,a,b)
      stop
  100 format(
     * "Usage: lsq <number-of-data-points> [<order-of-polynomial>]",/,
     * "       <order-of-polynomial>=1 by default")
 1000 write(unit=0,fmt=*)
     * "ERROR is lsq: <number-of-data-points> is not an integer ",ierr
      STOP "<number-of-data-points>"
 2000 write(unit=0,fmt=*)
     * "ERROR in lsq: <order-of-polynomial> is not an integer ",ierr
      STOP "<order-of-polynomial>"
 3000 write(unit=0,fmt=*)
     * "ERROR in lsq: error reading data ",ierr
      STOP "Reading data"
      end
