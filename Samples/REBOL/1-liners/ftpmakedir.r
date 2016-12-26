
;; =================================================
;; Script: ftpmakedir.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:06:55 UTC
;; owner: carl [script library member who can update
;; this script]
;; =================================================
;; ===================================================
;; email address(es) have been munged to protect
;; them from spam harvesters.
;; If you were logged on the email addresses would not
;; be munged
;; ===================================================
REBOL [
    Title: "Make a directory"
    Date: 26-May-1999
    File: %ftpmakedir.r
    Purpose: "Make a file directory on an FTP server."
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

make-dir ftp://user:%pass--ftp--site--com/newdir/

