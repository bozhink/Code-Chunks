// --- Handler ---

#class Handler
{
    #method new : anOwner
    [
        anOwner $addHandler:self.
    ]
}

// --- Numeric ---

#class Numeric <- Handler
{
    #method validate : aLiteral
    [
        'scan of:aLiteral
            run:('Validation of:{validate : aChar [
                #var aCode := aChar::getInteger.
                ((aCode>=48)and:(aCode<=57))or:(aCode==46)?.
            ]})
        ?.
    ]

    #method create : aLiteral
    [
        ^ calc'math'Number of:('basic'Adapter toReal64:aLiteral).
    ]
}

// --- Sum ---

#class Sum <- Handler
{
    #method validate : aLiteral
    [
        ("+" == aLiteral)?.
    ]

    #method create : aLiteral
    [
        ^ calc'math'Sum.
    ]
}

// --- Difference ---

#class Difference <- Handler
{
    #method validate : aLiteral
    [
        ("-" == aLiteral)?.
    ]

    #method create : aLiteral
    [
        ^ calc'math'Difference.
    ]
}

// --- Product ---

#class Product <- Handler
{
    #method validate : aLiteral
    [
        ("*" == aLiteral)?.
    ]

    #method create : aLiteral
    [
        ^ calc'math'Product.
    ]
}

// --- Fraction ---

#class Fraction <- Handler
{
    #method validate : aLiteral
    [
        ("/" == aLiteral)?.
    ]

    #method create : aLiteral
    [
        ^ calc'math'Fraction.
    ]
}

// --- Parser ---

#class Parser
{
    #field theTree.
    #field theToken.
    #field theHandler.
    #field theHandlers.

    #method new
    [
        theHandler := 'nil.
        theToken := 'String.
    ]

    #method of : Handlers
    [
        theHandlers := Handlers.
    ]

    #method getResult 
    [
        ('nil==theTree)
            ? [
                (theToken=="-")
                    ? [ ^ calc'math'Number of:0.0 + (theHandler create:theToken). ]
                    | ![ ^ theHandler create:theToken. ].
            ]
            |! [ ^ theTree + (theHandler create:theToken). ].
    ]

    #method proceed : aCurrent
    [
        (" " == aCurrent) ?[ ^ self. ]|!.            

        #var aNewToken := theToken + aCurrent.

        theHandler validate:aNewToken
        [
            theToken += aCurrent.
        ]
        | [
            ('nil!=theHandler)?
            [
                theTree := self::getResult.
            ]
            |!.

            theHandler := 'Scan of:theHandlers
                run:('Search of:{== aItem [ 
                    aItem validate:aCurrent::getLiteral [ ^'true. ] | [ ^'false. ]. 
                ]}).

            theHandler ifNotNil.

            theToken << aCurrent.
        ].
    ]
}

#class ParsingFactory
{
    #field theHandlers.

    #method new
    [
        theHandlers := std'collections'List.

        'calc'Modules.
    ]

    #method $addHandler : aHandler
    [
        theHandlers += aHandler.
    ]

    #method create : anExpression
    [
        #var aParser := calc'parser'Parser of:theHandlers.

        ^ 'scan of:anExpression run:aParser.
    ]
}

#static Parsing = ParsingFactory.