
    'this short program demonstrates how to measure elapsed
    'time in milliseconds

    start = time$("ms")
    while a < 250000
        a = a + 1
    wend
    print "Elapsed time: "; time$("ms")-start
    end
