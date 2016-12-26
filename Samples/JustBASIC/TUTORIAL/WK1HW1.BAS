
    'WK1HW1.BAS
    'Week 1, homework solution 1
    'Just BASIC programming course
    'Copyright 2004 Shoptalk Systems
    'All Rights Reserved

[start]

    'Ask for a dollar and cent amount
    print "Type a dollar and cent amount."
    input "(Press 'Enter' alone for help) ?"; amount

    'Display help if user pressed [Enter]
    if amount = 0 then [help]

    'Calculate tax for the nearest 20 cent multiple
    dollars = int(amount)
    dollarsTax = dollars * 0.05
    cents = amount - dollars
    adjustment = 0.10
    centsAdjusted = cents + adjustment
    centsRounded = int(centsAdjusted / 0.20) * 0.20
    centsTax = (centsRounded / 0.20) / 100
    tax = dollarsTax + centsTax

    'Display the amount, tax, and total
    'Add 0.001 to compensate for any loss of precision because
    'we are dealing with monetary values.
    print "Product Price $"; using("#####.##", amount + 0.001)
    print "Sales Tax      "; using("#####.##", tax + 0.001)
    print "------------------------"
    print "Total          "; using("#####.##", tax + amount + 0.001)
    print
    goto [start]

[help]
    cls
    print "SALESTAX.BAS Help"
    print
    print "This tax program determines how much tax is"
    print "due on an amount entered and also computes"
    print "the total amount.  The tax rate is 5%."
    print
    input "Press [Enter] to continue."; dummyVariable
    cls
    goto [start]
