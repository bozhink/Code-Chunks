      recursive function det(rank, a) result (s)
      implicit double precision(a-z)
      integer rank, n, i, j, k, ii, kk
      dimension a(rank,rank), b(rank-1,rank-1)
      s = 0.0
      sig = 1.0
      n = rank-1
      if (rank .eq. 2) then
          s = a(1,1)*a(2,2) - a(1,2)*a(2,1)
          return
      endif
      do i=1,rank
          ii = i+1
          do k=2,rank
              kk = k-1
              do j=1,i-1
                  b(j,kk) = a(j,k)
              enddo
              do j=i+1,rank
                  b(j-1,kk) = a(j,k)
              enddo
          enddo
          if ( 2*(ii/2) .ne. ii ) sig=-1.0
          s = s + sig*det(n,b)*a(i,1)
      enddo
      return
      end

