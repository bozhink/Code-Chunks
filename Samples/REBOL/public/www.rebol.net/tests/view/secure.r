REBOL [
	Title: "REBOL/View Sandbox Security Check"
	Author: "Carl Sassenrath"
	Version: 1.2.0
	Needs: [1.2.120]
]

; dir read-ok write-ok
checks: reduce [
	%//  false false
	%../ true false
	%./  true true
	what-dir true true
	view-root/.. false false
	view-root true false
	view-root/desktop true false
	system/options/home true false
	system/options/home/.. false false
]

errors: 0
errors++: does [errors: errors + 1]

test: has [result] [
	foreach [dir read-ok write-ok] checks [
		set-face stat reform ["Reading:" dir]
		result: not error? try [read dirize dir false]
		if result <> read-ok [
			alert reform ["ERROR:" pick ["Allowed" "Denied"] result " READ of" dir]
			errors++
		]

		set-face stat reform ["Writing to:" dir]
		result: not error? try [write dir/junk.txt "remove this file" false]
		if result <> write-ok [
			alert reform ["ERROR:" pick ["Allowed" "Denied"] result " WRITE of" dir]
			errors++
		]
	]
	if not error? try [call ""] [
		alert reform ["ERROR: CALL function is enabled"]
		errors++
	]
	if not error? try [load/library %/c/windows/system/gdi32.dll] [
		alert reform ["ERROR: Library interface is enabled"]
		errors++
	]
	foreach word [
		create-link
		create-reg
		ctx-install
		delete-link
		delete-reg
		delete-regs
		delete-reg-hkcr
		exists-reg?
		get-reg
		list-reg
		netscan
		set-browser-path
		set-reg
	][
		if all [value? word not unset? get word] [
			alert reform ["ERROR:" word "is enabled"]
			errors++
		]
	]
	set-face stat reform [errors "security errors occurred"]
]

view layout [
	backeffect [gradient 0x1 red maroon]
	vh2 "Sandbox Security Check:"
	vtext bold 300 {This program tests reblet launch security to verify that reblets run within the proper sandbox.}
	stat: text 300x-1 wrap black snow {This test will pop up security requests. ALWAYS REPLY NO to them - to obtain the proper test results.}
	across
	btn-enter 65 "Test" [test]
	btn-cancel 65 [quit]
]

