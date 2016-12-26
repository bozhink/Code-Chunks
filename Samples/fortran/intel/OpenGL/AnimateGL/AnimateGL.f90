! Part of the Intel(R) Visual Fortran samples
!
! Example demonstrating animation (rotation) of a color-shaded triangle.  Also shows use of
! Windows message handling, including keypress recognition
!
! USAGE:
!
!   animateGL [-sb] [-ci] [-h]
!
!   -sb : Use single buffering (double buffer default)
!   -ci : Use indexed color palette (default is to use all colors)
!   -h  : Display usage information
!
!   While running, press the space bar to toggle animation on and off, press q to quit.
!
!   By using -sb, you can see the advantage of double-buffering as the single-buffered display
!   is sometimes streaky.  -ci uses at most 256 colors rather than the full color depth
!             
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
!

! Entry point for Animate
function WinMain (hCurrentInst, hPreviousInst, lpszCmdLine, nCmdShow)
!DEC$ ATTRIBUTES STDCALL,DECORATE,ALIAS:"WinMain" :: WinMain
use IFWINA ! Alternate version of ifwin that renames MSFWIN$ routines that conflict with QuickWin
use IFOPNGL
use GLUtilsMod

implicit none

integer(SINT) :: WinMain
integer(HANDLE), intent(IN) :: hCurrentInst, hPreviousInst
integer(LPCSTR), intent(IN) :: lpszCmdLine
integer(SINT), intent(IN) :: nCmdShow

! Locals

integer(HANDLE) :: hDC  ! Device Context
integer(HANDLE) :: hRC  ! OpenGL Context
integer(HANDLE) :: hWnd ! Window
type(T_MSG) :: msg      ! Message
integer(DWORD) :: buffer  = PFD_DOUBLEBUFFER  ! Buffering type
integer(BYTE) :: color = PFD_TYPE_RGBA  ! Color type
character(100):: CmdLine
integer(SINT) :: ret
integer(HANDLE) :: hret
integer(BOOL) :: bret

! Variables visible to contained procedures
logical :: animate = .TRUE.  ! Rotate triangle while true
logical :: run = .TRUE. ! Keep running while true

WinMain = 0

! Look at command line arguments
call get_command (CmdLine)
if (index(CmdLine, '-sb') > 0) then
  buffer = 0
end if
if (index(CmdLine, '-ci') > 0) then
  color = PFD_TYPE_COLORINDEX
