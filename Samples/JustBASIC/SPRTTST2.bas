
    loadbmp "smiley1", "sprites\smiley1.bmp"
    loadbmp "smiley2", "sprites\smiley2.bmp"
    loadbmp "smiley3", "sprites\smiley3.bmp"
    loadbmp "smiley4", "sprites\smiley4.bmp"
    loadbmp "landscape", "sprites\bg1.bmp"
    WindowHeight = 300
    WindowWidth = 400
    'graphicbox #wg, 0, 0, 400, 300
    open "sprite test" for graphics_nf_nsb as #wg
    print #wg, "background landscape";
    print #wg, "addsprite smiley smiley1 smiley2 smiley3 smiley4";
    print #wg, "addsprite smiler smiley1 smiley2 smiley3 smiley4";
    print #wg, "addsprite smiled smiley1 smiley2 smiley3 smiley4";
    print #wg, "addsprite smiles smiley1 smiley2 smiley3 smiley4";
    print #wg, "cyclesprite smiley 1 once"
    print #wg, "cyclesprite smiler 1"
    print #wg, "cyclesprite smiled 1"
    print #wg, "cyclesprite smiles 1"
    for x = 1 to 100 step 2
        print #wg, "spritexy smiley "; x; " "; x
        print #wg, "spritexy smiler "; 100-x; " "; x
        print #wg, "spritexy smiled "; 100-x; " "; 100-x
        print #wg, "spritexy smiles "; x; " "; 100-x
        print #wg, "drawsprites";
        print #wg, "spritecollides smiley list$"
        if list$ > "" then print #wg, "cyclesprite smiley 1 once"
    next x

    input a$

