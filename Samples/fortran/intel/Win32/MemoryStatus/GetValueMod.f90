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

!  GetValueMod.f90
!
!  Part of the MemoryStatus sample.
!
!****************************************************************************
module GetValueMod

! Contains a routine gv that accepts a value and returns a string
! with a text representation of that value in storage units

private
public :: gv

! The fields of type T_MEMORYSTATUSEX may be of type integer(DWORDLONG)
! or type T_LARGE_INTEGERX, which consists of two integer(4) components.  
! To account for this, create a generic for our "get value" routine gv 
! to handle either type.

interface gv
  module procedure gv_dww
  module procedure gv_lix
end interface gv
contains

function gv_dww (val)
use ifwinty, only: DWORDLONG
character(30) gv_dww
integer(DWORDLONG), intent(in) :: val
integer(8), parameter :: DIV = 1024
integer(8) :: lval

lval = zext(val,8)
if (val == -1) then
  gv_dww = '(unrepresentable)'
else if (lval < 1024) then
  write (gv_dww, 101) lval, ' bytes'
101 format (I0,A)
else if (lval < (DIV*DIV)) then
  write (gv_dww,101) lval/DIV, 'KB'
else if (lval < (DIV*DIV*DIV)) then
  write (gv_dww,101) lval/(DIV*DIV), 'MB'
else 
  write (gv_dww,102) REAL(lval/(DIV*DIV))/REAL(DIV), 'GB'
102 format (F20.2,A)
  gv_dww = adjustl(gv_dww)
end if
end function gv_dww

function gv_lix (val)
use ifwinty, only: T_LARGE_INTEGERX, DWORDLONG
character(30) gv_lix
type(T_LARGE_INTEGERX), intent(IN) :: val
! Convert val to DWORDLONG and call gv_dww
gv_lix = gv_dww(transfer(val, 0_DWORDLONG))
end function gv_lix

end module GetValueMod