/*
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
*/

/* Main program written in C++ that calls a Fortran routine */
#include <stdio.h>
#include <string.h>

/* Declare the Fortran routine. 

   The "C" attribute prevents C++ name mangling  Remove it
   if the file type is .c
*/

#ifdef __cplusplus
extern "C" 
#endif

/* This source file can be used with the Fortran routine
   being in a DLL or directly in the project.  The 
   USEDLL project defines a USEDLL preprocessor symbol to
   indicate that a DLL is being used; the USELIB project 
   omits this.  If we're using the Fortran DLL, add the
   dllimport specification.
*/

#ifdef USEDLL
__declspec(dllimport)
#endif

/* In the following declaration of FSUB, note that there
   are two additional arguments defined.  By default,
   Fortran code expects CHARACTER arguments to be passed
   using two argument positions, an address and an integer
   length (passed by value).  When calling from 
   non-Fortran code, we need to explicitly pass the
   length arguments unless other arrangements have been 
   made for the Fortran code not to expect them (C routine
   attribute and REFERENCE argument attribute.) Intel
   Fortran, by default, places these lengths at the end of
   the argument list.

   The routine name must be in uppercase unless the Fortran code 
   includes an appropriate ALIAS attribute.
*/

void FSUB 
                     (int *INT_ARG,
                      char *STR_IN,
                      char *STR_OUT,
                      size_t STR_IN_LEN,
                      size_t STR_OUT_LEN);

void main (int argc, char *argv[])
{
char instring[40];
char outstring[40];
int intarg;

strcpy(instring,"Testing...");
intarg = 123;
/* Call Fortran routine - pass intarg by reference,
pass length of outstring explicitly */
FSUB(&intarg,instring,outstring,strlen(instring),sizeof(outstring));
printf("%s\n",outstring);
} 
