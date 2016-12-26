
    'demonstrates radiobuttons

    'don't open a main window, please
    nomainwin

    WindowWidth = 520
    WindowHeight = 220

    groupbox #cfg, "Confirm File Operations:", 240, 20, 200, 140
    radiobutton #cfg.Aalways, "Always", [alwaysConfirm], [waitHere], 260, 45, 130, 20
    radiobutton #cfg.AwhenReplacing, "When Replacing", [whenReplacingConfirm], [waitHere], 260, 70, 130, 20
    radiobutton #cfg.Anever, "Never", [neverConfirm], [waitHere], 260, 95, 130, 20
    groupbox #cfg, "Confirm File Operations:", 20, 20, 200, 140
    radiobutton #cfg.always, "Always", [alwaysConfirm], [waitHere], 40, 45, 130, 20
    radiobutton #cfg.whenReplacing, "When Replacing", [whenReplacingConfirm], [waitHere], 40, 70, 130, 20
    radiobutton #cfg.never, "Never", [neverConfirm], [waitHere], 40, 95, 130, 20
    button #cfg, " &OK ", [cfgOk], UL, 450, 30

    open "Action Confirmation - Setup" for dialog as #cfg
    print #cfg, "trapclose [cfgOk]"

[waitHere]
    wait

[alwaysConfirm]

    status$ = "Always Confirm"
    goto [waitHere]

[whenReplacingConfirm]

    status$ = "When Replacing Confirm"
    goto [waitHere]

[neverConfirm]

    status$ = "Never Confirm"
    goto [waitHere]


[cfgOk]

    confirm status$ + chr$(13) + "Save this configuration?"; answer$
    'perform some sort of save for config here

    close #cfg

    end
