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

!  Platform.f90
!
!  Demonstrates use of the Win32 API to determine which platform and version
!  of Windows we are on.
!
!****************************************************************************

integer*4 function WinMain( hInstance, hPrevInstance, lpszCmdLine, nCmdShow )
!DEC$ ATTRIBUTES STDCALL, DECORATE, ALIAS : 'WinMain' :: WinMain

use kernel32
use user32

implicit none
    
integer(HANDLE) hInstance
integer(HANDLE) hPrevInstance
integer(LPVOID) lpszCmdLine
integer(DWORD) nCmdShow

type(T_OSVERSIONINFO) :: ovi
type(T_SYSTEM_INFO) :: sysi
integer(BOOL) :: bret
integer(DWORD) :: ret
integer(DWORD) :: lasterr
character(1000) :: message
integer(HANDLE) :: hwnd
integer ilen
character(50) unknownver
character(50) nprocessors
character(2), parameter :: CRLF = CHAR(13)//CHAR(10)

! The following value isn't defined yet in IFWINTY, so define our own
integer, parameter :: PROCESSOR_ARCHITECTURE_IA32_ON_WIN64_ = 10

hwnd = GetForegroundWindow()
WinMain = 0

! Set size of OSVERSION structure and get OS Version info
ovi%dwOSVersionInfoSize = sizeof(ovi)
bret = GetVersionEx(ovi)
if (bret == 0) then
  lasterr = GetLastError()
  write (message,'(A,I0,A)') "GetVersion call failed with status ", lasterr, CHAR(0)
  ret = MessageBox (hwnd, message, "Platform Error"C, IOR(MB_OK,MB_ICONEXCLAMATION))
  return
  end if
! In case of error,write out major and minor version
write (unknownver, '(A,I0,A,I0)') ' Unknown ',ovi%dwMajorVersion,'-',ovi%dwMinorVersion

! Get system info
call GetSystemInfo (sysi)

! Now put together the message

message = 'Platform information:' // CRLF

! Processor type

message = trim(message) // '  Processor Architecture:'
select case (sysi%wProcessorArchitecture)

  case(PROCESSOR_ARCHITECTURE_INTEL)
    message = trim(message) // ' IA-32' // CRLF
  case(PROCESSOR_ARCHITECTURE_IA64)
    message = trim(message) // ' IA-64 [Intel(R) Itanium(R)]' // CRLF
  case(PROCESSOR_ARCHITECTURE_AMD64)
    message = trim(message) // ' Intel(R) 64 or AMD64*' // CRLF
  case(PROCESSOR_ARCHITECTURE_IA32_ON_WIN64_)
    message = trim(message) // ' IA-32 running under WOW64' // CRLF
  case default
    message = trim(message) // 'Unknown' // CRLF
  end select

! Number of processors (can't distinguish among physical CPUs,
! cores or logical processors)

write (nprocessors, '(A, I0)') '  Number of logical processors: ', sysi%dwNumberOfProcessors
message = trim(message) // trim(nprocessors) // CRLF

! Windows version

message = trim(message) // '  Windows* Version:'
select case (ovi%dwMajorVersion)
  case (4) ! Windows NT 4.0, Windows Me, Windows 98, or Windows 95
    select case (ovi%dwMinorVersion)
      case (0) ! Windows NT 4.0, or Windows 95.
      if (ovi%dwPlatformID == VER_PLATFORM_WIN32_NT) then
        message = trim(message) // ' Windows NT 4.0' 
      else
        message = trim(message) // ' Windows 95' 
        end if
      case (10)
        message = trim(message) // ' Windows 98' 
      case (90)
        message = trim(message) // ' Windows Me'
      case default
        message = trim(message) // unknownver
      end select
   case(5) ! Windows Server 2003 R2, Windows Server 2003, Windows XP, or Windows 2000.
     select case (ovi%dwMinorVersion)
       case(0)
         message = trim(message) // ' Windows 2000'
       case(1)
         message = trim(message) // ' Windows XP'
       case(2)
         message = trim(message) // ' Windows Server 2003'
       case default
         message = trim(message) // unknownver
       end select
    case(6)
      select case (ovi%dwMinorVersion)
        case (0)
          message = trim(message) // ' Windows Vista or Windows Server 2008'
        case (1)
          message = trim(message) // ' Windows 7'
        case default
          message = trim(message) // unknownver
        end select
    case default
      message = trim(message) // unknownver
    end select
    
! Is there service pack info?  If so, add it
ilen = index(ovi%szCSDVersion, char(0)) - 1
if (ilen > 0) message = trim(message) // ' (' // ovi%szCSDVersion(1:ilen) // ')'
    
! Display message
message = trim(message) //CHAR(0)
ret = MessageBox (hwnd, message, 'Platform'C, MB_OK)

end function WinMain