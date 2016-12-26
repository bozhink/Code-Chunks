#class Connector <- win32'gui'Window
{
    #field cmdQuit.
    #field rbConnectType.

    #method ::getLocation = {::getX = 50; ::getY = 50}.

    #method ::getSize = {::getWidth = 560; ::getHeight = 375}.

    #method open : aParent
    [
        super open:aParent.    

        // Form
		self::Caption << "Up'N'Down: Establish connections with other players".

        // cmdQuit
        cmdQuit := win32'gui'controls'Button
                        setLocation:{::getX = 379; ::getY = 322} setSize:{::getWidth = 145; ::getHeight = 25} open:self.

        cmdQuit::Caption << "Quit Game".

        rbConnectType := win32'gui'controls'radioButtonGroup 
                        setLocation:{::getX = 8; ::getY = 3} setSize:{::getWidth = 521; ::getHeight = 60} open:self.

        rbConnectType::Caption << "Begin game as...".
        rbConnectType addItem:"&Host".
        rbConnectType addItem:"&Client".
    ]

    #method onCommand : aMessage
    [
        #var WParam := aMessage::getWParam.
        #var LParam := aMessage::getLParam.
        (WParam::getHiWord==win32'common'BN_CLICKED)and:(LParam == cmdQuit::getHandle)?
        [
            'application close.
        ].
    ]
}
