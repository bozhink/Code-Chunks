
;; ===============================================
;; Script: roman.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:21:57 UTC
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
    Title: "Roman"
    Date: 3-Jul-2002
    Name: 'Roman
    Version: 1.0.0
    File: %roman.r
    Author: "Andrew Martin"
    Purpose: "Converts a Roman numeral to Arabic and reverse!"
    eMail: %Al--Bri--xtra--co--nz
    Web: http://valley.150m.com
    Acknowledgements: {Christian "CHE" Ensel}
    Example: [
    Roman "IX" 
    Roman "LXXXI" 
    Roman "MCMLII" 
    Roman "MMI" 
    Roman "MIM" 
    Roman "MMMCMXCIX" 
    Roman 9 
    Roman 81 
    Roman 1952 
    Roman 2001 
    Roman 3999 
    Roman "XXXXV"
]
    library: [
        level: 'advanced 
        platform: none 
        type: 'tool 
        domain: 'math 
        tested-under: none 
        support: none 
        license: none 
        see-also: none
    ]
]

Roman: function [
	{Converts a Roman numeral to Arabic and reverse!
	Returns 'none if it can't convert the number.}
	[catch]
	Number [string! integer!] {The Roman "MMMCMXCIX" or Arabic 3999 number to convert.}
	][
	Roman-Arabic Result
	][
	throw-on-error [
		Roman-Arabic: compose [
			M	1000
			CM	(-100 + 1000)
			D	500
			CD	(-100 + 500)
			C	100
			XC	(-10 + 100)
			L	50
			XL	(-10 + 50)
			X	10
			IX	(-1 + 10)
			V	5
			IV	(-1 + 5)
			I	1
			]
		either string? Number [
			Result: 0
			if not parse/all Number [
				0 3 ["M" (Result: Result + Roman-Arabic/M)]
				opt [
					"CM" (Result: Result + Roman-Arabic/CM)
					| "D" (Result: Result + Roman-Arabic/D)
					| "CD" (Result: Result + Roman-Arabic/CD)
					]
				0 3 ["C" (Result: Result + Roman-Arabic/C)]
				opt [
					"XC" (Result: Result + Roman-Arabic/XC)
					| "L" (Result: Result + Roman-Arabic/L)
					| "XL" (Result: Result + Roman-Arabic/XL)
					]
				0 3 ["X" (Result: Result + Roman-Arabic/X)]
				opt [
					"IX" (Result: Result + Roman-Arabic/IX)
					| "V" (Result: Result + Roman-Arabic/V)
					| "IV" (Result: Result + Roman-Arabic/IV)
					]
				0 3 ["I" (Result: Result + Roman-Arabic/I)]
				end
				][
				Result: none
				]
			][
			if all [0 <= Number Number <= 3999] [
				Result: make string! 10
				foreach [Roman Arabic] Roman-Arabic [
					while [Arabic <= Number][
						append Result Roman
						Number: Number - Arabic
						]
					]
				]
			]
		Result
		]
	]

