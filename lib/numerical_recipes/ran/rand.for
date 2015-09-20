      function ran0(idum)
      integer idum, IA, IM, IQ, IR, MASK
      real ran0, AM
      parameter (IA=16807, IM=2147483647, AM=1./IM,
     *    IQ=127773, IR=2836,MASK=123459876)
      integer k
      idum=ieor(idum,MASK)
      k=idum/IQ
      idum=IA*(idum-k*IQ) - IR*k
      if (idum.lt.0) idum=idum+IM
      ran0=AM*idum
      idum=ieor(idum,MASK)
      return
      end

      function dran0(idum)
      integer idum, IA, IM, IQ, IR, MASK
      double precision dran0, AM
      parameter (IA=16807, IM=2147483647,
     *    IQ=127773, IR=2836,MASK=123459876)
      integer k
      AM=1.d0/dble(IM)
      idum=ieor(idum,MASK)
      k=idum/IQ
      idum=IA*(idum-k*IQ) - IR*k
      if (idum.lt.0) idum=idum+IM
      dran0=AM*dble(idum)
      idum=ieor(idum,MASK)
      return
      end