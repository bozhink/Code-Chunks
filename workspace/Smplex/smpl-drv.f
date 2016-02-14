      program simplexdrv
      print*
      print*,'========================================================'
      print*,'>>>> PROBLEM: 776 <<<<'
      call simplex776
      print*
      print*,'========================================================'
      print*,'>>>> PROBLEM: 777 <<<<'
      call simplex777
      print*
      print*,'========================================================'
      print*,'>>>> PROBLEM: 778 <<<<'
      call simplex778
      print*
      print*,'========================================================'
      print*,'>>>> PROBLEM: 779 <<<<'
*      call simplex779
      print*
      print*,'========================================================'
      print*,'>>>> PROBLEM: 780 <<<<'
      call simplex780
      print*
      print*,'========================================================'
      print*,'>>>> PROBLEM: 781 <<<<'
      call simplex781
      print*
      print*,'========================================================'
      print*,'>>>> PROBLEM: 782 <<<<'
      call simplex782
      print*
      print*,'========================================================'
      print*,'>>>> PROBLEM: 783 <<<<'
      call simplex783
      stop
      end

      subroutine simplex776
      implicit none
      integer m,n,j
      parameter (m=3,n=6)
      integer ibasis(m)
      double precision A(m,n), z, x(n)
      double precision c(n), A0(m)
      character*3 mode
      data A / 1.d0,  0.d0,  0.d0,
     *         3.d0, -2.d0, -4.d0,
     *        -1.d0,  4.d0,  3.d0,
     *         0.d0,  1.d0,  0.d0,
     *         2.d0,  0.d0,  8.d0,
     *         0.d0,  0.d0,  1.d0/
      data c /0.d0, 1.d0, -3.d0, 0.d0, 2.d0, 0.d0/
      data A0 /7.d0, 12.d0, 10.d0/
      data ibasis/1, 4, 6/
      data x /n*0.d0/
      mode = 'MIN'

      call SIMPLEX(A,A0,c,IBASIS,M,N,Z,X,mode)

      print*,'RESULTS:'
      print*,'Z = C.X'
      print "(3x,a5,6(f8.2,1x),a1)",'C = (',(c(j),j=1,n),')'
      print "(3x,a5,6(f8.2,1x),a1)",'X = (',(x(j),j=1,n),')'
      print "(3x,a5,f8.2,1x,a1)",'Z = (',z,')'
      return
      end

      subroutine simplex777
      implicit none
      integer m,n,j
      parameter (m=2,n=4)
      integer ibasis(m)
      double precision A(m,n), z, x(n)
      double precision c(n), A0(m)
      character*3 mode
      data A / 0.18d0,  0.08d0,
     *         0.09d0,  0.28d0,
     *         1.00d0,  0.00d0,
     *         0.00d0,  1.00d0/
      data c /1.1d0, 0.7d0, 0.0d0, 0.0d0/
      data A0 /72.d0,56.d0/
      data ibasis/3,4/
      data x /n*0.d0/
      mode = 'MAX'

      call SIMPLEX(A,A0,c,IBASIS,M,N,Z,X,mode)

      print*,'RESULTS:'
      print*,'Z = C.X'
      print "(3x,a5,4(f8.2,1x),a1)",'C = (',(c(j),j=1,n),')'
      print "(3x,a5,4(f8.2,1x),a1)",'X = (',(x(j),j=1,n),')'
      print "(3x,a5,f8.2,1x,a1)",'Z = (',z,')'
      return
      end

      subroutine simplex778
      implicit none
      integer m,n,j
      parameter (m=3,n=5)
      integer ibasis(m)
      double precision A(m,n), z, x(n)
      double precision c(n), A0(m)
      character*3 mode
      data A /-2.d0,  1.d0, 1.d0,
     *         1.d0, -2.d0, 1.d0,
     *         1.d0,  0.d0, 0.d0,
     *         0.d0,  1.d0, 0.d0,
     *         0.d0,  0.d0, 1.d0/
      data c /0.d0, 1.d0, -1.d0, 0.d0, 0.d0/
      data A0 /2.d0,2.d0,5.d0/
      data ibasis/3,4,5/
      data x /n*0.d0/
      mode = 'MIN'

      call SIMPLEX(A,A0,c,IBASIS,M,N,Z,X,mode)

      print*,'RESULTS:'
      print*,'Z = C.X'
      print "(3x,a5,5(f8.2,1x),a1)",'C = (',(c(j),j=1,n),')'
      print "(3x,a5,5(f8.2,1x),a1)",'X = (',(x(j),j=1,n),')'
      print "(3x,a5,f8.2,1x,a1)",'Z = (',z,')'
      return
      end

      subroutine simplex779
      implicit none
      integer m,n,j
      parameter (m=3,n=6)
      integer ibasis(m)
      double precision A(m,n), z, x(n)
      double precision c(n), A0(m)
      character*3 mode
      data A / 1.d0,  3.d0,  1.d0,
     *         0.d0,  1.d0,  0.d0,
     *         0.d0, -4.d0, -2.d0,
     *         1.d0,  0.d0,  0.d0,
     *         0.d0,  0.d0,  1.d0,
     *         6.d0,  2.d0,  2.d0/
      data c /1.d0, -1.d0, 1.d0, 1.d0, 1.d0, -1.d0/
      data A0 /9.d0,2.d0,6.d0/
      data ibasis/4,2,5/
      data x /n*0.d0/
      mode = 'MIN'

      call SIMPLEX(A,A0,c,IBASIS,M,N,Z,X,mode)

      print*,'RESULTS:'
      print*,'Z = C.X'
      print "(3x,a5,6(f8.2,1x),a1)",'C = (',(c(j),j=1,n),')'
      print "(3x,a5,6(f8.2,1x),a1)",'X = (',(x(j),j=1,n),')'
      print "(3x,a5,f8.2,1x,a1)",'Z = (',z,')'
      return
      end

      subroutine simplex780
      implicit none
      integer m,n,j
      parameter (m=2,n=4)
      integer ibasis(m)
      double precision A(m,n), z, x(n)
      double precision c(n), A0(m)
      character*3 mode
      data A /-2.d0,  1.d0,
     *         5.d0,  0.d0,
     *         0.d0,  1.d0,
     *         1.d0,  0.d0/
      data c /2.d0, 1.d0, 0.0d0, 0.0d0/
      data A0 /10.d0,3.d0/
      data ibasis/4,3/
      data x /n*0.d0/
      mode = 'MAX'

      call SIMPLEX(A,A0,c,IBASIS,M,N,Z,X,mode)

      print*,'RESULTS:'
      print*,'Z = C.X'
      print "(3x,a5,4(f8.2,1x),a1)",'C = (',(c(j),j=1,n),')'
      print "(3x,a5,4(f8.2,1x),a1)",'X = (',(x(j),j=1,n),')'
      print "(3x,a5,f8.2,1x,a1)",'Z = (',z,')'
      return
      end

      subroutine simplex781
      implicit none
      integer m,n,j
      parameter (m=3,n=5)
      integer ibasis(m)
      double precision A(m,n), z, x(n)
      double precision c(n), A0(m)
      character*3 mode
      data A /1.d0, 5.d0, 4.d0,
     *         -1.d0, -2.d0, 5.d0,
     *         1.d0, 0.d0, 0.d0,
     *         0.d0, 1.d0, 0.d0,
     *         0.d0, 0.d0, 1.d0/
      data c /3.d0, 0.d0, 0.d0, 0.d0, 0.d0/
      data A0 /2.d0,10.d0,20.d0/
      data ibasis/3,4,5/
      data x /n*0.d0/
      mode = 'MIN'

      call SIMPLEX(A,A0,c,IBASIS,M,N,Z,X,mode)

      print*,'RESULTS:'
      print*,'Z = C.X'
      print "(3x,a5,5(f8.2,1x),a1)",'C = (',(c(j),j=1,n),')'
      print "(3x,a5,5(f8.2,1x),a1)",'X = (',(x(j),j=1,n),')'
      print "(3x,a5,f8.2,1x,a1)",'Z = (',z,')'
      return
      end

      subroutine simplex782
      implicit none
      integer m,n,j
      parameter (m=3,n=5)
      integer ibasis(m)
      double precision A(m,n), z, x(n)
      double precision c(n), A0(m)
      character*3 mode
      data A /1.d0, 0.d0, 0.d0,
     *         1.d0, 1.d0, 0.d0,
     *         1.d0, 0.d0, 1.d0,
     *         0.d0, 1.d0, 0.d0,
     *         0.d0, 0.d0, 1.d0/
      data c /1.d0, -2.d0, -1.d0, 0.d0, 0.d0/
      data A0 /4.d0,4.d0,4.d0/
      data ibasis/1,4,5/
      data x /n*0.d0/
      mode = 'MAX'

      call SIMPLEX(A,A0,c,IBASIS,M,N,Z,X,mode)

      print*,'RESULTS:'
      print*,'Z = C.X'
      print "(3x,a5,5(f8.2,1x),a1)",'C = (',(c(j),j=1,n),')'
      print "(3x,a5,5(f8.2,1x),a1)",'X = (',(x(j),j=1,n),')'
      print "(3x,a5,f8.2,1x,a1)",'Z = (',z,')'
      return
      end

      subroutine simplex783
      implicit none
      integer m,n,j
      parameter (m=3,n=5)
      integer ibasis(m)
      double precision A(m,n), z, x(n)
      double precision c(n), A0(m)
      character*3 mode
      data A /-1.d0, 1.d0, -3.d0,
     *         1.d0, 0.d0, 0.d0,
     *         -1.d0, 1.d0, 1.d0,
     *         0.d0, 1.d0, 0.d0,
     *         0.d0, 0.d0, 1.d0/
      data c /1.d0, 1.d0, 4.d0, 0.d0, 0.d0/
      data A0 /1.d0,3.d0,3.d0/
      data ibasis/2,4,5/
      data x /n*0.d0/
      mode = 'MIN'

      call SIMPLEX(A,A0,c,IBASIS,M,N,Z,X,mode)

      print*,'RESULTS:'
      print*,'Z = C.X'
      print "(3x,a5,5(f8.2,1x),a1)",'C = (',(c(j),j=1,n),')'
      print "(3x,a5,5(f8.2,1x),a1)",'X = (',(x(j),j=1,n),')'
      print "(3x,a5,f8.2,1x,a1)",'Z = (',z,')'
      return
      end
