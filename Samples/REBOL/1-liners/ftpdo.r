
;; =================================================
;; Script: ftpdo.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:06:50 UTC
;; owner: carl [script library member who can update
;; this script]
;; =================================================
REBOL [
    Title: "Run Script from FTP"
    Date: 26-May-1999
    File: %ftpdo.r
    Purpose: "Do a REBOL script via FTP."
    library: [
        level: 'beginner 
        platform: none 
        type: 'one-liner
        domain: [ftp other-net] 
        tested-under: none 
        support: none 
        license: none 
        see-also: none
    ]
]

do ftp://ftp.site.com/scripts/test.r

