! Copyright (C) 2009 Intel Corporation. All Rights Reserved. 
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

module anginc
use ifwinty
implicit none


! anginc.f90 - header file for the AngleArc() demonstration program.


!/* Top dialog item IDs */
integer, parameter, public :: DID_X      =  101
integer, parameter, public :: DID_Y      =  102
integer, parameter, public :: DID_RADIUS =  103
integer, parameter, public :: DID_START  =  104
integer, parameter, public :: DID_SWEEP  =  105
integer, parameter, public :: DID_DRAW   =  200

integer, parameter, public :: MAXCHARS   =  32

!/* Misc. defines for size, color, and appearance of drawing. */
integer, parameter, public :: GRIDCOLOR     =  Z'01000006'
integer, parameter, public :: TICKSPACE     =  20
integer, parameter, public :: DIALOGHEIGHT  =  60

integer(HANDLE)   hInst
integer(HANDLE)   hwnddlg
integer(HANDLE)   hWndMain

end module anginc






