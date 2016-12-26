
;; ============================================
;; Script: oneliner-cd.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:08:39 UTC
;; owner: romano [script library member who can
;; update this script]
;; ============================================
Rebol [
    Title: "Change directory"
    Date: 20-Jul-2003
    File: %oneliner-cd.r
    Purpose: {Used alone, return the actual dir. Used with a dir name, changes the actual dir and
return the new dir.}
    One-liner-length: 66
    Version: 1.0.0
    Author: "Romano Paolo Tenca"
    Library: [
        level: 'beginner
        platform: none
        type: [How-to FAQ one-liner function]
        domain: [file-handling]
        tested-under: none
        support: none
        license: none
        see-also: none
    ]
]
cd: func [d [unset! file!]][if value? 'd [change-dir d] what- dir]

