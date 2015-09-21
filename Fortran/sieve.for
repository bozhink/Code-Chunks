* This program computes the prime numbers between 1 and 10 000
* using the Sieve of Eratosthenes algorithm
*
* Compilation OW for DOS
*C>wfl /l=dos sieve.for
      IMPLICIT NONE
      INTEGER UPBOUND
      PARAMETER (UPBOUND=10 000)
      INTEGER I, K, PRIMES
      LOGICAL*1 NUMBERS(2:UPBOUND)
      CHARACTER*11 FORM
      PARAMETER (FORM='(A,I5,A,I5)')
      DO I=2,UPBOUND
        NUMBERS(I)=.TRUE.
      ENDDO
      PRIMES=0
      DO I=2,UPBOUND
        IF (NUMBERS(I)) THEN
          PRIMES=PRIMES+1
          DO K=i+i, UPBOUND, I
            NUMBERS(K)=.FALSE.
          ENDDO
        ENDIF
      ENDDO
      PRINT FORM, 'The Number of Primes between 1 and ', UPBOUND,
     1            ' are: ', PRIMES
      END
