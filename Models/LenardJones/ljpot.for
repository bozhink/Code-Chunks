      subroutine LJPOT(idimv,x,U)
c Two center Lenard-Jones Potential
      implicit real*8(a-h,o-z),integer(i-n)
      dimension x(idimv),a1(3),a2(3)
      data a1 /0.d0,0.d0,0.d0/
      data a2 /5.d0,0.d0,0.d0/
      s1=0.d0
      s2=0.d0
      do i=1,3
         d=x(i)-a1(i)
         s1=s1+d*d
         d=x(i)-a2(i)
         s2=s2+d*d
      enddo
      r16=s1*s1*s1
      r26=s2*s2*s2
      U= - 1.d0/r16*(1.d0-1.d0/r16) - 1.d0/r26*(1.d0-1.d0/r26)
      return
      end

      subroutine LJF(idimv,x,xdot)
c Two center Lenard-Jones Force
      implicit real*8(a-h,o-z),integer(i-n)
      dimension x(idimv),xdot(idimv),a1(3),a2(3)
      data a1 /0.d0,0.d0,0.d0/
      data a2 /5.d0,0.d0,0.d0/
      r1=dsqrt((x(1)-a1(1))**2+(x(2)-a1(2))**2+(x(3)-a1(3))**2)
      r2=dsqrt((x(1)-a2(1))**2+(x(2)-a2(2))**2+(x(3)-a2(3))**2)
      f1=6.d0/r1**7 - 12.d0/r1**13
      f2=6.d0/r2**7 - 12.d0/r2**13
      do i=1,3
         xdot(i) = f1*(x(i)-a1(i)) + f2*(x(i)-a2(i))
      enddo
      return
      end

      subroutine LJPOT1(idimv,x,U)
c Two center Lenard-Jones Potential
      implicit real*8(a-h,o-z),integer(i-n)
      dimension x(*),a1(1),a2(1)
      data a1 /-5.d0/
      data a2 / 5.d0/
      s1=x(1)-a1(1)
      s2=x(1)-a2(1)
      r16=s1**6
      r26=s2**6
      U= - 6.d0/r16*(1.d0-2.d0/r16) - 6.d0/r26*(1.d0-2.d0/r26)
      return
      end

      subroutine LJF1(idimv,x,xdot)
c Two center Lenard-Jones Force
      implicit real*8(a-h,o-z),integer(i-n)
      dimension x(*),xdot(*),a1(1),a2(1)
      data a1 /-5.d0/
      data a2 /5.d0/
      r1=dabs(x(1)-a1(1))
      r2=dabs(x(1)-a2(1))
      s1=r1**6
      s2=r2**6
      z1=s1*r1
      z2=s2*r2
      xdot(1) = -6.d0/z1*(1.d0-2.d0/s1) - 6.d0/z2*(1.d0-2.d0/s2)
      return
      end
