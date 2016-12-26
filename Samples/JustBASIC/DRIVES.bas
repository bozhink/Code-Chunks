
    'a simple example illustrating the use of the Drives$ variable
    dim letters$(25)
    index = 0
    while word$(Drives$, index + 1) <> ""
        letters$(index) = word$(Drives$, index + 1)
        index = index + 1
    wend
    statictext #choose, "Double-click to pick a drive:", 10, 10, 200, 20
    listbox #choose.list, letters$(, [selectionMade], 10, 35, 100, 150
    open "Scan drive" for dialog as #choose
    print #choose, "trapclose [quit]"
    wait

[selectionMade]
    print #choose.list, "selection? whatsIt$"
    notice "You selected drive "; whatsIt$

[quit]
    close #choose
    end
