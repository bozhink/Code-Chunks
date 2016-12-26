rebol [
	Author: "Robert M. Münch"
	Title: "Wikipedia-On-The-Go"
	Version: 1.0.0
	Date: 29-Jan-2006
	Info: {Entry for the Rebol programming contest 2006.}
]

if system/product == 'Link [
	alert "This program requires Rebol View 1.3 or above. Pleas start through: open with... or öffnen mit..."
	quit
]

;--- general setup for debugging
; link-root: first split-path first split-path system/script/path
; do link-root/framework/anamonitor300.r


;--- Initialization
wiki-dir: %_wikipedia/
if not exists? wiki-dir [make-dir wiki-dir]


scroll-panel-vert: func [pnl bar][
	pnl/pane/offset/y: negate bar/data * (max 0 pnl/pane/size/y - pnl/size/y)
  show pnl
]

;--- Rich-Text Rendering
set-face-style: func [face style' /c colors'] [
	face/font: make face/font [
		style: either block? style [union style style'] [style']
		colors: none
	]

	if c [
		face/font/colors: reduce colors'
		face/font/color: first face/font/colors
	]
]

get-text-size: func [word][
	size-text make face [text: decode 1 word para: make para [origin: margin: 0x0 wrap?: false]]
]

add-output-face: func[word style /http link /local tmp strings right-side][
	; skip empty stuff
	if any [none? word empty? word] [return]

	; handle linefeeds but don't create a face
	if all [word = "^/"] ;  pos/x > 0]
	[
    pos/y: pos/y + 20 ; second size-text make face [text: word]
    pos/x: 0
    return
	]

	; break long text lines to fit face boundaries
	; for this the text will be broken into blocks of strings
	strings: make block! []
	right-side: 15
	if (to-integer first get-text-size word) > (output-face/size/x - right-side) [
		tmp: copy ""
		foreach part parse word "" [
			either ((to-integer first get-text-size rejoin [tmp " " part]) + 3) > (output-face/size/x - right-side)
			[
				; handle face overflow
				append/only strings tmp

			  ; continue next round
				tmp: part
			]
			[
				; append to tmp string as long as possible
				repend tmp [" " part]
			]
		]
	]

	; if empty use input text otherwise add last round as well
	either empty? strings
		[append/only strings word]
		[append/only strings tmp]

	; build richt-text face
	foreach part strings [
		insert tail output-face/pane make face [
	    pane: none
	    state: none
	    offset: pos
	    text: decode 1 part
	    variants: make block! []

	    switch style [
	    	link [
	    		; wiki link is blue and hovered with red
	        set-face-style/c self [underline] [blue red]
	        feel: svv/vid-feel/hot
	        action: func [face value][
	        	; get clicked word and find out, which language to download
	        	sw: face/text

	        	foreach e wikilinks/user-data [
	        		if found? find/any e join sw "*" [append variants e]
	        	]

						either (length? variants) = 1
							[load-wikipedia create-wiki-word variants/1]
							[
								tmp: request-list "Select Wikipedia variant to download:" variants
								load-wikipedia create-wiki-word tmp
							]

						; update selection
						downloaded/picked: rejoin [copy sw "_" get-face wlc]
						show downloaded/update

						wikilinks/picked: reduce [copy sw]
						show wikilinks/update
	        ]
	    	]

	    	bold [
	    		set-face-style self [bold]
	    	]

	    	italic [
	    		set-face-style self [italic]
	    	]

	    	heading [
	    		set-face-style self [bold underline]
	    		self/font: make self/font [size: 16]
	    	]

	    	http-link [
	        set-face-style/c self [underline] [red blue]
	        feel: svv/vid-feel/hot
	        action: func [face value] reduce compose [
	        	'browse (link)
	        ]
	      ]

	    	sub-heading [
	    		set-face-style self [bold]
	    		self/font: make self/font [size: 14]
	    	]
	    ]

	    para: make para [origin: margin: 0x0 wrap?: false]
	    size: (size-text self) + 0x4

			if any [style = 'link style = 'italic style = 'bold][size: size + 2x0]

	    if (pos/x + size/x) > (output-face/size/x - output-face/para/origin/x - output-face/para/margin/x) [
	        pos/y: pos/y + size/y
	        pos/x: 0
	        offset: pos

			    ; set height of output-pane face to new y-position
			    output-face/size/y: pos/y

					; trim space at first position
					text: trim/head text
	    ]
	    pos/x: pos/x + size/x ; + space/x
	  ]
	]
]

