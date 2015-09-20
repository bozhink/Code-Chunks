c The infinetely deep potential wall

      subroutine infwalls(n,s)
c S-matrix: 
c S_{mn} = <m|S|n>
      implicit none
      integer n,i,j,k
      double precision s(n,n)
      do i=1,n
         do j=1,n
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
      double precision h(n,n)
      do i=1,n
         do j=1,n
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
