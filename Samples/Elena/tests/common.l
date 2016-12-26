#class TestCase
{
    #method run : aCase
    [
        aCase do:self
            [ 'console << aCase::Name << " successful%10". ]
            | [ 'console << aCase::Name << " unsuccessful%10". ].
    ]
}