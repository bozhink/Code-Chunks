REBOL [Type: 'index]

title "REBOL Games"
backdrop
[gradient 0x1 255.255.255 190.190.190 draw [
        pen none 
        fill-pen cubic 830x394 0 291 352 2 6 0.255.0.178 72.72.16.166 160.82.45.128 100.120.100.134 80.108.142.218 255.255.0.213 128.128.0.145 175.155.120.181 40.100.130.178 179.179.126.142 38.58.108.140 0.48.0.210 240.240.240.137 255.205.40.222 128.128.0.174 192.192.192.136 80.108.142.210 76.26.0.221 160.82.45.139 box 0x0 full-size 
        pen none 
        fill-pen cubic 1032x860 0 282 60 10 1 128.128.0.179 0.128.0.204 250.240.230.146 76.26.0.129 255.255.255.198 38.58.108.148 255.0.0.199 255.205.40.201 40.100.130.217 142.128.110.190 255.80.37.143 76.26.0.181 100.120.100.214 0.0.255.200 240.240.240.178 38.58.108.146 44.80.132.157 255.255.240.189 38.58.108.192 box 0x0 full-size
        pen none 
        fill-pen cubic 930x231 0 210 244 6 5 222.184.135.140 128.128.0.141 192.192.192.150 100.136.116.182 255.228.196.182 255.255.255.136 0.255.255.176 170.170.170.138 255.164.200.172 175.155.120.160 178.34.34.148 255.0.255.176 box 0x0 full-size
        pen none 
        fill-pen diagonal 261x845 0 148 192 2 9 128.0.128.147 100.136.116.135 44.80.132.207 255.205.40.182 255.205.40.200 255.205.40.131 255.205.40.129 245.222.129.137 139.69.19.191 64.64.64.160 0.255.255.221 142.128.110.176 175.155.120.165 0.255.0.138 0.0.255.188 255.205.40.180 160.180.160.131 222.184.135.206 160.82.45.216 76.26.0.174 box 0x0 full-size 
        pen none 
        fill-pen diagonal 1029x263 0 228 7 9 4 245.222.129.160 38.58.108.131 128.0.128.155 128.128.128.174 0.0.128.179 128.0.0.130 38.58.108.169 128.128.128.157 0.128.128.141 255.228.196.179 192.192.192.177 box 0x0 full-size
    ]]

folder "R-Forces Games" http://www.rebolforces.com/reb/13/game-index.r
info "Games from REBOL Forces rebsite"

file "Mines" %mines.r icon game
info "Minesweeper-style game (Allen Kamp)"

file "Rebtris" %rebtris.r icon game
info "Tetris-style game (Frank Sievertsen)"

file "Tile Game" %tile-game.r icon game
info "Classic tile sliding game (Sterling Newton)"
