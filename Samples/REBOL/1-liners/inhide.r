
;; ======================================================
;; Script: inhide.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:07:56 UTC
;; owner: carl [script library member who can update this
;; script]
;; ======================================================
REBOL [
    Title: "Non-echoing Input"
    Date: 15-Sep-1999
    File: %inhide.r
    Purpose: "Hide input for passwords (no echo characters)"
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

print ask/hide "Password: "


