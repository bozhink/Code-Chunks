rebol [
	Title: "Christmas tree"
	File: %Christmas-tree.r
	Date: 27-Jan-2006
	Version: 1.0.7
	Progress: 0.7
	Status: {working, doesn't always look much like a Christmas tree though !}
	Needs: [View]
	Author: "Anton Rolls"
	Language: 'English
	License: "MIT" ; see http://www.rebol.com/docs/bsd-mit-license.html
	Purpose: {Display a christmas tree using AGG Draw dialect}
	Usage: {}
	History: [
		1.0.0 [31-Dec-2004 {First version} "Anton"]
		1.0.1 [2-Jan-2006 {renamed from christmas-tree-AGG.r -> christmas-tree.r, adding control boxes,
			wrapped in context, added draw-tree initializing wrapper, collected all the draw commands
			in one block to draw all at once} "Anton"]
		1.0.2 [3-Jan-2006 {converting from a triangle to a polygon, and fully recursive instead of part
			iterative} "Anton"]
		1.0.3 [3-Jan-2006 {removed control boxes (the way I used became too problematic)} "Anton"]
		1.0.4 [7-Jan-2006 {finished move to trunk segments and arc joiners (code is messy though)} "Anton"]
		1.0.5 [8-Jan-2006 {added many user  interface controls; branch levels, growth factors, optional
			continuation and left and right branches, optional outlines} "Anton"]
		1.0.6 [9-Jan-2006 {split the single control angle (dang) into continuation angle (dang) and
			side branch divergence angle (side-dang), added side branch symmetry types reflection and rotation
			(side-dang-mul)} "Anton"]
		1.0.7 [27-Jan-2006 {added colour gradient from base segment to tips, inlined colour-box style from
			gui/colour-box.r, increased image size to 500x500, added Save as PNG} "Anton"]
	]
	ToDo: {
	- heads of rebol developers as the leaf nodes !
	- colour gradients
	  - transparency
	    - will probably have to modify colour-box style and/or request-color
		- or provide a separate slider for transparency
	- resizeable window
	- segments don't join together very well, there are gaps
	- arc joiners don't match the width of the new bases
	  - this can be fixed by uncoupling the new start base size from the new grow vector
	- need more accuracy with start point and growth vector, change to decimal ?
	  or just scale the image in AGG ? <- try this first
	- alternating branches (eg. left, right, left, right etc..)
	  binary pattern for controlling the flipping ? eg. 0101010, where 0 = original side, 1 = left/right flipped
	- factors to bias angles towards sun/earth/horizon ?
	  - maybe draggable control point(s) that the plant "strives for"
	- version 2 should use a much simpler branch joining model, a circle at the end of each growth segment
	- star on top, presents at the bottom :) sparkles, baubles and snow
	}
	Notes: {
		With DRAW code blocks, I am finding myself very often wishing to be able to
		reduce or compose one block into another already existant one, without creating a new block
		in the process. Compose and reduce always create a new block.
	}
]

