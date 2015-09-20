c Gravitational Three body problem  in 2dim
c The scale of length is R=earthmoon=3.8E8 meters , combining with
c     G=6.67E-11Nm^2/kg^2 and M=5.98E24 kg, one has L(scale)=R
c moon mass = 7.36E22 =1.23E-2*Mearth
c     T(scale)=(L^3/GM)^0.5=____ sec ; v(scale)=L/T= m/s ,
c     acceleration (scale)=L/T^2=9.82 m/s^2 , tfinal is in days
      real  mscale, m1,m2,m3
c     enter data of relative masses , m1=1.
      data mscale, m1,m2,m3/5.98E24,1.,1.23E-2,1.23E-2  /
      data G,rscale,r10,r20,r30 /6.67E-11,3.8E8,0.,1.,.5/
      data v10,v20,v30,tfinal/0.,1.,1.4142,12./
      equivalence (r12,r21) ,(r13,r31),(r23,r32)
      pi=2.*asin(1.)
      vscale=sqrt(G*mscale/rscale)
      tscale=rscale/vscale
      nstep=3000
      print*,'vsc(m/s),tscale(s),tfinal(days)=',vscale ,tscale,tfinal
      tfinal=tfinal*8.64E4/tscale
      dt=tfinal/float(nstep)
c alfa are the initial angles of the position vectors
      alfa1=0.
      alfa2=0.
      alfa3=pi
c theta1,theta2,theta3 initial angle of velocity vectors
      theta1=0.
      theta2=pi/2.
      theta3=1.5*pi
      x10=r10*cos(alfa1)
      y10=r10*sin(alfa1)
      x20=r20*cos(alfa2)
      y20=r20*sin(alfa2)
      x30=r30*cos(alfa3)
      y30=r30*sin(alfa3)
      x11=x10+v10*cos(theta1)*dt
      y11=y10+v10*sin(theta1)*dt
      x21=x20+v20*cos(theta2)*dt
      y21=y20+v20*sin(theta2)*dt
      x31=x30+v30*cos(theta3)*dt
      y31=y30+v30*sin(theta3)*dt
      r12=sqrt( (x10-x20)**2 +(y10-y20)**2)
      r13=sqrt( (x10-x30)**2 +(y10-y30)**2)
      r23=sqrt( (x30-x20)**2 +(y30-y20)**2)
      et=.5*(m1*v10**2+m2*v20**2+m3*v30**2)-
     $ (m1*m2/r12+m1*m3/r13+m2*m3/r23)
      print*,'Etotal =',  et
      kprint=int(float(nstep)/60.)
      kount=kprint
      print* , 'x1,y1,x2,y2,x3,y3='
      print*,'   '
      print 120 ,x10,y10,x20,y20,x30,y30
      do 100 i=2,nstep
      call rijtrig(x11,y11,x21,y21,x31,y31,r12,r13,r23,cs12,sn12,cs13,
     $sn13,cs23,sn23)
      cs21=-cs12
      sn21=-sn12
      cs31=-cs13
      sn31=-sn13
      cs32=-cs23
      sn32=-sn23

      x12=2.*x11-x10+(dt**2)*( m2*cs12/r12**2 +m3*cs13/r13**2)
      y12=2.*y11-y10+(dt**2)*( m2*sn12/r12**2 +m3*sn13/r13**2)

      x22=2.*x21-x20+(dt**2)*( m1*cs21/r12**2 +m3*cs23/r23**2)
      y22=2.*y21-y20+(dt**2)*( m1*sn21/r12**2 +m3*sn23/r23**2)

      x32=2.*x31-x30+(dt**2)*( m1*cs31/r13**2 +m2*cs32/r23**2)
      y32=2.*y31-y30+(dt**2)*( m1*sn31/r13**2 +m2*sn32/r23**2)

      if(i.eq.kount)then
      print 120 ,x12,y12,x22,y22,x32,y32
      kount=kount+kprint
      endif
      
      x10=x11
      x11=x12
      y10=y11
      y11=y12
c**********************
      x20=x21
      x21=x22
      y20=y21
      y21=y22
c*************************
      x30=x31
      x31=x32
      y30=y31
      y31=y32
100   continue
120   format(6(2x,e10.3) )
      stop
      end
      

      subroutine  rijtrig(x11,y11,x21,y21,x31,y31,r12,r13,r23,cs12,
     $sn12,cs13,sn13,cs23,sn23)
      r12=sqrt( (x11-x21)**2+(y11-y21)**2)
      r13=sqrt( (x11-x31)**2+(y11-y31)**2)
      r23= sqrt((x21-x31)**2+(y21-y31)**2)
      cs12= (x21-x11)/r12
      sn12= (y21-y11)/r12
      cs13= (x31-x11)/r13
      sn13= (y31-y11)/r13
      cs23= (x31-x21)/r23
      sn23= (y31-y21)/r23
      return
      end
