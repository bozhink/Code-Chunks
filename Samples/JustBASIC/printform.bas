
    'printform.bas
    'This example program shows how to use a graphics window to produce
    'printable form without using PCL or graphics characters.  Different
    'fonts and colors are used.

    nomainwin
    WindowWidth = 800
    WindowHeight = DisplayHeight
    open "Printable Form" for graphics as #form
    #form "trapclose [quit]"

    #form "down"
    #form "backcolor 220 220 220"
    #form "size 2"
    #form "place 1 1 ; boxfilled 700 110"
    #form "font arial 16 bold"

    #form "place 20 34"
    #form "\Software Mail-in Order Form"
    #form "font arial 10"
    #form "\Mega2 Super Corporation\PO Box 1029391\Industrialtown, PA 11701\"

    #form "backcolor white"
    #form "place 1 110"
    #form "boxfilled 700 471"

    #form "place 1 471"
    #form "boxfilled 700 970"

    #form "font courier_new 10"
    #form "size 1"
    for a = 1 to 9
        y = 111+a*30
        #form "place 250 "; y
        #form "box 650 "; y + 22
        read label$
        #form "place 50 "; y + 13
        #form "\"; label$
    next a

    #form "place 150 431"
    #form "font courier_new 10 italic"
    #form "\Make sure to provide your email address so we can send"
    #form "\your registration code promptly!"

    #form "place 50 501"
    #form "\ 1) Widget Tools SILVER license:"
    #form "\    "
    #form "\                $29.95 x ____ copies          = $______________.___"
    #form "\"
    #form "\ 2) Widget Tools GOLD license:"
    #form "\"
    #form "\                $49.95 x ____ copies          = $______________.___"
    #form "\"
    #form "\ 3) Upgrade to SILVER license.  You will receive a special"
    #form "\    registration code which works with your v1.x or v2.x or 3.x"
    #form "\    license code to upgrade to v4.0 SILVER!"
    #form "\"
    #form "\                $14.95 x ____ copies          = $______________.___"
    #form "\"
    #form "\ 4) Upgrade to GOLD license.  You will receive a special"
    #form "\    registration code which works with your v1.x or v2.x or v3.0x"
    #form "\    license code to upgrade to v4.0 GOLD!"
    #form "\"
    #form "\                $19.95 x ____ copies          = $______________.___"
    #form "\"
    #form "\    Circle YES below if you want us to mail you an optional CDROM."
    #form "\    Your registration code will be printed clearly on the disk."
    #form "\"
    #form "\    YES  Send me the optional CDROM!          = $            10.00"
    #form "\"
    #form "\"
    #form "\                                Total         = $______________.___"


    #form "flush"
    confirm "Send to printer?"; answer
    if answer then #form "print svga"
    wait
    close #form
    end

    data "Name:", "Address 1:", "Address 2:", "City:", "State:", "Zip Code:"
    data "Email Address:", "Special Instructions:", "Comments:"

[quit]
    close #form
    end
