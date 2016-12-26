

    'Simple wave file player
    'You must have sound support installed to
    'use this player!

    template$ = "*.wav"

[loop]

    filedialog "Pick a *.WAV file", template$, w$
    if w$ = "" then [quit]
    playwave w$, asynch

    'get the path and make it the default
    while right$(w$, 1) <> "\"
        w$ = left$(w$, len(w$) - 1)
    wend
    template$ = w$ + "*.wav"

    goto [loop]

[quit]

    end
