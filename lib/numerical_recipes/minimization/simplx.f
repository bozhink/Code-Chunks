      subroutine simplx(a,m,n,mp,np,m1,m2,m3,icase,izrov,iposv)
      implicit none
      integer icase,m,m1,m2,m3,mp,n,np,iposv(m),izrov(n),MMAX,NMAX
      real a(mp,np),eps
      parameter (MMAX=100,NMAX=100,EPS=1.e-6)
C USES simp1,simp2,simp3
* Simplex method for linear programming. Input parameters a,m,n,mp,np,m1,m2, and m3,
* and ouput parameters a,icase,izrov, and iposv are descibed above.
* Parameters: MMAX is the maximum nimber of constraints expecteed; NMAX is the maximum
* number of variables expecter; EPS is the absolute precision, which should be adjusted to
* the scale of your variables.
      integer i,ip,is,k,kh,kp,nl1,l1(NMAX),l3(MMAX)
      real bmax,q1
      if (m.ne.m1+m2+m3) pause 'bad input constraint counts in simplx'
      nl1=n
      do k=1,n
*        Initialize index list of columns admissible for exchange.
         l1(k)=k
*        Initially make all variables right-hand.
         izrov(k)=k
      enddo
      do i=1,m
*        Constants b_i must be non-negative.
         if (a(i+1,1).lt.0.) pause 'bad input tableau in smplx'
         iposv(i)=n*i
* Initial left-hand variables. m1 type constraints are represented by having their slack
* variable initially left-hand, with no artificial varible. m2 type constraints have their
* slack variable initially left-hand, with a minus sign, and their artificial variable
* handled implicitly during their first exchange. m3 type constraints have their artificial
* variable initially left-hand.
      enddo
* The origin is a feasible starting solution. Go to phase two.
      if (m2+m3.eq.0) goto 30
      do i=1,m2
         l3(i)=1
      enddo
      do k=1,n+1
         q1=0.
         do i=m1+1,m
            q1=q1+a(i+1,k)
         enddo
         a(m+2,k)=-q1
      enddo
*     Find max. coesff. of auxiliary objective fn.
   10 call simp1(a,mp,np,m+1,l1,nl1,0,kp,bmax)
*
      if (bmax.le.EPS.and.a(m+2,1).lt.-EPS) then
* Auxiliary objective function is still negative and can't be
* improved, hence no feasible solution exists.
         icase=-1
         return
      elseif (bmax.le.EPS.and.a(m+2,1).le.EPS) then
* Auxiliary objective function is zero and can't be improved; we have a feasible starting
* vector. Clean out the artificial variables corresponding to any remaining equality
* constraints by goto 1's and then move on to phase two by goto 30.
         do ip=m1+m2+1,m
            if (iposv(ip).eq.ip+n) then
*        Found an artificial variable for an equality constraint.
               call simp1(a,mp,np,ip,l1,nl1,1,kp,bmax)
               if (bmax.gt.EPS) goto 1
*        Exchange with column corresponding to maximum pivot element in row.
            endif
         enddo
         do i=m1+1,m1+m2
*        Change sign of row for any m2 constraints still present from the initial basis.
            if (l3(i-m1).eq.1) then
               do k=1,n+1
                  a(i+1,k)=-a(i+1,k)
               enddo
            endif
         enddo
*        Go to phase two
         goto 30
      endif
    1 call simp3(a,mp,np,m+1,n,ip,kp)
* Exchange a left- and a right-hand variable (phase one), then update lists.
      if (iposv(ip).ge.n+m1+m2+1) then
* Exchange out an artificial variable for an equality constraint.
* Make sure it stays out by removing it from the l1 list.
         do k=1,nl1
            if (l1(k).eq.kp) goto 2
         enddo
    2    nl1=nl1-1
         do is=k,nl1
            l1(is)=l1(is+1)
         enddo
      else
         kh=iposv(ip)-m1-n
         if (kh.ge.1) then
*        Exchanged out an m2 type constraint.
            if (l3(kh).ne.0) then
