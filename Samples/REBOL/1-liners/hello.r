
;; ==========================================
;; Script: hello.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:07:29 UTC
;; owner: carl [script library member who can
;; update this script]
;; ==========================================
REBOL [
    Title: "Hello World Window"
    Date: 20-May-2000
    File: %hello.r
    Purpose: {Opens a window that displays text and a quit button}
    library: [
        level: 'beginner 
        platform: none 
        type: 'one-liner
        domain: [GUI] 
        tested-under: none 
        support: none 
        license: none 
        see-also: none
    ]
]

view layout [text "Hello World!" button "Quit" [quit]]


