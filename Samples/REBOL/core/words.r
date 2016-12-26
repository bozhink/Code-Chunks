REBOL [
	Title: "REBOL Function Summary"
	Version: 2.0.0
	Author: "Carl Sassenrath"
	Purpose: {Generates an HTML document of REBOL functions.}
]

;-- Build a list of all function words:

word-list: make block! 300
vals: second system/words
foreach word first system/words [ 
	if any-function? first vals [append word-list word]
	vals: next vals
]
sort word-list
bind word-list 'system

;-- Generate the document:

output: make string! 120000

emit: func [data] [repend output data]

get-next: func ['series] [first back set series next get series]

title: "REBOL Function Summary"

emit [
{<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;CHARSET=iso-8859-1">
<TITLE>} title {</TITLE>
<STYLE TYPE="text/css">
BODY, P, TD, OL, UL {
	Font-Family: Arial, Helvetica, sans-serif;
	Font-Size: 10pt;
}
PRE, TT {
	Font-Family: "courier new", courier, monospace;
	Font-Size: 10pt;
}
HR {Color: black; Height: 3;}
</STYLE>
</HEAD>
<BODY BGCOLOR="white">
<H2>}title{</H2>
<BLOCKQUOTE><B>}
"Product: " system/product <BR>
"Version: " system/version <BR>
"Created: " system/build/date <BR>
"Totals: " length? word-list " functions from "
length? first system/words " words" <BR>
{</B></BLOCKQUOTE>}
]

;-- Output the details for each function:

foreach word word-list [
	name: word  ; to get global binding
	args: first get name ; function's arg list
	spec: third get name ; function's specification

	if loc: find args refinement! [args: copy/part args loc]

	emit [
		<HR><P>
		<FONT SIZE="4"><B>name</B> " " <I>mold/only args</I></FONT>
		<BLOCKQUOTE>
		either string? spec/1 [get-next spec]["Undocumented function."]
		<P>
	]

	; Spec format: argument [types] "description"
	while [not empty? spec] [
		if not block? arg: get-next spec [
			if any [arg = /local number? arg] [break]
			types: if block? spec/1 [get-next spec]
			description: either string? spec/1 [get-next spec][""]
			emit pick [
				<FONT COLOR="maroon">
				<FONT COLOR="navy">
			] refinement? arg
			emit [
				<B> mold :arg </B> </FONT> " - " description
				<I> " (" any [types "any value"] ")" </I><BR>
			]
		]
	]
	emit [</BLOCKQUOTE><P> newline]
]

emit {</BODY></HTML>}

print {View words.html with your web browser.}
write %words.html output
if view? [browse %words.html]

