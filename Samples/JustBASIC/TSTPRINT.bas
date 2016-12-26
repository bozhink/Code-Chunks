
    'test printing
    filedialog "Select a BASIC program", "*.bas", fname$
    if fname$ = "" then end
    open fname$ for input as #1
    while eof(#1) = 0
        line input #1, text$
        lprint text$
    wend
    close #1
    dump
    end
