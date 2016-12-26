
;; ===============================================
;; Script: mini-calc.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:20:15 UTC
;; owner: skurunner [script library member who can
;; update this script]
;; ===============================================
;; ==================================================
;; email address(es) have been munged to protect them
;; from spam harvesters.
;; If you were logged on the email addresses would
;; not be munged
;; ==================================================
REBOL [
    Title: "Mini-Calculator"
    Date: 6-Mar-2002
    Version: 1.1.3
    File: %mini-calc.r
    Author: "Ryan Cole"
    Purpose: "Tiny calculator example."
    Email: %ryancole--usa--com
    library: [
        level: 'intermediate 
        platform: none 
        type: none 
        domain: [math GUI] 
        tested-under: none 
        support: none 
        license: none 
        see-also: none
    ]
]

reg: []
op: no
 
do solve: does [
    acc: none
    if op [error? try [acc: do reform [any [reg/2 acc 0] op 'to-decimal reg/1]]]
    reg: copy []
    op: no
]

calc: func [key] [
    if find ".0123456789" key [
        if none? pick reg not op [insert reg copy ""]
        if not all ["." = key  find reg/1 key] [append reg/1 key]
    ]
    if find "+-*/" key [
        if reg/2 [solve]
        any [reg/1 insert reg any [acc 0]] 
        op: key
    ]
    if key = "=" [solve]
]

view layout [
    origin 0x0 space 0x0 across
    lcd: field "0." silver 140x22 right feel none
    return
    style k button 35x25 [
        calc face/text
        if not find lcd/text: form any [reg/1 acc 0] "." [append lcd/text "."] 
        show lcd
    ]
    k "7" k "8" k "9" k "/" return
    k "4" k "5" k "6" k "*" return
    k "1" k "2" k "3" k "-" return
    k "0" k "." k "=" k "+"
]                                               
