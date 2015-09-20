      subroutine amoeba(p,y,mp,np,ndim,ftol,funk,iter)
      implicit none
      integer iter,mp,ndim,np,NMAX,ITMAX
      real ftol,p(mp,np),y(mp),funk,TINY
* Maximum allowed dimension and function evaluation,
* and a small number.
      parameter (NMAX=20,ITMAX=5000,TINY=1.e-10)
      external funk
C USES amotry,funk
* Multidimensional minimization of the function funk(x) where x(1:ndim) is a vector
* in ndim dimensions, by the downhill simplex method of Nelder and Mead. The matrix
* p(1:ndim+1,1:ndim) is input. Its ndim+1 rows are ndim-dimensional vector which are
* the vertices of the starting simplex. Also input is the vector y(1:ndim+1), whose
* components must be pre-initialized to the values of funk evaluated at the ndim+1
* vertices (rows) of p; and ftol the fractional convergence tolerance to be achieved
* in the function value (n.b.!). On output, p and y will have been reset to ndim+1
* new points all within ftol of a minimum value, and iter gives the number of
* function evaluations taken.
      integer i,ihi,ilo,inhi,j,m,n
      real rtol,sum,swap,ysave,ytry,psum(NMAX),amotry
      iter=0
    1 do n=1,ndim
         sum=0.0
         do m=1,ndim+1
            sum=sum+p(m,n)
         enddo
         psum(n)=sum
      enddo
    2 ilo=1
      if (y(1).gt.y(2)) then
         ihi=1
         inhi=2
      else
         ihi=2
         inhi=1
      endif
* by looping over the points in the simplex
      do i=1,ndim+1
         if (y(i).le.y(ilo)) ilo=i
         if (y(i).gt.y(ihi)) then
            inhi=ihi
            ihi=i
         else if (y(i).gt.y(inhi)) then
            if (i.ne.ihi) inhi=i
         endif
      enddo
      rtol=2.0*abs(y(ihi)-y(ilo))/(abs(y(ihi))+abs(y(ilo))+TINY)
* Compute the fractional range from highest to lower and return if satisfactory.
* If returning, put best point and value in slot 1.
      if (rtol.lt.ftol) then
         swap=y(1)
         y(1)=y(ilo)
         y(ilo)=swap
         do n=1,ndim
            swap=p(1,n)
            p(1,n)=p(ilo,n)
            p(ilo,n)=swap
         enddo
         return
      endif
      if (iter.ge.ITMAX) print*,'ITMAX exceeded in amoeba'
      iter=iter+2
* Begin a new iteration. First exrapolate byy a factor -1 though the face of the
* simplex across from the high point, i.e., reflect the simplex from the high point.
      ytry=amotry(p,y,psum,mp,np,ndim,funk,ihi,-1.0)
      if (ytry.le.y(ilo)) then
* Gives a result better than the best point, so try an additional extrapolation
* by a factor 2.
         ytry=amotry(p,y,psum,mp,np,ndim,funk,ihi,2.0)
      else if (ytry.ge.y(ihi)) then
* The reflected point is worse than the second-highest, so look for an interpolate
* lower point, i.e., do a on-dimensionsl contraction.
         ysave=y(ihi)
         ytry=amotry(p,y,psum,mp,np,ndim,funk,ihi,0.5)
* Cant't seem to get rid of that high point. Better contract around the loweer
* (best) point.
         if (ytry.ge.ysave) then
            do i=1,ndim+1
               if (i.ne.ilo) then
                  do j=1,ndim
                     psum(j)=0.5*(p(i,j)+p(ilo,j))
                     p(i,j)=psum(j)
                  enddo
                  y(i)=funk(psum)
               endif
            enddo
* Keep track of function evaluations.
            iter=iter+ndim
* Go back for the test of doneness and the next iteration.
            goto 1
         endif
      else
         iter=iter-1
      endif
      goto 2
      end
      
      function amotry(p,y,psum,mp,np,ndim,funk,ihi,fac)
      implicit none
      integer ihi,mp,ndim,np,NMAX
      real amotry,fac,p(mp,np),psum(np),y(mp),funk
      parameter (NMAX=20)
      external funk
C USES funk
* Extrapolates by a factor fac through the face of the simplex across from the high
* point, tries it, and replaces the high point if the new point is better.
      integer j
      real fac1,fac2,ytry,ptry(NMAX)
      fac1=(1.0-fac)/ndim
      fac2=fac1-fac
      do j=1,ndim
         ptry(j)=psum(j)*fac1-p(ihi,j)*fac2
      enddo
* Evaluate the function at the trial point.
      ytry=funk(ptry)
* If it's better than the highest, then replace the highest.
      if (ytry.lt.y(ihi)) then
         y(ihi)=ytry
         do j=1,ndim
            psum(j)=psum(j)-p(ihi,j)+ptry(j)
            p(ihi,j)=ptry(j)
         enddo
      endif
      amotry=ytry
      return
      end
