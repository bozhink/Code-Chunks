!+ Test driver program for subroutine Limes 
PROGRAM Test 

  IMPLICIT NONE 

  INTEGER,   PARAMETER :: pr = SELECTED_REAL_KIND (30,150) 
  REAL (pr), PARAMETER :: zero = 0.0, one = 1.0 
  REAL (pr)            :: S(0:137), C(0:137), x, xi, arg 
  REAL (pr)            :: rLimes 
  REAL (pr)            :: err 
  INTEGER              :: N 
  INTEGER              :: i 
  INTEGER              :: i_Pade 
  INTEGER              :: k_Pade 
  INTEGER              :: is 

  WRITE (*, '(15X,A)') '+---------------------------------------------+' 
  WRITE (*, '(15X,A)') '|   Test driver program for subroutine Limes  |' 
  WRITE (*, '(15X,A)') '|               Calculate Ln[x]               |' 
  WRITE (*, '(15X,A)') '+---------------------------------------------+' 
  WRITE (*, '(A)') ' ' 

  WRITE (*, '(A)', ADVANCE='NO') ' Enter argument of Ln[x],         x = ' 
  READ  (*,*) arg 

  WRITE (*, '(A)', ADVANCE='NO') ' Enter the number of known terms, N = ' 
  READ  (*,*) N 

  IF (N > 137) N = 137   ! ... we like this number ;-) 

  x  = arg - one 
  xi = one 
  is = 1 

! Initialize S to store the first N+1 known partial sums 
! S0, S1, S2,..., Sn-1, Sn 
! 
! Sn = x + x^2/2 - x^3/3! + x^4/4! - ... + (-1)^n x^n/n! 
! 
  S(0) = zero     ! *** lower bound of the subscript should start at 0 ! *** 
  DO i=1,N 
    xi   = xi*x 
    C(i) = xi/i 
    S(i) = S(i-1) + is * C(i) 
    is   = -is 
  END DO 

  WRITE (*, '(A)') ' ' 
  WRITE (*, '(A)') ' ===========================================& 
                    &===========================================' 
  WRITE (*, '(14X,A8,5(X,A12))') 'S(0)', 'S(1)', 'S(2)', 'S(3)',& 
                                 'S(4)', 'S(5)' 
  WRITE (*, '(A)') ' -------------------------------------------& 
                    &-------------------------------------------' 
  WRITE (*, '(A)', ADVANCE='NO') ' before call: ' 
  WRITE (*, '(F8.4,5(X,f12.4))')        S(0:5) 

  CALL Limes &   ! call subroutine Limes to calculate Ln[x] 
 (      N,   &   ! in 
   S(0:N),   &   ! inout 
   rLimes,   &   ! out 
   i_Pade,   &   ! out 
   k_Pade,   &   ! out 
      err  )     ! out

! Formated output of results 
! 
  WRITE (*, '(A)', ADVANCE='NO') '  after call: ' 
  WRITE (*, '(F8.4,5(X,f12.4))')        S(0:5) 
  WRITE (*, '(A)') ' ===========================================& 
                    &===========================================' 
  WRITE (*,*) ' '  

  WRITE (*, '(X,A,X,F9.3,X,A,ES12.5)') 'Ln[', arg, '] = ', LOG (arg) 
  WRITE (*, '(X,A,I3,A,I3,A,ES12.5)') 'rLimes[', i_Pade, ',', k_Pade, & 
                                     '] = ', rLimes 
  WRITE (*, '(13X, 1A, ES12.5)')   'err = ', err 
  WRITE (*, '(6X,  1A, ES12.5)') & 
                            'true error = ', ABS ( rLimes - LOG (one + x)) 

!----------------------------------------------------------------------------- 
  CONTAINS 
!----------------------------------------------------------------------------- 
!+ Finds the limit of a series 
SUBROUTINE Limes & 
 (      N,       &   ! in 
        S,       &   ! inout 
   rLimes,       &   ! out 
   i_Pade,       &   ! out 
   k_Pade,       &   ! out 
      err  )         ! out 

