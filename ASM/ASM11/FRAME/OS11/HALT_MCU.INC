                    #ROM

Halt_MCU            ldx       #500
                    os        fDelayMS            ;Let pending events complete
                    sei                           ;Disable interrupts
; --- Shut down all peripherals (on and off chip)
                    pshx
                    ldx       #REGS
                    clr       [OPTION,x           ;Power-down A/D
                    clr       [SCCR2,x            ;Disable SCI
                    clr       [SPCR,x             ;Disable SPI
                    clr       [TMSK1,x            ;Disable IC/OC interrupts
                    clr       [TMSK2,x            ;Disable Timer interrupts
                    pulx
                    os        fDelayMS            ;Let subsystems turn off
                    cls                           ;Enable STOP instruction
                    stop                          ;and stay here in deep sleep
                    bra       *-1                 ;on XIRQ, go back to sleep