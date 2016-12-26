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
! POKER -- Video Poker in Fortran with QuickWin
!
!

!======================================================================
!
! Module Layout		(Object size and location in the Poker window)
!
module layout
use cards
use ifqwin
implicit none

!!! Overall poker window size and location
integer(2), parameter :: WindowSizeX = 480, WindowSizeY = 350

!!! Button location and size
integer(2), parameter :: DealButtonX = 340, DealButtonY = 97
integer(2), parameter :: DealButtonXSize = 110, DealButtonYSize = 18

!!! Layout for scoreboard
integer(2), parameter :: LabelCol1X = 20
integer(2), parameter :: NumCol1X = 160
integer(2), parameter :: LabelCol2X = 170
integer(2), parameter :: NumCol2X = 310
integer(2), parameter :: LabelY = 20
integer(2), parameter :: YOff = 20
integer(2), parameter :: LineXOff = 5
integer(2), parameter :: LineYOff = 3

!!! Layout for Credits and Bet display
integer(2), parameter :: TextX = 330
integer(2), parameter :: NumX = 462
integer(2), parameter :: CreditY = 38
integer(2), parameter :: BetY = 14

!!! Layout for Winner sign
integer(2), parameter :: WinnerX = 336
integer(2), parameter :: WinnerY = 62
integer(2), parameter :: WinnerYSize = 25
integer(2), parameter :: WinnerXSize = 120

!!! Layout for messages
integer(2), parameter :: MessageY = 130
integer(2), parameter :: MessageYSize = 20

contains

!!! Given a card's number, these routines return the X and Y for
!!! that card's location.
integer(2) function cardx(cnum)
	integer cnum
	cardx = (20 + ((cnum-1)*(CardSizeX+20)))
end function
integer(2) function cardy(cnum)
	integer cnum
	cardy = 160
end function

end module layout

module dlock
use kernel32
private
public DrawLockInit, DrawLock, DrawUnlock
type(t_rtl_critical_section) drawlockcs
contains
subroutine DrawLockInit()
call initializecriticalsection(loc(drawlockcs))
end subroutine
subroutine DrawLock()
call entercriticalsection(loc(drawlockcs))
end subroutine
subroutine DrawUnlock()
call leavecriticalsection(loc(drawlockcs))
end subroutine
end module

module testhand
!DEC$ if defined(TESTHAND)
use cards

type(CARD), parameter :: testcards(16*5) = (/ &
CARD(1,CardJack), CARD(1,CardAce), CARD(1,CardQueen), CARD(1,CardKing), CARD(1,10), &  ! Royal Flush
CARD(3,CardJack), CARD(3,CardQueen), CARD(3,10), CARD(3,CardKing), CARD(3,CardAce), &  ! Royal Flush
CARD(1,CardJack), CARD(1,9), CARD(1,CardQueen), CARD(1,CardKing), CARD(1,10), &        ! Straight Flush
CARD(4,2), CARD(4,3), CARD(4,4), CARD(4,5), CARD(4,CardAce), &                         ! Straight Flush (low)
CARD(1,8), CARD(3,8), CARD(1,2), CARD(4,8), CARD(2,8), &							   ! Four of a Kind
CARD(3,CardKing), CARD(2,10), CARD(2,CardKing), CARD(1,10), CARD(4,CardKing), &		   ! Full House
CARD(4,9), CARD(3,2), CARD(4,2), CARD(1,2), CARD(3,9), &						       ! Full House
CARD(3,3), CARD(3,5), CARD(3,7), CARD(3,CardQueen), CARD(3,4), &                       ! Flush
CARD(4,2), CARD(4,3), CARD(4,4), CARD(4,5), CARD(4,10), &                         ! Flush
CARD(1,CardJack), CARD(1,CardAce), CARD(2,CardQueen), CARD(1,CardKing), CARD(1,10), &  ! Straight
CARD(1,8), CARD(3,5), CARD(2,7), CARD(4,6), CARD(2,4), &                               ! Straight
CARD(2,3), CARD(2,CardAce), CARD(3,4), CARD(4,2), CARD(1,5), &                         ! Straight (low)
CARD(2,9), CARD(3,2), CARD(3,9), CARD(4,9), CARD(4,4), &							   ! Three of a Kind
CARD(1,7), CARD(2,5), CARD(4,5), CARD(3,2), CARD(4,7), &							   ! Two Pair
CARD(1,2), CARD(2,3), CARD(4,CardJack), CARD(3,4), CARD(3,CardJack), &				   ! Jacks or Better
CARD(1,10), CARD(3,2), CARD(4,5), CARD(2,7), CARD(2,10) &
/)
integer :: testtop = 1
!DEC$ endif
end module




