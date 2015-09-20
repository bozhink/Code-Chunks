c Discretisation subroutines
      subroutine discr2d(idimx,idimy,A,x,indx,indxdim,left,right)
      implicit none
c x -- discretisation step
c indx -- array of indices of boundaries
c indxdim -- number of boundaries
c Array A is supposed be sorted in first column
c indx must be of size idimx + 1
      integer idimx,idimy,indx(*),indxdim,i,j,left,right
      double precision A(*,*), x, a1
      indx(1) = left
      indxdim = 1
      a1 = A(left,1) + x
      do i=left+1,right
         if (A(i,1).lt.a1) cycle
         indxdim = indxdim + 1
         indx(indxdim) = i
         a1 = a1 + x
      enddo
      indxdim = indxdim + 1
      indx(indxdim) = right
      return
      end

      subroutine discr(idimv,A,y,indx,indxdim,left,right)
      implicit none
c y -- discretisation step
c indx -- array of indices of boundaries
c indxdim -- number of boundaries
c Array A is supposed be sorted in first column
c indx must be of size idimv + 1
      integer idimx,idimy,indx(*),indxdim,i,j,left,right
      double precision A(*), x, a1
      indx(1) = left
      indxdim = 1
      a1 = A(left) + y
      do i=left+1,right
         if (A(i).lt.a1) cycle
         indxdim = indxdim + 1
         indx(indxdim) = i
         a1 = a1 + y
      enddo
      indxdim = indxdim + 1
      indx(indxdim) = right
      return
      end
