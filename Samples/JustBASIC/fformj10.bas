
    'Freeform-J v1.0a for Just BASIC

    'Copyright 2004 Shoptalk Systems
    'All Rights Reserved

    'This program lets you graphically lay out
    'windows and their controls, and then converts
    'this visual layout to Liberty BASIC source code
    'that you can paste into your Liberty BASIC
    'programming session.

    'INI filename = ffjust.ini
    'FREEFORM-J template save name extension = *.frj


    'set up an arrays to hold control specs

    dim font$(2)    'font$(1)=control font,font$(2)=titlebar font
    dim type$(100)
    dim label$(100)
    dim names$(100)
    dim xOrg(100)
    dim yOrg(100)
    dim width(100)
    dim height(100)
    dim corner$(100)
    dim branchLabel$(100)
    dim segment(100)
    dim handle$(100)
    dim bmpName$(100)
    dim arrayName$(100)
    dim menu$(20)
    dim menuItem$(20, 30)
    dim menuItemLocal$(30)
    dim menuItemCount(20)
    dim winType$(20)
    dim colorType$(20)
    dim info$(10, 10)   'used for getting file listing info
    ffVersion$ = "1.0a"
    index = 0
    resizeable$ = " combobox textbox listbox graphicbox groupbox statictext windowframe textedit button "   'add more as you go
    newControlNumber = 0  'increment by one each time a new control is added
    qu$ = chr$(34)
    controlsThatBranch$ = " button listbox combobox bmpbutton checkbox radiobutton "
    snapOn = 1
    xInterval = 8
    yInterval = 5
    createInspect = 1

    formName$ = "untitled.frj"
    windowXOrigin = 70
    windowYOrigin = 10
    windowXExtent = 550
    windowYExtent = 410
    windowLabel$ = "untitled"
    windowType$ = "window"
    winHandle$ = "#main"
    wincolor$ = "white"
    textcolor$ = "black"
    boxcolor$ = "white"
    menuCount = 0

    winType$(0) = "window"
    winType$(1) = "window_nf"
    winType$(2) = "dialog"
    winType$(3) = "dialog_nf"
    winType$(4) = "dialog_modal"
    winType$(5) = "dialog_nf_modal"
    winType$(6) = "graphics"
    winType$(7) = "graphics_nsb"
    winType$(8) = "graphics_nsb_nf"

    colorType$(1) = "black"
    colorType$(2) = "blue"
    colorType$(3) = "brown"
    colorType$(4) = "cyan"
    colorType$(5) = "darkblue"
    colorType$(6) = "darkcyan"
    colorType$(7) = "darkgray"
    colorType$(8) = "darkgreen"
    colorType$(9) = "darkpink"
    colorType$(10) = "darkred"
    colorType$(11) = "green"
    colorType$(12) = "lightgray"
    colorType$(13) = "palegray"
    colorType$(14) = "pink"
    colorType$(15) = "red"
    colorType$(16) = "white"
    colorType$(17) = "yellow"

    gosub [loadIniFile]

    if left$(windowType$, 6) = "dialog" then loadbmp "systemBox", "bmp\jbicon2.bmp"
    if left$(windowType$, 6) <> "dialog" then loadbmp "systemBox", "bmp\jbicon.bmp"
    loadbmp "minBox",      "bmp\95minbx.bmp"
    loadbmp "maxBox",      "bmp\95maxbx.bmp"
    loadbmp "closebox",    "bmp\95exit.bmp"
    loadbmp "comboButton", "bmp\cmbobttn.bmp"
    loadbmp "radioButton", "bmp\radibttn.bmp"
    loadbmp "checkBox",    "bmp\checkbox.bmp"
    loadbmp "scrollUp",    "bmp\scrlup.bmp"
    loadbmp "scrollDown",  "bmp\scrldown.bmp"
    loadbmp "scrollRight", "bmp\scrlrght.bmp"
    loadbmp "scrollLeft",  "bmp\scrlleft.bmp"

[setUpWindowAndOpenIt]
    nomainwin

    menu #form, "&File", "&New", [newFile], "&Open", [openFile], "&Save", [saveFile], |,"Q&uit", [quit]
    menu #form, "&Control", "&Inspect", [inspectControl], "&Delete", [deleteControl], |, "Move to &front", [moveToFront], "Move to &back", [moveToBack]
    menu #form, "&Output", "&Produce Code", [produceCode], "Produce Code + Outline", [produceCodeAndOutline]
    menu #form, "&Window", "&Title", [changeTitle], "T&ype", [changeWindowType], "&Handle", [changeHandle], "&Window Color", [changeColorType], "&Box Color", [changeBoxColorType]
    menu #form, "O&ptions", "&Auto Snap to Grid", [gridDialog], "&Settings", [settingsDialog]
    menu #form, "&Menu", "&Add a Menu", [addAMenu], "&Remove a Menu", [removeMenu], "&Edit Menus", [editMenus]

    bmpbutton #form.load,   "bmp\loadbttn.bmp", [openFile],           UL, 5, 40
    bmpbutton #form.save,   "bmp\savebttn.bmp", [saveFile],           UL, 35, 40
    bmpbutton #form.static, "bmp\textbttn.bmp", [addStaticText],      UL, 5, 80
    bmpbutton #form.field,  "bmp\efldbttn.bmp", [addField],           UL, 35, 80
    bmpbutton #form.button, "bmp\bttnbttn.bmp", [addButton],          UL, 5, 110
    bmpbutton #form.bmp,    "bmp\usrdbttn.bmp", [addBmpButton],       UL, 35, 110
    bmpbutton #form.list,   "bmp\lboxbttn.bmp", [addListBox],         UL, 5, 140
    bmpbutton #form.combo,  "bmp\cboxbttn.bmp", [addComboBox],        UL, 35, 140
    bmpbutton #form.radio,  "bmp\rdiobttn.bmp", [addRadioButton],     UL, 5, 170
    bmpbutton #form.check,  "bmp\chbxbttn.bmp", [addCheckBox],        UL, 35, 170
    bmpbutton #form.group,  "bmp\gboxbttn.bmp", [addGroupBox],        UL, 5, 200
    bmpbutton #form.edit,   "bmp\tedtbttn.bmp", [addTextEdit],        UL, 35, 200
    bmpbutton #form.graphic,"bmp\grbxbttn.bmp", [addGraphicBox],      UL, 5, 230
    bmpbutton #form.fill,   "bmp\windfill.bmp", [changeBoxColorType], UL, 35, 230
    bmpbutton #form.inspect,"bmp\check.bmp",    [inspectControl],     UL, 5, 270
    bmpbutton #form.delete, "bmp\checkout.bmp", [deleteControl],      UL, 35, 270
    bmpbutton #form.infront,"bmp\infront.bmp",  [moveToFront],        UL, 5, 300
    bmpbutton #form.inback, "bmp\inback.bmp",   [moveToBack],         UL, 35, 300
    bmpbutton #form.code,   "bmp\compile.bmp",  [produceCode],        UL, 5, 330
    bmpbutton #form.outline,"bmp\compile2.bmp", [produceCodeAndOutline], UL, 35, 330

    open "FreeForm-J "+ffVersion$+" for Just BASIC" for graphics_fs_nsb as #form
    font$(2)="system 7 16"
    font$(1)="ms_sans_serif 0 16"
    print #form, "font ";font$(1)
    print #form, "trapclose [quit]";


[drawTheWindow]
    gosub [renderWindow]
    gosub [addWindowFrame]

[setForSelection]
    'set up event handling for the default behavior (selection)
    print #form, "when leftButtonDown [selectControl]";
    print #form, "when leftButtonDouble [inspectControl]";
    print #form, "when leftButtonMove" ;
    print #form, "when leftButtonUp" ;
    wait

[addWindowFrame]    'add the window frame as the first object
    objectCount = objectCount + 1
    idx = objectCount
    xOrg(idx) = 70
    yOrg(idx) = 10
    width(idx) = 550
    height(idx) = 410
    type$(idx) = "windowframe"
    return

[addButton]     'add a new button to the form
    text$ = "Button Caption"
    prompt "Please enter text for this button"; text$
    text$ = noQuotes$(text$)
    if text$ = "" then wait

    newControlNumber = newControlNumber + 1
    objectCount = objectCount + 1
    idx = objectCount
    call addControl "button", newControlNumber, idx, 8*len(text$)+10, 25, text$, "UL"
    branchLabel$(idx) = "["+names$(idx)+"Click]"
    gosub [renderButton]
    if createInspect then gosub [deselectOnly] : index = idx : gosub [selectDeselect] : goto [inspectControl]
    wait

[addBmpButton]     'add a new bmpButton to the form
    bmp$ = ""
    filedialog "Select a bitmap for this button", "*.bmp", bmp$
    if bmp$ = "" then wait

    WindowWidth=222:WindowHeight=240
    UpperLeftX=50:UpperLeftY=50
    graphicbox #bb.g, 10,10,200,100
    button #bb.okay, "OKAY",[bmpbuttonOkay],UL,110,120,100,26
    button #bb.cancel "Cancel",[bmpbuttonCancel],UL,110,150,100,26
    button #bb.again "Select Again",[bmpbuttonSelect],UL,110,180,100,26
    open "Bmpbutton Preview" for window_nf as #bb

[displayBmpbutton]
    print #bb.g, "cls";
    loadbmp "bmptest",bmp$
    print #bb.g, "drawbmp bmptest 0 0";
    wait

[bmpbuttonSelect]
    bmp$ = ""
    filedialog "Select a bitmap for this button", "*.bmp", bmp$
    if bmp$ = "" then wait
    goto [displayBmpbutton]

[bmpbuttonCancel]
    unloadbmp "bmptest"
    close #bb:wait

[bmpbuttonOkay]
    close #bb
    newControlNumber = newControlNumber + 1
    objectCount = objectCount + 1
    idx = objectCount
    call addControl "bmpbutton", newControlNumber, idx, 16, 16, "", "UL"
    bmpName$(idx) = bmp$
    loadbmp bmp$, bmp$
    branchLabel$(idx) = "["+names$(idx)+"Click]"
    gosub [renderBmpButton]

    if createInspect then
        gosub [deselectOnly]
        index = idx
        gosub [selectDeselect]
        goto [inspectControl]
    end if
    wait

[addField]     'add a new field (textBox) to the form
    newControlNumber = newControlNumber + 1
    objectCount = objectCount + 1
    idx = objectCount
    call addControl "textbox", newControlNumber, idx, 100, 25, "", ""
    gosub [renderTextBox]
    if createInspect then gosub [deselectOnly] : index = idx : gosub [selectDeselect] : goto [inspectControl]
    wait

