

    ' Plot a mandala with 20 vertices
    nomainwin
    dim verticesX(100)
    dim verticesY(100)
    verticesQty = 20
    diameter = 400
    radius = int(diameter/2)
    angle = 360/verticesQty

    ' Open the graphics window
    open "Mandala" for graphics_fs as #mand
    print #mand, "trapclose [quit]"
    print #mand, "home"
    print #mand, "north"
    print #mand, "up"

    ' Create vector table
    for i = 1 to verticesQty

        ' Place turtle in center of screen pointing to top of screen
        print #mand, "home"
        print #mand, "north"

        ' Turn to next vector and 'go' there
        print #mand, "turn "; i * angle
        print #mand, "go "; radius

        ' Ask for turtle position in xy
        print #mand, "posxy vrtcX vrtcY"

        ' Add to table
        verticesX(i) = vrtcX
        verticesY(i) = vrtcY

    next i

    ' Draw - put the pen down
    print #mand, "down"

    ' Draw each individual line in the mandala
    for a = 1 to verticesQty
        for b = a to verticesQty
            print #mand, "line "; verticesX(a); " "; verticesY(a); " "; verticesX(b); " "; verticesY(b)
        next b
    next a

    ' Force the drawing to 'stick'
    print #mand, "flush"

    ' stop to look at the drawing
    wait

[quit]
    ' Close the window
    close #mand
    end