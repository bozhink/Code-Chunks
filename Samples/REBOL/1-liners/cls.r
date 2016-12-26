
;; ===============================================
;; Script: cls.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:06:21 UTC
;; owners: ajmartin + timjohnsonsw [script library
;; members who can update this script]
;; ===============================================
;; ===================================================
;; email address(es) have been munged to protect
;; them from spam harvesters.
;; If you were logged on the email addresses would not
;; be munged
;; ===================================================
REBOL [
    Title: "CLS"
    Date: 3-Jul-2002
    Name: 'CLS
    Version: 1.0.0
    File: %cls.r
    Author: "Andrew Martin"
    Purpose: "Clears the console screeen."
    eMail: %Al--Bri--xtra--co--nz
    Web: http://valley.150m.com
    library: [
        level: 'beginner 
        platform: none 
        type: [one-liner tool]
        domain: none 
        tested-under: none 
        support: none 
        license: none 
        see-also: none
    ]
]

CLS: does [prin "^(page)"]

