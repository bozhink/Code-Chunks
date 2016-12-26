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

! This module contains the data that is shared between the parent and child process. It is built
! into a DLL that is then linked into the application.
!
! In order for the data to be read-write shared, the following must be done:
!
! 1. The variables must be initialized to a non-zero value so that they are placed
!    in the .data image section
!
! 2. The linker command line options are modified to add: /section:.data,RWS
!    This tells the linker to make the .data section of the DLL read-write shared.  If this
!    isn't done, then each process will have its own copy of the data.
!
module shared_globals
implicit none

real :: shared_variable = 999.0  ! Must initialize to non-zero value
                                 ! in order to be placed in .data section
!dec$ attributes dllexport :: shared_variable
logical :: not_dead_yet = .TRUE. ! Used to detect that the other process is alive
!dec$ attributes dllexport :: not_dead_yet

end module shared_globals 