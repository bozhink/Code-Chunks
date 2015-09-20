*$include winapi.fi
      implicit none
      integer*2 hInstance, hPrevInstance, nCmdShow
      integer*4 lpszCmdLine
*$noreference
      integer*2 dunction fwinmain( hInstance, hPrevInstance,
     &                             lpszCmdLine, nCmdShow)
*$reference
      
      include 'windows.fi'
*
* This program computes the prime numbers between 1 and 10 000
* using the Sieve of Eratosthenes algorithm.
*
* Compile & link: wfl -l=windows -win sieve.for
      integer upbound
      parameter(upbound=10 000)
      integer i, k, primes
      logical*1 numbers(2:upbound)
      character*11 form
      character*60 buffer
      parameter(form='(a,i5,a,i5)')
      do i=2, upbound
        numbers(i)=.true.
      enddo
      primes=0
      do i=2,upbound
        if (numbers(i)) then
          primes=primes+1
          do k=i+i, upbound, i
            numbers(k)=.false.
          enddo
        endif
      enddo
      write(buffer,form) 'The Number of Primes between 1 and',
     &   upbound, ' are: ',primes
      call MessageBox(0, buffer,
     &     'Sieve of Eratosthenes'c,
     &     MB_OK .OR. MB_TASKMODAL )
      end
