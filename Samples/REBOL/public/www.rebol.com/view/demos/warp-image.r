REBOL [
	Title: "Draw Image Scaling Test"
	Author: "Carl Sassenrath"
	Version: 1.0.0
	Needs: [1.2.115]
]

img: load read-thru http://www.rebol.com/bay.jpg

out: layout [
	backeffect [gradient 0x1 water coal]
	vh2 "REBOL Draw Image Scaling Test"
	across
	vtext 200 bold yellow "Drag the corners of the image."
	pad 100
	t1: tog 80 "Border" silver "Border" yellow [set-border]
	below
	bx: box 400x400 black effect [draw [image-filter 1 image img]]
]

change-image: has [pts][
	pts: clear next find bx/effect/2 'img
	foreach face [p1 p2 p3 p4] [
		face: get face
		append pts face/offset
	]
	show bx
]

set-border: does [
	bx/effect/2: [image img]
	if t1/data [
		bx/effect/2: [pen yellow blue line-width 5 line-pattern 5 5 image border img]
	]
	change-image
]

pts: layout [
	style box box 5x5 red feel [
		engage: func [face act evt] [
			if find [over away] act [
				face/offset: face/offset + evt/offset
			]
			change-image
		]
	]
	at 100x100 p1: box
	at 300x100 p2: box
	at 300x300 p3: box
	at 100x300 p4: box
]

bx/pane: pts/pane
change-image
view out
