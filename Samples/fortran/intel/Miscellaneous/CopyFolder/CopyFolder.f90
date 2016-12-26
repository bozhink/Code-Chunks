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
!
!  CopyFolder.f90 
!
!  FUNCTIONS:
!  CopyFolder      - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: CopyFolder
!
!  PURPOSE:  Driver program for Copy_Folder routine that demonstrates using
!            Win32 APIs to recursively copy a file folder
!
!  Part of the Intel Visual Fortran samples
!
!****************************************************************************

    program CopyFolder

    use Copy_Folder_mod
    implicit none

    ! Variables
    integer ret

    ! Body of CopyFolder
    
    ret = Copy_Folder ('.\sourcefiles','.\destfiles')
    
    if (ret == 0) then
      write (*,*) "Copy succeeded"
    else
      write (*,*) "Copy failed with status ", ret
      end if

    end program CopyFolder

