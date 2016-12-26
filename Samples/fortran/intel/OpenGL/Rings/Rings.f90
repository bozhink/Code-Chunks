! Part of the Intel(R) Visual Fortran samples
!
! Example demonstrating animation of colored rings. 
!
! USAGE:
!
!   animateGL [-sb] [-ci] [-h]
!
!   -sb : Use single buffering (double buffer default)
!   -ci : Use indexed color palette (default is to use all colors)
!   -h  : Display usage information
!
!   While running, press the space bar to generate a new set of rings, press q to quit.
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

! Entry point for Rings
function WinMain (hCurrentInst, hPreviousInst, lpszCmdLine, nCmdShow)
!DEC$ ATTRIBUTES STDCALL,DECORATE,ALIAS:"WinMain" :: WinMain
use IFWINA ! Alternate version of ifwin that renames MSFWIN$ routines that conflict with QuickWin
use IFOPNGL
use GLUtilsMod
use RingsMod

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
logical :: run = .TRUE. ! Keep running while true

WinMain = 0

! Look at command line arguments
call get_command (CmdLine)
if (index(CmdLine, '-sb') > 0) then
  buffer = 0
end if
if (index(CmdLine, '-ci') > 0) then
  color = PFD_TYPE_COLORINDEX
  rgbmode = .false.
end if
if (index(CmdLine, '-h') > 0) then
  ret = MessageBox(NULL, "rings [-ci] [-sb]\n &
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
hWnd = CreateOpenGLWindow("Rings - press spacebar to reset, q to exit", 0, 0, 512, 256, color, buffer, WindowProc)
if (hwnd == NULL) return

! Set up the OpenGL context
!
hDC = GetDC(hWnd)
hRC = fwglCreateContext(hDC)
hret = fwglMakeCurrent(hDC, hRC)
bret = ShowWindow(hWND, SW_SHOW)
bret = UpdateWindow(hWnd)
call Init

! Message loop.  We use PeekMessage so we can do the animation while the window is
! not asking to do something else. 
!
mainloop: do while (run)
  if (PeekMessage(msg, hWnd, 0, 0, PM_REMOVE) /= 0) then
    if (msg%message == WM_QUIT) exit mainloop
      bret = TranslateMessage(msg)
      bret = DispatchMessage(msg)
  end if
call DrawScene
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
    call DrawScene
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
        call ReInit
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
  
subroutine DrawScene()

! DrawScene is called in the idle loop.  It gradually moves and 
! rotates the rings towards the desired end position and orientation.
! The offset for each iteration is randomized in Init.
!

   integer(SINT) :: i, j
   integer(BOOL) :: bret

   do i = 1, RINGS
      if (iters(i) > 0) then
         do j = 1, 3
            offsets(i,j) = Clamp(iters(i), offsets(i,j))
         end do
         angs(i) = Clamp(iters(i), angs(i))
         iters(i) = iters(i)-1
      end if
   end do

   call fglPushMatrix()

   call fglClear(IOR(GL_COLOR_BUFFER_BIT,GL_DEPTH_BUFFER_BIT))
   call fgluLookAt(DBLE(0), DBLE(0), DBLE(10), DBLE(0), DBLE(0), DBLE(0), DBLE(0), DBLE(1), DBLE(0))

   do i = 1, RINGS
      if (rgbmode) then
         call fglColor3ubv(LOC(rgb_colors(i,1)))
      else
         call fglIndexi(mapped_colors(i))
      end if
      call fglPushMatrix()
      call fglTranslatef(dests(i,1)+offsets(i,1), dests(i,2)+offsets(i,2),   &
               dests(i,3)+offsets(i,3))
      call fglRotatef(angs(i), rotAxis(i,1), rotAxis(i,2), rotAxis(i,3))
      call fglCallList(theTorus)
      call fglPopMatrix()
   end do

   call fglPopMatrix()

   call fglFlush()

   bret = SwapBuffers(hDC)	! Ignored if single-buffered
   
end subroutine DrawScene



end function WinMain

 