#class ArithmeticTest
{
    #method do
    [
        #var i := self::Number0.

        i := i + self::Number1.

        (i == self::Number2)?.

        i := i - self::Number1.

        (i== self::Number0)?.

        i := i * self::Number2.

        (i== self::Number4)?.

        i := i / self::Number0.

        (i== self::Number2)?.
    ]
}

#class IntArithmeticTest <- ArithmeticTest
{
    #method ::Name = "Int32 Test".

    #method ::Number0 = -1.

    #method ::Number1 = 3.

    #method ::Number2 = 2.

    #method ::Number4 = -2.
}

#symbol inttest = tests'common'TestCase run:IntArithmeticTest.

#class RealArithmeticTest <- ArithmeticTest
{
    #method ::Name = "Real64 Test".

    #method ::Number0 = 2.3.

    #method ::Number1 = 1.03.

    #method ::Number2 = 3.33.

    #method ::Number4 = 7.659.
}

#symbol realtest = tests'common'TestCase run:RealArithmeticTest.

#static start = (inttest, realtest).

#symbol start2 = tests'test2'chain run.