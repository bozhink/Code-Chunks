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
        #loop 'Console >> {
            << aLine
            [
                (('basic'Adapter toAnsiLiteral:aLine)::getLength!=0)?
                [
                    (aText::getLength!=0)?
                        [ aText += " ". ]
                        | !.

                    aText += aLine.
                ].
            ]    
        }.

        #var aSearchText := 'String.
        'Console << "Enter the phrase to be found:" >> aSearchText.

        #var aReplaceText := 'String.
        'Console << "Enter the phrase to replace with:" >> aReplaceText.

		sys'processes'SimpleCycle of:aText::getIndexer
			run: {
				proceed : anIndexer 
				[ 
					^ anIndexer seek:aSearchText delete:aSearchText::getLength insert:aReplaceText.
				]
			}.

        'Console << "The resulting text:%10" << aText.
    ]
}