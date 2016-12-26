

    ' This program ask for a string and then
    ' displays a list of ASCII codes for each
    ' character in the entered string

    input "Please enter a string >"; entry$

    for index = 1 to len(entry$)

        result$ = result$ + str$(asc(mid$(entry$,index,1))) + chr$(13)

    next index

    print result$