[addTextEdit]     'add a new field (textBox) to the form
    newControlNumber = newControlNumber + 1
    objectCount = objectCount + 1
    idx = objectCount
    call addControl "textedit", newControlNumber, idx, 100, 100, "", ""
    gosub [renderTextEdit]
    if createInspect then gosub [deselectOnly] : index = idx : gosub [selectDeselect] : goto [inspectControl]
    wait

[addComboBox]     'add a new combobox to the form
    newControlNumber = newControlNumber + 1
    objectCount = objectCount + 1
    idx = objectCount
    call addControl "combobox", newControlNumber, idx, 100, 100, "", ""
    branchLabel$(idx) = "["+names$(idx)+"DoubleClick]"
    arrayName$(idx) = "array$("
    gosub [renderComboBox]
    if createInspect then gosub [deselectOnly] : index = idx : gosub [selectDeselect] : goto [inspectControl]
    wait

[addListBox]     'add a new listbox to the form
    newControlNumber = newControlNumber + 1
    objectCount = objectCount + 1
    idx = objectCount
    call addControl "listbox", newControlNumber, idx, 100, 100, "", ""
    branchLabel$(idx) = "["+names$(idx)+"DoubleClick]"
    arrayName$(idx) = "array$("
    gosub [renderListBox]
    if createInspect then gosub [deselectOnly] : index = idx : gosub [selectDeselect] : goto [inspectControl]
    wait

[addStaticText]     'add statictext to the form
    text$ = "StaticText Caption"
    prompt "Please enter the text you would like to add:"; text$
    text$ = noQuotes$(text$)
    if text$ = "" then wait

    newControlNumber = newControlNumber + 1
    objectCount = objectCount + 1
    idx = objectCount
    call addControl "statictext", newControlNumber, idx, 8 * len(text$), 20, text$, ""
    gosub [renderStaticText]
    if createInspect then gosub [deselectOnly] : index = idx : gosub [selectDeselect] : goto [inspectControl]
    wait

[addGroupBox]     'add groupbox to the form
    text$ = "GroupBox Caption"
    prompt "Please enter the text this GroupBox :"; text$
    text$ = noQuotes$(text$)
    if text$ = "" then wait

    newControlNumber = newControlNumber + 1
    objectCount = objectCount + 1
    idx = objectCount
    call addControl "groupbox", newControlNumber, idx, 100, 100, text$, ""
    gosub [renderGroupBox]
    if createInspect then gosub [deselectOnly] : index = idx : gosub [selectDeselect] : goto [inspectControl]
    wait

[addGraphicBox]     'add graphicbox to the form
    newControlNumber = newControlNumber + 1
    objectCount = objectCount + 1
    idx = objectCount
    call addControl "graphicbox", newControlNumber, idx, 100, 100, "", ""
    gosub [renderGraphicBox]
    if createInspect then gosub [deselectOnly] : index = idx : gosub [selectDeselect] : goto [inspectControl]
    wait

[addRadioButton]     'add radiobutton to the form
    text$ = "RadioButton Caption"
    prompt "Please enter a label for the radiobutton:"; text$
    text$ = noQuotes$(text$)
    if text$ = "" then wait

    newControlNumber = newControlNumber + 1
    objectCount = objectCount + 1
    idx = objectCount
    call addControl "radiobutton", newControlNumber, idx, 100, 25, text$, ""
    branchLabel$(idx) = "["+names$(idx)+"Set] ["+names$(idx)+"Reset]"
    gosub [renderRadioButton]
    if createInspect then gosub [deselectOnly] : index = idx : gosub [selectDeselect] : goto [inspectControl]
    wait

[addCheckBox]     'add checkbox to the form
    text$ = "CheckBox Caption"
    prompt "Please enter a label for the checkbox"; text$
    text$ = noQuotes$(text$)
    if text$ = "" then wait

    newControlNumber = newControlNumber + 1
    objectCount = objectCount + 1
    idx = objectCount
    call addControl "checkbox", newControlNumber, idx, 100, 25, text$, ""
    branchLabel$(idx) = "["+names$(idx)+"Set] ["+names$(idx)+"Reset]"
    gosub [renderCheckBox]
    if createInspect then gosub [deselectOnly] : index = idx : gosub [selectDeselect] : goto [inspectControl]
    wait

[inputLoop]
    wait

[renderWindow]
    'render the window depending on the value of windowType$
    xOrg = windowXOrigin
    yOrg = windowYOrigin
    xExt = windowXExtent
    yExt = windowYExtent

    print #form, "cls; fill 255 250 230";
    gosub [renderToolbox]

    'render gui:
    print #form, "font ";font$(1);

    print #form, "color black ; down ; size 1";
    print #form, "place "; xOrg + 4; " "; yOrg + 4;
    print #form, "backcolor "; wincolor$;"";
    print #form, "boxfilled "; xOrg + xExt - 4; " "; yOrg + yExt - 4;
    if instr(windowType$, "_nf") > 0 then [noResizingFrame]

    'draw resizing frame
    print #form, "color lightgray ; size 3";
    if windowType$ = "dialog" then print #form, "color darkgray";
    print #form, "place "; xOrg + 2; " "; yOrg + 2;
    print #form, "box "; xOrg + xExt - 2; " "; yOrg + yExt - 2;
    print #form, "color black ; backcolor white ; size 1";
    print #form, "place "; xOrg; " "; yOrg;
    print #form, "box "; xOrg + xExt ; " "; yOrg + yExt;

  [noResizingFrame]
    'draw titlebar
    print #form, "color black ; backcolor darkblue";
    if left$(windowType$, 6) = "dialog" then print #form, "backcolor darkgray";
    print #form, "place "; 4 + xOrg; " "; 4 + yOrg;
    print #form, "boxfilled "; xOrg + xExt - 4; " "; 4 + yOrg + 20;
    print #form, "place "; 20 + xOrg ; " "; 18 + yOrg;
    print #form, "color white; font ";font$(2)
    print #form, "\"; windowLabel$;
    print #form, "font ";font$(1)

    'draw buttons
    print #form, "drawbmp systemBox "; xOrg + 4; " "; 4 + yOrg;
    print #form, "backcolor white ; color black ; down ; size 1";
    if windowType$ = "dialog" then print #form, "color white" ;
    print #form, "place "; xOrg + 4; " "; yOrg + 4;
    print #form, "box "; xOrg + xExt - 4; " "; yOrg + yExt - 4;
    if left$(windowType$, 6) = "dialog" then [drawMenus]
    if instr(windowType$, "_nf") then print #form, "drawbmp closebox "; xOrg + xExt - 24 - 1; " "; 7 + yOrg; : goto [drawMenus]
    print #form, "drawbmp minBox "; xOrg + xExt - 60; " "; 7 + yOrg;
    print #form, "drawbmp maxBox "; xOrg + xExt - 44; " "; 7 + yOrg;
    print #form, "drawbmp closebox "; xOrg + xExt - 24; " "; 7 + yOrg;

  [drawMenus]
    if menuCount = 0 then [dontDrawMenus]
    print #form, "color black ; backcolor lightgray" ;
    print #form, "place "; 4 + xOrg; " "; 23 + yOrg;
    print #form, "boxfilled "; xOrg + xExt - 4; " "; 24 + yOrg + 20 ;
    string$ = ""
    underline$ = ""
    for x = 0 to menuCount - 1
        item$ = menu$(x)
        hkIndex = instr(menu$(x), "&")
        if hkIndex = 0 then [noHotKey]
        item$ = left$(item$, hkIndex - 1) + mid$(item$, hkIndex + 1)
        underline$ = underline$ + chr$(len(string$)+hkIndex)
      [noHotKey]
        string$ = string$ + item$ + "  "
    next x
    print #form, "place "; xOrg + 10; " "; 38 + yOrg ;
    print #form, "\"; string$;
    if len(underline$) = 0 then [dontDrawMenus]
    for x = 1 to len(underline$)
        print #form, "place "; xOrg + 10 + (asc(mid$(underline$, x, 1)) - 1) * 8; " "; yOrg + 40 ;
        print #form, "north ; turn 90 ; go 8";
    next x

  [dontDrawMenus]
    print #form, "flush" ;
    return

[renderToolbox]
   'render toolbox:
    print #form, "color darkgray; down; size 2; backcolor lightgray";
    print #form, "place 2 11; boxfilled 67 362";
    print #form, "color 150 110 80;backcolor 150 110 80";
    print #form, "place 5 13;boxfilled 65 34"
    print #form, "color white; font arial bold 10"
    print #form, "place 8 28;|Toolbox";
    return

[changeTitle]
    'change the window's title
    newWindowLabel$ = windowLabel$
    prompt "Specify the window's title"; newWindowLabel$
    if newWindowLabel$ <> "" then windowLabel$ = newWindowLabel$
    gosub [redrawAll]
    wait

[changeWindowType]
    WindowWidth = 290:WindowHeight = 140

    'change the window's type
    statictext #type.statictext1, "Select the type of window desired:", 14, 11, 272, 20
    combobox #type.types, winType$(, [selectWinType], 14, 36, 256, 115
    button #type.default, "Accept", [acceptWinType], UL, 146, 71,100,24
    button #type, "Cancel", [cancelWinType], UL, 30, 71,100,24
    open "Select Window Type" for dialog_modal as #type
    print #type.types, "select "; windowType$ 
    print #type, "trapclose [cancelWinType]"
    defaultType$ = windowType$ 
    wait

[selectWinType]   'Perform action for the combobox named 'types'
    'select the type of window desired
    print #type.types, "selection?";
    input #type.types, defaultType$
    wait

[acceptWinType]   'Perform action for the button named 'acceptWinType'
    'accept the selected window type
    close #type
    if windowType$ <> defaultType$ then windowType$ = defaultType$
    If left$(windowType$,6) = "dialog" or  left$(windowType$,6) = "window" then wincolor$ = "white"
    if left$(windowType$, 6) = "dialog" then loadbmp "systemBox", "bmp\jbicon2.bmp"
    if left$(windowType$, 6) <> "dialog" then loadbmp "systemBox", "bmp\jbicon.bmp"
    gosub [redrawAll]
    wait

[cancelWinType]   'Perform action for the button named 'cancelWinType'
    'close the window, don't accept type change
    close #type
    wait

[changeColorType]
    if  left$(windowType$, 8) <> "graphics" then notice " Error!" + chr$(13) + " Colored windows only supported in Graphics" : wait
    WindowWidth = 290
    WindowHeight = 140
    'change the window's color type
    statictext #type.statictext1, "Select the window color desired:", 14, 11, 272, 20
    combobox #type.types, colorType$(, [selectColorType],  14, 36, 256, 115
    button #type.default, "Accept", [acceptColorType], UL, 146, 71,100,24
    button #type, "Cancel", [cancelColorType], UL, 30, 71,100,24
    open "Select Window Type" for dialog_modal as #type
    print #type.types, "select "; wincolor$ 
    print #type, "trapclose [cancelColorType]"
    colorDefaultType$ = colorType$
    wait

