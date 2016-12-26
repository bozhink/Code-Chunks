
// --- WordList ---

#class WordList
{
    #field theList.
    #field theTotal.

    #method new
    [          
        theList := 'List.
        theTotal := 'Integer.
    ]

    #method ::getEnumerator = theList::getEnumerator.

    #method ::getTotal = theTotal.

    #method ::getUnique = theList::getCount.

    #method += aWord
    [
        theTotal += 1.
        (theList isContaining:aWord)!
            [ theList += aWord. ]
            | ?.
    ]
}

// --- Program ---

#class Program
{
    #method new
    [
        self start.
    ]

    #method start
    [
        'Console << "Enter the text(to stop press enter two times):%10".

        #var aText := 'String.
        #var aLine := 'String.

        'Console >> aLine.
        #loop (aLine::getLength != 0)?
        [
            aText += aLine += " ".

            'Console >> aLine.
        ].

        aLine << "".
        #var aNewWord := 'Boolean << 'False.
        #var aList := WordList.            
        'scan of:aText
            run: {
                proceed : aChar
                [
                    (aChar::getInteger > 32)?
                    [
                        aLine += aChar.
                        aNewWord << 'True.
                    ]
                    | ![
                        aNewWord?
                        [
                            aList += aLine::getLiteralValue.
                            aLine << "".
                            aNewWord << 'False.
                        ]
                        |!.
                    ].
                ]
            }.
        'Console << "There are " << aList::getUnique << " unquie words out of " << aList::getTotal.
        'Console << "%10the list of unique words:%10".
        ext'console'patterns'ListPrint proceed:aList.
    ]
}