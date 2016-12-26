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

!**********************************************************************
!
! POKER -- Video Poker in Fortran 90 with QuickWin
!
!  Files in this sample:
!	POKER.F90  
!	CARDS.F90
!	BITMAP.F90
!	BUTTON.F90
!	MISC.F90
!	DESCRIPT.F90
!	REGISTRY.F90
!	SCORING.F90
!	SUBCLASS.F90
!	
! 

module ButtonMod

use ifqwin
implicit none

private
type button
	private
	integer(2) :: buttonx, buttony
	integer(2) :: buttonxsize, buttonysize
end type
public Button, ButtonInit, ButtonWord, ButtonHit, ButtonPress

contains

subroutine ButtonInit(btn,x,y,sx,sy,str)
type(button) btn
integer x, y, sx, sy
type(xycoord) s
character*(*), optional :: str
integer i

btn%buttonx = x; btn%buttony = y
btn%buttonxsize = sx; btn%buttonysize = sy

i = setcolor(7)
i = rectangle( $GFILLINTERIOR, btn%buttonx, btn%buttony, &
	       btn%buttonx+btn%buttonxsize, btn%buttony+btn%buttonysize )
call ButtonPress( btn, .false. )
i = setcolor(0)
call moveto( btn%buttonx-2_2, btn%buttony-3_2, s )
i = lineto( btn%buttonx+btn%buttonxsize+2_2, btn%buttony-3_2 )
call moveto( btn%buttonx-3_2, btn%buttony-2_2, s )
i = lineto( btn%buttonx-3_2, btn%buttony+btn%buttonysize+2_2 )
call moveto( btn%buttonx-2_2, btn%buttony+btn%buttonysize+3_2, s )
i = lineto( btn%buttonx+btn%buttonxsize+2_2, btn%buttony+btn%buttonysize+3_2 )
call moveto( btn%buttonx+btn%buttonxsize+3_2, btn%buttony-2_2, s )
i = lineto( btn%buttonx+btn%buttonxsize+3_2, btn%buttony+btn%buttonysize+2_2 )
if( present( str ) ) then
	call ButtonWord(btn, str)
end if

end subroutine

subroutine ButtonWord( btn, str )
type( button ) btn
character*(*) str
type(xycoord) s
integer i

i = setcolor(7)
i = rectangle( $GFILLINTERIOR, btn%buttonx, btn%buttony, &
	       btn%buttonx+btn%buttonxsize, btn%buttony+btn%buttonysize )
i = setfont("t'Arial'h16be")
i = setcolor(0)
call moveto( btn%buttonx+(btn%buttonxsize/2)- &
		(getgtextextent(str(1:len_trim(str)))/2), &
	     btn%buttony+1, s )
call outgtext( str(1:len_trim(str)) )

end subroutine

logical function ButtonHit( btn, x, y )
type( button ) btn
integer x, y
ButtonHit = (x >= btn%buttonx-3 .and. x <= btn%buttonx+btn%buttonxsize+3 .and. &
	     y >= btn%buttony-3 .and. y <= btn%buttony+btn%buttonysize+3)
end function

subroutine ButtonPress( btn, InLogical )
type( button ) btn
logical InLogical
integer(2) In, i
integer(2), parameter :: Color(0:1) = (/ 15, 8 /)
record /xycoord/ s

In = InLogical
i = setcolor(Color(In))
call moveto( btn%buttonx-1_2, btn%buttony-1_2, s )
i = lineto( btn%buttonx-1_2, btn%buttony+btn%buttonysize )
call moveto( btn%buttonx-1_2, btn%buttony-1_2, s )
i = lineto( btn%buttonx+btn%buttonxsize, btn%buttony-1_2 )
call moveto( btn%buttonx-2_2, btn%buttony-2_2, s )
i = lineto( btn%buttonx-2_2, btn%buttony+btn%buttonysize+1_2 )
call moveto( btn%buttonx-2_2, btn%buttony-2_2, s )
i = lineto( btn%buttonx+btn%buttonxsize+1_2, btn%buttony-2_2 )
i = setcolor(Color(ieor(In,1)))
call moveto( btn%buttonx-1_2, btn%buttony+btn%buttonysize+1_2, s )
i = lineto( btn%buttonx+btn%buttonxsize, btn%buttony+btn%buttonysize+1_2 )
call moveto( btn%buttonx-2_2, btn%buttony+btn%buttonysize+2_2, s )
i = lineto( btn%buttonx+btn%buttonxsize, btn%buttony+btn%buttonysize+2_2 )
call moveto( btn%buttonx+btn%buttonxsize+1, btn%buttony-1, s )
i = lineto( btn%buttonx+btn%buttonxsize+1_2, btn%buttony+btn%buttonysize+2_2 )
call moveto( btn%buttonx+btn%buttonxsize+2_2, btn%buttony-2_2, s )
i = lineto( btn%buttonx+btn%buttonxsize+2_2, btn%buttony+btn%buttonysize+2_2 )

end subroutine

end module ButtonMod


