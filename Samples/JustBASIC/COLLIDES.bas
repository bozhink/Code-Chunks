
    'demonstrate sprite collision in Just BASIC

    loadbmp "smiley1", "sprites\smiley1.bmp"
    loadbmp "smiley2", "sprites\smiley2.bmp"
    loadbmp "smiley3", "sprites\smiley3.bmp"
    loadbmp "smiley4", "sprites\smiley4.bmp"
    loadbmp "landscape", "sprites\bg1.bmp"
    WindowHeight = 300
    WindowWidth = 400
    graphicbox #w.g, 0, 0, 400, 300
    open "sprite test" for window_nf as #w
    graphicbox #w.g, 0, 0, 400, 300
    print #w.g, "background landscape";
    print #w.g, "addsprite smiley smiley1 smiley2 smiley3 smiley4";
    print #w.g, "addsprite smiler smiley1 smiley2 smiley3 smiley4";
    print #w.g, "addsprite smiled smiley1 smiley2 smiley3 smiley4";
    print #w.g, "addsprite smiles smiley1 smiley2 smiley3 smiley4";
    print #w.g, "cyclesprite smiley 1"
    print #w.g, "cyclesprite smiler 1"
    print #w.g, "cyclesprite smiled 1"
    print #w.g, "cyclesprite smiles 1"
    for x = 1 to 100 step 5
        print #w.g, "spritexy smiley "; x; " "; x
        print #w.g, "spritexy smiler "; 100-x; " "; x
        print #w.g, "spritexy smiled "; 100-x; " "; 100-x
        print #w.g, "spritexy smiles "; x; " "; 100-x
        print #w.g, "drawsprites";
        print #w.g, "spritecollides smiley list$"
        if list$ > "" then print list$
    next x

    wait


