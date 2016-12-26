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

! MemoryStatus.f90
!
!  Demonstrates use of the GlobalMemoryStatusEx Win32 API, as well as using a generic function
!  gv to accomodate the platform-dependent type of the status components
!
!****************************************************************************
program MemoryStatus
use kernel32
use GetValueMod ! Defines generic function gv
implicit none

type (T_MEMORYSTATUSEX) :: stat
integer(BOOL) :: ret

! Set the length field in structure stat

stat%dwlength = sizeof(stat)

! Get the statistics and then display the results
ret = GlobalMemoryStatusEx (stat)
if (ret == 0) then
  print *, "GlobalMemoryStatusEx call failed, error code = ", GetLastError()
  stop
  end if

write (*,'(I0,A)') stat%dwMemoryLoad, '% of memory is in use'
write (*,'(A,A)') trim(gv(stat%ullTotalPhys)), ' total physical memory'
write (*,'(A,A)') trim(gv(stat%ullAvailPhys)), ' available physical memory'
write (*,'(A,A)') trim(gv(stat%ullTotalPageFile)), ' total pageable memory'
write (*,'(A,A)') trim(gv(stat%ullAvailPageFile)), ' available pageable memory'
write (*,'(A,A)') trim(gv(stat%ullTotalVirtual )), ' total virtual memory'
write (*,'(A,A)') trim(gv(stat%ullAvailVirtual  )), ' available virtual memory'

end program MemoryStatus