end if
if (index(CmdLine, '-h') > 0) then
  ret = MessageBox(NULL, "AnimateGL [-ci] [-sb]\n &
                         &  -sb  single buffered\n &
                         &  -ci  color index\n"C,"Usage Help"C,MB_ICONINFORMATION)
  return
end if

! In the past, we would use the GLAUX routines to simplify creation of the window
! and handle common tasks, but Microsoft removed glaux.lib in Visual Studio 2008,
! so we have to do it the "hard way".  CreateOpenGLWindow does most of the "grunt work"
! of opening the window, but we still have to provide a WindowProc and a message loop
!
! See comments in CreateOpenGLWindow (GLUtilsMod.f90) for more details
!
hWnd = CreateOpenGLWindow("AnimateGL", 0, 0, 256, 256, color, buffer, WindowProc)
if (hwnd == NULL) return

! Set up the OpenGL context
!
hDC = GetDC(hWnd)
hRC = fwglCreateContext(hDC)
hret = fwglMakeCurrent(hDC, hRC)
bret = ShowWindow(hWND, SW_SHOW)
bret = UpdateWindow(hWnd)

! Message loop.  We use PeekMessage so we can do the animation while the window is
! not asking to do something else. 
!
mainloop: do while (run)
  if (PeekMessage(msg, hWnd, 0, 0, PM_REMOVE) /= 0) then
    if (msg%message == WM_QUIT) exit mainloop
      bret = TranslateMessage(msg)
      bret = DispatchMessage(msg)
  end if
call display
call sleep(10) ! sleep for 10ms
end do mainloop

! Quitting - close down

hret = fwglMakeCurrent(NULL,NULL)
ret = ReleaseDC(hDC, hWnd)
hret = fwglDeleteContext(hRC)
bret = DestroyWindow(hWnd)
if (hPalette /= NULL) bret = DeleteObject(hPalette)

return

contains

  ! WindowProc that is called by Windows to handle messages for our OpenGL Window
  !
  ! The interface to this is standardized and it must use the STDCALL calling mechanism
  ! on IA-32 architecture systems. (On other platforms, the STDCALL attribute serves to
  ! change the argument passing default to be by-value.)
  !
  integer(LONG) function WindowProc (hWnd, uMsg, wParam, lParam)
  !DEC$ ATTRIBUTES STDCALL :: WindowProc
  integer(HANDLE) :: hWnd    ! Window handle
  integer(UINT) :: uMsg      ! Message
  integer(fWPARAM) :: wParam ! Message parameter
  integer(fLPARAM) :: lParam ! Message parameter
  
  ! Locals
  type(T_PAINTSTRUCT) :: ps
  integer(HANDLE) :: hret
  integer(BOOL) :: bret
  
  WindowProc = FALSE
  
  ! Please refer to MSDN or other Win32 programming documentation for an explanation
  ! of the message types
  select case (uMsg)
  
  case (WM_PAINT)
    call display
    hret = BeginPaint(hWnd, ps)
    hret = EndPaint(hWnd, ps)
    return
    
  case (WM_SIZE)
    call fglViewport (0, 0, int(ibits(lParam,0,16),UINT), int(ibits(lParam,16,16),UINT))
    bret = PostMessage(hWnd, WM_PAINT, 0, 0)
    return 
    
  case (WM_CHAR)
    select case (wParam)
    
      case (ichar('q')) ! q for quit
      run = .false.
      call PostQuitMessage(0)
      return
      case (ichar(' ')) ! Blank
        animate = .NOT. animate
      return
      case default ! Anything else
      return
      end select
    
  case (WM_PALETTECHANGED)
    if (hWnd == ZEXT(wParam,HANDLE)) then
      bret = UnrealizeObject(hPalette) ! hPalette is from GLUtilsMod
      bret = SelectPalette(hDC, hPalette, FALSE)
      bret = RealizePalette(hDC)
      WindowProc = TRUE
      return
    end if
    return 
    
  case (WM_QUERYNEWPALETTE)
    if (hPalette /= NULL) then
      bret = UnrealizeObject(hPalette) ! hPalette is from GLUtilsMod
      bret = SelectPalette(hDC, hPalette, FALSE)
      bret = RealizePalette(hDC)
      WindowProc = TRUE
      return
    end if
    return
        
  case (WM_CLOSE)
    run = .false.
    call PostQuitMessage(0)
    return
    
  end select
    
  ! Not ours to handle  
  WindowProc = DefWindowProc( hWnd, uMsg, wParam, lParam )
  
  end function WindowProc
  
  subroutine display
  
  integer(BOOL) :: bret
  
  ! rotate a triangle 
  call fglClear(GL_COLOR_BUFFER_BIT);
  if (animate) &
    call fglRotatef(1.0, 0.0, 0.0, 1.0)
  call fglBegin(GL_TRIANGLES)
  call fglIndexi(1)
  call fglColor3f(1.0, 0.0, 0.0)
  call fglVertex2i(0,  1)
  call fglIndexi(2)
  call fglColor3f(0.0, 1.0, 0.0)
  call fglVertex2i(-1, -1)
  call fglIndexi(3)
  call fglColor3f(0.0, 0.0, 1.0)
  call fglVertex2i(1, -1)
  call fglEnd
  call fglFlush
  bret = SwapBuffers(hDC)	!no-op if singlebuffered
  end subroutine display

end function WinMain

 