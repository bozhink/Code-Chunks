REBOL [
Title: "User Preferences"
Date:  26-Jan-2011/16:04:31+2:00
]

set-net [ none   none none none ]
set-user-name "A Rebol"
if (not none? system/view) [
system/view/screen-face/options: none
]
