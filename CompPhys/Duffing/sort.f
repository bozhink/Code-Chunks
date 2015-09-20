      subroutine sort2d(idimx,idimy,A,left,right)
      implicit none
      integer idimx,idimy,i,j,left,right
      double precision A(idimx,idimy)
      double precision temp(idimy)
      integer m
      do i=left,right-1
         m = i
         do j=i+1,right
            if (a(j,1).lt.a(m,1)) m=j
         enddo
         temp = a(i,:)
         a(i,:) = a(m,:)
         a(m,:) = temp
      enddo
      return
      end

      subroutine sort(idimv,A,left,right)
      implicit none
      integer idimv,i,j,left,right
      double precision A(idimv)
      double precision temp
      integer m
      do i=left,right-1
         m = i
         do j=i+1,right
            if (A(j).lt.A(m)) m=j
         enddo
         temp = A(i)
         A(i) = A(m)
         A(m) = temp
      enddo
      return
      end
