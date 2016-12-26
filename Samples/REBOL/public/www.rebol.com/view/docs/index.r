REBOL [type: 'index]

title "REBOL Documentation"
backdrop [gradient 1x1 140.140.150 150.170.150 grid 150.170.150]

folder "Developer" %developer/index.r

link "Desktop" http://www.rebol.com/docs/desktop.html
info "Desktop documentation."

link " Doc Page" http://www.rebol.com/docs.html
info "Documents on the web."

file "License" %license.r
info "REBOL/View license agreement"

;file "License" %license.html
;info "REBOL/View license agreement"

;file "Setup 1.0" %setup.html
;info "REBOL/View 1.0 setup"

file "Easy VID" %easy-vid.r
info "Simple REBOL/View interface dialect tutorial"

file "Easy Draw" http://www.nwlink.com/~ecotope1/reb/easy-draw.r
info "Ecotope DRAW dialect tutorial"

;file "Comments?" docs@rebol.com

;file "Make Spec" %make-spec.r
;info {REBOL's standard document creator. Converts simple text files into HTML formatted documents.} 

;file "Make Spec" %make-spec.txt
;info "Documentation for Make-Spec.r program."

;file "Create Doc" %view-guide.r
;info {Creates the REBOL/View documentation by generating it locally. About 10 times faster than viewing it on the Web.}

;file "Ref-Words" %view-ref.r [9362 9-May-2001/17:28:30-7:00]
;info "REBOL's Dictionary Reference viewer"

;file "Ref-Make" %make-ref.r
;info "Generate HTML Version of REBOL Dictionary"

;link "How To" http://www.rebol.com/how-to.html
;info "REBOL How To Documents"

file "RAMBO" http://www.rebol.net/cgi-bin/rambo.cgi icon html
info "REBOL bug and enhancement database"

file "Word Browser" %../tools/word-browser.r [17-sep-2005/12:10-7:00] icon tool
info "REBOL interactive dictionary 2.1.1"

file "ROAM" %../tools/roam.r [17-jun-2005/13:33-7:00] icon tool
info "A simple, easy-to-use REBOL object browser (alpha)"
