#symbol FailedSymbol = 1 fail.

#class FailedObject { #method new [ self fail. ] }

#class Chain
{
    #method run
    [
        FailedObject.

        self run1
            | [ 'console << "failed symbol is ok". ].
    ]

    #method run1
    [
        FailedSymbol ifnotnil.
    ]

    #method run2
    [
        self ifnotnil:(self fail) | ifnotnil.

        self ifnotnil
            [
                ^ self fail.
            ]
            |
            [
                'console << "test fails".
            ].    
    ]
}