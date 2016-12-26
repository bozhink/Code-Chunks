// --- Number ---

#class Number
{
    #field theNumber.

    #method ::Level = 3.

    #method + anExpression
    [
        ^ (anExpression + self).
    ]

    #method of : aNumber
    [
        theNumber := aNumber.
    ]

    #method ::asReal = theNumber.
}

// --- SubExpression ---

#class SubExpression
{
    #field theRoot.

    #method ::Level = 255.

    #method ::asInteger = theRoot::asInteger.

    #method ::asReal = theRoot::asReal.

    #method + anExpression
    [
        theRoot := anExpression.
    ]
}

// --- Expression ---

#class Expression
{
    #field theLeft.
    #field theRight.

    #method + anExpression
    [
        (self::Level > anExpression::Level)?
        [
            ^ (anExpression + self).
        ]
        | ! [
            theLeft ifNotNil
            [
                theRight ifNotNil
                [
                    (self::Level == anExpression::Level)?
                        [ ^ (anExpression + self). ]
                        | ! [ theRight := theRight + anExpression. ].
                ]
                | [ theRight := anExpression. ].
            ]
            | [ theLeft := anExpression. ].

            ^ self.
        ].
    ]
}

// --- Sum ---

#class Sum <- Expression
{
    #method ::Level = 1.

    #method asInteger
    [
        ^ (theLeft::asInteger + theRight::asInteger).
    ]

    #method asReal
    [
        ^ (theLeft::asReal + theRight::asReal).
    ]
}

// --- Difference ---

#class Difference <- Expression
{
    #method ::Level = 1.

    #method asInteger
    [
        ^ (theLeft::asInteger - theRight::asInteger).
    ]

    #method asReal
    [
        ^ (theLeft::asReal - theRight::asReal).
    ]
}

// --- Product ---

#class Product <- Expression
{
    #method ::Level = 2.

    #method asInteger
    [
        ^ (theLeft::asInteger * theRight::asInteger).
    ]

    #method asReal
    [
        ^ (theLeft::asReal * theRight::asReal).
    ]
}

// --- Fraction ---

#class Fraction <- Expression
{
    #method ::Level = 2.

    #method asInteger
    [
        ^ (theLeft::asInteger / theRight::asInteger).
    ]

    #method asReal
    [
        ^ (theLeft::asReal / theRight::asReal).
    ]
}
