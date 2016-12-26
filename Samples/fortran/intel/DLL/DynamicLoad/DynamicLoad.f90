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

!  DynamicLoad.f90 
!
!  Example demonstrating the use of the Win32 APIs LoadLibrary and
!  GetProcAddress to dynamically load a DLL, look up a routine, and
!  call the routine
!
!  The program will load a DLL called 'USERDLL' and look for a routine
!  called USERFUNC.  This function must accept an integer argument and
!  return an integer result.  If the function is found, it is called
!  ten times with arguments 1-10, and the result displayed.  At the end,
!  the library is unloaded.
!
!  A sample DLL project USERDLL is also provided.  
!****************************************************************************

program DynamicLoad

use kernel32  ! Declares Win32 API routines
implicit none

! Declare the interface to function USERFUNC

interface
  function USERFUNC (arg)
  integer USERFUNC
  integer, intent(IN) :: arg
  end function USERFUNC
end interface

! Declare a pointer to the function.  This is an extension
! to the Fortran language.  In the future, a Fortran 2003
! procedure pointer might be useful here.  p_USERFUNC is
! automatically declared as an integer of the correct size
! to hold an address.
!
pointer (p_USERFUNC, USERFUNC)

integer(HANDLE) :: dll_handle
integer(BOOL) :: free_status
integer i, ret

! Load the DLL and get a "handle" to it.  Note that the DLL name must
! be a C string and that DLLs are looked for in the following locations:
! 1) Current directory
! 2) Directory containing this .EXE
! 3) Directories on PATH
! 4) Windows directory
! 5) Windows System directory
!
! We have constructed the DLL project so that it copies the DLL into the
! project directory, which is "current" when we run from within Visual Studio
!
write (*,*) "Loading library..."
dll_handle = LoadLibrary ("USERDLL.dll"C)
! Check for errors
if (dll_handle == NULL) then
  ! Failure
  call print_error ('loading DLL')
  stop
  end if

! Look up the routine address.  Note that this example requires that
! the function be named "USERFUNC" without any decoration such as a
! leading underscore.  This may require an ALIAS directive or similar
! in the DLL routine.
!
write (*,*) "Getting routine address..."
p_USERFUNC = GetProcAddress (dll_handle, "USERFUNC"C)
if (p_USERFUNC == NULL) then
  ! Failure
  call print_error ('looking up routine')
  stop
  end if
  
! Now call the function in a loop
!
do i=1,10
  write (*,*) "Calling USERFUNC with argument ", i
  ret = USERFUNC(i)
  write (*,*) "USERFUNC returned ", ret
  end do
  
! Unload the library.  This will be done automatically on program
! exit but it's good practice anyway
!
write(*,*) "Unloading library..."
free_status = FreeLibrary (dll_handle)
if (free_status == 0) call print_error ('unloading DLL')

! End of main program

contains

! Error processing routine.  Gets the system error and
! its corresponding string, prints a message, then stops
! execution
!
subroutine print_error (string)
use kernel32
implicit none

character(*), intent(IN) :: string

integer(DWORD) last_error
integer(DWORD) nTchars
character(200) message_buffer

! Get the actual system error code
!
last_error = GetLastError ()

! Get the string corresponding to this error
!
nTchars = FormatMessage (FORMAT_MESSAGE_FROM_SYSTEM, & ! dwflags 
  NULL, & ! lpsource - ignored
  last_error, & ! dwMessageId
  0, & ! dwLanguageId
  message_buffer, & ! lpBuffer
  len(message_buffer), & !nSize
  NULL) ! Arguments

if (nTchars == 0) then
  write (*,*) "Format message failed for status ", last_error, " while ", &
    string, ": eror status = ", GetLastError()
else
  write (*,*) "Error while ", string, ": ", message_buffer(1:nTchars)
  end if
  
stop

end subroutine print_error

end program DynamicLoad

