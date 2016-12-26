
;; ==========================================
;; Script: fahrenheit.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:17:03 UTC
;; owner: ajmartin [script library member who
;; can update this script]
;; ==========================================
;; ==================================================
;; email address(es) have been munged to protect them
;; from spam harvesters.
;; If you were logged on the email addresses would
;; not be munged
;; ==================================================
REBOL [
    Title: "Fahrenheit"
    Date: 3-Jul-2002
    Name: 'Fahrenheit
    Version: 1.0.0
    File: %fahrenheit.r
    Author: "Andrew Martin"
    Purpose: "Converts Temperature in Celcius to Fahrenheit."
    eMail: %Al--Bri--xtra--co--nz
    Web: http://valley.150m.com
    Example: [
    Fahrenheit 0 
    Fahrenheit 100
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

Fahrenheit: func [
	"Converts Temperature in Celcius to Fahrenheit."
	Temperature [number!]	"Temperature in degrees Celcius."
	][
	Temperature * 9 / 5 + 32
	]