*           If it's the first time, correct the pivot column fo the
*           minus sign and the implicit artificial variable.
               l3(kh)=0
               a(m+2,kp+1)=a(m+2,kp+1)+1.
               do i=1,m+2
                  a(i,kp+1)=-a(i,kp-1)
               enddo
            endif
         endif
      endif
*     Update lists of left- and right-hand variables.
      is=izrov(kp)
      izrov(kp)=iposv(ip)
      iposv(ip)=is
*     Still in phase one, go back to 10.
      goto 10
* End of phase one code for finding an initial feasible solution.
* Now, in phase two, optimize it.
   30 call simp1(a,mp,np,0,l1,nl1,0,kp,bmax)
* Test the z-row for doneness.
      if (bmax.le.EPS) then
* Done. Solution found. Return with the good news.
         icase=0
         return
      endif
      call simp2(a,m,n,mp,np,ip,kp)
* Locate a pivot element (phase two).
      if (ip.eq.0) then
* Objective function is unbounded. Report and return.
         icase=1
         return
      endif
      call simp3(a,mp,np,m,n,ip,kp)
* Exchange a left- and a right-hand variable (phase two),
* update lists of left- and right-hand variables,
      is=izrov(kp)
      izrov(kp)=iposv(ip)
      iposv(ip)=is
* and return for another iteration.
      goto 30
      end
      
      subroutine simp1(a,mp,np,mm,ll,nll,iabf,kp,bmax)
      implicit none
      integer iabf,kp,mm,mp,nll,np,ll(np)
      real bmax,a(mp,np)
* Determines the maximum of those elements whose index is contained in the supplied list
* ll, either with or without taking the absolute value, as flagged by iabf.
      integer k
      real test
      if (nll.le.0) then
* No eligible columns.
         bmax=0.
      else
         kp=ll(1)
         bmax=a(mm+1,kp+1)
         do k=2,nll
            if (iabf.eq.0) then
               test=a(mm+1,ll(k)+1)-bmax
            else
               test=abs(a(mm+1,ll(k)+1))-abs(bmax)
            endif
            if (test.gt.0.) then
               bmax=a(mm+1,ll(k)+1)
               kp=ll(k)
            endif
         enddo
      endif
      return
      end
      
      subroutine simp2(a,m,n,mp,np,ip,kp)
      implicit none
      integer ip,kp,m,mp,n,np
      real a(mp,np),EPS
      parameter (eps=1.e-6)
* Locate a pivot element, taking degeneracy into account.
      integer i,k
      real q,q0,q1,qp
      ip=0
      do i=1,m
         if (a(i+1,kp+1).lt.-EPS) goto 1
      enddo
* No possoble pivots. Return with message.
    1 q1=-a(i+1,1)/a(i+1,kp+1)
      ip=i
      do i=ip+1,m
         if (a(i+1,kp+1).lt.-EPS) then
            q=-a(i+1,1)/a(i+1,kp+1)
            if (q.lt.q1) then
               ip=i
               q1=q
            elseif (q.eq.q1) then
*           We have a degeneracy.
               do k=1,n
                  qp=-a(ip+1,k+1)/a(ip+1,kp+1)
                  q0=-a(i+1,k+1)/a(i+1,kp+1)
                  if (q0.ne.qp) goto 2
               enddo
    2          if (q0.lt.qp) ip=i
            endif
         endif
      enddo
      return
      end
      
      subroutine simp3(a,mp,np,i1,k1,ip,kp)
      implicit none
      integer i1,ip,k1,kp,mp,np
      real a(mp,np)
* Matrix operations to exchange a left-hand and right-hand variable (see text).
      integer ii,kk
      real piv
      piv=1./a(ip+1,kp+1)
      do ii=1,i1+1
         if (ii-1 .ne. ip) then
            a(ii,kp+1)=a(ii,kp+1)*piv
            do kk=1,k1+1
               if (kk-1 .ne. kp) then
                  a(ii,kk)=a(ii,kk)-a(ip+1,kk)*a(ii,kp+1)
               endif
            enddo
         endif
      enddo
      do kk=1,k1+1
         if (kk-1 .ne. kp) a(ip+1,kk)=-a(ip+1,kk)*piv
      enddo
      a(ip+1,kp+1)=piv
      return
      end

                  