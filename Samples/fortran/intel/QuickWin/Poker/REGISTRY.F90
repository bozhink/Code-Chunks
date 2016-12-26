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
!

module pokerregistry

use scoring
use advapi32

logical RegMessage
integer RegXPos, RegYPos

character*(*), parameter :: KEYNAME =  &
 "Software\\Intel\\Compilers\\Fortran\\Samples\\Fortran Video Poker"C
character*(*), parameter :: KEYNAMEPAY =  &
 "Software\\Intel\\Compilers\\Fortran\\Samples\\Fortran Video Poker\\Paytable"C

contains

subroutine ReadRegistry()
integer(HANDLE) RegKey
integer i, j, namelen
character*20 name
logical l

! Defaults
RegMessage = .false.
RegXPos = 70
RegYPos = 70
Bet = 1
Credits = 100
CreditsIn = 100
CreditsOut = 0
HandsPlayed = 0
HandsPayoff = 0
HandsBet = 0
HandsScoring = 0
TensOrBetter = .false.

! Open and Read Registry Entries
if( RegOpenKeyEx( HKEY_CURRENT_USER, KEYNAME, 0, &
		  KEY_ALL_ACCESS, loc(RegKey) ) == ERROR_SUCCESS ) then
ilen = 4
if( RegQueryValueEx( RegKey, "Messages"C, 0, 0, loc(i), loc(ilen) ) &
		== ERROR_SUCCESS ) then
	RegMessage = i
end if
ilen = 4
if( RegQueryValueEx( RegKey, "XPosition"C, 0, 0, loc(i), loc(ilen) ) &
		== ERROR_SUCCESS ) then
	RegXPos = i
end if
ilen = 4
if( RegQueryValueEx( RegKey, "YPosition"C, 0, 0, loc(i), loc(ilen) ) &
		== ERROR_SUCCESS ) then
	RegYPos = i
end if
ilen = 4
if( RegQueryValueEx( RegKey, "Bet"C, 0, 0, loc(i), loc(ilen) ) &
		== ERROR_SUCCESS ) then
	Bet = i
end if
ilen = 4
if( RegQueryValueEx( RegKey, "Credits"C, 0, 0, loc(i), loc(ilen) ) &
		== ERROR_SUCCESS ) then
	Credits = i
end if
ilen = 4
if( RegQueryValueEx( RegKey, "HandsPlayed"C, 0, 0, loc(i), loc(ilen) ) &
		== ERROR_SUCCESS ) then
	HandsPlayed = i
end if
ilen = 4
if( RegQueryValueEx( RegKey, "HandsScoring"C, 0, 0, loc(i), loc(ilen) ) &
		== ERROR_SUCCESS ) then
	HandsScoring = i
end if
ilen = 4
if( RegQueryValueEx( RegKey, "HandsPayoff"C, 0, 0, loc(i), loc(ilen) ) &
		== ERROR_SUCCESS ) then
	HandsPayoff = i
end if
ilen = 4
if( RegQueryValueEx( RegKey, "HandsBet"C, 0, 0, loc(i), loc(ilen) ) &
		== ERROR_SUCCESS ) then
	HandsBet = i
end if
ilen = 4
if( RegQueryValueEx( RegKey, "CreditsIn"C, 0, 0, loc(i), loc(ilen) ) &
		== ERROR_SUCCESS ) then
	CreditsIn = i
end if
ilen = 4
if( RegQueryValueEx( RegKey, "CreditsOut"C, 0, 0, loc(i), loc(ilen) ) &
		== ERROR_SUCCESS ) then
	CreditsOut = i
end if
endif
if( RegOpenKeyEx( HKEY_CURRENT_USER, KEYNAMEPAY, &
	          0, KEY_ALL_ACCESS, loc(RegKey) ) == ERROR_SUCCESS ) then