[selectColorType]   'Perform action for the combobox named 'types'
    'select the type of window color desired
    print #type.types, "selection?";
    input #type.types, colorDefaultType$
    wait

[acceptColorType]   'Perform action for the button named 'acceptColorType'
    'accept the selected window type
    close #type
    if colorType$ <> colorDefaultType$ then colorType$ = colorDefaultType$
    wincolor$ = colorType$
    gosub [redrawAll]
    wait

[cancelColorType]   'Perform action for the button named 'cancelColorType'
    'close the window, don't accept type change
    close #type
    wait

[changeBoxColorType]
    if  left$(windowType$, 8) <> "graphics" then notice " Error!" + chr$(13) + " Colored windows only supported in Graphics" : wait
    WindowWidth = 290:WindowHeight = 140
    'change the window's color type
    statictext #type.statictext1, "Select the window color desired:", 14, 11, 272, 20
    combobox #type.types, colorType$(, [selectBoxColorType],  14, 36, 256, 115
    button #type.default, "Accept", [acceptBoxColorType], UL, 146, 71,100,24
    button #type, "Cancel", [cancelBoxColorType], UL, 30, 71,100,24
    open "Select Window Type" for dialog_modal as #type
    print #type.types, "select "; boxcolor$ 
    print #type, "trapclose [cancelBoxColorType]"
    colorBoxDefaultType$ = colorType$
    wait

[selectBoxColorType]   'Perform action for the combobox named 'types'
    'select the type of window color desired
    print #type.types, "selection?";
    input #type.types, colorBoxDefaultType$
    wait

[acceptBoxColorType]   'Perform action for the button named 'acceptColorType'
    'accept the selected window type
    close #type
    if colorType$ <> colorBoxDefaultType$ then colorType$ = colorBoxDefaultType$
    boxcolor$ = colorType$
    gosub [redrawAll]
    wait

[cancelBoxColorType]   'Perform action for the button named 'cancelColorType'
    'close the window, don't accept type change
    close #type
    wait

[changeHandle]
    'change the window's handle
    prompt "Specify the window's handle (starts with a #)"; result$
    if result$ = "" then wait
    winHandle$ = result$
    if left$(winHandle$, 1) <> "#" then winHandle$ = "#" + winHandle$ : notice "Window handle defaults to: " + winHandle$
    wait

'This function is used at the tail end of rendering any control
function postRender(idx, displayOrdering)
    if displayOrdering then
        print #form, "color white ; backcolor black ; place " + str$(xOrg(idx)-4) + " " + str$(yOrg(idx)+7)
        print #form, "\" + str$(idx - 1)
    end if
    print #form, "up ; flush" ;
    print #form, "segment" : input #form, id
    segment(idx) = id
    end function

[renderButton]
    'render the button at idx.
    'assume an font 8 bits wide
    'type$(idx) = "button"
    xOrgIdx = xOrg(idx)
    yOrgIdx = yOrg(idx)
    print #form, "place "; xOrgIdx; " "; yOrgIdx ;
    print #form, "place "; xOrgIdx; " "; yOrgIdx ;
    print #form, "color black ; backcolor lightgray ; size 1" ;
    print #form, "down ; boxfilled "; xOrgIdx+width(idx); " "; yOrgIdx+height(idx) ;
    print #form, "size 2 ; color darkgray ; place "; xOrgIdx+2; " "; yOrgIdx+2 ;
    print #form, "box "; xOrgIdx+width(idx)-1; " "; yOrgIdx+height(idx)-1 ;
    print #form, "color white" ;
    print #form, "place  "; xOrgIdx+2; " "; yOrgIdx+height(idx)-3 ;
    print #form, "goto "; xOrgIdx+2; " "; yOrgIdx+2 ;
    print #form, "goto "; xOrgIdx+width(idx)-3; " "; yOrgIdx+2 ;
    print #form, "color black ; backcolor lightgray ; size 1" ;
    print #form, "place "; xOrgIdx+int((width(idx)-len(label$(idx))*8)/2); " "; yOrgIdx+int((height(idx)-15)/2)+12 ;
    print #form, "\"; label$(idx);
    result = postRender(idx, displayOrdering)
    return

[renderStaticText]
    'render the statictext at idx.
    'assume an font 8 bits wide, 15 high
    'type$(idx) = "statictext"
    print #form, "place "; xOrg(idx); " "; yOrg(idx)+15-3 ; " ; place "; xOrg(idx); " "; yOrg(idx)+15-3 ;
    print #form, "down ; color black ; backcolor white";
    print #form, "\"; label$(idx);
    result = postRender(idx, displayOrdering)
    return

[renderRadioButton]
    'render the radiobutton at idx.
    'assume an font 8 bits wide, 15 high
    'type$(idx) = "radiobutton"
    width(idx) = 8 * len(label$(idx)) + 16
    height(idx) = 20
    print #form, "down" ;
    print #form, "place "; xOrg(idx); " "; yOrg(idx);
    print #form, "drawbmp radioButton "; xOrg(idx); " "; yOrg(idx);
    print #form, "color black ; backcolor white" ;
    print #form, "place "; xOrg(idx)+16; " "; yOrg(idx)+15-3 ;
    print #form, "\"; label$(idx);
    result = postRender(idx, displayOrdering)
    return

[renderCheckBox]
    'render the checkbox at idx.
    'assume an font 8 bits wide, 15 high
    'type$(idx) = "checkbox"
    width(idx) = 8 * len(label$(idx)) + 16
    height(idx) = 20
    print #form, "place "; xOrg(idx); " "; yOrg(idx) ;
    print #form, "down" ;
    print #form, "drawbmp checkBox "; xOrg(idx); " "; yOrg(idx);
    print #form, "color black ; backcolor white" ;
    print #form, "place "; xOrg(idx)+16; " "; yOrg(idx)+15-3 ;
    print #form, "\"; label$(idx);
    result = postRender(idx, displayOrdering)
    return

