REBOL [
	Title: "Penguin"
	Author: "Allen Kamp"
	Email: allen@aussieweb.com.au
	Rebsite: http://www.rebolforces.com/index.r
	Date: 20-Feb-2000
	Version: 2.1.1
	Description: "Card Game using CGE" 
	History: [
		2.0.0 [7-Nov-2000 {Modified to use CGE} {Allen K}]
		2.1.0 [19-Apr-2001 {Updated for view 1.1} {Allen K}]
		2.1.1 [11-Jun-2005 "View 1.3" "Allen K"]
	]
]

; load the card game engine
engine: http://www.rebolforces.com/reb/13/cge.bin

either exists-thru? engine [
	error? try [do decompress read/binary path-thru engine]
][      
     error? try [do decompress request-download/to engine path-thru engine]
]


; init card game engine using this rule set
cge/init [
rules: penguin-rules: make rules! [
        beak: none
        score: 0
        game-name: "Penguin"
        drop-legal?: func [new-card dest-card count orig-pile dest-pile /local legal?][
            legal?: false
            return legal?: switch dest-pile/group [
                Tableau [
                    either dest-pile/count = 0 [
                        standard-rules/circulardesc new-card beak 
                    ][
                        standard-rules/suitsamecirculardesc new-card dest-card
                    ]
                ]
                ; Only samesuitrank+1 and only one card.
                Foundation [
                    either dest-pile/count = 0 [
                        All [(standard-rules/ranksame new-card dest-pile) (count = 1)]
                    ][             
                        All [(standard-rules/suitsamecircularasc new-card dest-card) (count = 1)]] 
                    ]
                Flipper [All [(dest-pile/count = 0) (count = 1)]]
            ]
        ]

        set-card-locks: func [pile /local length prev-card this-card sequence locked][
            length: pile/count
            switch pile/group [
                 Tableau [
                     if length > 0 [
                         prev-card: pile/pane/:length
                         prev-card/locked: false
                         sequence: true
                         for i (length - 1) 1 -1 [
                             this-card: pile/pane/:i
                             either (sequence and standard-rules/suitsamecirculardesc prev-card this-card) [
                                 this-card/locked: false
                             ][
                                 this-card/locked: true
                                 sequence: false 
                             ]  
                             prev-card: this-card
                         ]
                     ]
                 ]
                 ;--these two rules are constant so are handled at the pile/lock level
                 ; Foundation [if length > 0 [pile/pane/:length/locked: true]]
                 ; Flipper [if length > 0 [pile/pane/:length/locked: false]]
            ]
        ]
        
        deal: func [/game-num gseed /local index pack card card-id foundation tableau postion][
            clear-piles
            history/reset
            pack: copy []
            foundation: 1
            tableau: 5
            either game-num [pack: shuffled-deck/seeded gseed][pack: shuffled-deck]
            penguin-rules/beak: pick cards first pack
            append piles/:tableau/content first pack cards
            pack: next pack
            piles/:foundation/suit: beak/suit
            piles/:foundation/rank: beak/rank
            tableau: 0
            while [not tail? pack] [
                card-id: first pack
                card: pick cards card-id
                either (card/rank = beak/rank) [
                    foundation: foundation + 1
                    append piles/:foundation/content card-id
                    pack: next pack
                ][
                    tableau: tableau + 1
                    position: (tableau // 7) + 5
                    append piles/:position/content card-id
                    pack: next pack
                ]
    
            ]
            init-piles
            lock-piles
            calc-score
        ]
    
        game-layout: does [return layout800x600]
    
        layout800x600: func [/local block][
            block: copy []
            ;--Foundations
            append block make-foundation 154x27 [] 'Clubs 1
            append block make-foundation 244x27 [] 'Diamonds 2
            append block make-foundation 334x27 [] 'Hearts 3
            append block make-foundation 424x27 [] 'Spades 4
            ;--Tableau
            for i 4 10 1 [
                append block make-pile repair [ (to-integer (i - 4 * 90) + 20) 137] reduce [] 'Tableau i 'vpile
            ]
            ;--Flipper
            for i 11 17 1 [
                append block make-pile repair [ (to-integer (i - 11 * 90)) + 20 490] [] 'Flipper i 'vdeck
            ]
            block
        ]
    
        calc-score: func [/no-show /local old-score][
            old-score: self/score
            self/score: piles/1/count + piles/2/count + piles/3/count + piles/4/count
            move-count: length? first history/export
            moves-lbl/text: move-count
            show moves-lbl  
            if old-score <> self/score [
                score-lbl/text: score
                if not no-show [show score-lbl]
                if self/score = 52 [
                    inform layout [backdrop 0.128.0 effect [gradcol -1x-1 100.100.150 50.150.50]
                        space 0x0
                        text "Congratulations!" font [style: 'bold color: 240.240.204]
                        text (join "Game # " game-number)
                        text "Completed in"
                        text (join form move-count " moves")
                    ]
                ] 
            ]
        ]
    
        ;--------------------
        ;   Auto-complete
        ;--------------------
        auto-complete: does [
            auto-complete-tableau
            lock-piles
    	      calc-score
        ]
    
        auto-complete-tableau: func [/local state-changed][
            state-changed: false
            for pile 5 18 1 [
                if auto-complete-pile piles/:pile [state-changed: true]
            ]
            ;--Recurse until no more changes
            If state-changed [auto-complete-tableau]
        ]
        
        auto-complete-pile: func [pile /local new-card dest-card state-changed foundation][
            new-card: copy []
            dest-card: copy []
            foundation: copy []
            state-changed: false
                for index 1 4 1 [
                    if pile/count <> 0 [
                        foundation: piles/:index
                        new-card: pick pile/pane pile/count
                        dest-card: pick foundation/pane foundation/count
                        if (rules/drop-legal? new-card dest-card 1 pile foundation) [
                            history/add reduce [pile/index new-card/pos 1 index foundation/count + 1]
                            move-cards pile new-card/pos 1 foundation foundation/count + 1
                            state-changed: true
                        ]
                    ]
                ]
            state-changed
        ]

    how-to-play: layout [
       
        size 650x520
        backcolor 0.128.0
        Origin 10x10
		space 0x0
        	text bold "Penguin" snow navy 630
    		
    text black snow as-is font-size 11 630 
    {A game invented by David Parlett and described in his book "Card Games for One
    
    The layout from top to bottom, consists of 3 main areas.
    (1) At the top are the 4 Foundations. The empty first pile can only be started by placing the
    "Beak" card in it. Foundations are built in suit and ascending sequence J, Q, K, A, 2 etc  
    (2) In the middle the tableau, consists of 7 columns. The first card of the first pile is the "Beak".
    (3) At the bottom the "Flipper", consists of 7 reserves which can be used as needed.  

    Your objective is to release the beak and put it in place as the first foundation, and to build all the 
    foundations up into thirteen card ascending suit-sequences. (For example if the beak is a Ten,
    the foundations are all Tens and the sequences runs J, Q, K, A, 2, 3, 4, 5, 6, 7, 8, 9)
    You can, of course, start building on the other three foundations before you get the beak out.

    The uncovered end card of each column is available for building on a foundation pile if it continues the
    sequence, or for packing on the end card in another column in suit and descending sequence, e.g. 8H on 9H etc.
    Alternatively, it may be taken and temporarily put to one side in a reserve known as the 'flipper'.

    The flipper may contain up to seven cards at any one time. Any card of the flipper may be taken and built on 
    a foundation pile or packed on the end of a column provided that it completes the appropriate sequence.

    In the layout, a sequence of properly packed cards may be shifted as a whole to another
    column provided that the join follows the rule. If a space is made by clearing out a column, it may only 
    be filled with a card which is one rank lower than a foundation (e.g. a Nine if the foundations are Tens),
    or with a properly sequence headed by such a card.

    Shortcut Keys ---
        Spacebar for autocomplete, "d" Deal, "r" Repeat Deal, "n" Deal next game#.
        Shift S - for Save, Shift L for Load. "<" ">" Undo, Redo.

    To load a game, deal select game# and load that game. Only 1 save game for each game#
      is currently possible. Saving and loading will enhanced in future updates. 
    
    Enjoy! Allen Kamp allen@aussieweb.com.au}
     label "Close" #"^M" [unview/only how-to-play] 630 right snow navy 
    
    ]             


 
    ] ;---Penguin game rules end
]