

    'First create a short file with some text in it.
    open "myfile.dat" for output as #my
    print #my, "hey diddle diddle"
    close #my

    'Show how to open a file in binary mode, seek to
    'a specific place and write some text.  Then seek
    'again.  Read the text out of the file and print it.
    open "myfile.dat" for binary as #my
    seek #my, 4
    print #my, "doddle"
    seek #my, 4
    print input$(#my, 6)
    close #my

