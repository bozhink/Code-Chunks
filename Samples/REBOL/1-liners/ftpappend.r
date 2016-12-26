
;; ==============================
;; Script: ftpappend.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 13:06:39 UTC
;; 
;; ==============================
;; ==================================================
;; email address(es) have been munged to protect them
;; from spam harvesters.
;; If you were logged on the email addresses would
;; not be munged
;; ==================================================
REBOL [
    Title: "Append to a Text File"
    Date: 26-May-1999
    File: %ftpappend.r
    Purpose: "Append to a text file using FTP."
    library: [
        level: 'beginner 
        platform: none 
        type: [FAQ one-liner] 
        domain: 'ftp 
        tested-under: none 
        support: none 
        license: none 
        see-also: none
    ]
    Version: 1.0.0
    Author: "Anonymous"
]

write/append ftp://user:%pass--ftp--site--com/log.txt join "date: " now

