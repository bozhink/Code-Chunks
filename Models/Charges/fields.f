      subroutine fields(r1,r2,v1,v2,a1,a2,field1,field2,ierr)
      implicit double precision(a-h,o-z),integer(i-n)
      dimension r1(3),r2(3),v1(3),v2(3),a1(3),a2(3)
      dimension field1(3),field2(3)
      dimension r0(3)
c
      r0(1)=r1(1)-r2(1)
      r0(2)=r1(2)-r2(2)
      r0(3)=r1(3)-r2(3)
      r    =dsqrt(r0(1)*r0(1)+r0(2)*r0(2)+r0(3)*r0(3))
      r0(1)=r0(1)/r
      r0(2)=r0(2)/r
      r0(3)=r0(3)/r
c      print*,r0,r
c
      ierr=0
      vv1 = 1.d0 -v1(1)*v1(1)-v1(2)*v1(2)-v1(3)*v1(3)
      vv2 = 1.d0 -v2(1)*v2(1)-v2(2)*v2(2)-v2(3)*v2(3)
      if (vv1.lt.0.d0.or.vv2.lt.0.d0) goto 10
      vv  = 1.d0 -v1(1)*v2(1)-v1(2)*v2(2)-v1(3)*v2(3)
c      print*,'vv: ',vv1,vv2,vv
c
      vr1 = v1(1)*r0(1)+v1(2)*r0(2)+v1(3)*r0(3)
      vr2 = v2(1)*r0(1)+v2(2)*r0(2)+v2(3)*r0(3)
c      print*,'vr: ',vr1,vr2
c
      ar1 = (a1(1)*r0(1)+a1(2)*r0(2)+a1(3)*r0(3))*r
      ar2 = (a2(1)*r0(1)+a2(2)*r0(2)+a2(3)*r0(3))*r
c      print*,'ar: ',ar1,ar2
c
      y1 = 1.d0-vr1
      y2 = 1.d0-vr2
c
      z1 = 1.d0/(r*r*y2*y2)
      cr1 = ((vv2+ar2)*vv/y2-y1)*z1
      cr2 = -((vv2+ar2)*y1/y2)*z1
      cr3 = -y1*z1*r
c      print*,'cr:1: ',cr1,cr2,cr3
c
      field1(1) = cr1*r0(1) + cr2*v2(1) + cr3*a2(1)
      field1(2) = cr1*r0(2) + cr2*v2(2) + cr3*a2(2)
      field1(3) = cr1*r0(3) + cr2*v2(3) + cr3*a2(3)
c
      gg  = dsqrt(vv1)
      t11 = gg*(1.d0-v1(1)*v1(1))
      t12 = -gg*v1(1)*v1(2)
      t13 = -gg*v1(1)*v1(3)
      t22 = gg*(1.d0-v1(2)*v1(2))
      t23 = -gg*v1(2)*v1(3)
      t33 = gg*(1.d0-v1(3)*v1(3))
c      print*,'T:1:'
c      print*,t11,t12,t13
c      print*,t12,t22,t23
c      print*,t12,t23,t33
c      print*
c
      field1(1) = t11*field1(1)+t12*field1(2)+t13*field1(3)
      field1(2) = t12*field1(1)+t22*field1(2)+t23*field1(3)
      field1(3) = t13*field1(1)+t23*field1(2)+t33*field1(3)
c
      y1 = 1.d0+vr2
      y2 = 1.d0+vr1
c
      z1 = 1.d0/(r*r*y2*y2)
      cr1 = (-(vv1-ar1)*vv/y2-y1)*z1
      cr2 = -((vv1-ar1)*y1/y2)*z1
      cr3 = -y1*z1*r
c      print*,'cr:2: ',cr1,cr2,cr3
c
      field2(1) = cr1*r0(1) + cr2*v1(1) + cr3*a1(1)
      field2(2) = cr1*r0(2) + cr2*v1(2) + cr3*a1(2)
      field2(3) = cr1*r0(3) + cr2*v1(3) + cr3*a1(3)
c
      gg  = dsqrt(vv2)
      t11 = gg*(1.d0-v2(1)*v2(1))
      t12 = -gg*v2(1)*v2(2)
      t13 = -gg*v2(1)*v2(3)
      t22 = gg*(1.d0-v2(2)*v2(2))
      t23 = -gg*v2(2)*v2(3)
      t33 = gg*(1.d0-v2(3)*v2(3))
c      print*,'T:2:'
c      print*,t11,t12,t13
c      print*,t12,t22,t23
c      print*,t12,t23,t33
c      print*
c
      field2(1) = t11*field2(1)+t12*field2(2)+t13*field2(3)
      field2(2) = t12*field2(1)+t22*field2(2)+t23*field2(3)
      field2(3) = t13*field2(1)+t23*field2(2)+t33*field2(3)
c
      return
   10 ierr=1
      write(unit=0,fmt=*)'Error: fields: velocities must be less than 1'
      return
      end
