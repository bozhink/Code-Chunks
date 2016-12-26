#class CalcWindow <- win32'gui'Window
{
    #field theEdit.
    #field theButton.

    #method ::getLocation = { ::getX = 50 ; ::getY = 50 }.

    #method ::getSize = { ::getWidth = 310 ; ::getHeight = 200 }.

    #method open : aParent
    [
        super open:aParent.

        self::Caption << "Calculator ELENA Sample".

        // init controls
        theEdit := (win32'gui'controls'Edit
                       setLocation:{ ::getX =10 ; ::getY =10 }
                       setSize:{ ::getWidth =200 ; ::getHeight =24 }) open:self.

        theEdit << "1+12*3-14".        

        theButton := (win32'gui'controls'Button
                       setLocation:{ ::getX =220 ; ::getY =10 }
                       setSize:{ ::getWidth =70 ; ::getHeight =30 }) open:self.      

        theButton::Caption << "Evaluate".        
    ]

    #method onCommand : aMessage
    [      
        (('Integer << aMessage::getWParam)::getHiWord == win32'common'BN_CLICKED)
           ? [
              #var anExpression := 'String.

              anExpression << theEdit::getLiteral.

              #var aResult := 'calc'Parsing create:anExpression.  

              theEdit << aResult::asReal
                | << "0".
           ]
           | !. 
    ]    
}

#symbol Start = win32'application'SDIApplication proceed:CalcWindow.
