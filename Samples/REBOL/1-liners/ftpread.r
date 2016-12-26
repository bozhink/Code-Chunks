
;; =================================================
;; Script: ftpread.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:07 UTC
;; owner: carl [script library member who can update
;; this script]
;; =================================================
REBOL [
    Title: "Read a Text File"
    Date: 26-May-1999
    File: %ftpread.r
    Purpose: "Read a text file from an FTP server and print it."
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

print read ftp://ftp.site.com/file.r