do j = 1, ubound(winners,1)
	ilen = 4
	name = winners(j)%label
	namelen = len_trim( winners(j)%label )
	name(namelen+2:namelen+3) = "1"//char(0)
	if( RegQueryValueEx( RegKey, name, 0, 0, loc(i), loc(ilen) ) == ERROR_SUCCESS ) then
		if( i <= MAXPAY1 .and. i >= 0 ) &
			winners(j)%payoff = i
	end if
	name(namelen+2:namelen+3) = "5"//char(0)
	if( RegQueryValueEx( RegKey, name, 0, 0, loc(i), loc(ilen) ) == ERROR_SUCCESS ) then
		if( i <= MAXPAY5 .and. i >= 0 ) &
			winners(j)%payoff5 = i	
	end if
end do
l = RegCloseKey( RegKey )
end if
end subroutine

subroutine WriteRegistry()
integer(HANDLE) RegKey
integer Disp
character*20 name
integer i, j, namelen
logical l

i = RegCreateKeyEx( HKEY_CURRENT_USER, KEYNAME, 0, &
		    "Application Per-User Data"C, &
	            REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, &
		    NULL_SECURITY_ATTRIBUTES, &
		    loc(RegKey), loc(Disp) )
if( i == ERROR_SUCCESS ) then
    i = RegSetValueEx( RegKey, "Messages"C, 0, REG_DWORD, loc(RegMessage), 4 )
    i = RegSetValueEx( RegKey, "XPosition"C, 0, REG_DWORD, loc(RegXPos), 4 )
    i = RegSetValueEx( RegKey, "YPosition"C, 0, REG_DWORD, loc(RegYPos), 4 )
    i = RegSetValueEx( RegKey, "Bet"C, 0, REG_DWORD, loc(Bet), 4 )
    i = RegSetValueEx( RegKey, "Credits"C, 0, REG_DWORD, loc(Credits), 4 )
    i = RegSetValueEx( RegKey, "HandsPlayed"C, 0, REG_DWORD, loc(HandPlayed), 4 )
    i = RegSetValueEx( RegKey, "HandsScoring"C, 0, REG_DWORD, loc(HandScoring), 4 )
    i = RegSetValueEx( RegKey, "HandsPayoff"C, 0, REG_DWORD, loc(HandPayoff), 4 )
    i = RegSetValueEx( RegKey, "HandsBet"C, 0, REG_DWORD, loc(HandBet), 4 )
    i = RegSetValueEx( RegKey, "CreditsIn"C, 0, REG_DWORD, loc(CreditsIn), 4 )
    i = RegSetValueEx( RegKey, "CreditsOut"C, 0, REG_DWORD, loc(CreditsOut), 4 )
    l = RegCloseKey( RegKey )
end if
i = RegCreateKeyEx( HKEY_CURRENT_USER, KEYNAMEPAY, 0, &
		    "Application Per-User Data"C, &
	            REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, &
		    NULL_SECURITY_ATTRIBUTES, &
		    loc(RegKey), loc(Disp) )
if( i == ERROR_SUCCESS ) then
    do j = 1, ubound(winners,1)	
	name = winners(j)%label
	namelen = len_trim(winners(j)%label)
	name(namelen+2:namelen+3) = "1"//CHAR(0)
        i = RegSetValueEx( RegKey, name, 0, REG_DWORD, loc(winners(j)%payoff), 4 )
	if( winners(j)%payoff5 >= 0 ) then
	     name(namelen+2:namelen+3) = "5"//CHAR(0)
	     i = RegSetValueEx( RegKey, name, 0, REG_DWORD, loc(winners(j)%payoff5), 4 )	
	end if
    end do
    l = RegCloseKey( RegKey )
end if
end subroutine

subroutine SaveRegistry()
logical i
record /qwinfo/ qwi
i = GetWSizeQQ( QWIN$FRAMEWINDOW, QWIN$SIZECURR, qwi )
RegXPos = qwi.x
RegYPos = qwi.y
call WriteRegistry()
end subroutine

end module

