      function dinteg(px,py,mu,T)
      implicit double precision(a-h,o-z),integer(i-n)
      parameter(n=4)
      dimension h(n,n),evector(n)
      data ieigen/3/
      call bhhamilt(px,py,h)
      call eigen4(h,ieigen,evalue,evector,info)
      x=dabs(evalue-mu)*0.5d0/T
      chi=evector(1)*evector(2)
      dinteg=chi*chi*td(x)
      return
      end
