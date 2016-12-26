REBOL [type: 'index]

title "REBOL/View Demos"
backdrop [gradient 0x1 255.255.255 190.190.190 draw [
        pen none 
        fill-pen radial 3x952 0 173 295 3 1 100.120.100.175 0.0.0.184 139.69.19.181 76.26.0.184 100.136.116.201 222.184.135.192 250.240.230.198 255.150.10.135 0.0.0.147 250.240.230.197 100.120.100.185 222.184.135.135 0.0.0.173 255.164.200.152 80.108.142.202 box 0x0 full-size
        pen none 
        fill-pen linear 1173x908 0 190 196 6 9 255.255.240.218 164.200.255.163 255.0.255.235 72.0.90.156 255.80.37.237 164.200.255.169 40.100.130.170 178.34.34.172 128.0.128.206 0.255.255.174 255.255.240.229 0.0.0.230 0.128.128.134 128.128.0.218 240.240.240.151 0.0.128.234 100.136.116.168 0.128.0.219 255.164.200.169 255.255.240.203 160.180.160.160 0.255.0.206 box 0x0 full-size 
        pen none 
        fill-pen radial 1106x835 0 193 276 8 9 139.69.19.175 0.128.128.165 255.205.40.148 100.120.100.197 0.48.0.133 175.155.120.150 255.255.240.181 72.72.16.175 100.120.100.176 255.0.0.171 179.179.126.130 255.255.0.158 72.72.16.182 0.0.0.167 0.0.0.175 44.80.132.163 box 0x0 full-size
        pen none 
        fill-pen conic -47x-125 0 169 159 7 2 128.128.0.205 64.64.64.129 222.184.135.172 0.128.0.192 128.0.128.142 0.255.255.236 40.100.130.148 72.0.90.213 0.48.0.132 255.80.37.161 0.128.128.176 100.136.116.202 255.80.37.147 0.128.128.156 38.58.108.201 38.58.108.168 245.222.129.133 0.0.0.226 40.100.130.196 72.0.90.133 40.100.130.175 255.80.37.169 44.80.132.142 box 0x0 full-size
]]
text-color 0.0.0 80.80.240

file " Info " %info.txt
info "Info about these demos"

file "Calculator" %calculator.r 17-jun-2005/14:44-7:00 icon demo
info "Basic calculator in 1K of code"

file "Clock" %clock.r [17-oct-06/14:00-7:00] icon demo
info "Resizable digital clock"

file "Clock Retro" %retro-clock.r icon demo
info "The classic analog clock"

file "Easy VID" %easy-vid.r icon demo

;file "Effect Lab" %effect-lab.r icon demo

;file "Emailer" %emailer.r icon demo

;file "Feedback" %feedback.r [2168 2-July-2001/19:27-7:00] icon demo

file "Gel" %gel.r icon demo

file "Rebodex" %rebodex.r icon demo
info "Simple contact database" 

file "V-Balls" %vball-vid.r icon %vball-icon.png
info "Doc Kimbel's Vector Balls Demo"

;file "Win Skin" %do-win95.r icon %winskin.png
;info "Doc Kimbel's Win-95 Skin for REBOL VID"

;file "Todo List" %todo-list.r icon demo
;info "Outline style todo list example application"

file "Paint" %paint.r 6-Dec-2005/0:00-8:00 icon demo
info "Frank Sievertsen's 1.7K paint program"

file "Splash" %splash.r 16-Jun-2005 icon demo
info "Splash screen 'intro' animation"

file "RIM" %rim.r 11-jun-05/10:00-7:00 icon demo
info "REBOL Instant Messenger - P2P in 6K"

file "Bubbles" %bubbles.r 6-Dec-2005/0:00-8:00  icon demo
info "Generates lots of bubbles (By Gabriele)"

file "Warp Image" %warp-image.r  icon demo
info "Interesting image scaling test"

file "Particles" %particles.r 6-Dec-2005/0:00-8:00 icon demo
info "Generates colored particles (By Cyphre & McSeem)"

file "Tiger" %tiger.r  icon demo
info "Classic SVG tiger demo (By Cyphre)"

file "Tiger Boom" %tiger-boom.r [1-jun-2005/0:00-7:00]  icon demo
info "Dishevelling the classic SVG tiger"

file "Imagination" %imagination.r [2-jun-2005/0:00-7:00]  icon demo
info "Etcha-sketch for the new century (By Errru)"

file "Cyphre" %cyphre.r [2-jun-2005/0:00-7:00]  icon demo
info "A gift to Cyphre? (By Rebolek)"

file "Pointillize" %pointillize.r [2-jun-2005/0:00-7:00]  icon demo
info "Move the slider to control it (By Oldes)"

file "RZoom" %rzoom.r [9-jun-2005/10:50-7:00]  icon demo
info "Zooming demo that is quite small (By Henrik)"

file "Spiral Tides" %spiral.r icon demo
info {Spiral based demo (By Cyphre)}

file "Reb Circle" %reb-circle.r icon demo
info {The unbroken circle of REB}

file "Site Monitor" %gismo.r icon demo
info {Graphical Internet server monitor}

file "Convolve" %convolve.r 6-Dec-2005/0:00-8:00 icon demo
info {Demo of convolution effect (By Cyphre)}

file "RebGUI" http://www.rebol.com/rebgui-demo.r icon demo
info {Demo of RebGUI user interface (By Dobeash Software)}