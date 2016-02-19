      program EFermi EvanHove Es Main Program
      implicit none
      double precision Kelvin, pi
      parameter(Kelvin=1.d0/11604.d0)
      integer info, n, i
      double precision findef, ess, fillingf, eff
      double precision esmin, esmax, des
      double precision e(3), t(3), dspec(4)
      double precision Ed,Es,Ep,Tpd,Tsp,Tpp
      common /BHPARAMS/ Ed,Es,Ep,Tpd,Tsp,Tpp

      e(1)=Ed
      e(2)=Es
      e(3)=Ep
      t(1)=Tpd
      t(2)=Tsp
      t(3)=Tpp

      print*,"Initialization and start"
      pi=4.d0*datan(1.d0)
      call setriang(0.d0,0.d0,pi,pi)

      n = 50
      esmin=1.25d0
      esmax=12.d0
      des = (esmax-esmin)/dble(n)
      
      open(unit=12,file="efevhes-p012.dat",status='replace')

      ess=esmin
      fillingf=0.5d0-0.20d0
      do i=1,n
         ! Calculation of EFermi
         eff = findef(ess,fillingf)
         ! Calculation of spectrum and van Hove energy in point X=(pi,0)
         e(2)=ess
         call spec(pi,0.d0,e,t,dspec,info)
         ess=ess+des
         ! Exporting results
         print 100,ess, eff, dspec
         write (unit=12,fmt=100) ess, eff, dspec
      enddo

      close(unit=12)
      stop
  100 format(f6.3,5(1x,f6.3))
      end

