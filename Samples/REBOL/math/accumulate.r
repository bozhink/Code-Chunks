
;; ===============================================
;; Script: accumulate.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:14:35 UTC
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
    Title: "Accumulate"
    Date: 3-Jul-2002
    Name: 'Accumulate
    Version: 1.0.1
    File: %accumulate.r
    Author: "Andrew Martin"
    Purpose: {Cumulates values in a block together, by successively applying the function to each value in Series.}
    eMail: %Al--Bri--xtra--co--nz
    Web: http://valley.150m.com
    Acknowledgements: [
        "Ladislav Mecir" 
        "Carl Sassenrath"
    ]
    Example: [
        Accumulate 0 [1 2 3 4 5] :+
    ]
    library: [
        level: 'intermediate 
        platform: none 
        type: 'function 
        domain: 'math 
        tested-under: none 
        support: none 
        license: none 
        see-also: none
    ]
]

Accumulate: func [
	{Cumulates values in a block together,
	by successively applying the function
	to each value in Series.}
	[catch]
	Accumulator [any-type!]
	Series [series!]
	F [any-function!]
	"Function that takes two parameters, Accumulator and Item."
	] [
	throw-on-error [
		foreach Item Series [
			Accumulator: F Accumulator :Item
			]
		:Accumulator
		]
	]

