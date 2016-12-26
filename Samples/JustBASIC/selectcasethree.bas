    value = 3
    select case value
        case 1
            print reversed$("one")
        case 2
            print reversed$("two")
        case 3
            print reversed$("three")
        case 4
            print reversed$("four")
        case 5
            print reversed$("five")
        case else
            print value; " is not covered!"
    end select

function reversed$(string$)
    for x = len(string$) to 1 step -1
        reversed$ = reversed$ + mid$(string$, x, 1)
    next x
end function

