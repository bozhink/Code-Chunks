
;; ===================================================
;; Script: cd-track-titles.r
;; downloaded from: www.REBOL.org
;; on: 5-May-2008
;; at: 12:57:14 UTC
;; owner: rvdzee [script library member who can update
;; this script]
;; ===================================================
REBOL [
    Title: "CD Track Titles"
    Date: 30-01-2008
    File: %cd-track-titles.r
    Author: R. v.d.Zee
    Owner:   "R. v.d.Zee"
    Rights:  "Copyright (C) R. v.d.Zee 2008"
    Purpose: {
         This script illustrates a method of obtaining the track titles of music CDs so
         that the titles may become part of a CD directory or data base - without typing
         each title in manually.
    }
    Library: [
        level: 'beginner
        platform: 'all
        type: [demo how-to]
        domain: [cgi shell]
        support: none
        tested-under: [View 1.3.2.3.1 [Windows]]
        license: none
    ]

    Note: {
       The 8Hex Digit ID needed to extract the CD data from the Freedb.org data bank is provided  by "discid", 
       a small C++ program.  "discid" may be obtained from http://discid.sourceforge.net/ (Roland Schäuble) 
       This download is a compressed tar file and includes versions for other operating systems.

       If using the Windows operating system, "7-zip", http://www.7-zip.org/" is an open source application
       that might be useful to extract the necessary file from the distribution.
  
       The required executable file in the uncompressed distribution folder is:
               discid-0.1.3/src/win32/native/release/discid -  and  it is all 
       that is needed.  This file is to be placed in the current path, that is, C:\WINDOWS\system32.

       The Rebol command "call/output" is used to call "discid" and to capture the "discid" output.  An example
       of "discid" output is:

                       670FF708 8 150 76675 109525 133450 150400 199300 220900 256900 4089

       670FF708 is the CD's ID, there are 8 tracks and the total time is 4,089 seconds.  The rest of the integers
       represent track offsets. A track offset is the measure of the track starting point from the start of the CD,
       and is measured in "frames".  The duration of a frame is 1/.75 seconds. 

       The Freedb cgi command line: 

             "cmd=cddb+read+classical+670FF708&hello=rkv+telus.com.au+rebol+.1.3.2.3.1&proto=6"

       or:
           - database         "cddb"
           - command          "read"
           - genre            "classical"
           - 8hex id code     "670FF708"
           - user's id        "Example-User"
           - user's isp       "example.com"
           - client name      "rebol"
           - client version   "1.3.2.3.1"
           - protocol #       "proto=6"

        The script assumes that drive "E" is the CD drive.  The Freedb.org output is displayed and may
        be copied to the clipboard.  (or the output could be parsed & entered into a local database.)

        The script will work with the default values of "Example-User" and "example.com".
        Supplying the user's correct information is encouraged, two fields are included for this.
        The script will save the new user name and isp back to the script, see the "Quit" button
        scripts. 

        Note that a search with a "Misc" genre & the id code "670ff708" provides the titles of the CD
        "SINTFLUT_CD8_von_8",  Marianne Fredriksson. But a search with a "Classical" genre
        and the same id code "670ff708" also provides titles for "The Best of Liszt, Franz Liszt".
        If it occurs that the track offset data and times of the CD are the same as other CDs, then
        the id code generated by that data may not be unique.

        Other scripts that may be of interest: 
        -  %gunzip.r a script by Vincent Ecuyer that can decompress tar files.

        This script is provided "as is", without warranty of any kind, express or implied, 
        including but not limited to the warranties of merchantability, fitness for a particular 
        purpose and non infringement. In no event shall the author or copyright holder(s) be liable 
        for any claim, damages or other liability, whether in an action of contract, tort or otherwise,
        arising from, out of or in connection with the software or the use or other dealings in 
        this script.
       }
]


genres: ["Blues""Folk""Reggae""Classical""Jazz""Rock""Country""Misc""Soundtrack""Data""New Age"]
sort genres
insert genres "Genres"
genre-selected?: false


