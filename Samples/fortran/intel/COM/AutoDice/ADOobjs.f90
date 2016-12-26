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

	MODULE ADOBJECTS
	IMPLICIT NONE

    INTEGER, PARAMETER :: K_OBJ = INT_PTR_KIND()
  ! Object Pointers

	  INTEGER(K_OBJ) excelapp
	  INTEGER(K_OBJ) workbooks
	  INTEGER(K_OBJ) workbook
	  INTEGER(K_OBJ) worksheets
	  INTEGER(K_OBJ) worksheet
	  INTEGER(K_OBJ) range
	  INTEGER(K_OBJ) charts
	  INTEGER(K_OBJ) chart
	  INTEGER(K_OBJ), DIMENSION(1:12) :: cells
	  INTEGER(K_OBJ) categoryAxis
	  INTEGER(K_OBJ) valueAxis

  ! BSTRs
	  INTEGER(K_OBJ) bstr1
	  INTEGER(K_OBJ) bstr2
	  INTEGER(K_OBJ) bstr3

	CONTAINS

	  SUBROUTINE INITOBJECTS()
	
		  USE IFCOM
	
		  INTEGER i;

		  excelapp = 0
		  workbooks = 0
		  workbook = 0
		  worksheets = 0
		  worksheet = 0
		  range = 0
		  charts = 0
		  chart = 0
		  DO i=1,12
			cells(i) = 0
		  END DO
		  categoryAxis = 0
		  valueAxis = 0

		  bstr1 = 0
		  bstr2 = 0
		  bstr3 = 0
	
	  END SUBROUTINE
	  
	  SUBROUTINE RELEASEOBJECTS()
	
		  USE IFCOM
	
		  INTEGER*4 status
		  INTEGER i;

		  IF (range /= 0) status = COMRELEASEOBJECT ( range )
		  IF (chart /= 0) status = COMRELEASEOBJECT ( chart )
		  IF (charts /= 0) status = COMRELEASEOBJECT ( charts )
		  IF (worksheets /= 0) status = COMRELEASEOBJECT ( worksheet )
		  IF (worksheet /= 0) status = COMRELEASEOBJECT ( worksheet )
		  IF (workbook /= 0) status = COMRELEASEOBJECT ( workbook )
		  IF (workbooks /= 0) status = COMRELEASEOBJECT ( workbooks )
		  DO i=1,12
			  IF (cells(i) /= 0) status = COMRELEASEOBJECT ( cells(i) )
		  END DO
		  IF (categoryAxis /= 0) status = COMRELEASEOBJECT ( categoryAxis )
		  IF (valueAxis /= 0) status = COMRELEASEOBJECT ( valueAxis )
		  IF (excelapp /= 0) status = COMRELEASEOBJECT ( excelapp )

		  IF (bstr1 /= 0) CALL SysFreeString(bstr1)
		  IF (bstr2 /= 0) CALL SysFreeString(bstr2)
		  IF (bstr3 /= 0) CALL SysFreeString(bstr3)
	
	  END SUBROUTINE


	END MODULE