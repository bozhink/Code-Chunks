
;; ============================================
;; Script: round-2.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:22:29 UTC
;; owner: coccinelle [script library member who
;; can update this script]
;; ============================================
;; ==================================================
;; email address(es) have been munged to protect them
;; from spam harvesters.
;; If you were logged on the email addresses would
;; not be munged
;; ==================================================
    REBOL [
    	File: %round-2.r
    	Date: 23-july-2004
    	Title: "Round Function"
    	Purpose: "A function to round a number"
                     Author: "Marco"
    	Library: [
                          level: 'intermediate
                          platform: 'all
                          type: [tutorial tool]
                          domain: [math]
                          tested-under: [View 1.2.47.3.1 Windows XP]
                          support: %marco--ladyreb--org
                          license: PD
   	]
]
round: func [
    "Rounds a number"
    number [number!]
    /to precision [number!] "to a given precision"
    /at place [integer!] "at a given place"
    /up /down
][
    to: any [
        all [at power 10 multiply place -1]
        precision
        1
    ]
    precision: multiply sign? number any [
        all [up 1]
        all [down 0]
        .5
    ]
    multiply subtract number: add divide number to precision remainder number 1 to
]
