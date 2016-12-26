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

! Module file for Calendar QuickWin sample program
!

module CALNMOD

INTEGER(4), Parameter :: BackColor=2
INTEGER(4), Parameter :: TextColor=#FFFFFF   !RGB Color in (B G R order)
INTEGER(4), Parameter :: GridColor=#FFFFFF   !RGB Color in (B G R order)
INTEGER(4), Parameter :: WeekendColor=#0000FF   !RGB Color in (B G R order)
INTEGER(4), Parameter :: WeekdayColor=#00FF00   !RGB Color in (B G R order)


INTEGER(2) ,Parameter :: ColX=100
INTEGER(2) ,Parameter :: ColY=220
INTEGER(2) ,Parameter :: ColXOff = 30
INTEGER(2) ,Parameter :: ColYOff = 30




type table 
	integer(2) numx, numy
end type

! Calendar(i) points the upper left corner 
Type(table) :: Calendar(7) = &
		(/ table(30, ColY), table(30+ColXOff,ColY), &
		   table(30+ColXOff*2, ColY), table(30+ColXOff*3,ColY), &
		   table(30+ColXOff*4, ColY), table(30+ColXOff*5,ColY), &
		   table(30+ColXOff*6, ColY)   /)


CHARACTER(2) :: DayString(31) = &
				(/ ' 1',' 2',' 3',' 4',' 5', &
				   ' 6',' 7',' 8',' 9','10', &
				   '11','12','13','14','15', &
				   '16','17','18','19','20', &
				   '21','22','23','24','25', &
				   '26','27','28','29','30','31' /)

INTEGER(2) :: EndOfMonth(12) = &
				(/ 31, 28, 31, 30, 31, &
				   30, 31, 31, 30, 31, &
				   30, 31 /)

end module
