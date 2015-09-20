;
;
[BITS 32]

[global start]
[extern _hello]

start:
    call _hello
    cli
    hlt
