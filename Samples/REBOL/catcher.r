
;; ==============================
;; Script: catcher.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 12:57:53 UTC
;; 
;; ==============================
;; ===============================================
;; email address(es) have been munged to protect
;; them from spam harvesters.
;; If you were logged on the email addresses would
;; not be munged
;; ===============================================
REBOL [
    Title: "Throwing and Catching Named Values"
    Date: 16-Jun-1999
    File: %catcher.r
    Author: "Jeff Kreis"
    Purpose: "Throwing and catching functions."
    Email: %jeff--rebol--com
    library: [
        level: 'intermediate 
        platform: 'all 
        type: [Demo Tool How-to] 
        domain: 'x-file 
        tested-under: none 
        support: none 
        license: none 
        see-also: none
    ]
    Version: 1.0.0
]

random/seed now

catcher: func [][
    return catch/name [
        return catch/name [
            if random true [
                throw/name func [][print "I am primus"] 'primus
            ]
            if random false [
                throw/name func [][print "I am secondus"] 'secondus
            ]
            func [][print "I made it through untouched!"]
        ] 'secondus 
    ] 'primus  
    func[][print "How'd I get down here?"]
]

loop 20 [do catcher] 

