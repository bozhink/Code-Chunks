      program Potts
      implicit none
      integer,parameter :: ni=32, nj=64, ns=1024
      integer :: S(ni,nj)
      double precision :: J,B,R(-1:1,-4:4)
      integer :: ii,jj
      real :: tstart,tstop

      read*,J,B

      call cpu_time(tstart)

      call stateGen(ni,nj,S)

      call setR(J,B,R)

      do ii=-1,1
         print*,(R(ii,jj),jj=-4,4,2)
      enddo
c      call sleep(10)

      do ii=1,100
         call mcmks(ni*nj,ni,nj,S,R)
         call system('clear')
         call plot(ni,nj,S)
         call sleep(1)
      enddo

      call cpu_time(tstop)

      print*,'Time to execute: ' ,tstop-tstart

      stop
      end


      subroutine plot(nx,ny,S)
      implicit none
      integer :: nx, ny, S(nx,ny)
      character(len=1) :: c(ny)
      integer :: i,j
      print*
      do j=1,ny
         c(j) = '-'
      enddo
      print*,'+',(c(j),j=1,ny),'+'

      do i=1,nx
      do j=1,ny
      if (S(i,j).eq.1) then
         c(j) = 'X'
      elseif (S(i,j).eq.0) then
         c(j) = 'O'
      else
         c(j) = ' '
      endif
      enddo
      print*,'|',(c(j),j=1,ny),'|'
      enddo

      do j=1,ny
         c(j) = '-'
      enddo
      print*,'+',(c(j),j=1,ny),'+'
      print*
      return
      end
