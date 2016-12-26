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

!  Platform.f90
!
!  Demonstrates use of the Win32 API to determine which platform and version
!  of Windows we are on.
!
!****************************************************************************

!  ProcessStatus.f90 
!
! Demonstrate use of some of the Process Status Win32 API (PSAPI) routines.
!
! Part of the Intel Visual Fortran samples
!
! The program lists all of the pagefiles on the system and then displays
! memory usage information for every process on the system
!

program ProcessStatus
use psapi
use kernel32
implicit none

integer(DWORD), dimension(1024) :: Processes
integer(DWORD) :: cbNeeded, cProcesses
integer(BOOL) :: ret
integer i

! Enumerate pagefiles
! The PageFileCallBackProc function will be called for each
! pagefile by EnumPageFiles
!
print *, "Pagefile information"
ret = EnumPageFiles (PageFileCallBackProc, 0)  ! Context not used

print *, ""

! Get list of process identifiers

ret = EnumProcesses (Processes, int(sizeof(Processes),DWORD), cbNeeded)
if (ret == 0) then
  print *, "EnumProcesses failed, status = ", GetLastError()
  stop
  end if
  
! Calculate how many process identifiers were returned

cProcesses = cbNeeded / sizeof(0_DWORD)

! Print the memory usage for each process

do i=1,cProcesses
  call PrintMemoryInfo (Processes(i))
  end do

contains

function PageFileCallBackProc (pContext, pPageFileInfo, lpFilename)
use psapi
integer(BOOL) :: PageFileCallBackProc
!DEC$ ATTRIBUTES DEFAULT,STDCALL :: PageFileCallBackProc
integer(LPVOID), intent(IN) :: pContext
type(T_ENUM_PAGE_FILE_INFORMATION), intent(IN) :: pPageFileInfo
!DEC$ ATTRIBUTES REFERENCE :: pPageFileInfo
character(MAX_PATH), intent(IN) :: lpFilename ! NUL terminated
!DEC$ ATTRIBUTES REFERENCE :: lpFilename

integer ilen

! Find length of pagefile name
ilen = index(lpFilename, CHAR(0))

! Display information about this pagefile
!
write (*, '(1X,A/(2X,A,1X,I0))') lpFileName(1:ilen), &
  'TotalSize:', pPageFileInfo%TotalSize, &
  'TotalInUse:', pPageFileInfo%TotalInUse, &
  'PeakUsage:', pPageFileInfo%PeakUsage

PageFileCallBackProc = TRUE
return
end function PageFileCallBackProc
  
  
subroutine PrintMemoryInfo (processID)
use psapi
use kernel32
implicit none

integer(DWORD), intent(IN) :: processID

integer(HANDLE) :: hProcess
type (T_PROCESS_MEMORY_COUNTERS) :: pmc
integer(BOOL) :: ret

! Print the process identifier

write (*,'(" Process ID: ", I0)') processID

! Print information about the memory usage of the process

hProcess = OpenProcess (IOR(PROCESS_QUERY_INFORMATION, PROCESS_VM_READ), &
    FALSE, processID)
if (hProcess == NULL) return  ! Will return null for the idle process
ret = GetProcessMemoryInfo (hProcess, pmc, int(sizeof(pmc),DWORD))
if (ret /= 0) &
  write (*, '(2X,A,1X,I0)') &
    "PageFaultCount:", pmc%PageFaultCount, &
    "PeakWorkingSetSize:", pmc%PeakWorkingSetSize, &
    "WorkingSetSize:", pmc%WorkingSetSize, &
    "QuotaPeakPagedPoolUsage:", pmc%QuotaPeakPagedPoolUsage, &
    "QuotaPeakNonPagedPoolUsage:", pmc%QuotaPeakNonPagedPoolUsage, &
    "QuotaNonPagedPoolUsage:", pmc%QuotaNonPagedPoolUsage, &
    "PagefileUsage:", pmc%PagefileUsage, &
    "PeakPagefileUsage:", pmc%PeakPagefileUsage
    
ret = CloseHandle (hprocess)
return

end subroutine PrintMemoryInfo

end program ProcessStatus