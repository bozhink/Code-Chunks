// --- Program ---

#symbol Modules =  (calc'parser'Numeric, 
                    calc'parser'Sum, 
                    calc'parser'Difference, 
                    calc'parser'Product, 
                    calc'parser'Fraction).

#class Manager
{
    #method process : aLine
    [
        ("-q" == aLine)?
            [ ^ self fail. ]
            | [
                ^ ('calc'Parsing create:aLine) asReal | back:"Invalid expression".
            ].
    ]
}

#class Program <- sys'processes'CommandCycle
{
    #method new
    [
        theInput := { get [  'Console << ">". ^ ext'console'Input get. ] }.
        theOutput := ext'console'Output.

        theOutput set:"ELENA Calculator. Evaluate the expression. To quit type -q".

        self start.
    ]

	#method start
	[
		self run:calc'control'Manager.
	]
}