tree: context [

	start-dang: 0
	end-dang: 0
	start-side-dang: end-side-dang: 0
	trunk-width-growth: 0.8 ; shrinking by 20% each segment
	growth-factor: 0.7
	left-growth-factor: 0.5
	right-growth-factor: 0.5

	pen-colour: start-fill-colour: 70.55.30 ; brown, solid
	end-fill-colour: 220.220.230 ; snow, solid  ; 40.240.40.128 ; semi-transparent leaf    ; 0.192.0.128 ; semi-transparent leaf

	outlines?: no

	continuation-branch?: true
	left-branch?: none
	right-branch?: none

	side-dang-mul: -1 ; this is for symmetry type;  -1 = reflection, 1 = rotation

	draw-code: []
	max-n: none

	draw-tree: func [
		image [image!]
		start [pair!]
		grow [pair!]
		n [integer!]
		/control face "face containing control-points"
	][
		max-n: n
		draw-code: copy [
			;line-width 1 pen pen-colour fill-pen fill-colour
		]
		draw-branch start grow 1
		draw image draw-code
	]

	to-distance: func [p [pair!]][
		square-root (p/x * p/x + (p/y * p/y))
	]

	; <- variables which don't need to be local. (out here to minimize recursion memory use)

	draw-branch: func [
		start [pair!]
		grow [pair!] "growth vector"
		n [integer!]
		/local base cont left right top top-left top-right pc ang dang side-dang dist arc-cen radius 
			new-ang new-start new-grow trunk-perp tr-left tr-right
			ang-right mid-right fill-colour
	][
		;print [n start]
		base: (-1x1 * reverse grow) * 0.15 ; 15% perpendicular of growth vector
		cont: base * trunk-width-growth ; ("continuation" radius, ie. the top edge of this trunk segment)
		left: start - base
		right: start + base
		top: start + grow
		top-left: start + grow - cont
		top-right: start + grow + cont

		pc: either max-n <= 2 [0][n - 1 / (max-n - 2)] ; "percentage" of the way from the base to the tips

		fill-colour: (start-fill-colour * (1 - pc)) + (end-fill-colour * pc) ; parametric function

		pen-colour: either outlines? [sky][fill-colour]

		append draw-code compose [
			line-width 1 pen (pen-colour) fill-pen (fill-colour)
			polygon (left) (right) (top-right) (top-left)
		]

		if n < max-n [
			; recurse
			
			dang: (1 - pc * start-dang) + (pc * end-dang) ; parametric function

			ang: angle grow/x grow/y ; angle of growth vector
			dist: square-root ((grow/x * grow/x) + (grow/y * grow/y))

			; Trunk continuation branch:
			if continuation-branch? [
				; first draw a joining segment; an arc from the cont edge to the new start
				; then draw-branch from new start position at the new angle
				arc-cen: top + (cont * 1.5 * sign? dang) ; see if it's a left or right angle change
				radius: 1.5 * to-distance cont
				new-ang: ang + (either dang >= 0 [-90][90])
				append draw-code compose [
					pen (fill-colour)  fill-pen (fill-colour)
					line-width (to-distance (cont * 2))
					arc (arc-cen) (to-pair radius) (new-ang) (dang)
				]
				new-start: top + (cont * 1.5 * either dang < 0 [-1][1]) + as-pair (radius * cosine new-ang + dang) (radius * sine new-ang + dang)
				new-grow: growth-factor * as-pair ((to-distance grow) * cosine ang + dang) ((to-distance grow) * sine ang + dang)
				draw-branch new-start new-grow n + 1
			]

			side-dang: (1 - pc * start-side-dang) + (pc * end-side-dang) ; parametric function

			; Side branch (right):
			if right-branch? [
				; first draw two joining segments; a shape with two curves, and an arc
				tr-right: top-right - right ; growth vector of right side of trunk
				ang-right: angle tr-right/x tr-right/y
				mid-right: right + (tr-right / 2) ; middle of right side of trunk
				trunk-perp: (-1x1 * reverse tr-right) / 4

				; arc
				arc-cen: top-right + (trunk-perp / 2) - either side-dang < 0 [0x0][tr-right / 2] ; decide left or right turn
				new-ang: ang-right + side-dang
				radius: to-distance tr-right / 4
				new-start: arc-cen + ((either side-dang < 0 [-1][1]) * as-pair (radius * cosine new-ang) (radius * sine new-ang))
				radius: to-distance tr-right * right-growth-factor
				new-grow: as-pair (radius * cosine new-ang + 90) (radius * sine new-ang + 90) ; <-- 
				append draw-code compose/deep [
					pen (pen-colour)  fill-pen (fill-colour)
					line-width 1
					;circle (arc-cen) 2
					;circle (mid-right) 2
					shape [
						move (top-right)
						line (mid-right)
						arc (20) (mid-right + (trunk-perp / 2) + (tr-right / 8)) false false
						line (top-right + (trunk-perp / 2) - (tr-right / 8))
						arc (20) (top-right)
					]
					pen (fill-colour)  fill-pen none
					line-width (to-distance trunk-perp)
					arc (arc-cen) (to-pair to-distance trunk-perp) (ang-right + 180 + either side-dang > 0 [180][0]) (side-dang) ; <--
				]
				draw-branch new-start new-grow n + 1
			]

			; side branch (left):
			side-dang: side-dang * side-dang-mul
			if left-branch? [
				tr-left: top-left - left ; growth vector of left side of trunk
				ang-left: angle tr-left/x tr-left/y
				mid-left: left + (tr-left / 2) ; middle of left side of trunk
				trunk-perp: (1x-1 * reverse tr-left) / 4

				; arc
				arc-cen: top-left + (trunk-perp / 2) - either side-dang < 0 [tr-left / 2][0x0] ; decide left or right turn
				new-ang: ang-left + side-dang
				radius: to-distance tr-left / 4
				new-start: arc-cen + ((either side-dang < 0 [1][-1]) * as-pair (radius * cosine new-ang) (radius * sine new-ang))
				radius: to-distance tr-left * left-growth-factor
				new-grow: as-pair (radius * cosine new-ang - 90) (radius * sine new-ang - 90)
				append draw-code compose/deep [
					pen (pen-colour)  fill-pen (fill-colour)
					line-width 1
					shape [
						move (top-left)
						line (mid-left)
						arc (20) (mid-left + (trunk-perp / 2) + (tr-left / 8)) true false
						line (top-left + (trunk-perp / 2) - (tr-left / 8))
						arc (20) (top-left) true false
					]
					pen (fill-colour)  fill-pen none
					line-width (to-distance trunk-perp)
					arc (arc-cen) (to-pair to-distance trunk-perp) (ang-left + either side-dang > 0 [180][0]) (side-dang)
				]
				draw-branch new-start new-grow n + 1
			]
		]
	]

	; taken from library/trigonometry.r
	angle: func ["calculate angle given x and y - returns positive angles in degrees"
		x y
		/local a
	][
		a: either x = 0 [either y < 0 [270][90]][
			arctangent y / x
		]
		; left of centre? arctangent won't be quite right then.
		if x < 0 [a: a + 180]
		; this should fix "quirkiness"
		return (a + 720) // 360
	]
]

