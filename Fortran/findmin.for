      program findmin
      implicit real*8(a-z)
      a  = 0.d0
      m  = 0.01d0
      ha = 0.01d0
      hm = 0.01d0
      mmax = 20.d0
      amax  = 20.d0
      do 10
        m = m + hm
        if (m.gt.mmax) goto 50
        do 20
          a = a + ha
          if (a.gt.amax) goto 50
          dr1 = r1(m, a)
          dr2 = r2(m, a)
          v1  = ddv(a, m, dr1)
          v2  = ddv(a, m, dr2)
          if(v1.ge.0.d0.or.v2.ge.0.d0) then
            print 100, m, a, dr1, v1, dr2, v2
          endif
   20   continue
        print*,"'"
   10 continue
   50 stop
  100 format('M',1x,f6.2,1x,'A',1x,f6.2,1x,'R1',1x,f6.2,1x,'DDV1',
     *           1x,e18.8,1x,'R2',1x,f6.2,1x,'DDV2',1x,e18.8)
      end
      
      function ddv(a,m,r)
      implicit double precision(a-z)
      ddv=8.d0*a*m*r-2.d0*a*a*m+3.d0*r*r*(r-4.d0*m)
      return
      end
      
      function r1(m,a)
      implicit double precision(a-z)
      r1=1.5d0*M*(1.d0-dsqrt(1.d0-4.d0*a/(9.d0*m)))
      return
      end
      
      function r2(m,a)
      implicit double precision(a-z)
      r2=1.5d0*M*(1.d0+dsqrt(1.d0-4.d0*a/(9.d0*m)))
      return
      end
