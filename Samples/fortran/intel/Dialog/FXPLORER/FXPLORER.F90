! Copyright (C) 2007-2008 Intel Corporation. All Rights Reserved. 
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

! This software FXPLORER.F90 is part of the Visual Fortran kit.
!
! This software is provided as an example that demonstrates a particular
! feature/function of the licensed product. The software is not intended to
! provide a complete solution to any application problem but rather is provided
! as a teaching mechanism.
! 
! Users may incorporate any part of this sample into their own source after 
! making appropriate changes to make it suitable for the intended application.
!
! This sample program demonstrates an SDI Fortran Windows application using
! the Visual Fortran Dialog Procedures.  It uses an Internet Explorer ActiveX
! control in the main window of the application. The Internet Explorer control
! is installed with Internet Explorer.  If Internet Explorer is not installed,
! this sample will not run. It is also required that the Intel Visual Fortran DLL
! IFDLG100.DLL be present in PATH and be registered.  This is done when the compiler
! is installed.
!
! There is a known issue that when you exit the application, an error message
! appears.  The cause is under investigation.
!
! The basic structure of this application was generated using the Fortran
! Windows Application project wizard.
!
!
!  FUNCTIONS:
!   WinMain()      - Entry point for the application;
!                    displays the main window; processes the message loop
!   MainWndProc()  - processes messages for the main window
!   CenterWindow() - centers one window over another
!   AboutDlgProc() - processes messages for the about box
!   CreateChildDialog() - Creates the child dialog with the Internet Explorer
!                    control
!   ResizeChildDialog() - Resizes the child dialog to fill the client area
!                    of the main window
!   FXSub()        - Dialog box callback for initialization and destroy
!   FXChangeSize() - Positions the controls in the dialog box
!   FXGo()         - Dialog box callback for the Go button
!   FXStop()       - Dialog box callback for the Stop button
!   FXBack()       - Dialog box callback for the Back button
!   DownloadInProgress() - Enables/disables a number of controls while
!                    a download is in progress
!   DWebBrowserEvents2_DownloadBegin() - "Download of a page started" 
!                    event handler
!   DWebBrowserEvents2_DownloadComplete() - "Download of page complete" 
!                    event handler
!   DWebBrowserEvents2_ProgressChange() - "Download progress is updated" 
!                    event handler
!   DWebBrowserEvents2_TitleChange() - "Title is changed" event handler
!   CopyCStr()     - Copies a null terminated C string to a F90 string
!   CopyFStr()     - Copies a F90 string to a null terminated C string
!

!****************************************************************************
!
!  FUNCTION: WinMain( hInstance, hPrevInstance, lpszCmdLine, nCmdShow )
!
!  PURPOSE:  Entry point for the application
!
!  COMMENTS: Displays the main window and processes the message loop
!
!****************************************************************************

