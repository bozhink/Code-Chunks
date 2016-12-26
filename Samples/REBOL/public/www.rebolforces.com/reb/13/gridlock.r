REBOL [
	Title: "Gridlock"
	Author: "Allen Kamp"
	Email: allen@rebolforces.com
	Rebsite: http://www.rebolforces.com/index.r
	Date: 18-Aug-2002
	Comments: {A REBOL version of the "Rush Hour" puzzle game}
	Version: 1.0.1
	History: [
		0.9.0 18-Aug-2002 "Demo Released" "Allen K"
		0.9.1 19-Aug-2002 "Made more colorful" "Allen K"
		1.0.0 25-Aug-2002 "Added help and number selection" "Allen K"
		1.0.1 11-Jun-2005 "View 1.3" "Allen K"
	]


]

;levels: load %levels.r
random/seed now/precise
prefs-file: %gridlock.usr ;link-root/elite/users/allen/gl-prefs.r
prefs: context [lvl: 1]
load-prefs: does [error? try [prefs: make prefs load/all prefs-file]]
save-prefs: does [error? try [save prefs-file third prefs]]

title: ""
ambulance: 255.0.0

moves: 0

levels: [
["XB3" "AA1" "B5A" "CE5" "O1F" "P2A" "Q2D" "RC6"]
["XA3" "A1A" "B2D" "C3E" "D5C" "EE5" "FA6" "GD6" "OD1" "P2F" "QA4"]
["XB3" "AB4" "B5B" "CC6" "O3D" "P4F"]
["XB3" "A4C" "B5F" "O1A" "P1D" "QD4" "RC6"]
["XB3" "AA1" "B1F" "D5A" "EE5" "FE6" "G3F" "O1D" "P2A" "Q2E" "RB4"]
["XB3" "AA1" "B1D" "CA2" "DA4" "E4C" "F5A" "O2E" "P2F" "Q3D" "RD6"]
["XB3" "A1B" "BC1" "C1E" "D1F" "E2D" "F3F" "IC4" "H5D"]
["XA3" "AD1" "BC2" "C2E" "D3C" "E3D" "FA4" "GE4" "HA5" "I5C" "KA6" "O1F" "PD5" "QD6"]
["XA3" "A1B" "BC1" "CE1" "D2D" "EE2" "F3F" "G5C" "H5F" "O3E" "P4A" "QB4"]
["XB3" "AA1" "B1C" "CE1" "DA2" "E5D" "FE5" "GA6" "HE6" "O2F" "P3A" "QB4"]
["XB3" "AB1" "B4C" "E5F" "O1A" "P1D" "QD4" "RC6"]
["XA3" "A1A" "BB1" "C5E" "O1F" "P2C" "QD4" "RA6"]
["XD3" "AA1" "BC1" "C1E" "D2C" "E3B" "FD4" "G5D" "HE5" "IB6" "KE6" "O2F" "P4A"]
["XC3" "AA1" "B1C" "CE2" "D3A" "E3B" "F3E" "G3F" "HC4" "I5C" "JE5" "KA6"]
["XC3" "AB1" "BD1" "CA2" "DC2" "E4C" "F4D" "GE5" "HB6" "ID6" "O2E" "P2F" "Q3A" "R3B"]
["XD3" "AA1" "BC1" "C1E" "D2A" "EC2" "F3B" "GA6" "O1F" "P3C" "QD4"]
["XA3" "A1A" "BC2" "CE2" "D3C" "EA4" "F5E" "G5F" "OB1" "P4D" "QA5" "RA6"]
["XB3" "AA1" "B1C" "CA2" "DB5" "O1D" "P3A" "QB4" "RA6"]
["XC3" "A1C" "BD1" "D3B" "EC4" "F4E" "J2E" "OB5"]
["XA3" "A1A" "BB2" "C2D" "D3C" "E5C" "FD5" "OD1" "P3F" "QD6"]
["XB3" "AA1" "B1C" "O1D" "P2A" "QB4" "RD6"]
["XB3" "A1C" "B2A" "CE2" "D4B" "EE4" "F5A" "GC5" "H5F" "OD1" "P2D" "QB6"]
["XD3" "A2C" "BD2" "C4C" "D4D" "EE4" "FE5" "OC1" "P1F" "QC6"]
["XC3" "A1C" "BD1" "C2B" "D3A" "E3E" "FB4" "G5E" "HA6" "OA5"]
["XB3" "AA1" "B1C" "CE1" "DA2" "E3E" "F5B" "G5D" "HE5" "IE6" "O2F" "P3A" "QB4"]
["XB3" "A1B" "B2A" "C2D" "D3F" "E4A" "F5C" "G5F" "HD6" "OD1" "P2E" "RB4"]
["XA3" "A1A" "BB1" "CB2" "D3C" "ED4" "F5C" "O1D" "P3F" "RD6"]
["XA3" "A1D" "BE2" "C4A" "D4B" "ED4" "FA6" "GC6" "OA1" "P2C" "Q4F" "RC5"]
["XA3" "A2C" "B3F" "C4A" "DB4" "ED4" "FB5" "G5D" "H5F" "OA1" "P1E" "RA6"]
["XB3" "A1C" "B2D" "CA4" "DC4" "EA6" "FC6" "O1A" "PD1" "Q4F"]
["XB3" "AA1" "B2D" "CE2" "D3A" "ED4" "FA5" "OD1" "P3F" "Q4C" "RD6"]
["XA3" "AA1" "B1D" "CE1" "D4A" "EB4" "FD4" "HA6" "K5D" "O1C" "P4F"]
["XA3" "A1B" "BE1" "DB4" "ED4" "FB5" "G5D" "H5E" "I4A" "P4F" "QA6" "R1C"]
["XA3" "A1A" "B2D" "C3E" "D4D" "E5C" "FE5" "HD6" "IA6" "P2F" "QA4" "RD1"]
["XA3" "AD1" "B2D" "DB5" "E5D" "F5E" "GA6" "K4A" "O1C" "P1F" "QB4"]
["XC3" "AE1" "B2B" "CC2" "D4D" "E5C" "FE5" "GA6" "O1A" "PB1" "Q2F" "RA4"]
["XB3" "AA1" "B1C" "CE1" "DA2" "E5D" "FE5" "GA6" "HE6" "O2E" "P2F" "Q3A" "RB4"]
["XA3" "A1A" "BB2" "C2D" "D3C" "ED4" "F5C" "GD5" "OD1" "QD6" "R3F"]
["XA3" "A1C" "B2D" "C3C" "DA4" "ED4" "F5A" "G5B" "HC5" "IC6" "OD1" "R3F"]
["XD3" "AB1" "B1E" "C2B" "D2C" "E4D" "F5C" "GE5" "HA6" "ID6" "O1A" "P2F" "QA4"]
]

