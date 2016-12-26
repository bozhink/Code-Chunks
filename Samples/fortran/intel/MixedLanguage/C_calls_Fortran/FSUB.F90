! Copyright (C) 2007 Intel Corporation. All Rights Reserved. 
!
! The source code contained or described herein and all documents related to the source code 
! ("Material") are owned by Intel Corporation or its suppliers or licensors. Title to the 
! Material remains with Intel Corporation or its suppliers and licensors.  The Material is 
! protected by worldwide copyright laws and treaty provisions. No part of the Material may be 
! used, copied, reproduced, modified, published, uploaded, posted, transmitted, distributed, 
! or disclosed in any way except as expressly provided in the license provided with the 
! Materials.  No license under any patent, copyright, trade secret or other intellectual 
! property right is granted to or conferred upon you by disclosure or delivery of the 
! Materials, either expressly, by implication, inducement, estoppel or otherwise, except as 
! expressly provided in the license provided with the Materials.

! Fortran subroutine which is called from a C main program.
! The source is structured so that it can be built either
! as a DLL or just mixed in with the C source directly.
!
SUBROUTINE FSUB (INT_ARG, STR_IN, STR_OUT)
IMPLICIT NONE

! If we're building a DLL, specify that DLL_ROUT is 
! exported to a DLL.  Key this off of the preprocessor
! symbol _DLL which is automatically defined if we're
! building a DLL.

!DEC$ IF DEFINED (_DLL)
!DEC$ ATTRIBUTES DLLEXPORT :: FSUB
!DEC$ END IF

INTEGER, INTENT(IN) :: INT_ARG
CHARACTER(*), INTENT(IN) :: STR_IN
CHARACTER(*), INTENT(OUT) :: STR_OUT

! This routine converts INT_ARG to a decimal string.
! appends the string value to STR_IN and stores it
! in STR_OUT. A trailing NUL is added to keep C
! happy.
!
! Note that there are implicit length arguments at the
! end of the argument list - see the CMAIN
! source for more details.

CHARACTER*5 INT_STR

WRITE (INT_STR,'(I5.5)')INT_ARG

STR_OUT = STR_IN // INT_STR // CHAR(0)

RETURN
END 
