#class Sample
{
    #method run : aCase
    [
        'Console << aCase::Prompt | << "Enter the two number:%10".

        #var a := aCase::FirstNumber.
        #var b := aCase::SecondNumber.

        'Console >> a >> b
            | [
                'Console << "Input error. Aborting%10".

                ^ self fail.
            ].

        'Console << "The sum is " << (a + b) << "%10".        
    ]
}

#symbol IntSample = Sample run:
                    {
                        ::FirstNumber = 'Integer; 
                        ::SecondNumber = 'Integer; 
                        ::Prompt = "Enter the two integer numbers:%10" 
                    }.

#symbol RealSample = Sample run:
                    {
                        ::FirstNumber = 'Real; 
                        ::SecondNumber = 'Real; 
                        ::Prompt = "Enter the two real numbers:%10" 
                    }.
