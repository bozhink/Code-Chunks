

    ' draw a set of concentric circles

    dim color$(4)
    color$(1) = "red"
    color$(2) = "blue"
    color$(3) = "green"
    color$(4) = "yellow"

    open "Circles" for graphics as #1
    print #1, "trapclose [quit]"
        count = 1
        print #1, "home"
        print #1, "down"
        print #1, "size 6"
        for x = 124 to 0 step -12
            print #1, "color "; color$(count)
            count = count + 1
            if count > 4 then count = 1
            print #1, "circle "; x
        next x
        print #1, "flush"
    wait

[quit]
    close #1
    end

