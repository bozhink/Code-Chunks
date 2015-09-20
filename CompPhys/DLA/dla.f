      program dla
      implicit double precision(a-h,o-z),integer(i-n)
      parameter (idimv=127,idimv1=idimv-1,idimv2=idimv*idimv)
      parameter(maxit=10000)
      parameter (n=1000)
      logical a(0:idimv1,0:idimv1)
      integer icoord(n,2)
      data a / idimv2*.false. /
      icenter=idimv1/2
      a(icenter,icenter) = .true.
      icoord(1,1)=icenter
      icoord(1,2)=icenter
      call system_clock(iclock)
      call srand(iclock)
      do i=2,n
c Set start point
         call startp(idimv,idimv,ix,iy)
         iter=1
         do
            ixp1 = mod( idimv + ix + 1, idimv )
            ixm1 = mod( idimv + ix - 1, idimv )
            iyp1 = mod( idimv + iy + 1, idimv )
            iym1 = mod( idimv + iy - 1, idimv )
            if (a(ix,iym1).or.a(ix,iyp1).or.
     *          a(ixm1,iy).or.a(imp1,iy)) then
               a(ix,iy) = .true.
               icoord(i,1) = ix
               icoord(i,2) = iy
               exit
            endif
            call newpos(idimv,idimv,ix,iy,inx,iny)
            ix = inx
            iy = iny
            iter=iter+1
            if(iter.gt.maxit) goto 100
         enddo
      enddo
c
      do j=1,n
         print*, icoord(i,1), icoord(i,2)
      enddo
c
      stop
  100 print*,'Convergence problem: Exceeded MAXIT'
      stop
      end

      subroutine newpos(idimx,idimy,ix,iy,inx,iny)
c subroutine new position
c idimx, idimy -- dimension of array
c ix, iy -- integer; current positions
c inx, iny -- integer; output; new positions
c returned values are between 0 and idimx/idimy-1
      inx=mod(idimx+ix+sign(1,int(2.0*rand())-1), idimx)
      iny=mod(idimy+iy+sign(1,int(2.0*rand())-1), idimy)
      return
      end

      subroutine startp(idimx,idimy,ix,iy)
c Generates start point
c ix, iy -- between 0 and idim(x|y)-1
      k = int(4.0*rand())
      select case(k)
      case(0)
         ix = int(idimx*rand())
         iy = 0
      case(1)
         ix = int(idimx*rand())
         iy = idimy-1
      case(2)
         iy = int(idimy*rand())
         ix = 0
      case(3)
         iy = int(idimy*rand())
         ix = idimx-1
      end select
      return
      end

