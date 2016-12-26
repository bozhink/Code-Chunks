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

module sharedata
use ifwinty, only: HANDLE
    real(8):: g_vAngle = 25.0_8
    integer g_axisOn
    integer:: g_rSpeed = 3
    real:: g_cSize = 1.48
    real:: g_vSpeed = 10.0
    real:: g_vStep = 10.0

    integer(HANDLE) :: g_hPalette=0
    real g_identity(4,4)
    type tCube
	real    ort(4,4)
    end type
    type(tCube) g_cube(3,3,3)

    type tSlot
	integer    cId(3)
    end type
    type(tSlot) g_slot(3,3,3)

    real(4) g_sin_tab(0:90)
    real(4) g_cos_tab(0:90)
    integer G_ROTATE_X
    integer G_ROTATE_Y
    integer G_ROTATE_Z
    integer G_ROTATE_LEV
    integer G_ROTATE_CW
    parameter (G_ROTATE_X =   #00000210)
    parameter (G_ROTATE_Y =   #00000220)
    parameter (G_ROTATE_Z =   #00000240)
    parameter (G_ROTATE_LEV = #00000003)
    parameter (G_ROTATE_CW =  #00000004)
    type stack
        integer, pointer, dimension(:):: buf
        integer size
        integer top
        integer count
    end type
    type(stack) cmdStack
	logical is_reset
end
