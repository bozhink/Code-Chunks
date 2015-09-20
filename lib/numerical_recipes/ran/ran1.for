      function ran1(idum)
      implicit none
      integer idum,IA,IM,IQ,IR,NTAB,NDIV
      real ran1,AM,EPS,RNMX
      parameter(IA=16907,IM=2147483647,AM=1./IM,IQ=127773,IR=2836,
     *     NTAB=32,NDIV=1+(IM-1)/NTAB,EPS=1.2e-7,RNMX=1.-EPS)
      integer j,k,iv(NTAB),iy
      save iv, iy
      data iv/NTAB*0/, iy/0/
      if (idum.le.0.or.iy.eq.0) then
         idum=max(-idum,1)
         do j=NTAB+8,1,-1
            k=idum/IQ
            idum=IA*(idum-k*IQ)-IR*k
            if (idum.lt.0) idum=idum+IM
            if (j.le.NTAB) iv(j)=idum
         enddo
         iy=iv(1)
      endif
      k=idum/IQ
      idum=IA*(idum-k*IQ)-IR*k
      if (idum.lt.0) idum=idum+IM
      j=1+iy/NDIV
      iy=iv(j)
      iv(j)=idum
      ran1=min(AM*iy,RNMX)
      return
      end

      function dran1(idum)
      implicit none
      integer idum,IA,IM,IQ,IR,NTAB,NDIV
      double precision dran1,AM,EPS,RNMX
      parameter(IA=16907,IM=2147483647,AM=1.d0/IM,IQ=127773,IR=2836,
     *     NTAB=32,NDIV=1+(IM-1)/NTAB,EPS=1.2d-7,RNMX=1.d0-EPS)
      integer j,k,iv(NTAB),iy
      save iv, iy
      data iv/NTAB*0/, iy/0/
      if (idum.le.0.or.iy.eq.0) then
         idum=max(-idum,1)
         do j=NTAB+8,1,-1
            k=idum/IQ
            idum=IA*(idum-k*IQ)-IR*k
            if (idum.lt.0) idum=idum+IM
            if (j.le.NTAB) iv(j)=idum
         enddo
         iy=iv(1)
      endif
      k=idum/IQ
      idum=IA*(idum-k*IQ)-IR*k
      if (idum.lt.0) idum=idum+IM
      j=1+iy/NDIV
      iy=iv(j)
      iv(j)=idum
      dran1=min(AM*iy,RNMX)
      return
      end

      subroutine sran1(idum,ran1)
      implicit none
      integer idum,IA,IM,IQ,IR,NTAB,NDIV
      real ran1,AM,EPS,RNMX
      parameter(IA=16907,IM=2147483647,AM=1./IM,IQ=127773,IR=2836,
     *     NTAB=32,NDIV=1+(IM-1)/NTAB,EPS=1.2e-7,RNMX=1.-EPS)
      integer j,k,iv(NTAB),iy
      save iv, iy
      data iv/NTAB*0/, iy/0/
      if (idum.le.0.or.iy.eq.0) then
         idum=max(-idum,1)
         do j=NTAB+8,1,-1
            k=idum/IQ
            idum=IA*(idum-k*IQ)-IR*k
            if (idum.lt.0) idum=idum+IM
            if (j.le.NTAB) iv(j)=idum
         enddo
         iy=iv(1)
      endif
      k=idum/IQ
      idum=IA*(idum-k*IQ)-IR*k
      if (idum.lt.0) idum=idum+IM
      j=1+iy/NDIV
      iy=iv(j)
      iv(j)=idum
      ran1=min(AM*iy,RNMX)
      return
      end

      subroutine sdran1(idum,dran1)
      implicit none
      integer idum,IA,IM,IQ,IR,NTAB,NDIV
      double precision dran1,AM,EPS,RNMX
      parameter(IA=16907,IM=2147483647,AM=1.d0/IM,IQ=127773,IR=2836,
     *     NTAB=32,NDIV=1+(IM-1)/NTAB,EPS=1.2d-7,RNMX=1.d0-EPS)
      integer j,k,iv(NTAB),iy
      save iv, iy
      data iv/NTAB*0/, iy/0/
      if (idum.le.0.or.iy.eq.0) then
         idum=max(-idum,1)
         do j=NTAB+8,1,-1
            k=idum/IQ
            idum=IA*(idum-k*IQ)-IR*k
            if (idum.lt.0) idum=idum+IM
            if (j.le.NTAB) iv(j)=idum
         enddo
         iy=iv(1)
      endif
      k=idum/IQ
      idum=IA*(idum-k*IQ)-IR*k
      if (idum.lt.0) idum=idum+IM
      j=1+iy/NDIV
      iy=iv(j)
      iv(j)=idum
      dran1=min(AM*iy,RNMX)
      return
      end