
;; =================================================
;; Script: ftprename.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:07:05 UTC
;; owner: carl [script library member who can update
;; this script]
;; =================================================
;; ===============================================
;; email address(es) have been munged to protect
;; them from spam harvesters.
;; If you were logged on the email addresses would
;; not be munged
;; ===============================================
REBOL [
    Title: "Rename a File"
    Date: 26-May-1999
    File: %ftprename.r
    Purpose: "Rename a file on a server using FTP."
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

rename ftp://user:%pass--ftp--site--com/foo.r %bar.r

