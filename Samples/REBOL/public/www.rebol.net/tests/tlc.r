REBOL [
	Title: "Tint, Luma, Contrast Test"
	Author: "Carl Sassenrath"
	Version: 1.0.0
	Credit: "Based on an old Jeff Kreis script."
]

if not exists? %company.jpg [
	request-download/to http://www.rebol.com/graphics/company.jpg %company.jpg
]
pic: load %company.jpg

val: -144
op: 'tint

page: copy []
loop 9 [
	loop 8 [
		append page compose/deep [
			image pic 60x60 (form val) effect [fit (op) (val)]
		]
		val: val + 4
	]
	append page [return]
	new-line tail page on
]

op-page: func ['op] [
	foreach f p1/pane [f/effect/2: op]
	show p1
]

view center-face layout [
	backdrop white
	style tog tog of op 72 white gold
	p1: panel page
	return
	tog "Tint" on [op-page tint]
	tog "Luma" [op-page luma]
	tog "Contrast" [op-page contrast]
	btn-cancel 72 [quit]
] 
