REBOL [title: "Update View" version: 1.1.0]

if all [
	system/version < 1.3.1 
	find [
		0.0.0.3.1 ; windows
		0.0.0.2.4 ; OSX
	] system/version and 0.0.0.255.255
][
	do http://www.rebol.com/view/system/upgrade.r
]

if system/version < 1.2.111 [
	; (Newer versions deal with these icons on-demand.)

	files: [
		%text.gif
		%image.gif
		%html.gif
		%email.gif
		%console.gif
		%demo.gif
		%site.gif
		%tool.gif
		%game.gif
		%pdf.gif
		%ms-word.gif
	]

	site: http://www.rebol.com/view/desktop/icons

	foreach file files [
		path: view-root/desktop/icons/:file
		if not exists? path [
			flash reform ["Reading icon file:" file]
			et: error? try [data: read/binary site/:file]
			unview
			either et [alert reform ["Error while reading icon:" file]][
				write/binary path data
			]
		]
	]
]

none