game-over?: func [face][
	if all [face/color = ambulance face/offset = 168x86][
		either request/type [rejoin ["Puzzle #" prefs/lvl " Completed in " moves " moves"] "Next" "Replay"] 'info [
			start-game
		][
			start-game/replay prefs/lvl
		]
	]
]

start-game: func [/replay which][
	moves: 0
	either replay [
		prefs/lvl: which
	][
		prefs/lvl: prefs/lvl + 1
		if prefs/lvl > length? levels [
			prefs/lvl: 1
		]	
	]
	load-level prefs/lvl
	show road
	title: join "GridLock - Level " prefs/lvl
	lay/text: title 
	lay/changes: 'text
	tmvs/text: join "Moves: " moves
	show [lay tmvs]
]

drag-feel: make face/feel [
	engage: func [f a e][
		if all [e/type = 'move f/data][
			f/offset: confine (f/offset + e/offset - f/data) f/size f/top f/bottom
		  	show f
			exit
	  	]
		switch a [
		   down [
			  if none? f/data [
		  		either f/dir/x = 1 [
					vertical-limits f
				][
					horizontal-limits f
				]
			   f/data: e/offset
			   f/user-data: f/offset / 41 * 41 + 4x4
			   show f
			   ]
			]
			up [
				f/data: none
				f/offset: f/offset / 41 * 41 + 4x4 ; snap to grid
				either f/user-data <> f/offset [
					moves: moves + 1
					lay/text: join title [" - Moves " moves]
					lay/changes: 'text
					tmvs/text: join "Moves: " moves
					show [lay tmvs]
				][
					show f
				]
				game-over? f
			]
		]
	]
]

;-- Could create a single func to do v & h later 
vertical-limits: func [face /local ofs above below][
	; 1x0
	above: append copy [] face/max-top/y
	below: append copy [] face/max-bottom/y
	ofs: 0x0
	ofs/x: face/offset/x + 20 ; passenger seat
	while [face/max-bottom/y > ofs/y][
		ofs: ofs + 0x20 
		foreach f road/pane [
			if f <> face [
				if within? ofs f/offset f/size [
					;f/text: "V" show f 
					either (f/offset/y < face/offset/y) [
						append above f/offset/y + f/size/y + 13
					][
						append below f/offset/y - 13
					] 
				]
			]
		]
		face/top/y: first maximum-of above	
		face/bottom/y: first minimum-of below
	]
]	

horizontal-limits: func [face /local ofs left right][
	; 0x1
	left: append copy [] face/max-top/x
	right: append copy [] face/max-bottom/x
	ofs: 0x0
	ofs/y: face/offset/y + 20 ; passenger seat
	while [face/max-bottom/x > ofs/x][
		ofs: ofs + 20x0 
		foreach f road/pane [
			if f <> face [
				if within? ofs f/offset f/size [
					;f/text: "H" show f 
					either (f/offset/x < face/offset/x) [
						append left f/offset/x + f/size/x + 13
					][
						append right f/offset/x - 13
					] 
				]
			]
		]
		face/top/x: first maximum-of left	
		face/bottom/x: first minimum-of right
	]
]	