integer function WinMain( hInstance, hPrevInstance, lpszCmdLine, nCmdShow )
!DEC$ ATTRIBUTES STDCALL, DECORATE, ALIAS : 'WinMain' :: WinMain

    use ifwin
    use ifcom
    use ifauto
    use fxplorerGlobals

    implicit none

    integer(HANDLE) hInstance
    integer(HANDLE) hPrevInstance
    integer(LPVOID) lpszCmdLine
    integer(UINT) nCmdShow


    ! Variables
    type (T_WNDCLASS)       wc
    type (T_MSG)            mesg
    integer(DWORD)          ret
    integer(BOOL)           lret
    integer(HANDLE)         haccel

    character(SIZEOFAPPNAME) lpszClassName
    character(SIZEOFAPPNAME) lpszIconName
    character(SIZEOFAPPNAME) lpszAppName
    character(SIZEOFAPPNAME) lpszMenuName
    character(SIZEOFAPPNAME) lpszAccelName

    ghInstance = hInstance
    ghModule = GetModuleHandle(NULL)
    ghwndFocus = NULL
    call COMINITIALIZE(ret)

    lpszClassName ="fxplorer"C
    lpszAppName ="Fortran Explorer"C
    lpszIconName ="fxplorer"C  
    lpszMenuName ="fxplorer"C
    lpszAccelName ="fxplorer"C

    !  If this is the first instance of the application, register the
    !  window class(es)
    if (hPrevInstance .eq. 0) then
        !  Main window
         wc%lpszClassName = LOC(lpszClassName)
         wc%lpfnWndProc = LOC(MainWndProc)
         wc%style = IOR(CS_VREDRAW , CS_HREDRAW)
         wc%hInstance = hInstance
         wc%hIcon = LoadIcon( hInstance, LOC(lpszIconName))
         wc%hCursor = LoadCursor( NULL, IDC_ARROW )
         wc%hbrBackground = ( COLOR_WINDOW+1 )
         wc%lpszMenuName = NULL
         wc%cbClsExtra = 0
         wc%cbWndExtra = 0
         if (RegisterClass(wc) == 0) goto 99999
    end if

    ! Load the window's menu and accelerators and create the window
    !
    ghMenu = LoadMenu(hInstance, LOC(lpszMenuName))
    if (ghMenu == 0) goto 99999
    ghFileSubMenu = GetSubMenu(ghMenu, 0)
    ghNavigateSubMenu = GetSubMenu(ghMenu, 1)
    ghHelpSubMenu = GetSubMenu(ghMenu, 2)
    haccel = LoadAccelerators(hInstance, LOC(lpszAccelName))
    if (haccel == 0) goto 99999

    ghwndMain = CreateWindowEx(  0, lpszClassName,                 &
                                 lpszAppName,                      &
                                 INT(WS_OVERLAPPEDWINDOW),         &
                                 CW_USEDEFAULT,                    &
                                 0,                                &
                                 CW_USEDEFAULT,                    &
                                 0,                                &
                                 NULL,                             &
                                 ghMenu,                           &
                                 hInstance,                        &
                                 NULL                              &
                              )
    if (ghwndMain == 0) goto 99999

    lret = ShowWindow( ghwndMain, nCmdShow )

    ! Read and process messsages
    do while( GetMessage (mesg, NULL, 0, 0) ) 
       if ( TranslateAccelerator (ghwndMain, haccel, mesg) == 0) then
	       if ( DlgIsDlgMessage(mesg, gdlg) .EQV. .FALSE. ) then
               lret = TranslateMessage( mesg )
               ret  = DispatchMessage( mesg )
           end if
       end if
    end do

    call DlgUninit(gdlg)
    call COMUNINITIALIZE()

    WinMain = mesg.wParam
    return

99999 &

    ret = MessageBox(ghwndMain, "Error initializing application fxplorer"C, &
                     "Error"C, MB_OK)
    call COMUNINITIALIZE()
    WinMain = 0

contains

!****************************************************************************
!
!  FUNCTION: MainWndProc ( hWnd, mesg, wParam, lParam )
!
!  PURPOSE:  Processes messages for the main window
!
!  COMMENTS: Note that the child dialog box is created when this window
!            processes the WM_CREATE message, and gets resized when this
!            window processes the WM_SIZE message.
!
!****************************************************************************

