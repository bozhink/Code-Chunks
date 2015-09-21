! file: main.f90
! author: Bozhin Karaivanov
! date created: 06.09.2013
! last modified: 06.09.2013

program ring_spectrum
   use tasep_ring
   use spectrum
   implicit none
   integer, parameter :: nn = 100 ! number of particles
   integer, parameter :: ll = 200 ! lattice size
   integer, parameter :: kk = 6 ! number of states
   integer, parameter :: TT = 256 ! number of frequency mods
   integer, parameter :: TN = TT * ll
   double complex, dimension (TT, ll) :: Sf ! spectral matrix
   double precision, dimension (TT) :: S ! spectral vector
   integer, dimension (TT, ll) :: AA ! model matrix
   integer :: i, j, iclock, tic, toc
   real :: p, q, a, b
   character(len=13) :: frmt, frmt1
   character(len=250) :: arg
   data AA /TN*0/
   data p /1.0/, q /0.0/, a /1.0/, b /0.0/
   write (unit=frmt, fmt="('(i1,'i2'(1xi1))')") ll - 1
   write (unit=frmt1, fmt="('(i6,'i2'(1xi6))')") ll - 1
   
   if (iargc() < 1) then
      stop 'Enter output file name!'
   endif
   call getarg(1,arg)
   open (unit=10, file=arg, status='replace', iostat=i)
   if (i.ne.0) then
      stop 'Error opening output file!'
   endif
   
   ! Initialization
   call system_clock(iclock)
   call srand(iclock)
   tic = iclock

   ! Population of model's matrix
   call init(ll, nn, p, q, a, b)
   call randomize()
   AA(1,:) = chain
   do i = 2, TT
      call backward_sequental_update_open()
      AA(i,:) = chain
   enddo
   call finalize()
   
   ! Calculation of the spectrum
   call fourier (TT, ll, AA, Sf)
   call spec(TT, ll, Sf, S)
   
   ! Writing spectrum to file
   do i = 1, TT
      write (unit=10,fmt="(i6,1x,e18.10)") i-1, S(i)
   enddo
   
   close(unit=10)
   call system_clock(toc)
   print*,"Time: ", (toc-tic)/1000.0
end program ring_spectrum

