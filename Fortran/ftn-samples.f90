!--------------------------------------------------------------- 
! No arguments 
!--------------------------------------------------------------- 
SUBROUTINE SubSimple 
PRINT *,"Simple subroutine called" 
END SUBROUTINE 

!--------------------------------------------------------------- 
! Simple Integer and Real arguments 
!--------------------------------------------------------------- 
SUBROUTINE SubArguments(i,x) 
INTEGER(KIND=3) :: i 
REAL(KIND=1) :: x 
PRINT *,"SubArguments called with values:" 
PRINT *,"i = ",i 
PRINT *,"x = ",x 
END SUBROUTINE 

!--------------------------------------------------------------- 
! String arguments 
!--------------------------------------------------------------- 
SUBROUTINE SubString(s1,s2) 
CHARACTER(LEN=*) :: s1 
CHARACTER(LEN=*) :: s2 
PRINT *,"SubString called with two strings" 
PRINT *,s1,s2 
END SUBROUTINE