integer function MainWndProc ( hWnd, mesg, wParam, lParam )
!DEC$ ATTRIBUTES STDCALL :: MainWndProc

    use ifwin
    use fxplorerGlobals

    implicit none

    integer(HANDLE) hWnd
    integer(UINT) mesg
    integer(UINT_PTR) wParam
    integer(UINT_PTR) lParam

    include 'resource.fd'

    ! Variables
    integer(DWORD)  ret
    integer(HANDLE)  hwndFocus
    character(SIZEOFAPPNAME)  lpszName, lpszHelpFileName, lpszContents, lpszMessage
    character(SIZEOFAPPNAME)  lpszHeader

    select case ( mesg )

    ! WM_CREATE: Create the child dialog
      case (WM_CREATE)
          gdlg = CreateChildDialog(hwnd)
          CALL ResizeChildDialog(hwnd, gdlg)
          MainWndProc = 0
          return

    ! WM_RESIZE: Resize the child dialog
      case (WM_SIZE)
          CALL ResizeChildDialog(hwnd, gdlg)
          MainWndProc = 0
          return

    ! WM_ACTIVATE: Remember/Set focus
      case (WM_ACTIVATE)
          if ( IBITS(wParam,0,16) == WA_INACTIVE ) then
              ghwndFocus = GetFocus()
          else
              if ( ghwndFocus .ne. NULL ) then
                  ret = SetFocus( ghwndFocus )
              else
                  hwndFocus = GetDlgItem( gdlg%hwnd, IDC_EDIT1 )
                  ret = SetFocus( hwndFocus )
              end if
          end if
          MainWndProc = 0
          return

    ! WM_DESTROY: PostQuitMessage() is called 
      case (WM_DESTROY)
          call PostQuitMessage( 0 )
          MainWndProc = 0
          return

    ! WM_COMMAND: user command
      case (WM_COMMAND)
        select case ( IAND( wParam, 16#ffff ) )
 
            case (IDM_EXIT)
                ret = SendMessage( hWnd, WM_CLOSE, 0, 0 )
                MainWndProc = 0
                return
 
            case (IDM_BACK)
                CALL FXBack(gdlg, IDM_BACK, dlg_clicked)
                return
 
            case (IDM_GO)
                CALL FXGo(gdlg, IDM_GO, dlg_clicked)
                return
 
            case (IDM_STOP)
                CALL FXStop(gdlg, IDM_STOP, dlg_clicked)
                return
  
            case (IDM_ABOUT)
                lpszName = "AboutDlg"C
                ret = DialogBoxParam(ghInstance,LOC(lpszName),hWnd,& 
                  LOC(AboutDlgProc), 0_LONG_PTR)
                MainWndProc = 0
                return

            ! All of the other possible menu options are currently disabled

            case DEFAULT
                MainWndProc = DefWindowProc( hWnd, mesg, wParam, lParam )
                return
        end select

    ! Let the default window proc handle all other messages
      case default
          MainWndProc = DefWindowProc( hWnd, mesg, wParam, lParam )

    end select

end function MainWndProc

!****************************************************************************
!
!  FUNCTION: CenterWindow (HWND, HWND)
!
!  PURPOSE:  Center one window over another
!
!  COMMENTS: Dialog boxes take on the screen position that they were designed
!            at, which is not always appropriate. Centering the dialog over a
!            particular window usually results in a better position.
!
!****************************************************************************

subroutine CenterWindow (hwndChild, hwndParent)

    use ifwin 
    use fxplorerGlobals

    implicit none

    integer(HANDLE)         hwndChild, hwndParent

    include 'resource.fd'

    ! Variables
    type (T_RECT)   rChild, rParent
    integer         wChild, hChild, wParent, hParent
    integer         wScreen, hScreen, xNew, yNew
    integer(HANDLE)         hdc
    integer(DWORD)       retval

    ! Get the Height and Width of the child window
       retval = GetWindowRect (hwndChild, rChild)
       wChild = rChild.right - rChild.left
       hChild = rChild.bottom - rChild.top

    ! Get the Height and Width of the parent window
       retval = GetWindowRect (hwndParent, rParent)
       wParent = rParent.right - rParent.left
       hParent = rParent.bottom - rParent.top

    ! Get the display limits
       hdc = GetDC (hwndChild)
       wScreen = GetDeviceCaps (hdc, HORZRES)
       hScreen = GetDeviceCaps (hdc, VERTRES)
       retval = ReleaseDC (hwndChild, hdc)

    ! Calculate new X position, then adjust for screen
       xNew = rParent.left + ((wParent - wChild) /2)
       if (xNew .LT. 0) then
          xNew = 0
       else if ((xNew+wChild) .GT. wScreen) then
          xNew = wScreen - wChild
       end if

    ! Calculate new Y position, then adjust for screen
       yNew = rParent.top  + ((hParent - hChild) /2)
       if (yNew .LT. 0) then
          yNew = 0
       else if ((yNew+hChild) .GT. hScreen) then
          yNew = hScreen - hChild
       end if

    ! Set it, and return
       retval = SetWindowPos (hwndChild, NULL, xNew, yNew, 0, 0,            &
                      IOR(SWP_NOSIZE , SWP_NOZORDER))
end subroutine CenterWindow

 
!/****************************************************************************
!
!  FUNCTION: AboutDlgProc(HWND, UINT, WPARAM, LPARAM)
!
!  PURPOSE:  Processes messages for "About" dialog box
!
!  COMMENTS: Display version information from the version section of the
!            application resource.  Wait for user to click on "Ok" button,
!            then close the dialog box.
!
!****************************************************************************/

integer*4 function AboutDlgProc( hDlg, message, uParam, lParam )
!DEC$ ATTRIBUTES STDCALL :: AboutDlgProc

    use ifwin
    use fxplorerGlobals

    implicit none

    integer(HANDLE)     hDlg        ! window handle of the dialog box
    integer(UINT)     message     ! type of message
    integer(UINT_PTR)     uParam      ! message-specific information
    integer(UINT_PTR)     lParam

    include 'resource.fd'

    ! Variables
    integer(HANDLE)   hfontDlg
    save        hfontDlg

    integer     dwVerHnd
    integer     dwVerInfoSize
    integer     uVersionLen
    integer     bRetCode
    integer     i
    character*256   szFullPath
    character*256   szResult
    character*256   szGetName
    character*256   lpversion

    integer(PCSTR)   lpstrVffInfo
    integer(HANDLE)   hMem
    integer(DWORD)   ret

    select case (message)
      case (WM_INITDIALOG)   ! message: initialize dialog box
         ! Create a font to use
         hfontDlg = CreateFont(14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,& 
                        IOR(INT(VARIABLE_PITCH) , INT(FF_SWISS)), ""C)

         ! Center the dialog over the application window
         call CenterWindow (hDlg, GetWindow (hDlg, GW_OWNER))

         ! Get version information from the application
         ret = GetModuleFileName (ghInstance, szFullPath,     &
                               len(szFullPath))
         dwVerInfoSize = GetFileVersionInfoSize(szFullPath,   &
                                       LOC(dwVerHnd))

         if (dwVerInfoSize .NE. 0) then
            ! If we were able to get the information, process it:
            hMem = GlobalAlloc(GMEM_MOVEABLE, INT(dwVerInfoSize,SIZE_T))
            lpstrVffInfo  = GlobalLock(hMem)
            ret = GetFileVersionInfo (szFullPath, dwVerHnd, &
            dwVerInfoSize, lpstrVffInfo)

            ! Walk through the dialog items that we want to replace:
            do i = IDC_VER1, IDC_VER5
               ret = GetDlgItemText(hDlg, i, szResult,      &     
                             len(szResult))
                
               szGetName = "\\StringFileInfo\\040904E4\\"C               
               ret =lstrcat(szGetName,szResult)

               bRetCode  =  VerQueryValue(lpstrVffInfo,       &
                                            szGetName,       &
                                            LOC(lpVersion),       &
                                            LOC(uVersionLen))

               if ( bRetCode .NE. 0 ) then
                    ! Replace dialog item text with version info
                  ret = lstrcpy(szResult,lpVersion)
                  ret = SetDlgItemText(hDlg, i,szResult)
                  ret = SendMessage (GetDlgItem (hDlg, i),   &
                                   WM_SETFONT, hfontDlg, TRUE)
               end if
            end do 

            ret = GlobalUnlock(hMem)
            ret = GlobalFree(hMem)
         end if 
         AboutDlgProc = 1
         return
      case (WM_COMMAND)                      ! message: received a command
         if ((IAND( uParam, 16#ffff ) .EQ. IDOK) &       !OK Selected
            .OR. (IAND( uParam, 16#ffff ) .EQ. IDCANCEL)) then  ! System menu close command?
            ret = EndDialog(hDlg, TRUE)        ! Exit the dialog
            ret = DeleteObject (hfontDlg)
            AboutDlgProc = 1
            return
         end if
    end select  
    AboutDlgProc = 0 ! Didn't process the message
    return
end function AboutDlgProc


!****************************************************************************
!
!  FUNCTION: CreateChildDialog (HWND)
!
!  PURPOSE:  Create the child dialog
!
!  COMMENTS: This is the window which will fill the client area of the
!            main application window.  Note that this dialog is defined to
!            have the WS_CHILD style, rather than the WS_POPUP style
!            that is normally used for dialog boxes.
!
!****************************************************************************

type (dialog) function CreateChildDialog(hwndParent)

    use ifwin 
    use dflogm
    use dfcomty
    use ifcom
    use ifauto
    use fxplorerGlobals
    use browser

    implicit none

    integer(HANDLE) hwndParent

    include 'resource.fd'

    ! Variables
    type (T_MSG)            mesg
    integer*4               ret
    logical*4               lret
    type (T_GUID)             guidmold

    ! Create the dialog box
    lret = DlgInit(IDD_FXPLORER_DIALOG, gdlg)
    ! Set up callbacks so that we get control when the dialog box is
    ! created, destroyed, and changes size
    lret = DlgSetSub(gdlg, IDD_FXPLORER_DIALOG, FXSub)
    lret = DlgSetSub(gdlg, IDD_FXPLORER_DIALOG, FXChangeSize, dlg_sizechange)
    ! Set up callbacks for the buttons
    lret = DlgSetSub(gdlg, IDM_GO, FXGo)
    lret = DlgSetSub(gdlg, IDM_STOP, FXStop)
    lret = DlgSetSub(gdlg, IDM_BACK, FXBack)
    ! Set up event handlers for certain events that the Internet Explorer
    ! control reports.  The interfaces for these handlers are defined in
    ! the BROWSER.F90 file, that is generated using the Fortran Module Wizard
    ret = DlgSetCtrlEventHandler(gdlg, IDC_EXPLORER1, &
        DWebBrowserEvents2_DownloadBegin, 106, &
        transfer(IID_DWebBrowserEvents2,guidmold))
    ret = DlgSetCtrlEventHandler(gdlg, IDC_EXPLORER1, &
        DWebBrowserEvents2_DownloadComplete, 104, &
        transfer(IID_DWebBrowserEvents2,guidmold))
    ret = DlgSetCtrlEventHandler(gdlg, IDC_EXPLORER1, &
        DWebBrowserEvents2_ProgressChange, 108, &
        transfer(IID_DWebBrowserEvents2,guidmold))
    ret = DlgSetCtrlEventHandler(gdlg, IDC_EXPLORER1, &
        DWebBrowserEvents2_TitleChange, 113, &
        transfer(IID_DWebBrowserEvents,guidmold))
    CALL DownloadInProgress(gdlg, .FALSE.);
    ! Child dialog boxes are displayed using DlgModeless
    lret = DlgModeless(gdlg, SW_SHOWNA, hwndParent)
    ! Set the return value
    CreateChildDialog = gdlg
end function CreateChildDialog

!****************************************************************************
!
!  FUNCTION: ResizeChildDialog (HWND, dialog)
!
!  PURPOSE:  Resize the child dialog
!
!  COMMENTS: This routine is called when the main application window
!            receives a WM_SIZE message.  This routine resizes the dialog
!            box window to fill the main application window's client area.
!
!****************************************************************************

subroutine ResizeChildDialog(hwndParent, dlg)

    use ifwin 
    use iflogm

    implicit none

    integer(HANDLE) hwndParent
    type (dialog) dlg
    integer(BOOL) lret
    integer uFlags, bx, by
    type (T_RECT) rect

    !  Get the size of a window border
    bx = GetSystemMetrics(SM_CXBORDER)
    by = GetSystemMetrics(SM_CYBORDER)
    !  Get the size of the client area of the main application window
    lret = GetClientRect(hwndParent, rect)
    !  Resize the dialog box
    uFlags = SWP_NOACTIVATE .OR. SWP_NOOWNERZORDER
    lret = SetWindowPos(            &
          dlg % hWnd,               &   ! handle to window
          HWND_TOP,                 &   ! placement-order handle
          bx,                       &   ! horizontal position
          by,                       &   ! vertical position
          rect % right - (2*bx),    &   ! width
          rect % bottom - (2*by),   &   ! height
          uFlags )                      ! window-positioning flags);

end subroutine ResizeChildDialog

!****************************************************************************
!
!  FUNCTION: FXSub ( dlg, id, callbacktype )
!
!  PURPOSE:  Dialog box callback for initialization and destroy
!
!  COMMENTS:
!
!****************************************************************************

SUBROUTINE FXSub( dlg, id, callbacktype )
!DEC$ ATTRIBUTES DEFAULT :: FXSub

  use ifwin
  use iflogm

  implicit none

  type (dialog) dlg
  integer id, callbacktype

  if (callbacktype == dlg_init) then
    call FXChangeSize( dlg, id, dlg_sizechange )
  endif

END SUBROUTINE FXSub

!****************************************************************************
!
!  FUNCTION: FXChangeSize ( dlg, id, callbacktype )
!
!  PURPOSE:  Dialog box callback for size change
!
!  COMMENTS: This routine moves/resizes the dialog box controls to fit
!            the current size of the dialog box.
!
!****************************************************************************

SUBROUTINE FXChangeSize( dlg, id, callbacktype )
!DEC$ ATTRIBUTES DEFAULT :: FXChangeSize

  use ifwin
  use iflogm

  implicit none

  type (dialog) dlg
  integer id, callbacktype

  include 'resource.fd'

  logical lret
  integer spacex, spacey
  integer dialogw, dialogh
  integer buttonw, buttonh
  integer x, y, w, h, bx
  integer(HANDLE) hwndControl
  type (T_RECT) rect

  if (callbacktype == dlg_sizechange) then
    ! Re-arrange the controls in the dialog to fit the new size

    ! First get the size of the buttons on the title bar - we use this for spacing
    spacex = GetSystemMetrics(SM_CXSIZE) * 3 / 4
    spacey = GetSystemMetrics(SM_CYSIZE) * 3 / 4

    ! Get the size of the dialog box
    lret = GetClientRect(dlg%hwnd, rect)
    dialogw = rect % right - rect % left
    dialogh = rect % bottom - rect % top

    ! Position the buttons
    ! Get the dimensions of the Stop button - this will be the size of all buttons
    hwndControl = GetDlgItem( dlg%hwnd, IDM_STOP )
    lret = GetWindowRect(hwndControl, rect)
    buttonw = rect % right - rect % left
    buttonh = rect % bottom - rect % top

    ! Stop Button
    hwndControl = GetDlgItem( dlg%hwnd, IDM_STOP )
    x = dialogw - spacex - buttonw
    y = spacey
    lret = MoveWindow(hwndControl, x, y, buttonw, buttonh, TRUE)

    ! Go Button
    hwndControl = GetDlgItem( dlg%hwnd, IDM_GO )
    x = x - (spacex / 2) - buttonw
    y = spacey
    lret = MoveWindow(hwndControl, x, y, buttonw, buttonh, TRUE)

    ! Back Button
    hwndControl = GetDlgItem( dlg%hwnd, IDM_BACK )
    x = x - (spacex / 2) - buttonw
    y = spacey
    lret = MoveWindow(hwndControl, x, y, buttonw, buttonh, TRUE)
    bx = x

    ! Position the Progress control
    hwndControl = GetDlgItem( dlg%hwnd, IDC_PROGRESS1 )
    lret = GetWindowRect(hwndControl, rect)
    x = spacex
    y = dialogh - spacey - buttonh
    w = rect % right - rect % left
    h = rect % bottom - rect % top
    lret = MoveWindow(hwndControl, x, y, w, h, TRUE)

    ! Position the Label and Edit controls
    hwndControl = GetDlgItem( dlg%hwnd, IDC_URLLABEL )
    lret = GetWindowRect(hwndControl, rect)
    x = spacex
    y = spacey
    w = rect % right - rect % left
    h = rect % bottom - rect % top
    lret = MoveWindow(hwndControl, x, y, w, h, TRUE)
    hwndControl = GetDlgItem( dlg%hwnd, IDC_EDIT1 )
    x = x + w
    y = spacey
    w = bx - x - spacex
    h = buttonh
    lret = MoveWindow(hwndControl, x, y, w, h, TRUE)

    ! Position the Browser control
    hwndControl = GetDlgItem( dlg%hwnd, IDC_EXPLORER1 )
    lret = GetWindowRect(hwndControl, rect)
    x = spacex
    y = 2*spacey + buttonh
    w = dialogw - 2*spacex
    h = dialogh - 4*spacey - 2*buttonh
    lret = MoveWindow(hwndControl, x, y, w, h, TRUE)

  endif

END SUBROUTINE FXChangeSize

!****************************************************************************
!
!  FUNCTION: FXGo ( dlg, id, callbacktype )
!
!  PURPOSE:  Dialog box callback for GO button
!
!  COMMENTS: This routine calls the Internet Explorer control Navigate method
!
!****************************************************************************

SUBROUTINE FXGo( dlg, id, callbacktype )
!DEC$ ATTRIBUTES DEFAULT :: FXGo

  use iflogm
  use browser

  implicit none

  type (dialog) dlg
  integer id, callbacktype

  include 'resource.fd'

  integer status
  logical lret
  integer text1
  integer(INT_PTR_KIND()) explorer1
  CHARACTER*(2048) url

  if (callbacktype == dlg_clicked) then
      !  Get the object handle (IDispatch*) of the Internet Explorer control
      lret = DlgGet(dlg, IDC_EXPLORER1, explorer1)
      !  Get the URL that the user specified
      lret = DlgGet(dlg, IDC_EDIT1, url)
      !  Call the Internet Explorer control
      CALL IWebBrowser_Navigate(explorer1, url, $STATUS = status)
  endif

END SUBROUTINE FXGo

!****************************************************************************
!
!  FUNCTION: FXStop ( dlg, id, callbacktype )
!
!  PURPOSE:  Dialog box callback for STOP button
!
!  COMMENTS: This routine calls the Internet Explorer control Stop method
!
!****************************************************************************

SUBROUTINE FXStop( dlg, id, callbacktype )
!DEC$ ATTRIBUTES DEFAULT :: FXStop

  use iflogm
  use browser

  implicit none

  type (dialog) dlg
  integer id, callbacktype

  include 'resource.fd'

  integer status
  logical lret
  integer(INT_PTR_KIND()) explorer1

  if (callbacktype == dlg_clicked) then
      !  Get the object handle (IDispatch*) of the Internet Explorer control
      lret = DlgGet(dlg, IDC_EXPLORER1, explorer1)
      !  Call the Internet Explorer control
      CALL IWebBrowser_Stop(explorer1, status)
  endif

END SUBROUTINE FXStop

!****************************************************************************
!
!  FUNCTION: FXBack ( dlg, id, callbacktype )
!
!  PURPOSE:  Dialog box callback for Back button
!
!  COMMENTS:  This routine calls the Internet Explorer control GoBack method
!
!****************************************************************************

SUBROUTINE FXBack( dlg, id, callbacktype )
!DEC$ ATTRIBUTES DEFAULT :: FXBack

  use iflogm
  use browser

  implicit none

  type (dialog) dlg
  integer id, callbacktype

  include 'resource.fd'

  integer status
  logical lret
  integer(INT_PTR_KIND()) explorer1

  if (callbacktype == dlg_clicked) then
      !  Get the object handle (IDispatch*) of the Internet Explorer control
      lret = DlgGet(dlg, IDC_EXPLORER1, explorer1)
      !  Call the Internet Explorer control
      CALL IWebBrowser_GoBack(explorer1, status)
  endif

END SUBROUTINE FXBack

!****************************************************************************
!
!  FUNCTION: DownloadInProgress ( dlg, inProgress )
!
!  PURPOSE:  This routine enables/disables a number of controls while
!            a download is in progress
!
!  COMMENTS:
!
!****************************************************************************

SUBROUTINE DownloadInProgress( dlg, inProgress )
    use iflogm
    use fxplorerGlobals

    implicit none

    type (dialog) dlg
    logical inProgress

    include 'resource.fd'

    logical notInProgress
    integer mFlags
    integer mNotFlags
    logical lret

    if (inProgress) then    
        notInProgress = .FALSE.
        mFlags = MF_ENABLED
        mNotFlags = MF_GRAYED
    else
        notInProgress = .TRUE.
        mFlags = MF_GRAYED
        mNotFlags = MF_ENABLED
    endif

    lret = DlgSet(dlg, IDM_GO, notInProgress)
    lret = EnableMenuItem(ghNavigateSubMenu, IDM_GO, mNotFlags)
    lret = DlgSet(dlg, IDM_BACK, notInProgress)
    lret = EnableMenuItem(ghNavigateSubMenu, IDM_BACK, mNotFlags)
    lret = EnableMenuItem(ghFileSubMenu, IDM_EXIT, mNotFlags)

    lret = DlgSet(dlg, IDM_STOP, inProgress)
    lret = EnableMenuItem(ghNavigateSubMenu, IDM_STOP, mFlags)
    lret = DlgSet(dlg, IDC_PROGRESS1, inProgress)

END SUBROUTINE DownloadInProgress

!****************************************************************************
!
!  FUNCTION: DWebBrowserEvents2_DownloadBegin($OBJECT)
!
!  PURPOSE:  "Download of a page started" event handler
!
!  COMMENTS: Calls DownloadInProgress to enable/disable a number of controls
!
!****************************************************************************

SUBROUTINE DWebBrowserEvents2_DownloadBegin($OBJECT)
    !DEC$ ATTRIBUTES STDCALL, DECORATE, ALIAS:"dwebbrowserevents2_downloadbegin"  :: DWebBrowserEvents2_DownloadBegin
    use fxplorerGlobals
    INTEGER*4, INTENT(IN)   :: $OBJECT   ! Object Pointer
    !DEC$ ATTRIBUTES VALUE  :: $OBJECT
    CALL DownloadInProgress(gdlg, .TRUE.);
END SUBROUTINE DWebBrowserEvents2_DownloadBegin

!****************************************************************************
!
!  FUNCTION: DWebBrowserEvents2_DownloadComplete($OBJECT)
!
!  PURPOSE:  "Download of page complete" event handler
!
!  COMMENTS: Calls DownloadInProgress to enable/disable a number of controls
!
!****************************************************************************

SUBROUTINE DWebBrowserEvents2_DownloadComplete($OBJECT)
    !DEC$ ATTRIBUTES STDCALL, DECORATE, ALIAS:"dwebbrowserevents2_downloadcomplete"  :: DWebBrowserEvents2_DownloadComplete
    use fxplorerGlobals
    INTEGER*4, INTENT(IN)   :: $OBJECT   ! Object Pointer
    !DEC$ ATTRIBUTES VALUE  :: $OBJECT
    CALL DownloadInProgress(gdlg, .FALSE.);
END SUBROUTINE DWebBrowserEvents2_DownloadComplete

!****************************************************************************
!
!  FUNCTION: DWebBrowserEvents2_ProgressChange($OBJECT, ProgressNow, ProgressMax)
!
!  PURPOSE:  "Download progress is updated" event handler
!
!  COMMENTS: Updates the progress bar control to match the progress as
!            reported by the Internet Explorer control
!
!****************************************************************************

SUBROUTINE DWebBrowserEvents2_ProgressChange($OBJECT, ProgressNow, ProgressMax)
    !DEC$ ATTRIBUTES STDCALL, DECORATE, ALIAS:"dwebbrowserevents2_progresschange"  :: DWebBrowserEvents2_ProgressChange
    use iflogm
    use fxplorerGlobals

    INTEGER*4, INTENT(IN)   :: $OBJECT   ! Object Pointer
    !DEC$ ATTRIBUTES VALUE  :: $OBJECT
    INTEGER*4, INTENT(IN)   :: ProgressNow  
    !DEC$ ATTRIBUTES VALUE  :: ProgressNow
    INTEGER*4, INTENT(IN)   :: ProgressMax  
    !DEC$ ATTRIBUTES VALUE  :: ProgressMax

    include 'resource.fd'
    
    logical lret
    lret = DlgSet(gdlg, IDC_PROGRESS1, ProgressMax, DLG_RANGEMAX)
    lret = DlgSet(gdlg, IDC_PROGRESS1, ProgressNow)

END SUBROUTINE DWebBrowserEvents2_ProgressChange

!****************************************************************************
!
!  FUNCTION: DWebBrowserEvents2_TitleChange($OBJECT, ProgressNow, ProgressMax)
!
!  PURPOSE:  "Document title changed" event handler
!
!  COMMENTS: Appends the Internet Explorer title to the main window title
!
!****************************************************************************

SUBROUTINE DWebBrowserEvents2_TitleChange($OBJECT, Text)
    !DEC$ ATTRIBUTES STDCALL, DECORATE, ALIAS:"dwebbrowserevents2_titlechange"  :: DWebBrowserEvents2_TitleChange
    USE IFCOMTY
    USE ifcom
    USE USER32
    use iflogm
    use fxplorerGlobals
    INTEGER*4, INTENT(IN)   :: $OBJECT   ! Object Pointer
    !DEC$ ATTRIBUTES VALUE  :: $OBJECT
    INTEGER(INT_PTR_KIND()), INTENT(IN)   :: Text ! BSTR
    !DEC$ ATTRIBUTES VALUE  :: Text

    character*256 pagetitle
    character*256 dlgtitle
    character*256 cstr
    INTEGER*4 status
    status = ConvertBSTRToString(Text, pagetitle)
    dlgtitle = "Fortran Explorer - "    // pagetitle
    CALL CopyFStr(dlgtitle, cstr)
    status = SendMessage(ghwndMain, WM_SETTEXT, 0, loc(cstr))

END SUBROUTINE DWebBrowserEvents2_TitleChange

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! CopyCStr
!!
!! Copies a null terminated C string to a F90 string
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

subroutine CopyCStr( cstr, fstr )
  byte, dimension(*), intent(in)  :: cstr
  character*(*), intent(out) :: fstr

    integer i
    ! scan up to the terminating null
    i = 1
    do while( cstr(i) .ne. 0 )
      fstr(i:i) = CHAR(cstr(i))
      i = i + 1
    end do
    ! pad the rest with blanks
    do while( i .le. len(fstr) )
      fstr(i:i) = ' '
      i = i + 1
    end do
end subroutine CopyCStr

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!! CopyFStr
!!
!! Copies a F90 string to a null terminated C string
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

subroutine CopyFStr( fstr, cstr )
  character*(*), intent(in)  :: fstr
  character*(*), intent(out) :: cstr

    !  Search for the last non-blank character in the F90 string
    !  and replace the next character with a terminating 0
    integer l
    l = len_trim(fstr)
    if (l > 0) then
        cstr(:l) = fstr(:l)
    end if 
    cstr(l+1:l+1) = char(0)
end subroutine CopyFStr

end function WinMain