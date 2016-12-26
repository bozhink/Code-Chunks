
;; ====================================================
;; Script: helloworld.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:07:39 UTC
;; owner: yeksoon [script library member who can update
;; this script]
;; ====================================================
REBOL [
    Title: "Great Computer Language Shootout : hello"
    Date: 27-Sep-2005
    File: %helloworld.r
    Purpose: "To test startup time in the Great Computer Language Shootout"
    Note: {
      The Great Computer Language Shootout
      http://shootout.alioth.debian.org/
      
    }
    library: [
        level: 'beginner 
        platform: [windows *nix mac]
        type: [one-liner] 
        domain: [shell text]
        tested-under: none 
        support: none 
        license: none 
        see-also: none
    ]
    Version: 1.0.0
    Author: "Lok Yek Soon"
]
print "hello world"
