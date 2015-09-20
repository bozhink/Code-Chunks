      subroutine piksrt(n,a)
      implicit none
      integer n,i,j
      double precision a(n),b
      do j=2,n
         b=a(j)
         do i=j-1,1,-1
            if (a(i).le.b) goto 10
            a(i+1)=a(i)
         enddo
         i=0
   10    a(i+1)=b
      enddo
      return
      end

      
      
