! Copyright (C) 2008 Intel Corporation. All Rights Reserved. 
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

PROGRAM fmain
IMPLICIT NONE

! This is an example of a Fortran main program calling
! a C routine. It uses the C Interoperability features
! of Fortran 2003

! Declare the interface for the C routine we'll call
!
INTERFACE
    ! The BIND(C) tells the compiler that this is an "interoperable"
    ! procedure.  The compiler adjusts the naming conventions as
    ! appropriate for the companion C processor.
    SUBROUTINE c_routine (int_arg, str_in, str_out) BIND(C)
    USE,INTRINSIC :: ISO_C_BINDING  ! Declares C kinds

    ! First argument is a C "int", passed by value
    INTEGER(C_INT), VALUE,INTENT(IN) :: int_arg
    ! Second and third arguments are C "char *", represented
    ! in Fortran by an array of single characters of kind C_CHAR.
    ! Note that the language allows passing a regular CHARACTER
    ! variable to such an argument.
    CHARACTER(KIND=C_CHAR),DIMENSION(*) :: str_in,str_out
    END SUBROUTINE c_routine
END INTERFACE

CHARACTER(80) OUTPUT_TEXT
INTEGER IN_ARG, OUTPUT_LEN
CHARACTER(80) INPUT_TEXT

INPUT_TEXT = "Testing..."C ! C suffix adds a null terminator
IN_ARG = 123

! Call c_routine. It will return text in OUTPUT_TEXT
!
CALL c_routine (in_arg, input_text, output_text)

! Find the length of the output text, looking
! for the trailing blank
!
OUTPUT_LEN = INDEX(OUTPUT_TEXT," ")
IF (OUTPUT_LEN == 0) OUTPUT_LEN = 80

! Write the string to the console
!
WRITE (*,*) OUTPUT_TEXT(1:OUTPUT_LEN)

END