colors: [
    pen none 
    fill-pen cubic 1158x1009 0 63 241 5 7 192.192.192.206 0.255.0.226 72.0.90.202 179.179.126.192 255.0.255.230 
    220.20.60.176 128.128.128.185 38.58.108.225 80.108.142.215 0.0.0.183 128.0.128.157 64.64.64.172 38.58.108.190
    160.180.160.158 245.222.129.195 38.58.108.132 139.69.19.158 0.128.0.226 222.184.135.195 255.0.0.198 0.0.128.230 
    box 0x0 500x440 
    pen none 
    fill-pen linear -336x-57 0 145 9 3 9 255.0.0.131 175.155.120.211 80.108.142.221 250.240.230.176 44.80.132.169
    255.255.240.209 64.64.64.163 128.0.128.178 64.64.64.149 44.80.132.212 255.255.255.168 72.0.90.152 175.155.120.185
    255.255.255.217 255.255.0.184 0.255.255.172 0.48.0.218 0.128.0.154 76.26.0.140 76.26.0.144 255.255.240.182 44.80.132.234
    box 0x0 500x440 
    pen none 
    fill-pen conic 1094x1139 0 265 330 9 6 222.184.135.158 245.222.129.218 240.240.240.214 255.255.240.224 245.222.129.225
    255.0.255.232 76.26.0.128 192.192.192.216 80.108.142.187 220.20.60.144 72.72.16.209 0.128.128.161 170.170.170.166
    255.80.37.208 240.240.240.162 178.34.34.212 44.80.132.169 44.80.132.147 160.180.160.160 44.80.132.175 0.128.128.218
    box 0x0 500x440
    ]


view layout [
    size 500x440
    backdrop effect [gradient 0x1 255.255.255 190.190.190 draw colors]
    across
    space 0
    information: area 440x340 black black wrap  with [font/color: green]
    info-scroller: scroller 16x340 black coal [scroll-para information info-scroller]
    return
    space 1
    pad 40x2
 
    enter-user: field black black "Example-User" 
    enter-isp:  field black black "example.com"
    return
    pad 250x4

    choose-genre: choice data genres 70x22 233.233.233 green left with [
        edge/size: 1x1
        edge/color: coal 
        font/colors: [0.0.0 255.0.0] 
        font/shadow: font/style: none
        font/size: 11
    ][
        if face/text <> "Genres" [
            genre: lowercase trim/all copy face/text
            genre-selected?: true
        ]
    ]

    btn "Get Titles" [
        if exists? %/e [
            either genre-selected? [
                genre-selected?: false
                if info-scroller/data <> 0 [reset-face info-scroller reset-face information]
                information/text: "discid is examining the Cd"
                show information
                discid-output: make string! 100
                call/output [%/c/windows/system32/discid] discid-output
                wait 1
                information/text: join "discid output is:" newline
                append information/text join newline discid-output
                show information
                append information/text {
            
                    Accessing Freedb.Org...
                }
                show information
                genre: lowercase trim/all copy choose-genre/text
                disc-data: parse discid-output none
                disc-id: first disc-data
                user-name: trim/all copy enter-user/text
                isp:       trim/all copy enter-isp/text
                command-string: rejoin ["cmd=cddb+read+" genre "+" disc-id "&hello="  user-name  "+"  isp  "+rebol+.1.32&proto=6"]
                freedb-output: read/binary/custom http://freedb.freedb.org/~cddb/cddb.cgi reduce ['POST command-string]
                information/text: to-string freedb-output
                choose-genre/data: head choose-genre/data
                choose-genre/text: first choose-genre/data
                show [choose-genre information]
            ][
                alert "Please Select A Genre"
            ] 
        ]
    ]

    btn "Close" [
        script-lines: read/lines %cd-track-titles.r
        while [not find first script-lines "enter-user:"][script-lines: next script-lines]
        parse first  script-lines [thru "^"" copy old-user to "^""]
        parse second script-lines [thru "^"" copy old-isp  to "^""]
        if any [
            old-user <> enter-user/text
            old-isp  <>  enter-isp/text
        ][
            save-changes: confirm "Save User/ISP Changes?"
            if save-changes [
                replace first  script-lines old-user trim/all enter-user/text
                replace second script-lines old-isp  trim/all enter-isp/text
                script-lines: head script-lines
                write/lines %cd-track-titles.r script-lines
            ]
            script-lines: head script-lines
        ]
        quit
    ]
]
