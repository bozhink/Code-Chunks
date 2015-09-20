c file: getcorr.f
c author: Bozhin Karaivanov
c data: 29.07.2013
c last modified: 29.07.2013
c
      subroutine getcorr (idimv,x,y,idima,a,r)
c
c This subroutine requires the pearcorr subroutine
c
      implicit none
      integer idimv, idima
      double precision x(idimv), y(idimv)
      double precision a(idima), r(idima)
      double precision xx(idimv), yy(idimv)
      integer i, j
      do i = 1, idimv
         xx(i) = dlog10(x(i))
      enddo
      do j = 1, idima
         do i = 1, idimv
            yy(i) = dlog10(y(i)+a(j))
         enddo
         call pearcorr(idimv, xx, yy, r(j))
      enddo
      return
      end

