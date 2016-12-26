
;; ===============================================
;; Script: round.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:22:38 UTC
;; owners: ajmartin + timjohnsonsw [script library
;; members who can update this script]
;; ===============================================
;; ===============================================
;; email address(es) have been munged to protect
;; them from spam harvesters.
;; If you were logged on the email addresses would
;; not be munged
;; ===============================================
REBOL [
    Title: "Round"
    Date: 31-Aug-2002
    Name: 'Round
    Version: 1.0.1
    File: %round.r
    Author: "Andrew Martin"
    Purpose: {
^-^-Rounds a number at any given place.
^-^-}
    eMail: %Al--Bri--xtra--co--nz
    Web: http://valley.150m.com
    Acknowledgements: {
^-^-Thanks to Geo Massar and for his example code.
^-^-Thanks to Christian "CHE" Ensel for inspiration.
^-^-}
    Example: [
    round 123.45 
    round 123.55 
    round -123.45 
    round -123.55 
    round/at 123.344 2 
    round/at 123.345 2 
    round/at 12345 -2 
    round/at -12345 -2 
    round/at (1.22 // 1E-2) 2 
    round/at 214748.36471 4 
    round/at 214748.36477 4
]
    library: [
        level: 'beginner 
        platform: none 
        type: 'tool 
        domain: 'math 
        tested-under: none 
        support: none 
        license: none 
        see-also: none
    ]
]

Round: func [
	"Rounds a Number At any given Place."
	[catch]
	Number [number!]	"Number to round."
	/At Place [integer!]	"Optional Places."
	][
	throw-on-error [
		Place: either none? Place [1] [10 ** Place]
		Number: Place * Number
		Number: Number + either positive? Number [0.5][-0.5]
		Number: Number - (Number // 1)
		Number / Place
		]
	]