stylize/master [
	car: image 69x28
		with [
		offset: 0x0
		size: 4x10
		feel: drag-feel
		max-top: top: 4x4
		max-bottom: bottom: 237x32
		dir: 0x0
		]

	truck: car 110x28
]

colors: [
	; Cars
	#"X" 255.0.0 ; the ambulance
	#"A" 128.255.128
	#"B" 192.192.0
	#"C" 128.128.255
	#"D" 255.128.255
	#"E" 192.0.0
	#"F" 0.128.0	
	#"G" 128.128.128
	#"H" 255.204.81
	#"I" 255.255.0	
	#"J" 255.168.1
	#"K" 0.255.0
	; Trucks
	#"O" 255.255.0
	#"P" 255.128.255
	#"Q" 0.0.255
	#"R" 0.255.255
]

letters: [#"A" #"B" #"C" #"D" #"E" #"F"]
numbers: [#"1" #"2" #"3" #"4" #"5" #"6"]
trucks: [#"O" #"P" #"Q" #"R"]

; This is the surface area/pane where we place the cars & trucks
road: make face [offset: 20x20 size: 300x300 color: none edge: none pane: []]

bg-image: has [bg lay][
	; -- creates the background image including the border ridge
	; -- function could be replaced by an image, but this takes up less bytes.
	stylize/master [
		b: box 170.170.170  40x40 effect  [gradcol 1x1 140.140.140 125.125.125]
		edge [size: 1x1 color: 190.190.190 effect: 'ibevel]
	]
	bg: layout loop 6 [
		append [
			backcolor 180.180.180
			origin 2x2 space 1x1 
			at 2x2
		][b b b b b b return]
	]
	bg/size: bg/size + 4x4
	lay: make face [
		color: 180.180.180
		size: bg/size + 28x28
   		pane: bg
	] 
	bg/offset: 12x12
	bg/edge: make face/edge [size 2x2 effect: 'ibevel]
	lay/edge: make face/edge [size: 2x2 effect: 'bevel]
	to-image lay
]

lay: make face [
	text: "GridLock"
	color: 180.180.180
	image: bg-image
	edge: none
	pane: road
] 

help-lay: none
show-help: does [
if not help-lay [
help-lay: center-face layout [origin 5x5 backcolor silver
	text as-is black ivory - 20 {
Objective: Complete each Game Level (1-40) by moving the "Ambulance" to the far right.
 
Play: Re-arrange the Gridlocked Traffic (blocks representing cars & trucks) to move the Ambulance (the bright red block) to its destination on the far right.
 
Controls: Use Left Mouse button to select and slide the blocks.
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
		at 2x2 btn "Replay Game" [
			start-game/replay prefs/lvl
		]
		btn "Select Game" [
			if req: request-text/title "Game Puzzle Number? (1-40)" [
				if not error? try [req: to-integer req][
					start-game/replay max 1 min prefs/lvl: req length? levels
				]
			]
		]
		btn-help [show-help]
		pad 5
		tmvs: text "Moves: 2310" right bold 
	]
	score-board/size/x: lay/size/x
	score-board/size/y: score-board/size/y + 8
	score-board/offset/y: lay/size/y + 2
	score-board/offset/x: 0
	score-board/edge: make face/edge [size: 3x3 color: silver effect: 'ibevel]
	lay/size/y: lay/size/y + score-board/size/y + 1
	score-board
]


add-traffic: func [vehicle clr row col hz /local tc bc edg][
	sq: 41x41
	way: 0x1
	rc: to-pair reduce [row col]
	pos: way * sq * rc
	tc: 4x4 + pos   
	bc: 236x32 + pos
	sz: either vehicle = 'truck [110x28][69x28]
	edg: 18x4
	if hz [
		way: 1x0
		pos: way * sq * rc
		tc: 4x4 + pos   
		bc: 32x237 + pos
		sz: reverse sz
		edg: 4x18	
	]

	append road/pane make-face/spec vehicle [
		offset: 4x4 + (41x41 * rc)
		color: clr
		size: sz
		max-top: top: tc
		;at: rc
		dir: way
		max-bottom: bottom: bc
		edge: make edge [size: edg effect: none color: clr - 80]
	] 	
]

load-level: func [id /local h c r veh][
	save-prefs ; level changed save it off
	clear head road/pane
	level: pick levels id
	foreach vehicle level [
		either h: find numbers vehicle/2 [
			c: (index? h)
			r: (index? find letters vehicle/3)
		][
			c: (index? find numbers vehicle/3)
			r: (index? find letters vehicle/2)
		]
		veh: either find trucks vehicle/1 ['truck]['car]
		add-traffic veh select colors vehicle/1 r - 1 c - 1 h
	]
]


lay/size: lay/image/size
road/size: lay/size - (road/offset * 2)
load-prefs


; Convert lay/pane from face to block to add the score-board face
lay: make lay [pane: reduce [lay/pane]]
append lay/pane make-score-board

start-game/replay prefs/lvl
lay/changes: none
view/title center-face lay title: join "GridLock - Level " prefs/lvl
