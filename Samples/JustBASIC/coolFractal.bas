    'coolFractal.bas contributed by Rod
    nomainwin
    dim col$(12)
    WindowWidth = DisplayWidth
    WindowHeight = DisplayHeight
    UpperLeftX = int((DisplayWidth-WindowWidth)/2)
    UpperLeftY = int((DisplayHeight-WindowHeight)/2)
    midx=int(WindowWidth/2)
    midy=int(WindowHeight/2)
    button #1, "Clear", [clear], LR, 50, 10
    open "Fractals" for graphics_nsb as #1
    print #1, "trapclose [quit]"

    [clear]
    print #1, "down ; fill black"

    [draw]
    'set up some random colors
    for c=0 to 12
    col$(c)=str$(int(rnd(0)*256))+" "+str$(int(rnd(0)*256))+" "+str$(int(rnd(0)*256))
    next c

    'set up some random starting positions
    a=rnd(0)
    b=0.9998
    c=2-2*a
    dots=12000
    x=j=0
    y=rnd(0)*12+0.1

    'calculate and draw the points
    for i=0 to dots
        scan
        z=x
        x=b*y+j
        j=a*x+c*(x^2)/(1+x^2)
        y=j-z
        xp=(x*20)+midx
        yp=(y*20)+midy
        print #1, "color ";col$(i/1000)
        print #1, "set ";xp;" ";yp
    next i
    goto [draw]

    [quit]
    close #1
    end
