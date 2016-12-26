REBOL [
	Title: "Rotate"
	Author: "Allen Kamp"
	Email: allen@aussieweb.com.au
	Rebsite: http://www.rebolforces.com/index.r
	Date: 10-Nov-2001
	Purpose: "A bit of fun - Random Pattern matching game"
	Version: 1.0.2
	History: [
		0.9.0 10-Nov-2001 "Demo Released - with btn style & image thanks to Chris RG" "Allen K"
		1.0.0 25-Aug-2002 "Partial Rewrite - removed scoring system, game play completed" "Allen K"
		1.0.1 13-Jun-2005 "View 1.3 Replaced image files with images built in Draw dialect, thanks to Cyphre" "Allen K"
		1.0.2 13-Jun-2005 "Removed some obsolete download code" "Allen K"
	]
]


;----------------------------------
;--Build/Draw Button images & styles
;----------------------------------
make-btn-img: func [col /down /local img][
	img: make image! 47x47
	img/alpha: 255
	draw img either down [
		compose [
			line-width 1.5
			pen 160.160.160
			circle 23x23 22
			line-width 1.5
			pen black
			fill-pen radial 0 23 28x28 45 2.8 8 (col) 255.255.255 (col)
			circle 23x23 21
		]
	][
		compose [
			line-width 1.5
			pen black
			fill-pen radial 0 23 28x28 45 2.8 8 (col) 255.255.255 (col)
			circle 23x23 22
		]
	] 
]

img-green-normal: make-btn-img 7.57.7
img-green-over:   make-btn-img 2.103.2
img-green-down:   make-btn-img/down 2.103.2

img-blue-normal: make-btn-img 7.7.57
img-blue-over:   make-btn-img 2.2.103
img-blue-down:   make-btn-img/down 2.2.103


stylize/master [
    btn-blue: button
    img-blue-normal center 120x26 colors [none none]
    effect [extend] edge [size: 0x0] font-size 11
    feel [
        over: func [face over? offset][
            either over? [
                face/images: head reverse face/images
                face/image: face/images/1 show face
                face/images: head reverse face/images
            ][
                face/image: face/images/1 show face
            ]
        ]
    ]
    with [
	    images: reduce [img-blue-normal img-blue-down img-blue-over]
		init: [
			edge: make edge []
		]
	]

    btn-green: btn-blue
    img-green-normal
    with [images: reduce [img-green-normal img-green-down img-green-over]]
 
]

;--------------------------------------------
; Buid Layout
;--------------------------------------------

