
;; ====================================================
;; Script: oneliner-chess-board.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:08:44 UTC
;; owner: sunanda [script library member who can update
;; this script]
;; ====================================================
Rebol [
    Title: "Chess board"
    Date: 20-Jul-2003
    File: %oneliner-chess-board.r
    Purpose: "Displays an empty chess board"
    One-liner-length: 126
    Version: 1.0.0
    Author: "Sunanda"
    Library: [
        level: 'beginner
        platform: 'all
        type: [How-to FAQ one-liner]
        domain: 'game
        tested-under: none
        support: none
        license: 'pd
        see-also: none
    ]
]
g:[style b box black 50x50 style w b white space 0x0]loop 8[append g head reverse/part [b w b w b w b w return]8]view layout g

