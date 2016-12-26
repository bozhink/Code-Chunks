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

! Example of Excel calling Intel Visual Fortran
! Excel code passes an integer and a character string to FortranCall
! The integer is doubled, converted to a string and returned in the second argument
! Excel calls always use the STDCALL mechanism
!
subroutine FortranCall (r1, num)
!DEC$ ATTRIBUTES DLLEXPORT, STDCALL, REFERENCE, ALIAS:"FortranCall" :: FortranCall
integer, intent(in) :: r1
character(10), intent(out) :: num
!DEC$ ATTRIBUTES REFERENCE :: num

num = ''
write (num,'(i0)') r1 * 2

return
end subroutine FortranCall