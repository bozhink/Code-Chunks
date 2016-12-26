REBOL [
	Title: "Line/Spline Test"
	Author: "Carl Sassenrath"
	Version: 1.0.0
]

out: layout [
	backeffect [gradient 0x1 water coal]
	vh2 "Line/Spline Test"
	across
	vtext 300 bold gold "Just let it run."
	t1: tog 80 "1X" "5X"
	below
	bx: box 400x400 black effect [draw []]
	key escape [quit]
]

nums: [0.9 0.4 0.8 0.3 0.75 0.52 0.66 0.4 0.1 0.01]
vels: []
foreach n nums [append vels (random 10) / 100]

change-image: has [v x n y b][
	clear b: bx/effect/2
	append b [pen red line-width 4 line]
	x: 20
	foreach n nums [
		append b as-pair x 400 * n
		x: x + 40
	]
	append b [pen blue line-width 2 spline 10]
	x: 20
	foreach n nums [
		append b as-pair x 200 * n + 100
		x: x + 40
	]
	v: vels
	n: nums
	forall n [
		y: n/1 + (v/1 * pick [1 5] not t1/data)
		if y < 0   [y: 0 v/1: absolute v/1]
		if y > .99 [y: .99 v/1: negate v/1]
		change n y
		v: next v
	]
	show bx
]

view/new out
forever [
	change-image
	wait 0
	if not viewed? out [quit]
]