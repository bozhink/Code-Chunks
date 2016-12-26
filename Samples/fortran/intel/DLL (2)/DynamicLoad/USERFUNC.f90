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

! Example user function called by the DynamicLoad program
!
! This must be a function taking one default integer argument
! and returning a default integer result.  The global name of the
! routine must be 'USERFUNC' and it must be DLLEXPORTed
!
! Note that this project has a custom build step to copy the DLL
! to the DynamicLoad project folder
!

function USERFUNC (arg)
implicit none

integer USERFUNC
! The following directive exports the routine and sets the global name
!DEC$ ATTRIBUTES DLLEXPORT, ALIAS:"USERFUNC" :: USERFUNC
integer, intent(IN) :: arg

write (*,*) "In USERFUNC with argument ", arg
USERFUNC = 3 * arg
return
end function USERFUNC