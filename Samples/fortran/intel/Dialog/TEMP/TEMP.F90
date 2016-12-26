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

!  TEMP.f90 
!
!   Part of the Intel Visual Fortran programming samples
!
!   This sample is used in the "Using Dialogs" chapter of the
!   Visual Fortran Building Applications Manual.  It displays a modal
!   dialog box that converts a Celsius temperature to Fahrenheit
!   and vice-versa.
!
!  FUNCTIONS:
!	TEMP       - Entry point of console application
!   DoDialog   - Displays the Temperature Conversion dialog box
!   UpdateTemp - Synchronizes the values of the dialog controls
!

!****************************************************************************
!
!  PROGRAM: TEMP
!
!  PURPOSE:  Entry point for the console application
!
!****************************************************************************

PROGRAM TEMP
    implicit none

	! Body of TEMP
	CALL DoDialog
END PROGRAM TEMP

!****************************************************************************
!
!  SUBROUTINE: DoDialog
!
!  PURPOSE:  Displays the Temperature Conversion dialog box
!
!****************************************************************************

SUBROUTINE DoDialog( )
    USE IFLOGM
    IMPLICIT NONE
    INCLUDE 'RESOURCE.FD'

    INTEGER retint
    LOGICAL retlog
    TYPE (dialog) dlg
    EXTERNAL UpdateTemp
  ! Initialize.
    IF ( .not. DlgInit( idd_temp, dlg ) ) THEN
        WRITE (*,*) "Error: dialog not found"
    ELSE
    ! Set up temperature controls.
        retlog = DlgSet( dlg, IDC_SCROLLBAR_TEMPERATURE, 200, DLG_RANGEMAX)
        retlog = DlgSet( dlg, IDC_EDIT_CELSIUS, "100" )
        CALL UpdateTemp( dlg, IDC_EDIT_CELSIUS, DLG_CHANGE)
        retlog = DlgSetSub( dlg, IDC_EDIT_CELSIUS, UpdateTemp )
        retlog = DlgSetSub( dlg, IDC_EDIT_FAHRENHEIT, UpdateTemp )
        retlog = DlgSetSub( dlg, IDC_SCROLLBAR_TEMPERATURE, UpdateTemp )
    ! Activate the modal dialog.
        retint = DlgModal( dlg )
    ! Release dialog resources.
        CALL DlgUninit( dlg )
    END IF
END SUBROUTINE DoDialog

!****************************************************************************
!
!  SUBROUTINE: UpdateTemp
!
!  PURPOSE:  Synchronizes the values of the dialog controls 
!
!****************************************************************************

SUBROUTINE UpdateTemp( dlg, control_name, callbacktype )
!DEC$ ATTRIBUTES DEFAULT :: UpdateTemp
    USE DFLOGM
    IMPLICIT NONE
    TYPE (dialog) dlg
    INTEGER control_name
    INTEGER callbacktype
    INCLUDE 'RESOURCE.FD'
    CHARACTER(256) text
    INTEGER cel, far, retint
    LOGICAL retlog
  ! Suppress compiler warnings for unreferenced arguments.
    INTEGER local_callbacktype
    local_callbacktype = callbacktype

    SELECT CASE (control_name)
      CASE (IDC_EDIT_CELSIUS)
      ! Celsius value was modified by the user so
      ! update both Fahrenheit and Scroll bar values.
        retlog = DlgGet( dlg, IDC_EDIT_CELSIUS, text )
        READ (text, *, iostat=retint) cel
        IF ( retint .eq. 0 ) THEN
            far = (cel-0.0)*((212.0-32.0)/100.0)+32.0
            WRITE (text,*) far
            retlog = DlgSet( dlg, IDC_EDIT_FAHRENHEIT,                &
    &                    TRIM(ADJUSTL(text)) )
            retlog = DlgSet( dlg, IDC_SCROLLBAR_TEMPERATURE, cel,     &
    &                    DLG_POSITION )
        END IF
      CASE (IDC_EDIT_FAHRENHEIT)
      ! Fahrenheit value was modified by the user so
      ! update both celsius and Scroll bar values.
        retlog = DlgGet( dlg, IDC_EDIT_FAHRENHEIT, text )
        READ (text, *, iostat=retint) far
        IF ( retint .eq. 0 ) THEN
            cel = (far-32.0)*(100.0/(212.0-32.0))+0.0
            WRITE (text,*) cel
            retlog = DlgSet( dlg, IDC_EDIT_CELSIUS, TRIM(ADJUSTL(text)) )
            retlog = DlgSet( dlg, IDC_SCROLLBAR_TEMPERATURE, cel,     &
    &                     DLG_POSITION )
        END IF
      CASE (IDC_SCROLLBAR_TEMPERATURE)
      ! Scroll bar value was modified by the user so
      ! update both Celsius and Fahrenheit values.
        retlog = DlgGet( dlg, IDC_SCROLLBAR_TEMPERATURE, cel,         &
    &                   DLG_POSITION  )
        far = (cel-0.0)*((212.0-32.0)/100.0)+32.0
        WRITE (text,*) far
        retlog = DlgSet( dlg, IDC_EDIT_FAHRENHEIT, TRIM(ADJUSTL(text)) )
        WRITE (text,*) cel
        retlog = DlgSet( dlg, IDC_EDIT_CELSIUS, TRIM(ADJUSTL(text)) )
    END SELECT
END SUBROUTINE UpdateTemp