! Description: 
!   Finds the limit of a series in the case where only 
!   the first N+1 terms are known. 
! 
! Method: 
!   The subroutine operates by applying the epsilon-algorithm 
!   to the sequence of partial sums of a seris supplied on input. 
!   For desciption of the algorithm, please see: 
! 
!   [1] T. Mishonov and E. Penev, Int. J. Mod. Phys. B 14, 3831 (2000) 
! 
! Owners: Todor Mishonov & Evgeni Penev 
! 
! History: 
! Version   Date         Comment 
! =======   ====         ======= 
! 1.0       01/04/2000   Original code. T. Mishonov & E. Penev 
! 
! Code Description: 
!   Language:           Fortran 90. 
!   Software Standards: "European Standards for Writing and 
!                        Documenting Exchangeable Fortran 90 Code". 
! 
! Declarations: 
IMPLICIT NONE 

!* Subroutine arguments 
!  Scalar arguments with intent(in): 
  INTEGER,   INTENT (IN)    :: N       ! width of the epsilon-table 

!  Array arguments with intent(inout): 
  REAL (pr), INTENT (INOUT) :: S(0:)   ! sequential row of the epsilon-table 

!  Scalar arguments with intent(out) 
  REAL (pr), INTENT (OUT)   :: rLimes  ! value of the series limes 
  INTEGER,   INTENT (OUT)   :: i_Pade  ! power of the numerator 
  INTEGER,   INTENT (OUT)   :: k_Pade  ! power of the denominator 
  REAL (pr), INTENT (OUT)   :: err     ! empirical error 

!* End of Subroutine arguments 

!  Local parameters                    ! these two need no description ;-) 
  REAL (pr),    PARAMETER   :: zero = 0.0 
  REAL (pr),    PARAMETER   :: one  = 1.0 

!  Local scalars 
  REAL (pr)                 :: A_max   ! maximum element of A 
  INTEGER                   :: i       ! index variable for columns 
  INTEGER                   :: k       ! index variable for rows 

!  Local arrays 
  REAL (pr)                 :: A(0:N)  ! auxiliary row of the epsilon-table 

!- End of header -------------------------------------------------------------- 

!  Parse input: the algorithm cannot employ more elements than supplied on 
!               input, i.e. N <= size(S) 
! 
  IF ( N > SIZE (S(:)) ) THEN 
    WRITE (*, '(A)') '*** Illegal input to Limes: N > size(S)' 
    STOP 1 
  END IF 

!  Algorithm not applicable for N < 2 
! 
  IF ( N < 2 ) THEN 
    WRITE (*, '(A)') '*** Illegal input to Limes: N < 2' 
    STOP 2 
  END IF 

!----------------------------------------------------------------------------- 
!  I. Initialize with natural assignments 
!----------------------------------------------------------------------------- 
  rLimes = S(N)                    ! the N-th partial sum 
  err    = ABS ( S(N) - S(N-1) )   ! error -> |S(N) - S(N-1)| 
  i_Pade = N                       ! Pade approximant [N/0] 
  k_Pade = 0                       ! 
  A(:)   = zero                    ! auxiliary row initially set to zero 
  A_max  = zero                    ! max. element set to zero 
  k      = 1                       ! algorithm starts from the first row 

!----------------------------------------------------------------------------- 
! II. Main loop: fill in the epsilon table, check for convergence ... 
!     (provision against devision by zero employs pseudo-inverse numbers) 
!----------------------------------------------------------------------------- 
  DO 
    IF ( N - 2 * k + 1 < 0 ) EXIT 

! Update the auxiliary row A(i) of the epsilon-table 
! by applying the "cross rule".  
! 
    DO i=0, N - 2 * k + 1 
      IF ( S(i+1) /= S(i) ) THEN 
        A(i) = A(i+1) + one/(S(i+1) - S(i)) 
      ELSE 
        A(i) = A(i+1) 
      END IF 
    END DO 
    IF ( N - 2 * k < 0 ) EXIT 

!  Update the sequential row S(i) of the epsilon-table 
!  by applying the "cross rule". 
! 
    DO i=0, N - 2 * k 
      IF ( A(i+1) /= A(i) ) THEN 
        S(i) = S(i+1) + one/(A(i+1) - A(i)) 
      ELSE 
        S(i) = S(i+1) 
      END IF 

!  Check for convergence, based on A_max; see Ref. [1] 
! 
      IF ( ABS ( A(i) ) > A_max ) THEN 
        A_max  = ABS ( A(i) ) 
        rLimes = S(i) 
        k_Pade = k 
        i_Pade = i + k_Pade 
        err    = one/A_max 
        IF ( S(i+1) == S(i) ) RETURN 
      END IF 
    END DO 
    k = k + 1      ! increment row index 
  END DO 

  END SUBROUTINE Limes
END PROGRAM Test

