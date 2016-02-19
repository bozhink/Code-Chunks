      subroutine setriang(a0,b0,a1,b1)
      implicit none
c This subroutine sets fixed triangulation with 2*n simplices,
c calling the subroutine triang
c
c Parameters
c 'a0' -- input; left boundary for variable x
c 'a1' -- input; right boundary for variable x
c 'b0' -- input; left boundary for variable y
c 'b1' -- input; right boundary for variable y
c 'n   -- half the number of simplices; in the current subroutine this nuber is fixed
      integer n
      parameter (n=25)
      double precision a0, a1, b0, b1
      double precision x(3,2*n*n),y(3,2*n*n)
      common /strngxy/ x, y
      call triang(a0,b0,a1,b1,n,x,y)
      return
      end