;--- Support Functions

;-- WikiWord and language identifier handling
create-wiki-word: func [taged-wikiword /local splitted joined lang][
	splitted: parse/all taged-wikiword "_"

	; strip language identifier
	if all [(length? splitted) > 1 (length? last splitted) = 2][
		lang: copy last splitted
		remove back tail splitted

		; set actual language to stripped language
		set-face wlc wlc/text: lang
	]

	; handle block structure
	joined: copy ""
	foreach e splitted [
		repend joined [e "_"]
	]
	remove back tail joined
	return joined
]

;-- UTF handling
udata: [0 192 224 240 248 252]
decode: func [
    {
    Decode a UTF-8 encoded string into UCS-k string,
    where k = 1, 2, 4.
    Encoded strings which originated from Latin-1
    can be decoded with k = 1, 2, or 4.
    Other encoded Latin-m (m > 1) strings can be
    decoded either with k = 2 or k = 4,
    but not with k = 1.
    }
    k [integer!]
    xs [string!]
    /local m x c result [string!]
][
    result: make string! (length? xs) * k

    ; attemps required, because function sometimes fails and I don't know why
    while [not tail? xs][
        x: first xs
        either x < 128 [
            insert insert/dup tail result #"^@" k - 1 x
        ][
            m: 8 - length? find enbase/base to binary! x 2 #"0"
            x: x xor pick udata m
            attempt [loop m - 1 [x: 64 * x + (63 and first xs: next xs)]]
            result: tail result
            loop k - 1 [
                insert result to char! x and 255
                x: x and -256 / 256
            ]
            attempt [insert result to char! x]
        ]
        xs: next xs
    ]
    head result ; return as much as possible
]

time-it: use [last-time] [
  last-time: none
  duration: 0

  func [] [
    if last-time [duration: now/time/precise - last-time]
    last-time: now/time/precise
    return duration
  ]
]

