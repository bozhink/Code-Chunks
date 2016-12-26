REBOL [
    Title: "Vector Balls Demo"
    Author: "DocKimbel"
    Date: 02/02/2001
    File: %vball-vid.r
    Version: 0.3
    History: [
    	0.2	06/12/2000	"First version released."
    	0.3	02/02/2001	"Speed field added"
    ]
]

flash "Downloading..."
read-thru http://www.rebol.com/view/demos/3d-objects.r
read-thru http://www.rebol.com/view/demos/ball.png
unview

vector-balls-obj: make object! [
	vobjects: load %3d-objects.r

	ball-list: make block! 50
	angle: make object! [x: y: z: 0]
	eye-distance: 256
	depth: 1024
	
	item: ball-color: plane: v-cmd-pane: v-frames: v-color: axe-x: axe-y: axe-z:
	v-list: dyn-size: labevel: axe-label: none


	ball-face: make face [
		color: none
		edge: make edge [size: 0x0]
		size: 25x25
		image: load %ball.png
		effect: [key 0.0.0 fit]
		coord: none
		scoord: none
		refresh: does [
			if dyn-size [
				size/x: (2000 - abs scoord/z) / 50	; set size according to depth (increase the
				size/y: (2000 - abs scoord/z) / 50	; depth effect, decrease refresh rate !)
			]
			offset/x: scoord/x - (size/x / 2)	; for centering the face
			offset/y: scoord/y - (size/y / 2)
		]
	]

	rotate: does [
		if axe-x/data [angle/x: angle/x + 6]
		if axe-y/data [angle/y: angle/y + 4]
		if axe-z/data [angle/z: angle/z + 3]
		update-balls
	]

	update-balls: func [/local sinxa cosxa sinya cosya sinza cosza
		coord wcoord co wx wy wz ball nx ny nz
	][

		sinxa: sine angle/x
		cosxa: cosine angle/x
		sinya: sine angle/y
		cosya: cosine angle/y
		sinza: sine angle/z
		cosza: cosine angle/z

		foreach ball ball-list [
			co: ball/coord

			wz: (co/y * cosxa) - (co/z * sinxa)
			wy: (co/y * sinxa) + (co/z * cosxa)
			wx: co/x

			nx: (wx * cosya) - (wz * sinya)
			nz: (wx * sinya) + (wz * cosya)
			wx: nx
			wz: nz

			nx: (wx * cosza) - (wy * sinza)
			ny: (wx * sinza) + (wy * cosza)
			wx: nx
			wy: ny

			ball/scoord/x: ((wx * eye-distance) / (wz - depth)) + 160
			ball/scoord/y: ((wy * eye-distance) / (wz - depth)) + 120
			ball/scoord/z: wz - depth

			ball/refresh
		]

		sort/compare ball-list func [a b][a/scoord/z < b/scoord/z]
		show plane
	]

	init-pane: func [name [string!] /local buf ball pos][
		buf: make block! 50	
		foreach ball vobjects/:name [
			append buf make ball-face compose/deep [
				coord: make object! [x: (ball/1) y: (ball/2) z: (ball/3)]
				scoord: make object! [x: y: z: 0]
				if found? ball-color [
					either pos: find effect 'colorize [
						change next pos ball-color
					][
						append effect [colorize (ball-color)]
					]
				]
			]
		]
		buf
	]

	my-style: stylize [
		labevel: label 90 edge [color: 144.144.144 size: 1x1 effect: 'ibevel]
			para [wrap?: no] bold font [color: 0.0.0 shadow: 0x0]
		axe-label: label bold font [color: 0.0.0 shadow: 0x0 valign: 'top] 
	]

	my-lay: layout [
		styles my-style
		size 320x240
		plane: backdrop 0.0.0 feel [
			engage: func [face action event][
				if action = 'time [
					rotate
					if zero? probe face/data: face/data - 1 [
						face/rate: none
						show my-lay/pane/2
					]
				]
			]
		]
		at 0x0 v-cmd-pan: panel 320x240 [
			backdrop 188.188.188
			origin 10x40
			below
			labevel "Speed"
			labevel "Frames"
			labevel "Balls color"
			labevel "Dynamic size"
			labevel "Rotation axis" 
			return
			v-speed: choice 50x20 "SLOW" "FAST" font-size 10
			v-frames: choice 50x20 "100" "200" "400" "1000" "2000" font-size 10
			pad -2
			v-color: box 20x20 255.0.0 edge [size: 1x1 color: 144.144.144 effect: 'bevel]
				[
					ball-color: request-color/color either ball-color [ball-color][255.0.0]
					if ball-color [v-color/color: ball-color]
				]
			pad 1
			v-size: check [dyn-size: v-size/data]
			panel 40x70 [
				origin 0x3 below
				axe-x: check axe-y: check axe-z: check return
				pad -2 axe-label "x" pad -3 axe-label "y" pad -4 axe-label "z"	; hum hum...:/
				do [axe-x/data: axe-y/data: axe-z/data: on]
			]
			return
			pad 20x-27
			labevel 120 "3D Object selection" para [wrap?: no]
			v-list: text-list 120x145 []
			pad 5x10
			button "Anim" [
				angle/x: angle/y: angle/z: 0
				plane/pane: ball-list: init-pane v-list/picked/1
				update-balls
				hide my-lay/pane/2
				either v-speed/text = "FAST" [
					loop to-integer v-frames/text [rotate]
					show my-lay/pane/2
				][
					loop to-integer v-frames/text [rotate wait 0.01]
					show my-lay/pane/2
				]
			]
		]
		
		do [
			foreach item vobjects [
				if string? item [append v-list/data item]  ; objects name
			]
			insert v-list/picked v-list/data/1
			v-speed/text: "SLOW"
		]
	]

	set 'demo-vball does [
		view center-face my-lay system/view/screen-face
	]
]

demo-vball