trunk-base: 250x400 
grow-vector: 0x-116
max-n: 4
img: make image! 500x500
do refresh: does [img/rgb: 0 tree/draw-tree img trunk-base grow-vector max-n]

view/new window: center-face layout [
	pic: image img [
		if file: request-file/keep/only/save/title/file "Save PNG image" "Save" "demo-tree.png" [
			save/png file pic/image
		]
	]
	return
	space 0
	style colour-box box 80x30 edge [size: 2x2] font [style: none size: 13 shadow: 2x2] feel [
		old-color: none
		engage: func [face action event][
			switch action [
				time [if not face/state [face/blinker: not face/blinker]]
				down [face/state: on]
				alt-down [face/state: on]
				up [
					if face/state [ ; this is the new bit
						face/color: any [request-color/color any [face/color black] face/color]
						if face/color <> old-color [
							do-face face face/text
							old-color: face/color
						]
					]
					face/state: off
				]
				alt-up [if face/state [do-face-alt face face/text] face/state: off]
				over [face/state: on]
				away [face/state: off]
			]
			cue face action
			show face
		]
	]
	style label label 200 black pewter font [shadow: none style: none] effect [round]
	style hscroller scroller 200x18 with [step: 0.0025]
	label "number of branching levels"
	hscroller with [data: max-n - 1 / 6][
		if max-n <> value: round face/data * 6 + 1 [max-n: value  refresh  show pic]
	]
	
	check-line "outlines" [tree/outlines?: value refresh show pic]
	
	style check-line check-line 200 pewter black effect [round]

	check-line "continuation growth factor" with [data: tree/continuation-branch?][tree/continuation-branch?: value refresh show pic]
	hscroller with [data: tree/growth-factor][tree/growth-factor: value refresh show pic]

	pad 0x5
	check-line "left branch growth factor" with [data: tree/left-branch?][tree/left-branch?: value refresh show pic]
	hscroller with [data: tree/left-growth-factor][
		tree/left-growth-factor: value  refresh show pic
	]

	pad 0x5
	check-line "right branch growth factor" with [data: tree/right-branch?][tree/right-branch?: value refresh show pic]
	hscroller with [data: tree/right-growth-factor][
		tree/right-growth-factor: value  refresh show pic
	]

	pad 0x10
	style dark-panel panel 210x120 top effect [merge luma -50] []
	dark-panel "start" [
		origin 5x20
		space 0
		colour-box 80x14 (tree/start-fill-colour) [tree/start-fill-colour: face/color refresh show pic]
		pad 0x4
		label "continuation angle (start-dang)"
		hscroller with [data: 0.5][
			if value * 2 - 1 * 360 <> tree/start-dang [
				tree/start-dang: value * 2 - 1 * 360
				refresh show pic
			]
		]
		pad 0x5
		label "side branch divergence angle"
		hscroller with [data: tree/start-side-dang / 720 + 0.5][
			if value - 0.5 * 720 <> tree/start-side-dang [
				tree/start-side-dang: value - 0.5 * 720
				refresh show pic
			]
		]
	]
	pad 0x10
	label "side branch symmetry type"
	rotary 200 "reflection" "rotation" [tree/side-dang-mul: either value = "reflection" [-1][1] refresh show pic]
	pad 0x10
	dark-panel "end" [
		origin 5x20
		space 0
		colour-box 80x14 (tree/end-fill-colour) [tree/end-fill-colour: face/color refresh show pic]
		pad 0x4
		label "continuation angle (end-dang)"
		hscroller with [data: 0.5][
			if value * 2 - 1 * 360 <> tree/end-dang [
				tree/end-dang: value * 2 - 1 * 360
				refresh show pic
			]
		]
		pad 0x5
		label "side branch divergence angle"
		hscroller with [data: tree/end-side-dang / 720 + 0.5][
			if value - 0.5 * 720 <> tree/end-side-dang [
				tree/end-side-dang: value - 0.5 * 720
				refresh show pic
			]
		]
	]
]
do-events