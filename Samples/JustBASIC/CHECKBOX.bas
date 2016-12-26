

    ' This code demonstrates how to use checkboxes in your
    ' Just BASIC programs

    nomainwin

    button #1, "&Ok", [quit], UL, 120, 90, 40, 25
    checkbox #1.cb, "I am a checkbox", [set], [reset], 10, 10, 130, 20
    button #1, "Set", [set], UL, 10, 50
    button #1, "Reset", [reset], UL, 50, 50
    textbox #1.text, 10, 90, 100, 24

    WindowWidth = 180
    WindowHeight = 160
    open "Checkbox test" for dialog as #1
    print #1, "trapclose [quit]"

[inputLoop]
    input r$ 

[set]

    print #1.cb, "set"
    goto [readCb]


[reset]

  print #1.cb, "reset"
    goto [readCb]

  end

[readCb]

    print #1.cb, "value?"
    input #1.cb, t$
    print #1.text, "I am "; t$
    goto [inputLoop]

[quit]

    close #1
    end