[renderBmpButton]
    'render the bmpbutton at idx.
    'assume a font 8 bits wide
    'type$(idx) = "bmpbutton"

    open bmpName$(idx) for input as #pic
    pic$=input$(#pic,25)
    close #pic
    bmpwidth = asc(mid$(pic$,19,1)) + (asc(mid$(pic$,20,1)) * 256)
    bmpheight = asc(mid$(pic$,23,1)) + (asc(mid$(pic$,24,1)) * 256)

    width(idx) = bmpwidth : height(idx) = bmpheight
    loadbmp "thisbmpbutton",bmpName$(idx)
    print #form, "place "; xOrg(idx); " "; yOrg(idx) ;
    print #form, "drawbmp thisbmpbutton "; xOrg(idx); " "; yOrg(idx);
    result = postRender(idx, displayOrdering)
    return

[renderComboBox]
    'render the comboBox at idx.
    'type$(idx) = "combobox"
    print #form, "place "; xOrg(idx); " "; yOrg(idx) ;
    print #form, "place "; xOrg(idx); " "; yOrg(idx) ;
    print #form, "color black ; backcolor white ; size 1" ;
    print #form, "down ; boxfilled "; xOrg(idx)+width(idx)-24; " "; yOrg(idx)+22 ;
    print #form, "drawbmp comboButton "; xOrg(idx)+width(idx)-16 ; " "; yOrg(idx) ;
    result = postRender(idx, displayOrdering)
    return

[renderTextBox]
    'render the textbox at idx.
    'type$(idx) = "textbox"
    print #form, "place "; xOrg(idx); " "; yOrg(idx) ; " ; place "; xOrg(idx); " "; yOrg(idx) ;
    print #form, "color black ; backcolor white ; size 1" ;
    print #form, "down ; boxfilled "; xOrg(idx)+width(idx); " "; yOrg(idx)+height(idx) ;
    result = postRender(idx, displayOrdering)
    return

[renderTextEdit]
    'render the textedit at idx.
    'type$(idx) = "textedit"
    print #form, "place "; xOrg(idx); " "; yOrg(idx) ;
    print #form, "place "; xOrg(idx); " "; yOrg(idx) ;
    print #form, "color black ; backcolor white ; size 1" ;
    print #form, "down ; boxfilled "; xOrg(idx)+width(idx); " "; yOrg(idx)+height(idx) ;
    print #form, "color black ; backcolor lightgray" ;
    print #form, "place "; xOrg(idx)+width(idx)-17; " "; yOrg(idx);
    print #form, "boxfilled "; xOrg(idx)+width(idx); " "; yOrg(idx)+height(idx)-17 ;
    print #form, "drawbmp scrollUp "; xOrg(idx)+width(idx)-17; " "; yOrg(idx);
    print #form, "drawbmp scrollDown "; xOrg(idx)+width(idx)-17; " "; yOrg(idx)+height(idx)-33;
    print #form, "place "; xOrg(idx); " "; yOrg(idx)+height(idx)-17;
    print #form, "boxfilled "; xOrg(idx)+width(idx); " "; yOrg(idx)+height(idx) ;
    print #form, "drawbmp scrollLeft "; xOrg(idx); " "; yOrg(idx)+height(idx)-17;
    print #form, "drawbmp scrollRight "; xOrg(idx)+width(idx)-33; " "; yOrg(idx)+height(idx)-17;
    result = postRender(idx, displayOrdering)
    return

[renderListBox]
    'render the listbox at idx.
    'type$(idx) = "listbox"
    print #form, "place "; xOrg(idx); " "; yOrg(idx) ;
    print #form, "place "; xOrg(idx); " "; yOrg(idx) ;
    print #form, "color black ; backcolor white ; size 1" ;
    print #form, "down ; boxfilled "; xOrg(idx)+width(idx); " "; yOrg(idx)+height(idx) ;
    print #form, "color black ; backcolor lightgray" ;
    print #form, "place "; xOrg(idx)+width(idx)-17; " "; yOrg(idx);
    print #form, "boxfilled "; xOrg(idx)+width(idx); " "; yOrg(idx)+height(idx) ;
    print #form, "drawbmp scrollUp "; xOrg(idx)+width(idx)-17; " "; yOrg(idx);
    print #form, "drawbmp scrollDown "; xOrg(idx)+width(idx)-17; " "; yOrg(idx)+height(idx)-17;
    result = postRender(idx, displayOrdering)
    return

[renderGraphicBox]
    'render the graphicbox at idx.  assume a font 8x15.
    'type$(idx) = "graphicbox"
    print #form, "place "; xOrg(idx); " "; yOrg(idx) ;
    print #form, "place "; xOrg(idx)+4 ; " "; yOrg(idx)+8 ;
    print #form, "color black ; backcolor "; boxcolor$ ;"; size 1" ;
    print #form, "down ; boxfilled "; xOrg(idx)+width(idx)-4; " "; yOrg(idx)+height(idx)-7 ;
    result = postRender(idx, displayOrdering)
    return

[renderGroupBox]
    'render the groupbox at idx.  assume a font 8x15.
    'type$(idx) = "groupbox"
    print #form, "place "; xOrg(idx); " "; yOrg(idx) ;
    print #form, "place "; xOrg(idx)+4 ; " "; yOrg(idx)+8 ;
    print #form, "color black ; backcolor white ; size 1" ;
    print #form, "down ; boxfilled "; xOrg(idx)+width(idx)-4; " "; yOrg(idx)+height(idx)-7 ;
    print #form, "place "; xOrg(idx)+8; " "; yOrg(idx)+15 ;
    print #form, "\"; label$(idx);
    result = postRender(idx, displayOrdering)
    return

[inspectControl]
    'pop up a dialog for displaying/modifying control
    'properties
    if index < 2 then wait
    if inspectIsOpen = 1 then [fillInspect]
    inspectIsOpen = 1

NOMAINWIN
WindowWidth =  155 : WindowHeight =  255
UpperLeftX=100:UpperLeftY=50
    statictext #inspect.st, "type",    1, 0, 48, 18
    statictext #inspect.sx, "x-org",   1, 21, 48, 18
    statictext #inspect.sy, "y-org",   1, 42, 48, 18
    statictext #inspect.sw, "width",   1, 63, 48, 18
    statictext #inspect.sh, "height",  1, 84, 48, 18
    statictext #inspect.sc, "caption", 1, 105, 48, 18
    statictext #inspect.sb, "branch",  1, 126, 48, 18
    statictext #inspect.se, ".ext",    1, 147, 48, 18
    statictext #inspect.sa, "array(",  1, 168, 48, 18

    statictext #inspect.type, "Type",  50, 0, 90, 20
    textbox #inspect.x,                50, 21, 90, 20
    textbox #inspect.y,                50, 42, 90, 20
    textbox #inspect.w,                50, 63, 90, 20
    textbox #inspect.h,                50, 84, 90, 20
    textbox #inspect.labelField,       50, 105, 90, 20
    textbox #inspect.branchLabelField, 50, 126, 90, 20
    textbox #inspect.nameField,        50, 147, 90, 20
    textbox #inspect.arrayNameField,   50, 168, 90, 20

    button #inspect.default, "Accept",[acceptInspect],UL,74,196,70,24
    button #inspect.cancel, "Cancel",[cancelInspect],UL,  1,196,70,24

    Open "Properties" for dialog as #inspect
    print #inspect, "trapclose [cancelInspect]";
    print #inspect, "font ms_sans_serif 8"

[fillInspect]
    print #inspect.x, "!setfocus"

    print #inspect.type, upper$(type$(index))

    print #inspect.labelField, label$(index)
    print #inspect.nameField, names$(index)
    print #inspect.branchLabelField, branchLabel$(index)
    print #inspect.arrayNameField, arrayName$(index)
    dummyx$=str$(xOrg(index)-xOrg-4)
    dummyy$=str$(yOrg(index)-yOrg-20-4)
    print #inspect.x, dummyx$
    print #inspect.y, dummyy$
    print #inspect.w, str$(width(index))
    print #inspect.h, str$(height(index))

    if instr(" button statictext checkbox radiobutton graphicbox groupbox ", type$(index)) = 0 then print #inspect.labelField, "n/a"
    if instr(controlsThatBranch$, type$(index)) = 0 then print #inspect.branchLabelField, "n/a"
    if instr(" listbox combobox ", type$(index)) > 0 then print #inspect.arrayNameField, arrayName$(index) else print #inspect.arrayNameField, "n/a"
    wait

[acceptInspect]
    'set the properties as modified by the user
    isModified = 1  'the form has been modified
    print #inspect.nameField, "!contents? names$" : names$(index) = names$
    branches = instr(controlsThatBranch$, type$(index))
    if branches > 0 then print #inspect.branchLabelField, "!contents? bLabel$" : branchLabel$(index) = bLabel$
    usesArray = instr(" listbox combobox ", type$(index))
    if usesArray > 0 then print #inspect.arrayNameField, "!contents? aName$" : arrayName$(index) = aName$

    print #inspect.x, "!contents? dummy$" : xOrg(index)=val(dummy$)+xOrg+4
    print #inspect.y, "!contents? dummy$" : yOrg(index)=val(dummy$)+yOrg+24
    print #inspect.w, "!contents? dummy$" : width(index)=val(dummy$)
    print #inspect.h, "!contents? dummy$" : height(index)=val(dummy$)
    print #inspect.labelField, "!contents? label$" : label$(index) = label$ 

    close #inspect
    inspectIsOpen = 0
    gosub [redrawAll]
    wait

[cancelInspect]
    'close the inspector window
    close #inspect
    inspectIsOpen = 0
    wait

[selectControl]
    'set up event handling
    print #form, "when leftButtonUp [setForSelection]" ;
    print #form, "when leftButtonDown" ;

    'highlight the control at the mouse click position
    x = MouseX : y = MouseY
    if index = 0 then [dontDeselect]

    'check to see if the resize handle has been clicked on, if applicable
    if instr(resizeable$, type$(index)) = 0 then [deselect]
    if x < xOrg(index)+width(index)-3 or x > xOrg(index)+width(index)+3 then [deselect]
    if y < yOrg(index)+height(index)-3 or y > yOrg(index)+height(index)+3 then [deselect]
    goto [resizeControl]

[deselect]
    print #form, "delsegment "; selectId -1 ;
    gosub [selectDeselect]
    index = 0
    print #form, "delsegment "; selectId - 1 ;

[dontDeselect]
    gosub [determineControl]
    if newIndex = 0 then [setUpMovementEvent]
    index = newIndex
    gosub [selectDeselect]
    lastMouseX = MouseX
    lastMouseY = MouseY

[setUpMovementEvent]
    if type$(newIndex) = "windowframe" then wait
    print #form, "when leftButtonMove [beginObjectMove]" ;
    wait

[determineControl]
    'based on x/y, determine which control is selected
    'set newIndex to point to this control, if found
    'otherwise set newIndex to 0
    if objectCount = 0 then return

    newIndex = 0
    for i = objectCount to 1 step -1
        if newIndex > 0 then [skipControl]
        if type$(i) = "" then [skipControl]
        if x < xOrg(i) or x > xOrg(i)+width(i) then [skipControl]
        if y < yOrg(i) or y > yOrg(i)+height(i) then [skipControl]
        newIndex = i
        i = 1
[skipControl]
    next i
    return

[selectDeselect]
    'select or deselect the object at index by drawing handles
    xOrgIdx = xOrg(index)
    yOrgIdx = yOrg(index)
    xow = xOrgIdx+width(index)
    yoh = yOrgIdx+height(index)
    print #form, "rule xor ; down";
    if type$(index) = "windowframe" then [drawSizingHandle]
    print #form, "color darkgray ; backcolor white" ;
    print #form, "place "; xOrgIdx-3; " "; yOrgIdx-3 ;
    print #form, "boxfilled "; xOrgIdx+3; " "; yOrgIdx+3 ;
    print #form, "place "; xow-3; " "; yOrgIdx-3 ;
    print #form, "boxfilled "; xow+3; " "; yOrgIdx+3 ;
    print #form, "place "; xOrgIdx-3; " "; yoh-3 ;
    print #form, "boxfilled "; xOrgIdx+3; " "; yoh+3 ;

  [drawSizingHandle]
    if instr(resizeable$, type$(index)) > 0 then print #form, "backcolor black" ;
    print #form, "place "; xow-3; " "; yoh-3 ;
    print #form, "boxfilled "; xow+3; " "; yoh+3 ;
    print #form, "rule over ; flush" ;
    print #form, "segment" ;
    input #form, selectId
    return

[deselectOnly]  'if there is a selected control, deselect it
    if index = 0 then return  'nothing is selected, do nothing
    print #form, "delsegment "; selectId -1 ;
    gosub [selectDeselect]
    index = 0
    print #form, "delsegment "; selectId - 1 ;
    return

[beginObjectMove]
    'if the mouse has only slightly moved, ignore the event
    if abs(MouseX - x) < 3 and abs(MouseY - y) < 3 then wait

    'set up to begin moving the selected object
    print #form, "delsegment "; selectId - 1 ;
    print #form, "when leftButtonMove [additionalObjectMoves]" ;
    print #form, "when leftButtonUp [acceptMovement]" ;

[additionalObjectMoves]
    'adjust the position of the selected object, then draw an object frame the size of the
    'selected object at that new position using xor rule.  set event handling to manage
    'additional movements or termination of this object's movement.
    gosub [snapMouse]
    if MouseX = lastMouseX and MouseY = lastMouseY then wait

    gosub [eraseObjectFrame]
    xOrg(index) = xOrg(index) + (MouseX - lastMouseX)
    yOrg(index) = yOrg(index) + (MouseY - lastMouseY)
    gosub [snapXY]
    lastMouseX = MouseX
    lastMouseY = MouseY

    print #form, "color black ; backcolor white ; size 1" ;
    print #form, "place "; xOrg(index); " "; yOrg(index) ;
    print #form, "down ; rule xor ; box "; xOrg(index)+width(index); " "; yOrg(index)+height(index) ;
    print #form, "rule over ; up ; flush" ;
    print #form, "segment" : input #form, id
    print #form, "delsegment "; id - 1 ;
    wait

[eraseObjectFrame]
    'erase the object frame (for movement)
    print #form, "color black ; backcolor white ; size 1" ;
    print #form, "place "; xOrg(index); " "; yOrg(index) ;
    print #form, "down ; rule xor ; box "; xOrg(index)+width(index); " "; yOrg(index)+height(index) ;
    print #form, "rule over ; up ; flush" ;
    print #form, "segment" : input #form, id
    print #form, "delsegment "; id - 1 ;
    return

[acceptResizing]
    if width(index) < 25 then width(index) = 25
    if type$(index) <> "textbox" and height(index) < 20 then height(index) = 20
    if type$(index) = "textbox" and height(index) < 25 then height(index) = 25

    if type$(index) <> "windowframe" then [acceptMovement]
    if width(index) < 100 then width(index) = 100
    if height(index) < 50 then height(index) = 50
    windowXExtent = width(index)
    windowYExtent = height(index)

[acceptMovement]
    'end the movement phase, and redraw all objects
    print #form, "delsegment "; segment(index) - 1 ;
    gosub [redrawAll]
    'index = 0
    gosub [selectDeselect]
    firstObjectMove = false
    goto [setForSelection]

[resizeControl]
    'set up to begin resizing the selected object
    firstObjectMove = true
    print #form, "delsegment "; selectId - 1 ;
    print #form, "when leftButtonMove [additionalResizes]" ;
    print #form, "when leftButtonUp [acceptResizing]" ;
    gosub [snapMouse]
    lastMouseX = MouseX
    lastMouseY = MouseY

[additionalResizes]
    'adjust the position of the selected object, then draw an object frame the size of the
    'selected object at that new position using xor rule.  set event handling to manage
    'additional movements or termination of this object's movement.
    if firstObjectMove = false then gosub [eraseObjectFrame]
    gosub [snapMouse]
    width(index) = width(index) + (MouseX - lastMouseX)
    height(index) = height(index) + (MouseY - lastMouseY)
    gosub [snapWH]
    lastMouseX = MouseX
    lastMouseY = MouseY

    print #form, "color black ; backcolor white ; size 1" ;
    print #form, "place "; xOrg(index); " "; yOrg(index) ;
    print #form, "down ; rule xor ; box "; xOrg(index)+width(index); " "; yOrg(index)+height(index) ;
    print #form, "rule over ; up ; flush" ;
    print #form, "segment" : input #form, id
    print #form, "delsegment "; id - 1 ;
    wait

[snapMouse]  'if snapOn is selected, then snap the mouse to grid
    if snapOn = 0 then return
    MouseX = int((MouseX + int(xInterval / 2)) / xInterval) * xInterval
    MouseY = int((MouseY + int(yInterval / 2)) / yInterval) * yInterval
    return

[snapWH]  'if snapOn is selected, then snap the width & height to grid
    if snapOn = 0 then return
    width(index) = int((width(index) + int(xInterval / 2)) / xInterval) * xInterval
    height(index) = int((height(index) + int(yInterval / 2)) / yInterval) * yInterval
    return

[snapXY]  'if snapOn is selected, then snap the x,y position to grid
    if snapOn = 0 then return
    xOrg(index) = int((xOrg(index) + int(xInterval / 2)) / xInterval) * xInterval
    yOrg(index) = int((yOrg(index) + int(yInterval / 2)) / yInterval) * yInterval
    return

[redrawAll]
    'redraw all controls
    isModified = 1  'the form has been modified
    print #form, "cls";
    index = 0
    gosub [renderWindow]
    if objectCount = 0 then return
    for idx = 1 to objectCount
        typeIdx$ = type$(idx)
        if typeIdx$ = "textbox" then gosub [renderTextBox] : goto [redrawNext]
        if typeIdx$ = "statictext" then gosub [renderStaticText] : goto [redrawNext]
        if typeIdx$ = "button" then gosub [renderButton] : goto [redrawNext]
        if typeIdx$ = "combobox" then gosub [renderComboBox] : goto [redrawNext]
        if typeIdx$ = "listbox" then gosub [renderListBox] : goto [redrawNext]
        if typeIdx$ = "bmpbutton" then gosub [renderBmpButton] : goto [redrawNext]
        if typeIdx$ = "radiobutton" then gosub [renderRadioButton] : goto [redrawNext]
        if typeIdx$ = "checkbox" then gosub [renderCheckBox] : goto [redrawNext]
        if typeIdx$ = "groupbox" then gosub [renderGroupBox] : goto [redrawNext]
        if typeIdx$ = "graphicbox" then gosub [renderGraphicBox] : goto [redrawNext]
        if typeIdx$ = "textedit" then gosub [renderTextEdit]
      [redrawNext]
    next idx
    gosub [clipControls]
    return

[clipControls]
'erase any controls outside of window:
    xOrg = windowXOrigin
    yOrg = windowYOrigin
    xExt = windowXExtent
    yExt = windowYExtent

    print #form, "down;color 255 250 230";
    print #form, "backcolor 255 250 230";
    print #form, "place 0 ";yExt+yOrg
    print #form, "boxfilled 2000 2000";
    print #form, "place ";xExt+xOrg;" 0"
    print #form, "boxfilled 2000 2000";
    print #form, "place 0 0"
    print #form, "boxfilled ";xOrg;" 2000"
    gosub [renderToolbox]
    return

[moveToBack]
    'move the selected control to the back (first item drawn)
    if index < 2 or objectCount < 2 then wait
    if index = 2 then gosub [redrawAll] : wait

    tmpType$ = type$(index)
    tmpLabel$ = label$(index)
    tmpNames$ = names$(index)
    tmpXOrigin = xOrg(index)
    tmpYOrigin = yOrg(index)
    tmpWidth = width(index)
    tmpHeight = height(index)
    tmpCorner$ = corner$(index)
    tmpBranchLabel$ = branchLabel$(index)
    tmpSegment = segment(index)
    tmpHandle$ = handle$(index)
    tmpBmpName$ = bmpName$(index)
    tmpArrayName$ = arrayName$(index)

    for idx = index - 1 to 2 step -1
        type$(idx+1) = type$(idx)
        label$(idx+1) = label$(idx)
        names$(idx+1) = names$(idx)
        xOrg(idx+1) = xOrg(idx)
        yOrg(idx+1) = yOrg(idx)
        width(idx+1) = width(idx)
        height(idx+1) = height(idx)
        corner$(idx+1) = corner$(idx)
        branchLabel$(idx+1) = branchLabel$(idx)
        segment(idx+1) = segment(idx)
        handle$(idx+1) = handle$(idx)
        bmpName$(idx+1) = bmpName$(idx)
        arrayName$(idx+1) = arrayName$(idx)
    next idx

    type$(2) = tmpType$
    label$(2) = tmpLabel$
    names$(2) = tmpNames$
    xOrg(2) = tmpXOrigin
    yOrg(2) = tmpYOrigin
    width(2) = tmpWidth
    height(2) = tmpHeight
    corner$(2) = tmpCorner$
    branchLabel$(2) = tmpBranchLabel$
    segment(2) = tmpSegment
    handle$(2) = tmpHandle$
    bmpName$(2) = tmpBmpName$
    arrayName$(2) = tmpArrayName$
    gosub [redrawAll]
    index = 0 'necessary here
    wait

[moveToFront]
    'move the selected control to the front (last item drawn)
    if index < 2 or objectCount < 2 then wait
    if index = objectCount then gosub [redrawAll] : wait

    tmpType$ = type$(index)
    tmpLabel$ = label$(index)
    tmpNames$ = names$(index)
    tmpXOrigin = xOrg(index)
    tmpYOrigin = yOrg(index)
    tmpWidth = width(index)
    tmpHeight = height(index)
    tmpCorner$ = corner$(index)
    tmpBranchLabel$ = branchLabel$(index)
    tmpSegment = segment(index)
    tmpHandle$ = handle$(index)
    tmpBmpName$ = bmpName$(index)
    tmpArrayName$ = arrayName$(index)

    for idx = index to objectCount - 1
        type$(idx) = type$(idx+1)
        label$(idx) = label$(idx+1)
        names$(idx) = names$(idx+1)
        xOrg(idx) = xOrg(idx+1)
        yOrg(idx) = yOrg(idx+1)
        width(idx) = width(idx+1)
        height(idx) = height(idx+1)
        corner$(idx) = corner$(idx+1)
        branchLabel$(idx) = branchLabel$(idx+1)
        segment(idx) = segment(idx+1)
        handle$(idx) = handle$(idx+1)
        bmpName$(idx) = bmpName$(idx+1)
        arrayName$(idx) = arrayName$(idx+1)
    next idx

    type$(objectCount) = tmpType$
    label$(objectCount) = tmpLabel$
    names$(objectCount) = tmpNames$
    xOrg(objectCount) = tmpXOrigin
    yOrg(objectCount) = tmpYOrigin
    width(objectCount) = tmpWidth
    height(objectCount) = tmpHeight
    corner$(objectCount) = tmpCorner$
    branchLabel$(objectCount) = tmpBranchLabel$
    segment(objectCount) = tmpSegment
    handle$(objectCount) = tmpHandle$
    bmpName$(objectCount) = tmpBmpName$
    arrayName$(objectCount) = tmpArrayName$

    gosub [redrawAll]
    gosub [selectDeselect]
    wait


[deleteControl]
    'delete the selected control
    if index < 2 then wait

    'delete graphical segments and clean up display
    print #form, "delsegment "; selectId -1 ;
    gosub [selectDeselect]
    print #form, "delsegment "; selectId - 1 ;

    for idx = index to objectCount
        type$(idx) = type$(idx+1)
        label$(idx) = label$(idx+1)
        names$(idx) = names$(idx+1)
        xOrg(idx) = xOrg(idx+1)
        yOrg(idx) = yOrg(idx+1)
        width(idx) = width(idx+1)
        height(idx) = height(idx+1)
        corner$(idx) = corner$(idx+1)
        branchLabel$(idx) = branchLabel$(idx+1)
        segment(idx) = segment(idx+1)
        handle$(idx) = handle$(idx+1)
        bmpName$(idx) = bmpName$(idx+1)
        arrayName$(idx) = arrayName$(idx+1)
    next idx

    objectCount = objectCount - 1

    gosub [redrawAll]
    index = 0
    wait

[produceCodeAndOutline]
    'set a flag so that an outline will be added
    produceOutline = 1

[produceCode]
    'produce code for the controls in the form
    if codeIsOpen = 1 then close #code : codeIsOpen = 0
    WindowWidth=450:WindowHeight=330
    UpperLeftX=100:UpperLeftY=30
    open "Free Form output window" for text as #code
    codeIsOpen = 1
    print #code, ""
    print #code, "    nomainwin"
    print #code, ""
    print #code, "    WindowWidth = "; windowXExtent
    print #code, "    WindowHeight = "; windowYExtent
    print #code, ""

    if objectCount < 2 then [menuCode]

    for x = 2 to objectCount
        if type$(x) = "button" then gosub [codeForButton]
        if type$(x) = "combobox" then gosub [codeForComboBox]
        if type$(x) = "textbox" then gosub [codeForTextBox]
        if type$(x) = "listbox" then gosub [codeForListBox]
        if type$(x) = "bmpbutton" then gosub [codeForBmpButton]
        if type$(x) = "statictext" then gosub [codeForStaticText]
        if type$(x) = "radiobutton" then gosub [codeForRadioButton]
        if type$(x) = "checkbox" then gosub [codeForCheckBox]
        if type$(x) = "graphicbox" then gosub [codeForGraphicBox]
        if type$(x) = "groupbox" then gosub [codeForGroupBox]
        if type$(x) = "textedit" then gosub [codeForTextEdit]
        print #code, code$
    next x

[menuCode]   'write menu code
    if menuCount = 0 then [noMenuCode]

    if left$(windowType$, 6) = "dialog" then print #code, "    '*** menus are not supported in windows of type "; windowType$; " ***"

    for x = 0 to menuCount - 1
        print #code, "    menu "; winHandle$; ", "; qu$; menu$(x); qu$;
        if menuItemCount(x) = 0 then print #code, ", "; chr$(34); "&FixMe"; chr$(34); ", [fixMe]  ' <-- this menu has no items!" : goto [produceNextMenu]
        for y = 0 to menuItemCount(x) - 1
            print #code, ", ";
            mi$ = menuItem$(x, y)
            print #code, qu$; left$(mi$, instr(mi$, chr$(0)) - 1) ; qu$;
            print #code, ", "; mid$(mi$, instr(mi$, chr$(0)) + 1) ;
        next y
        print #code, ""
      [produceNextMenu]
    next x


[noMenuCode] 'don't produce menu code
    print #code, "    open "; qu$; windowLabel$; qu$; " for "; windowType$; " as "; winHandle$
    for idx = 1 to objectCount
        if type$(idx) = "graphicbox" then  print #code, "    print ";winHandle$;".graph, ";qu$;"fill "; boxcolor$;"; flush";qu$ 
     next idx
    if left$(windowType$, 8) = "graphics" then print #code, "    print ";winHandle$;", ";qu$;"fill "; wincolor$;"; flush";qu$
    print #code, "    print ";winHandle$;", ";qu$;"font "; font$(1);qu$
    if produceOutline = 0 then [doneProducingCode]

[produceOutline]
    inputLoopLabel$ = "[" + mid$(winHandle$, 2) + ".inputLoop]"

    print #code, ""
    print #code, ""
    print #code, inputLoopLabel$; "   'wait here for input event"
    print #code, "    wait"
    print #code, ""

    produceOutline = 0
    branchLabels$ = ""

    if objectCount < 2 then [outlineForMenus]

    for x = 2 to objectCount
        if left$(trim$(branchLabel$(x)), 1) <> "[" then [nextOutlineObject]
        if instr(trim$(branchLabel$(x)), " ") > 0 then gosub [handleMultiBranchLabels] : goto [nextOutlineObject]
        if instr(branchLabels$, branchLabel$(x)) > 0 then [nextOutlineObject]
        branchLabels$ = branchLabels$ + " " + branchLabel$(x)
        print #code, ""
        print #code, ""
        print #code, branchLabel$(x); "   'Perform action for the "; type$(x); " named '"; names$(x); "'"
        print #code, "    'Insert your own code here"
        print #code, "    wait "

      [nextOutlineObject]
    next x

[outlineForMenus]   'produce outline code for menus
    if menuCount = 0 then [doneProducingCode]

    for x = 0 to menuCount - 1
        if menuItemCount(x) = 0 then [writeNextMenu]
        for y = 0 to menuItemCount(x) - 1
            mi$ = menuItem$(x, y)
            bl$ = mid$(mi$, instr(mi$, chr$(0)) + 1)
            if instr(branchLabels$, bl$) > 0 then [writeNextMenuItem]
            branchLabels$ = branchLabels$ + " " + bl$
            print #code, ""
            print #code, ""
            print #code, bl$; "   'Perform action for menu "; menu$(x); ", item "; left$(mi$, instr(mi$, chr$(0)) - 1)
            print #code, ""
            print #code, "    'Insert your own code here"
          [writeNextMenuItem]
        next y
      [writeNextMenu]
    next x

[doneProducingCode]
    print #code, "!selectall";
    print #code, "!copy";
    print #code, "!origin 1 1";
    notice "Done.  This code has been copied to clipboard.  You may paste it into your program."
    wait

[handleMultiBranchLabels]   'handle the case where a control has more than 1 branching option
    if instr(branchLabels$, word$(branchLabel$(x), 1)) > 0 then [nextMultiBranchLabel]
    print #code, ""
    print #code, ""
    print #code, word$(branchLabel$(x), 1); "   'Perform action for the "; type$(x); " named '"; names$(x); "'"
    print #code, ""
    print #code, "    'Insert your own code here"
    print #code, ""
    print #code, "    wait "

    branchLabels$ = branchLabels$ + " " + word$(branchLabel$(x), 1)

  [nextMultiBranchLabel]
    if instr(branchLabels$, word$(branchLabel$(x), 2)) > 0 then [doneMultiBranchLabel]
    print #code, ""
    print #code, ""
    print #code, word$(branchLabel$(x), 2); "   'Perform action for the "; type$(x); " named '"; names$(x); "'"
    print #code, ""
    print #code, "    'Insert your own code here"
    print #code, ""
    print #code, "    goto "; inputLoopLabel$
    branchLabels$ = branchLabels$ + " " + word$(branchLabel$(x), 2)

  [doneMultiBranchLabel]
    return

[codeForButton]
    'produce code for a text button
    code$ = "    button "+winHandle$+"."+names$(x)+", "+qu$+label$(x)+qu$+", "+branchLabel$(x)+", "+corner$(x)+", "+str$(xOrg(x)-xOrg-4)+", "+str$(yOrg(x)-yOrg-20-4)+", "+str$(width(x))+", "+str$(height(x))
    return

[codeForBmpButton]
    'produce code for a bmp button
    code$ = "    bmpbutton "+winHandle$+"."+names$(x)+", "+qu$+bmpName$(x)+qu$+", "+branchLabel$(x)+", "+corner$(x)+", "+str$(xOrg(x)-xOrg-4)+", "+str$(yOrg(x)-yOrg-20-4)
    return

[codeForTextBox]
    'produce code for a text box
    code$ = "    textbox "+winHandle$+"."+names$(x)+", "+str$(xOrg(x)-xOrg-4)+", "+str$(yOrg(x)-yOrg-20-4)+", "+str$(width(x))+", "+str$(height(x))
    return

[codeForStaticText]
   'produce code for a static text
    code$ = "    statictext "+winHandle$+"."+names$(x)+", "+qu$+label$(x)+qu$+", "+str$(xOrg(x)-xOrg-4)+", "+str$(yOrg(x)-yOrg-20-4)+", "+str$(width(x))+", "+str$(height(x))
    return

[codeForGroupBox]
    'produce code for a group box
     code$ = "    groupbox "+winHandle$+"."+names$(x)+", "+qu$+label$(x)+qu$+", "+str$(xOrg(x)-xOrg-4)+", "+str$(yOrg(x)-yOrg-20-4)+", "+str$(width(x))+", "+str$(height(x))
    return

[codeForGraphicBox]
    'produce code for a graphic box
    code$ = "    graphicbox "+winHandle$+".graph, "+str$(xOrg(x)-xOrg-4)+", "+str$(yOrg(x)-yOrg-20-4)+", "+str$(width(x))+", "+str$(height(x))
    return

[codeForListBox]
    'produce code for a listbox
    code$ = "    listbox "+winHandle$+"."+names$(x)+", "+arrayName$(x)+", "+branchLabel$(x)+", "+str$(xOrg(x)-xOrg-4)+", "+str$(yOrg(x)-yOrg-20-4)+", "+str$(width(x))+", "+str$(height(x))
    return

[codeForComboBox]
    'produce code for a listbox
    code$ = "    combobox "+winHandle$+"."+names$(x)+", "+arrayName$(x)+", "+branchLabel$(x)+", "+str$(xOrg(x)-xOrg-4)+", "+str$(yOrg(x)-yOrg-20-4)+", "+str$(width(x))+", "+str$(height(x))
    return

[codeForRadioButton]
    'produce code for a radiobutton
    code$ = "    radiobutton "+winHandle$+"."+names$(x)+", "+qu$+label$(x)+qu$+", "+word$(branchLabel$(x), 1)+", "+word$(branchLabel$(x), 2)+", "+str$(xOrg(x)-xOrg-4)+", "+str$(yOrg(x)-yOrg-20-4)+", "+str$(width(x))+", "+str$(height(x))
    return

[codeForCheckBox]
    'produce code for a checkbox
    code$ = "    checkbox "+winHandle$+"."+names$(x)+", "+qu$+label$(x)+qu$+", "+word$(branchLabel$(x), 1)+", "+word$(branchLabel$(x), 2)+", "+str$(xOrg(x)-xOrg-4)+", "+str$(yOrg(x)-yOrg-20-4)+", "+str$(width(x))+", "+str$(height(x))
    return

[codeForTextEdit]
    'produce code for a text edit box
    code$ = "    texteditor "+winHandle$+"."+names$(x)+", "+str$(xOrg(x)-xOrg-4)+", "+str$(yOrg(x)-yOrg-20-4)+", "+str$(width(x))+", "+str$(height(x))
    return

[newFile]
    'clear the contents of the form editor and start over
    if isModified = 1 then gosub [formIsModified]

    newControlNumber = 0
    windowLabel$ = "untitled"
    windowType$ = "window"
    objectCount = 0
    winHandle$ = "#main"
    windowXExtent = 550
    windowYExtent = 410

    gosub [clearMenuData]
    gosub [addWindowFrame]
    gosub [redrawAll]

    isModified = 0
    wait

[saveFile]
    'abort if no controls
    if objectCount < 2 then notice "No controls.  Save aborted" : wait

    'save the form into a *.frj file
    if formName$ = "" then formName$ = "untitled.frj"
    filedialog "Save form", "*.frj", formName$
    if formName$ = "" then wait
    formName$=lower$(formName$)
    'add frj extension if it isn't already there
    if left$(formName$,4)<>".frj" then formName$=formName$+".frj"
    gosub [saveFormSubroutine]

    notice "Done.  File saved as " + formName$
    wait

[saveFormSubroutine]   'the subroutine portion of the save routine
    open formName$ for output as #formOut
    print #formOut, newControlNumber
    print #formOut, windowLabel$
    print #formOut, windowType$
    print #formOut, objectCount
    print #formOut, winHandle$
    print #formOut, snapOn
    print #formOut, xInterval
    print #formOut, yInterval
    print #formOut, menuCount
    print #formOut, windowXExtent
    print #formOut, windowYExtent
    print #formOut, font$(1)

    for i = 2 to objectCount
        print #formOut, type$(i)
        print #formOut, label$(i)
        print #formOut, names$(i)
        print #formOut, xOrg(i)
        print #formOut, yOrg(i)
        print #formOut, width(i)
        print #formOut, height(i)
        print #formOut, corner$(i)
        print #formOut, branchLabel$(i)
        print #formOut, segment(i)
        print #formOut, handle$(i)
        print #formOut, bmpName$(i)
        print #formOut, arrayName$(i)
    next i

    'Now write the menu information
    if menuCount = 0 then [noMenusToSave]

    for i = 0 to menuCount - 1
        print #formOut, menu$(i)
        print #formOut, menuItemCount(i)
        if menuItemCount(i) = 0 then [noMenuItemsToSave]
        for j = 0 to menuItemCount(i) - 1
            print #formOut, menuItem$(i, j)
        next j
      [noMenuItemsToSave]
    next i

[noMenusToSave]
    close #formOut
    return


[openFile]
    'load the form from a *.frj file
    if isModified = 1 then gosub [formIsModified]

    filedialog "Load form", "*.frj", formName$
    if formName$ = "" then wait

    gosub [clearMenuData]
    objectCount = 0
    gosub [addWindowFrame]

    open formName$ for input as #formIn
    input #formIn, newControlNumber
    input #formIn, windowLabel$
    input #formIn, windowType$
    input #formIn, objectCount
    input #formIn, winHandle$
    input #formIn, snapOn
    input #formIn, xInterval
    input #formIn, yInterval
    input #formIn, menuCount
    input #formIn, windowXExtent
    input #formIn, windowYExtent
    input #formIn, tmp$:font$(1)=tmp$

    width(1) = windowXExtent
    height(1) = windowYExtent

    for i = 2 to objectCount
        input #formIn, tmp$ : type$(i) = tmp$
        input #formIn, tmp$ : label$(i) = tmp$
        input #formIn, tmp$ : names$(i) = tmp$
        input #formIn, tmp  : xOrg(i) = tmp
        input #formIn, tmp  : yOrg(i) = tmp
        input #formIn, tmp  : width(i) = tmp
        input #formIn, tmp  : height(i) = tmp
        input #formIn, tmp$ : corner$(i) = tmp$
        input #formIn, tmp$ : branchLabel$(i) = tmp$
        input #formIn, tmp  : segment(i) = tmp
        input #formIn, tmp$ : handle$(i) = tmp$
        input #formIn, tmp$ : bmpName$(i) = tmp$
        if trim$(tmp$) > "" then loadbmp tmp$, tmp$
        input #formIn, tmp$ : arrayName$(i) = tmp$
    next i

    if menuCount = 0 then [noMenusToRead]

    for i = 0 to menuCount - 1
        input #formIn, tmp$ : menu$(i)=tmp$
        input #formIn, tmp : menuItemCount(i) = tmp
        if menuItemCount(i) = 0 then [noMenuItemsToRead]
        for j = 0 to menuItemCount(i) - 1
            input #formIn, tmp$ : menuItem$(i, j) = tmp$
        next j
      [noMenuItemsToRead]
    next i

[noMenusToRead]
    close #formIn
    gosub [redrawAll]

    isModified = 0
    wait

[gridDialog]  'open a dialog box for selecting & adjusting snap to grid
    WindowWidth = 250:WindowHeight = 250

    if gridDialogIsOpen = 1 then close #gridDialog

    statictext #gridDialog.statictext2, "Select here whether control positions will", 26, 16, 336, 20
    statictext #gridDialog.statictext5, "automatically snap to gridded positions,", 26, 35, 320, 20
    statictext #gridDialog.statictext6, "and what the interval will be.", 26, 54, 240, 20
    checkbox #gridDialog.snapOnOff, "Snap to Grid", [snapOn], [snapOff], 26, 85, 120, 20
    statictext #gridDialog.statictext7, "X interval:", 34, 112, 70, 20
    textbox #gridDialog.xIntrvl, 34, 136, 38, 25
    statictext #gridDialog.statictext9, "Y interval:", 124, 112, 70, 20
    textbox #gridDialog.yIntrvl, 124, 136, 38, 25
    button #gridDialog.default, "OK", [acceptGridDialog], UL, 119, 175,80,24
    button #gridDialog, "Cancel", [cancelGridDialog], UL, 29, 175,80,24
    open "Snap to Grid" for dialog_modal as #gridDialog
    print #gridDialog, "trapclose [cancelGridDialog]"
    gridDialogIsOpen = 1

    if snapOn = 1 then snapOnSelected = 1 : print #gridDialog.snapOnOff, "set"
    print #gridDialog.xIntrvl, xInterval
    print #gridDialog.yIntrvl, yInterval
    wait

[snapOn]   'Perform on action for the checkbox named 'snapOnOff'
    snapOnSelected = 1
    wait

[snapOff]   'Perform off action for the checkbox named 'snapOnOff'
    snapOnSelected = 0
    wait

[acceptGridDialog]
    snapOn = snapOnSelected
    print #gridDialog.xIntrvl, "!contents?"
    input #gridDialog.xIntrvl, xInterval
    print #gridDialog.yIntrvl, "!contents?"
    input #gridDialog.yIntrvl, yInterval

[cancelGridDialog]
    gridDialogIsOpen = 0
    close #gridDialog
    wait

[addAMenu]    'add a new menu item
    WindowWidth = 300
    WindowHeight = 200
    listbox #newMenu.menuNames, menu$(, [inputLoop], 14, 38, 120, 120
    statictext #newMenu.statictext2, "Defined Menus", 14, 16, 104, 20
    statictext #newMenu.statictext3, "Enter new menu name:", 150, 16, 200, 20
    textbox #newMenu.newMenuName, 150, 38, 130, 25
    button #newMenu.default, "Accept", [acceptNewMenu], UL, 150,75,130,24
    button #newMenu, "Cancel", [cancelNewMenu], UL, 150,101,130,24
    open "Add a Menu" for dialog_modal as #newMenu
    print #newMenu, "trapclose [cancelNewMenu]";
    wait

[cancelNewMenu]   'Perform action for the button named 'cancelNewMenu'
    'close the dialog box
    close #newMenu
    wait

[clearMenuData]     'reset menu data arrays and indices
    for x = 0 to 20
        menu$(x) = ""
        for y = 0 to 30
            menuItem$(x, y) = ""
        next y
    next x
    menuCount = 0
    return

[acceptNewMenu]   'Perform action for the button named 'acceptNewMenu'
    'add this menu onto the list of menus, and update the display as needed
    print #newMenu.newMenuName, "!contents?";
    input #newMenu.newMenuName, result$
    if result$ = "" then notice "Please type a name for a new menu." : wait
    close #newMenu
    menu$(menuCount) = result$
    menuCount = menuCount + 1
    if menuCount > 1 then gosub [redrawAll] : wait

    'since this is the first menu added, reposition all controls 20 pixels down
    if objectCount < 2 then gosub [redrawAll] : wait
    for x = 2 to objectCount
        yOrg(x) = yOrg(x) + 20
    next x
    gosub [redrawAll]
    wait

[removeMenu]   'remove a menu from the list of menus
    if menuCount = 0 then notice "No menus to remove." : wait
    if removeMenuIsOpen = 1 then close #removeMenu

    WindowWidth = 330:WindowHeight = 195
    statictext #removeMenu.statictext1, "Select a menu to remove:", 26, 16, 192, 20
    listbox #removeMenu.menusToRemove, menu$(, [acceptRemoveMenu], 22, 41, 180, 100
    button #removeMenu.default, "Accept", [acceptRemoveMenu], UL, 216, 81,80,24
    button #removeMenu, "Cancel", [cancelRemoveMenu], UL, 216, 111,80,24
    open "Remove a Menu" for dialog_modal as #removeMenu
    print #removeMenu, "trapclose [cancelRemoveMenu]";
    removeMenuIsOpen = 1
    wait

[acceptRemoveMenu]   'get the name of the selected item, and remove it
    print #removeMenu.menusToRemove, "selectionIndex?"
    input #removeMenu.menusToRemove, result
    close #removeMenu
    removeMenuIsOpen = 0
    if result = 0 then notice "No item selected.  Menu not removed." : wait

    menuCount = menuCount - 1
    result = result - 1

    if result = menuCount then menu$(result) = "" : goto [checkForEmptyMenuBar]

    for x = result to menuCount
        menu$(x) = menu$(x+1)
    next x

[checkForEmptyMenuBar]  'if there are no more menus, shift controls up 20 pixels
    if menuCount > 0 then gosub [redrawAll] : wait

    for x = 2 to objectCount
        yOrg(x) = yOrg(x) - 20
    next x

    gosub [redrawAll]
    wait

[cancelRemoveMenu]   'close the remove menu dialog
    close #removeMenu
    removeMenuIsOpen = 0
    wait

[editMenus]     'edit menu order and menu contents
    if menuCount = 0 then notice "No menus to edit." : wait

    if editMenuIsOpen = 1 then close #editMenu

    WindowWidth = 435:WindowHeight = 360

    listbox #editMenu.menuList, menu$(, [selectMenuToEdit], 14, 31, 288, 105
    listbox #editMenu.menuItems, menuItemLocal$(, [selectMenuItemToEdit], 14, 166, 288, 145
    statictext #editMenu.statictext6, "Menus:", 14, 9, 48, 20
    statictext #editMenu.statictext14, "Menu line items -> Branch labels:", 14, 144, 240, 20
    button #editMenu.default, "&Close", [closeMenuEdit], UL, 310, 4,100,24
    button #editMenu, "&New Item", [addNewMenuItem], UL, 310, 166,100,24
    button #editMenu, "&Edit", [editMenuItem], UL, 310, 196,100,24
    button #editMenu, "Move &Up", [moveMenuItemUp], UL, 310, 226,100,24
    button #editMenu, "&Move Dn", [moveMenuItemDown], UL, 310, 256,100,24
    button #editMenu, "&Delete", [deleteMenuItem], UL, 310, 286,100,24
    button #editMenu, "&To Top", [moveMenuToTop], UL, 310, 60,100,24
    open "Edit Menus" for dialog_modal as #editMenu
    print #editMenu, "trapclose [closeMenuEdit]";
    print #editMenu.menuList, "singleclickselect";
    print #editMenu.menuItems, "singleclickselect";

    editMenuIsOpen = 1
    menuItemIndex = 0
    result = 0
    wait

[selectMenuToEdit]   'Perform action for the listbox named 'menuList'
    'populate the listbox named menuItems
    print #editMenu.menuList, "selectionIndex?"
    input #editMenu.menuList, result

    for x = 0 to 29
        mil$ = menuItem$(result - 1, x)
        if mil$ <> "" then mil$ = left$(mil$, instr(mil$, chr$(0)) - 1) + " -> " + mid$(mil$, instr(mil$, chr$(0)) + 1)
        menuItemLocal$(x) = mil$
    next x
    print #editMenu.menuItems, "reload"

    menuItemIndex = 0
    wait

[moveMenuToTop]   'move the selected menu to the top of the list
    'if there is no selection, or if the selected item is already on top, do nothing
    if result = 0 or result = 1 then wait

    menu$(20) = menu$(result - 1)
    for x = 0 to 29
        menuItem$(20, x) = menuItem$(result - 1, x)
    next x

    for x = result - 1 to 1 step -1
        menu$(x) = menu$(x - 1)
        for y = 0 to 29
            menuItem$(x, y) = menuItem$(x - 1, y)
        next y
    next x

    menu$(0) = menu$(20)
    menu$(20) = ""
    for x = 0 to 29
        menuItem$(0, x) = menuItem$(20, x)
        menuItem$(20, x) = ""
    next x

    print #editMenu.menuList, "reload"
    print #editMenu.menuList, "selectIndex 1"
    result = 1

    'now continue on to the next routine!
[selectMenuItemToEdit]   'Perform action for the listbox named 'menuItems'
    'set the selection index for the menu item to edit
    print #editMenu.menuItems, "selectionIndex?"
    input #editMenu.menuItems, menuItemIndex
    wait

[addNewMenuItem]   'Perform action for the button named 'newItemButton'
    if result = 0 then wait

    if editMenuItemIsOpen = 1 then gosub [closeEditMenuItem]

    menuItemCount(result - 1) = menuItemCount(result - 1) + 1
    menuItemIndex = menuItemCount(result - 1)
    editMenuItemAction$ = "ADD"
    goto [editMenuItemProperties]

[editMenuItem]   'Perform action for the button named 'editMenuItem'
    if menuItemIndex = 0 then wait

    if editMenuItemIsOpen = 1 then gosub [closeEditMenuItem]

    editMenuItemAction$ = "EDIT"
    goto [editMenuItemProperties]

[moveMenuItemUp]   'Perform action for the button named 'moveMenuItemUp'
    if menuItemIndex = 1 or menuItemIndex = 0 then wait

    tmpMi$ = menuItem$(result - 1, menuItemIndex - 1)
    menuItem$(result - 1, menuItemIndex - 1) = menuItem$(result - 1, menuItemIndex - 2)
    menuItem$(result - 1, menuItemIndex - 2) = tmpMi$

    gosub [reloadLocalMenuItems]

    menuItemIndex = menuItemIndex - 1
    print #editMenu.menuItems, "selectIndex "; menuItemIndex
    wait

[moveMenuItemDown]   'Perform action for the button named 'moveMenuItemDown'
    'Insert your own code here
    if result = 0 then wait
    if menuItemIndex = menuItemCount(result - 1) or menuItemIndex = 0 then wait

    tmpMi$ = menuItem$(result - 1, menuItemIndex - 1)
    menuItem$(result - 1, menuItemIndex - 1) = menuItem$(result - 1, menuItemIndex)
    menuItem$(result - 1, menuItemIndex) = tmpMi$

    gosub [reloadLocalMenuItems]

    menuItemIndex = menuItemIndex + 1
    print #editMenu.menuItems, "selectIndex "; menuItemIndex
    wait

[deleteMenuItem]   'Perform action for the button named 'deleteMenuItem'
    'Insert your own code here
    if result = 0 then wait
    if menuItemCount(result - 1) = 0 or menuItemIndex = 0 then wait

    for x = menuItemIndex to 30
        menuItem$(result - 1, x - 1) = menuItem$(result - 1, x)
    next x

    gosub [reloadLocalMenuItems]

    menuItemIndex = 0
    return

[reloadLocalMenuItems]  'reload the contents of the menu items listbox
    for x = 0 to 29
        mil$ = menuItem$(result - 1, x)
        if mil$ <> "" then mil$ = left$(mil$, instr(mil$, chr$(0)) - 1) + " -> " + mid$(mil$, instr(mil$, chr$(0)) + 1)
        menuItemLocal$(x) = mil$
    next x
    print #editMenu.menuItems, "reload"
    return

[closeMenuEdit]   'Perform action for the button named 'closeMenuEdit'
    'close the menu editing dialog and redraw the form
    for x = 0 to 29 : menuItemLocal$(x) = "" : next x
    close #editMenu
    editMenuIsOpen = 0
    'gosub [redrawAll]
    wait

[editMenuItemProperties]    'open a dialog for editing menu item properties
    WindowWidth = 350:WindowHeight = 150

    textbox #menuItems.name, 134, 16, 184, 25
    textbox #menuItems.branchLabel, 134, 51, 184, 25
    statictext #menuItems.statictext6, "Name:", 22, 21, 40, 20
    statictext #menuItems.statictext7, "Branch Label:", 22, 56, 104, 20
    button #menuItems.default, "Accept", [acceptMenuItemProps], UL, 198, 86, 100, 24
    button #menuItems, "Cancel", [cancelMenuItemProps], UL, 48, 86, 100, 24
    open "Menu Item Properties" for dialog_modal as #menuItems
    editMenuItemIsOpen = 1

    print #menuItems.name, "???"
    print #menuItems.branchLabel, "[???]"

    if menuItem$(result - 1, menuItemIndex - 1) = "" then wait

    mi$ = menuItem$(result - 1, menuItemIndex - 1)
    print #menuItems.name, left$(mi$, instr(mi$, chr$(0)) - 1)
    print #menuItems.branchLabel, mid$(mi$, instr(mi$, chr$(0)) + 1)
    wait

[acceptMenuItemProps]   'Perform action for the button named 'acceptMenuItemProps'
    'accept the edited menu item
    print #menuItems.name, "!contents?";
    input #menuItems.name, nResult$
    print #menuItems.branchLabel, "!contents?";
    input #menuItems.branchLabel, blResult$

    if nResult$ = "" or blResult$ = "" then notice "Bad menu item properties." : wait

    blr$ = blResult$
    if left$(blResult$, 1) <> "[" then blResult$ = "[" + blResult$
    if right$(blResult$, 1) <> "]" then blResult$ = blResult$ + "]"

    if blr$ <> blResult$ then notice "Branch Label was " + blr$ + ", defaulting to " + blResult$

    menuItem$(result - 1, menuItemIndex - 1) = nResult$ + chr$(0) + blResult$
    menuItemLocal$(menuItemIndex - 1) = nResult$ + " -> " + blResult$

    close #menuItems
    editMenuItemIsOpen = 0

    print #editMenu.menuItems, "reload"
    wait

[cancelMenuItemProps]   'Perform action for the button named 'cancelMenuItemProps'
    'close the window
    gosub [closeEditMenuItem]
    wait

[closeEditMenuItem]   'close the window before opening it again
    'close the window
    close #menuItems
    if editMenuItemAction$ = "ADD" then menuItemCount(result - 1) = menuItemCount(result - 1) - 1
    editMenuItemIsOpen = 0
    return

[formIsModified]    'the form has been modified, offer to save
    isModified = 0 ' set the isModified flag to be 0
    if objectCount < 2 then return  ' if there are no objects, don't offer to save form
    confirm "Save changes to " + formName$ + "?"; answer$
    if answer$ = "yes" then gosub [saveFormSubroutine]
    return

[settingsDialog]    'edit the settings for FreeForm
    WindowWidth = 300
    WindowHeight = 170

    checkbox #settings.creationInspect, "Inspect each control when created", [creationInspectSet], [creationInspectClear], 22, 16, 280, 19
    checkbox #settings.displayOrdering, "Display control ordering", [displayOrderingSet], [displayOrderingReset], 22, 36, 208, 19
    button #settings.default, "Accept", [settingsAccept], UL, 154, 101,80,24
    button #settings, "Cancel", [settingsCancel], UL, 24, 101,80,24
    open "Settings" for dialog_modal as #settings
    print #settings, "trapclose [settingsCancel]"

    createInspectValue = createInspect
    if createInspect > 0 then print #settings.creationInspect, "set"
    displayOrderingValue = displayOrdering
    if displayOrdering > 0 then print #settings.displayOrdering, "set"

[settings.inputLoop]   'wait here for input event
    wait

[creationInspectSet]   'set value for inspect on create
    createInspectValue = 1
    goto [settings.inputLoop]

[creationInspectClear]   'set value for no inspect on create
    createInspectValue = 0
    goto [settings.inputLoop]

[displayOrderingSet]   'set value for displaying of control ordering
    displayOrderingValue = 1
    goto [settings.inputLoop]

[displayOrderingReset]   'set value for non-displaying of control ordering
    displayOrderingValue = 0
    goto [settings.inputLoop]

[settingsAccept]   'accept the settings
    createInspect = createInspectValue
    displayOrdering = displayOrderingValue
    close #settings
    if left$(windowType$, 6) = "dialog" then loadbmp "systemBox", "bmp\jbicon2.bmp"
    if left$(windowType$, 6) <> "dialog" then loadbmp "systemBox", "bmp\jbicon.bmp"
    print #form, "font ";font$(1)
    gosub [redrawAll]
    wait


[settingsCancel]   'discard any settings changes
    close #settings
    goto [settings.inputLoop]


[loadIniFile]   'load the user preferences
    if fileExists(DefaultDir$, "ffjust.ini") then
        open "ffjust.ini" for input as #ini
        input #ini, xInterval   'snap to x
        input #ini, yInterval   'snap to y
        input #ini, snapOn      'snap to on/off
        input #ini, createInspect 'inspect each control when created
        input #ini, displayOrdering 'display control ordering
        close #ini
    else
        gosub [saveIniFile]
    end if
    return


[saveIniFile]   'save the user preferences
    open "ffjust.ini" for output as #ini
    print #ini, xInterval
    print #ini, yInterval
    print #ini, snapOn
    print #ini, createInspect
    print #ini, displayOrdering
    close #ini
    return


[quit]   'exit Freeform
    if isModified = 1 then gosub [formIsModified]
    if inspectIsOpen then close #inspect
    'quit freeform
    confirm "Are you sure?"; answer$
    if answer$ = "no" then wait
    gosub [saveIniFile]
    close #form
    if codeIsOpen then close #code
    end

'This sub is used when adding any control
sub addControl type$, count, idx, width, height, text$, corner$
    xOrg(idx) = 100
    yOrg(idx) = 50
    width(idx) = width
    height(idx) = height
    type$(idx) = type$
    names$(idx) = type$+str$(count)
    corner$(idx) = corner$
    label$(idx) = text$
    end sub

'Return a string without quotes
'This is used when getting typed input
function noQuotes$(text$)
    for x = 1 to len(text$)
        if mid$(text$, x, 1) <> chr$(34) then
            noQuotes$ = noQuotes$ + mid$(text$, x, 1)
        end if
    next x
    end function

function fileExists(path$, filename$)
    files path$, filename$, info$(
    fileExists = val(info$(0, 0)) > 0
    end function



