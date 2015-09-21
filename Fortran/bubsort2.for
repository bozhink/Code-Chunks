      subroutine bubsort2(x,y,l,r)
      integer r,l,i,j
      double precision x(*),y(*),t
      do i=l,r-1
         do j=r,i+1,-1
            if (x(j-1).gt.x(j)) then
               t = x(j-1)
               x(j-1) = x(j)
               x(j) = t
               t = y(j-1)
               y(j-1) = y(j)
               y(j) = t
            endif
         enddo
      enddo
      return
      end
