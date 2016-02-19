      function td(x)
      implicit none
      double precision td,x,cut
      parameter(cut=0.01d0)
      if (dabs(x).lt.cut) then
         td=(0.4d0*x*x-1.d0)*x*x/3.d0+1.d0
      else
         td=dtanh(x)/x
      endif
      return
      end
