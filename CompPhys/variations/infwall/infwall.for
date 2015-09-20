c The infinetely deep potential wall

      subroutine infwalls(n,s)
c S-matrix:
c S_{mn} = <m|S|n>
      implicit none
      integer n,i,j,k
      double precision s(0:n-1,0:n-1)
      do i=0,n-1
         do j=0,n-1
            k=i+j
            if (2*(k/2).eq.k) then
               s(i,j)=2.d0/dble(k+5)-4.d0/dble(k+3)+2.d0/dble(k+1)
            else
               s(i,j)=0.0d0
            endif
        enddo
      enddo
      return
      end

      subroutine infwallh(n,h)
c Hamiltonial:
c H-matrix:
c H_{mn} = <m|H|n>
      implicit none
      integer n,i,j,k
      double precision h(0:n-1,0:n-1)
      do i=0,n-1
         do j=0,n-1
            k=i+j
            if (2*(k/2).eq.k) then
               h(i,j)=dble(8*(k+2*i*j-1))/dble((k+3)*(k*k-1))
            else
               h(i,j)=0.d0
            endif
         enddo
      enddo
      return
      end

      subroutine basis(n,x,chi)
      integer n
      double precision x,chi(0:n-1)
      x2 = x*x-1.d0
      chi(0)=x2
      do i=1,n-1
      chi(i)=chi(i-1)*x
      enddo
      return
      end

      subroutine PSI(n,A,lda,x,DPSI)
      implicit double precision(a-h,o-z),integer(i-n)
c 'n'    -- input; number of wave functions to be calculated
c 'A'    -- input; matrix(lda,n); coefficients of the wave function
c 'lda'  -- input; leading dimension of A
c 'x'    -- input; point to be function calculated
c 'DPSI' -- output; returned result
      dimension A(lda,n),DPSI(n),chi(lda)
      call basis(lda,x,chi)
      do j=1,n
         DPSI(j)=0.d0
         do i=1,lda
            DPSI(j)=DPSI(j)+A(i,j)*chi(i)
         enddo
      enddo
      return
      end

