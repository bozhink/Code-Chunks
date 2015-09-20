      subroutine dsct(n,x,b,z)
c Special Conformal dimension
c n -- dimensionality
c x -- input; vector to be  transformed
c b -- input; translational vector
c z -- output; transformed vector
      implicit double precision(a-h,o-z),integer(i-n)
      dimension x(*),b(*),z(*)
      d=0.d0
      do i=1,n
         d=d+x(i)*x(i)
      enddo
      d=1.0d0/d
      do i=1,n
         z(i) = d*x(i)+b(i)
      enddo
      return
      end
      
       subroutine zsct(n,x,b,z)
c Special Conformal dimension
c n -- dimensionality
c x -- input; vector to be  transformed
c b -- input; translational vector
c z -- output; transformed vector
      implicit double complex(a-h,o-z),integer(i-n)
      dimension x(*),b(*),z(*)
      d=0.d0
      do i=1,n
         d1=dble(x(i))
         d2=dimag(x(i))
         d=d+d1*d1+d2*d2
      enddo
      d=1.0d0/d
      do i=1,n
         z(i) = d*x(i)+b(i)
      enddo
      return
      end
      
