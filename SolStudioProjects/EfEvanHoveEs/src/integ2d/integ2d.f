      subroutine integ2d(f,a0,b0,a1,b1,eps,res,nevals,iflag)
      implicit none
c This subroutine performs numerical 2d integration of a function f(x,y)
c in the region
c x in [a0,a1]
c y in [b0,b1]
c using the subroutine twodq
c
c Parameters
c 'f' -- input; external; double precision function f(x,y), which will be integrated
c 'a0' -- input; left boundary for variable x
c 'a1' -- input; right boundary for variable x
c 'b0' -- input; left boundary for variable y
c 'b1' -- input; right boundary for variable y
c 'eps' -- input; error estimate
c 'res' -- output; returned result
c 'nevals' -- output; number of evaluation of f (see twodq)
c 'iflag'  -- output; error flag (see twodq)
      integer n, nu, nd, nevals, iflag, iwork(100)
      parameter(n=25)
      double precision f,a0,a1,b0,b1,eps,res,err
      double precision x(3,2*n*n), y(3,2*n*n), dat(450)
      external f
      common /strngxy/ x, y
      common /cinteg2d/ iwork, dat
      nu=0
      nd=0
      iflag=1
      call twodq(f,2*n*n,x,y,eps,1,50,4000,res,err,nu,nd,
     *  nevals,iflag,dat,iwork)
      return
      end