;-- Wikipedia functions
get-wikipedia-word: func [word /local tmp wikipedia-link wikipedia-special][
	tmp: ""
	wikipedia-link: rejoin [ http:// lowercase copy get-face wlc ".wikipedia.org/w/index.php?"]

	wikipedia-special: switch/default get-face wlc [
		"DE" ["Spezial:Export"]
	]["Special:Export"]

	attempt [tmp: read/custom wikipedia-link reduce ['post	rejoin ["title=" wikipedia-special "&action=submit&pages=" word "&curonly=true"]]]
	return tmp
]


get-content: func [string start-pattern end-pattern /local start end][
	start: find/tail string start-pattern
	end: find string end-pattern

	return attempt [copy/part start ((index? end) - (index? start))]
]

load-wikipedia: func [entry /local-file /local filename page title text downloaded?][
	if any [none? entry empty? entry][return false]

	; already downloaded?
	either local-file
		[
			; local-file so remove language tag
			filename: rejoin [wiki-dir entry %.txt]
			set-face wlc wlc/text: last parse entry "_"
			set-face searchword entry
		]
		[
			; filename to save downloaded content to
			filename: rejoin [wiki-dir to-file entry "_" get-face wlc %.txt]
		]


	either exists? filename
		[
			text: decompress load filename
			downloaded?: false
		]
		[
			;--set GUI info field
			set-face cdl entry
			time-it
			page: get-wikipedia-word entry
			set-face dlt time-it
			set-face cdl ""

			downloaded?: true

			;-- extract content
			title: get-content page <title> </title>
			text: get-content page <text xml:space="preserve"> </text>
		]

	either none? text
		[
			if not get-face adl [alert reform ["Entry for:" entry "not found."]] return false
		]
		[
			;-- parse wiki-content, has to follow the download? handling because at the end of the parsing
			; the wikilinks/user-data list is updated
			parse/all text wiki-rules

			;-- store content if downloaded
			if downloaded? [
				save/all filename compress trim output
				fi: info? filename
				set-face lwas fi/size + to-integer get-face lwas

				; update our downloaded list
				entry: rejoin [entry "_" get-face wlc]
				set-face searchword entry

				if not found? find downloaded/user-data entry [
					append downloaded/user-data entry

					set-face lwa rejoin ["Local Wikipedia Articles (" length? downloaded/user-data ") :"]
				]

				; hightlight just downloaded entry
				set-face downloaded entry
			]

			;-- update wikilinks list
			; first merge wiki-links found in text than exclude allready downloaded wikiwords
			wikilinks/user-data: union wikilinks/user-data links
			wikilinks/user-data: sort exclude wikilinks/user-data downloaded/user-data

			save/all %_auto-dl-links.r wikilinks/user-data

			set-face wl rejoin ["Further Links to follow (" length? wikilinks/user-data ") :"]
			set-face rdl length? wikilinks/user-data

			set-face s1 0
			wikitext/pane output-face ; output is filled by parsing inside load-wikipedia
			scroll-panel-vert wikitext s1

			; f1 is the filter field for the downloaded wikipedia article list
			filter-list f1
			filter-list f2 ; apply filter

			return true
		]
]

;-- filter functions
filter-list: func [face /local list flist e][
	list: get face/user-data/1

	list/data: make block! []
	either empty? face/text
		[list/data: list/user-data]
		[
    	foreach e list/user-data [
    		if found? find e face/text [insert list/data e]
    	]
    ]

	; update textlist, we need to simulate a click on the "up-arrow"
	sort list/data
	list/sld/pane/2/action list/sld/pane/2 0
	show list/update
]

;--- Parse Rules
output: copy ""
output-tmp: copy ""
links: make block! []

space: size-text make face [para: make para [origin: margin: 0x0] text: " "]
pos: 0x0

handle-output-tmp: does [
	append output output-tmp
	add-output-face output-tmp 'text
	clear output-tmp
]

nochar: charset " ^-^/[]"
chars: 	complement nochar

wiki-rules: [
	; initializing done for each parsing
	(
		; clear txt holder
		clear output
		clear output-tmp
		clear links

		; setup new rich-text-face
		clear output-face/pane
		output-face/pane: make block! []
		pos: 0x0
	)

	some [
		"[[" copy word to "]]" 2 skip (

			handle-output-tmp

			if not none? word [
				; replace special chars
				replace word "%28" "("
				replace word "%29" ")"
			]

			; check if link already present
			if all [
				not none? word
				not empty? word
				(length? parse/all word ":") = 1
			][
				; check to see if we have alternativ entries and use the first one
				word: first parse/all word "|"

				; check to see if an anchor point is given and if just use the page
				word: first parse/all word "#"

				; and add to output in all cases
				repend output ["[[" word "]]"]

				; build rich-text face
				add-output-face word 'link

				; add language identifier
				word: rejoin [decode 1 word "_" get-face wlc]

				; add to found links of not already done
				if not found? find links word [append/only links word]
			]
		)
		| "#REDIRECT [[" copy word to "]]" 2 skip (load-wikipedia create-wiki-word word)
		| "'''" copy word to "'''" 3 skip (
			handle-output-tmp
			repend output ["'''" word "'''"] add-output-face word 'bold
		)
		| "''" copy word to "''" 2 skip (
			handle-output-tmp
			repend output ["''" word "''"] add-output-face word 'italic
		)
		| "{{" thru "}}"
		| "===" copy word to "===" 3 skip (
			handle-output-tmp
			repend output ["===" word "==="] add-output-face trim word 'sub-heading
		)
		| "==" copy word to "==" 2 skip (
			handle-output-tmp
			repend output ["==" word "=="] add-output-face trim word 'heading
		)
		| "[http://" copy link some chars [" " copy word to "]" 1 skip | to "]" 1 skip (word: link)] (
			handle-output-tmp
			repend output ["[http://" link " " word "]" ] add-output-face/http word 'http-link link
		)
		| "&lt;!--" thru "&gt;"
		| "&lt;" (append output-tmp "<")
		| "&gt;" (append output-tmp ">")
		| "&quot" (append output-tmp {"})
		| "&amp;times;" (append output-tmp " x ")
		| "&amp;nbsp;"
		| "%28" (append output-tmp "(")
		| "%29" (append output-tmp ")")
		| newline (
			handle-output-tmp
			append output-tmp newline
			handle-output-tmp
		)
		| c: skip (
			c: first c
			if all [
				(to-integer c) <> 226
				(to-integer c) <> 158
				(to-integer c) <> 156
				(to-integer c) <> 129
				(to-integer c) <> 128
			][append output-tmp c]
		)
	] ; some
]

;--- Program GUI
sw: none ; searchword

main-gui: layout [
	style filter field 220x22 feel [
	  engage: func [face act event] [
	    switch act [
				down [
	        either equal? face system/view/focal-face [unlight-text] [focus/no-show face]
	        caret: offset-to-caret face event/offset
	        show face
        ]
        over [
          if not-equal? caret offset-to-caret face event/offset [
            if not highlight-start [highlight-start: caret]
            highlight-end: caret: offset-to-caret face event/offset
            show face
          ]
        ]
        key [
        	system/words/ctx-text/edit-text face event get in face 'action
        	filter-list face
        ]
      ]
	  ]
	]

	style updateable-text-list text-list with [update-slider: does [sld/redrag lc / max 1 length? head lines]]

	at 10x10

	h1 "Wikipedia-On-The-Go Client" guide return
	across
	at 10x50
	label "Search Word:" indent 10
	searchword: field "Ajax" 350x22 [
		hide wikihelp show wikitext

		; get current searchword
		load-wikipedia create-wiki-word get-face searchword
	]

	search: btn "Search" [
		hide wikihelp show wikitext

		; get current searchword
		load-wikipedia create-wiki-word get-face searchword
	]

	btn "Help" [
		either wikihelp/show?
			[hide wikihelp show wikitext]
			[hide wikitext show wikihelp]
	]
	return

	label "Language:" indent 28 wlc: choice 50x20 base-color "DE" "EN" "FR" "SV" "NL" "PL" "PT" "IT" "SP" "NO"
	return


	label "Auto Download:" adl: check
	label "Random Download:" ardl: check
	indent 33 text "References To Download:" indent -5 rdl: text 150x20 return
	at 10x128
	bar 510

	below

	at 10x130
	lwa: label 220x20 "Local Wikipedia Articles:"
	downloaded: text-list 220x500 [
		hide wikihelp show wikitext

		load-wikipedia/local-file copy first get-face downloaded
	]
	return

	at 240x130
	label "Wikipedia Text"
	wikitext: box 550x500 frame
	at 240x157
	wikihelp: area 550x500 wrap
	at 790x156
	s1: scroller 16x501 [scroll-panel-vert wikitext s1]
	return

	at 815x130
	wl: label 220x20 "Referenced Links to follow:"
	wikilinks: text-list 220x500 [
		hide wikihelp show wikitext

		sw: copy first get-face wikilinks
		load-wikipedia create-wiki-word sw

		; update selection
;		downloaded/picked: rejoin [copy sw "_" get-face wlc]
		set-face downloaded sw
		show downloaded/update
	]

	;-- Info fiels
	across
	at 650x45
	label "Currently Downloading:" cdl: text 245x20
	at 690x60
	label "Download Time:" dlt: text 125x20 label "Seconds"
	at 614x75
	label "Local Wikipedia Article Sizes:" lwas: text 125x20 "0" label "Bytes"

	return
	; filter for downloaded wikipedia articles
	f1: filter 220x22 with [user-data: [downloaded]]
	indent 578
	; filter for references to wikipedia articles
	f2: filter 220x22 with [user-data: [wikilinks]]

;	return
;	btn "Debug" [monitor]
;	btn "Halt" [halt]
]

;--- Main Program

; user-data stores the complete master list, data can contain filtered (shortend master list)
downloaded/user-data: make block! []
wikilinks/user-data: make block! []
if exists? %_auto-dl-links.r [
	wikilinks/user-data: load/all %_auto-dl-links.r
]

;-- initialize link lists
files: read wiki-dir
foreach entry files [
	fi: info? wiki-dir/:entry
	set-face lwas fi/size + to-integer get-face lwas

	; add entry names to list
	if (suffix? entry) == %.txt [append downloaded/user-data to-string replace entry suffix? entry ""]
]
downloaded/data: sort downloaded/user-data
downloaded/update
set-face lwa rejoin ["Local Wikipedia Articles (" length? downloaded/user-data ") :"]

wikilinks/data: sort wikilinks/user-data
wikilinks/update
set-face wl rejoin ["Referenced Links to follow (" length? wikilinks/user-data ") :"]
set-face rdl length? wikilinks/user-data

;-- Init GUI field
wlc/edge/color: base-color
wlc/edge/effect: none

; preset text in output face
wikitext/pane: make face [offset: 0x0 size: wikitext/size]
output-face: wikitext/pane
output-face/pane: make block! []

set-face wikihelp {The Wikipedia-On-The-Go client downloads the words you search for to your computersystems and stores the content for later off-line access. To use it just type in a search word and press RETURN or click the search button.

It supports different Wikipedia languages. Just select the language you want to access from the drop-downlist. All search requests will be directed to the selected language site. All downloaded articles are tagged with the language ID to be able to download different language versions. Language setting is changed with respect to the selected word.

On the left side you see the list of all your local (already downloaded) Wikipedia articles. On the right side you see a list of all found Wikiwords contained in the articles on the left side. Just click one to download it.

At the bottom you see two filter-fields for each list. Just start typing characters and you see the list being filtered in real-time. This is your fast search if you have downloaded many Wikipedia articles.

At the top right you see some information fields. These show the article currently being downloaded. The time it took to download the article and the size of all your local articles in bytes.

At the top left you have two check-boxes. The first one starts the autodownload feature. If enabled, the client crawls through the list on the right and downloads one entry after the other starting at the top. If you click the "Random Download" check-box, the download order is random. Wikiwords found in the downloaded articles are added to the list, so that you can perform a recursive download of Wikipedia articles.

To display HELP just click the help button. To hide help, just click the help button again, or search for a word or click any word to download.
}

;-- start main GUI
view/new main-gui

forever [
	; handle GUI events
	wait 1

	; do autodownload
	if get-face adl [
		index: 1
		if get-face ardl	[index: random length? wikilinks/user-data]
		adlsw: wikilinks/user-data/:index ; adlsw = auto-download-search-word

		either none? adlsw
			[set-face adl false set-face ardl false]
			[
				if not load-wikipedia create-wiki-word adlsw [
					; not found, remove it from list
					remove skip wikilinks/user-data index - 1
				]
			]

		save/all %_auto-dl-links.r wikilinks/user-data
	]

;	if not viewed? main-gui [halt]
	if not viewed? main-gui [quit]
]
