/*
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
*/

/* C routine called by Fortran main program
**
** Converts integer input argument to text, appends
** the text to string input argument and stores the
** result in the string output argument
*/

#include <stdio.h>

extern "C" void c_routine (
                        int int_arg,
                        char* input_text,
                        char* output_text
                        )

{
    sprintf(output_text,"%s%i ",input_text,int_arg);
}
