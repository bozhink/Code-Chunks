REBOL [Type: 'index]

title "REBOL Central Folder"
summary "The portal to REBOL sites, demos, tests, and more."

folder "Demos" %view/demos/index.r
info "Demos of REBOL/View"

folder "Games" %view/games/index.r
info "REBOL Games"

folder "Tools" %view/tools/index.r
info "Useful utilities and scripts" icon tool

folder "Docs"  %view/docs/index.r
info "Documentation for REBOL"

folder "Public" %view/public.r
info "Public REB-sites"

folder "Services" http://www.rebol.net/rebservices/index.r
info "REBOL/Services docs and demos"

folder "Tests" http://www.rebol.net/tests/index.r
info "A few REBOL Tests"

link " Feedback " http://www.rebol.com/feedback.html icon email
info "Send feedback to REBOL Technologies"

;file "Feedback" %view/demos/feedback.r  [2168 2-July-2001/19:27-7:00] icon email
;info "Use this to report bugs and suggest enhancements"

link "REBOL Web" http://www.rebol.com/index.html icon %view/desktop/icons/hq.gif
info "View REBOL's web site"

file " About " %view/intro.txt icon %view/desktop/icons/read.gif
info "Introduction to the REBOL desktop."

folder "Contest" http://www.rebol.net/demos/index.r
info "REBOL demo contest scripts"