template: layout [
	btn-blue 47x47 with [type: 'b]
	btn-green 47x47 with [type: 'g]
]

btns: template/pane
positions: copy []
repeat i 37 [append positions i]
clicks: 0
random/seed now/precise
puzzle: random 30000

board: [
	style b btn-blue 47x47 [rotate-left lo/pane face][rotate-right lo/pane face] with [orig: dest: 0x0 type: 'b]
	style e b feel none
	backcolor 220.220.220
	space 0x0
	origin 5x5
	across
	at 80x10        e  e  e  e 
	at 55x60       e  b  b  b  e
	at 30x110     e  b  b  b  b  e 
	at 5x160     e  b  b  b  b  b  e
	at 30x210     e  b  b  b  b  e 
	at 55x260      e  b  b  b  e
	at 80x310       e  e  e  e
]

;-- take snapshot of board as small for small board image
target-img: to-image target-lo: layout board
start-game: func [ /replay which][
	either replay [
		puzzle: which
	][
		puzzle: random 30000
	]
	fill
]

lo: center-face layout append copy board [
	at 339x10 panel [origin 0x0 size 155x180 across space 0x5
		ti: image 150x150 effect [fit smooth] return
		at 40x155 text "Puzzle:" [start-game] bold pzl: text bold form puzzle 50 red [start-game/replay puzzle]
	] edge [size: 1x1] 
] 

tp: target-lo/pane 
lp: lo/pane
ti/image: target-img
 
hubs: reduce [
  6 reduce [ lp/1  lp/2  lp/7 lp/12 lp/11  lp/5]
  7 reduce [ lp/2  lp/3  lp/8 lp/13 lp/12  lp/6]
  8 reduce [ lp/3  lp/4  lp/9 lp/14 lp/13  lp/7]
 11 reduce [ lp/5  lp/6 lp/12 lp/18 lp/17 lp/10]
 12 reduce [ lp/6  lp/7 lp/13 lp/19 lp/18 lp/11]
 13 reduce [ lp/7  lp/8 lp/14 lp/20 lp/19 lp/12]
 14 reduce [ lp/8  lp/9 lp/15 lp/21 lp/20 lp/13]
 17 reduce [lp/10 lp/11 lp/18 lp/24 lp/23 lp/16]
 18 reduce [lp/11 lp/12 lp/19 lp/25 lp/24 lp/17]
 19 reduce [lp/12 lp/13 lp/20 lp/26 lp/25 lp/18]
 20 reduce [lp/13 lp/14 lp/21 lp/27 lp/26 lp/19]
 21 reduce [lp/14 lp/15 lp/22 lp/28 lp/27 lp/20]
 24 reduce [lp/17 lp/18 lp/25 lp/30 lp/29 lp/23]
 25 reduce [lp/18 lp/19 lp/26 lp/31 lp/30 lp/24]
 26 reduce [lp/19 lp/20 lp/27 lp/32 lp/31 lp/25]
 27 reduce [lp/20 lp/21 lp/28 lp/33 lp/32 lp/26]
 30 reduce [lp/24 lp/25 lp/31 lp/35 lp/34 lp/29]
 31 reduce [lp/25 lp/26 lp/32 lp/36 lp/35 lp/30]
 32 reduce [lp/26 lp/27 lp/33 lp/37 lp/36 lp/31]
]

do-anim: func [hub][
	repeat i 50 [
		foreach item hub [
			diff: item/offset - item/dest
			if (item/offset/x <> item/dest/x) [
				item/offset/x: item/offset/x + either (positive? diff/x) [-1][+1]
			]
			if (item/offset/y <> item/dest/y) [
				item/offset/y: item/offset/y + either (positive? diff/y) [-1][+1]
			]
			show item
		]
	]
]

do-sort: func [hub][
	foreach item hub [item/offset: item/orig]
]

copy-hub: func [hub1 hub2][
	hub1/image: hub2/image 
	hub1/images: copy hub2/images
	hub1/text: hub2/text
	hub1/type: hub2/type 
]

set-dest: func [hub1 hub2][hub1/dest: hub2/orig: hub2/offset]

do-count: does [
	clicks: clicks + 1
	lo/text: rejoin [title " - Moves " clicks]
	lo/changes: 'text
	tmvs/text: join "Moves: " clicks
	show [lo tmvs] 	
]

help-lay: none
show-help: does [
if not help-lay [
help-lay: center-face layout [origin 5x5 backcolor silver
	text as-is black ivory - 20 {
Objective: To re-arrange the buttons on the left to match the pattern shown on the right in the least number of moves.
 
Play: Buttons Rotate around the button that you click on. This group of buttons that rotate is called a hub. By rotating the hubs you are able to re-arrange the buttons and match the required pattern.
 
Controls: Left Click to rotate a hub to the anti-clockwise, Right Click to rotate a hub clock-wise. (Buttons on the edge of the layout do not cause a hub rotation.)
}
 450 bold edge [size: 1x1 color: navy]
]
]
unview/only help-lay
view/new help-lay

]

make-score-board: has [req][
	score-board: layout [
		style text text middle left
		origin 0x0 space 0x0
		across 	
		at 2x2 btn "New Game" [start-game]
		btn "Replay Game" [start-game/replay puzzle]
		btn "Select Game" [
			if req: request-text/title "Game Puzzle Number?" [
				if not error? try [puzzle: to-integer req][start-game/replay puzzle]
			]
		]
		btn-help [show-help]
		pad 155
		tmvs: text "Moves: 2310" right bold 
	]
	score-board/size/x: lo/size/x
	score-board/size/y: score-board/size/y + 8
	score-board/offset/y: lo/size/y + 2
	score-board/offset/x: 0
	score-board/edge: make face/edge [size: 3x3 color: silver effect: 'ibevel]
	lo/size/y: lo/size/y + score-board/size/y + 1
	score-board
]

test-win: has [match][
	match: 0
	repeat i 37 [
		if (lo/pane/:i/type = target-lo/pane/:i/type) [match: match + 1]
	] 
	if match = 37 [
		either request/type [rejoin ["Puzzle #" pzl/text " completed in " clicks " moves"] "New" "Replay"] 'info [
			start-game
		][
			start-game/replay puzzle
		]
	]
]


rotate-left: func [lp f /local i h h1][
	i: index? find lp f 
	if (h: select hubs i) [
		foreach [hub1 hub2][6 5 5 4 4 3 3 2 2 1 1 6][set-dest h/:hub1 h/:hub2]	
		do-count 
		do-anim h
		do-sort h
		h1: make-face/clone h/1
		foreach [hub1 hub2][1 2 2 3 3 4 4 5 5 6][copy-hub h/:hub1 h/:hub2]		
		copy-hub h/6 h1	
		show lo
		test-win
	]
]

rotate-right: func [lp f /local i h h1 h6][
	i: index? find lp f 
	if (h: select hubs i) [
		h1: h/1/offset ; get start val
		foreach [hub1 hub2][1 2 2 3 3 4 4 5 5 6][set-dest h/:hub1 h/:hub2]	
		h/6/dest: h/1/orig: h1
		do-count 
		do-anim h
		do-sort h
		h6: make-face/clone h/6
		foreach [hub1 hub2][6 5 5 4 4 3 3 2 2 1][copy-hub h/:hub1 h/:hub2]	
		copy-hub h/1 h6	
		test-win
		show lo

	]
]

fill: has [p t greens][
	random/seed puzzle
	greens: random/only [3 4 5 6 7]
	p: copy/part random positions greens 
	t: copy/part random positions greens 
	; clear
	repeat i 37 [
		copy-hub lp/:i btns/1
		copy-hub tp/:i btns/1
	]
	
	repeat i p [
		copy-hub lp/:i btns/2
	]
	repeat i t [
		copy-hub tp/:i btns/2
	]
	ti/image: to-image target-lo
	score: 0
	clicks: 0
	pzl/text: form puzzle
	show lp
	title: join "Rotate - Puzzle " puzzle
	lo/text: title
	lo/changes: 'text
	tmvs/text: join "Moves: " clicks
	show [lo tmvs] 	
	lo/changes: none
]

append lo/pane make-score-board
fill
view/title center-face lo title
