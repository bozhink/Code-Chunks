;*******************************************************************************
;* Program   : ...Put Your Program's Name here...
;* Programmer: ...Put Your Name Here...
;* Purpose   : OS11 FRAME FOR USER CODE ...Use your own description here...
;* Language  : MC68HC11 Assembly Language (ASM11 v1.84c+)
;* Status    : Copyright (c) 1998-2001 by Tony Papadimitriou <tonyp@acm.org>
;* History   : 01.xx.xx v1.00 Original (started on 01.xx.xx)
;*******************************************************************************

                    #CaseOn                       ; Case-sensitive labels
                    #ExtraOn                      ; Allow extra mnemonics
                    #OptRelOn                     ; Show optimization warnings for JMP/JSR
                    #SpacesOff                    ; Do not allow spaces within expressions
#ifdef ?
  #message ีออออออออออออออออออออออออออออออออออออออออออออออออออธ
  #message ณ Available conditionals (for use with -Dx option) ณ
  #message ฦออออออออออออออออออออออออออออออออออออออออออออออออออพ
  #message ณ NOICEÿÿ: Target is the NoICE emulator on F1 Board
  #message ณ WSIÿÿÿÿ: WSI DK68HC11 Development Kit
  #message ณ MAPÿÿÿÿ: OS11 Modules with source-level MAP info
  #message รฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ
  #message ณ BPS_RATE:<value> Set BPS_RATE to 24/48/96(00) bps
  #message ิอออออออออออออออออออออออออออออออออออออออออออออออออออ
  #fatal Run ASM11 -Dx (where x is any of the above)
#endif
                    #include  MCUs.INC
                    #push                         ;save switches
                    #mapoff                       ;Default is no MAP
#ifdef MAP
                    #mapon                        ;turn source-level info ON
#endif
                    #listoff
#ifexists OS11/MTOS.MOD                           ;not included in freeware version
                    #INCLUDE  OS11/MTOS.MOD       ;Multi-tasking kernel (always INCLUDE first)
#endif
#ifexists OS11/LCD_F1.MOD                         ;not included in freeware version
                    #INCLUDE  OS11/LCD_F1.MOD     ;LCD OS calls for the ASPiSYS F1 Board
#endif
                    #INCLUDE  OS11/SCI_INT.MOD    ;Interrupt SCI-related OS calls
                    #INCLUDE  OS11/STRINGS.MOD    ;String operations
#ifexists OS11/RTI.MOD                            ;not included in freeware version
                    #INCLUDE  OS11/RTI.MOD        ;Real-Time module
#endif
                    #INCLUDE  OS11/MISC.MOD       ;Miscellaneous OS calls
;
; --- add here (or enable) whatever modules are needed by your application ---
;
                    #INCLUDE  OS11/DISPATCH.MOD   ;OS call dispatcher (always INCLUDE last)
                    #pull                         ;restore switches

#PAGE *************** USER RAM AND STACK ORGANIZATION ***************

                    #RAM
;
; ------------- add your global variables here ----------------------
;

#PAGE ************************ PROGRAM CODE ************************

                    #ROM

;************************************************************
;*              CODE EXECUTION STARTS HERE                  *
;************************************************************
Start               lds       #STACKTOP           ;Initialize the Stack Pointer
                    ldx       #REGS               ;X points to register base

          ; NOTE: The following STAs must occur within next 58 cycles (64 cycle-limit)
                    lda       #REGS>12            ;Changing REGS will affect this line!
                    sta       XINIT               ;RAM and I/O Mapping
                    clr       [OPTION,x           ;System Configuration Options (IRQ level triggered)
                    clr       [TMSK2,x            ;setup timer prescaler (for TOF, etc.) (use your own value here)

          ; NOTE: The following STAs will affect write-once register bits (even outside 64-cycle limit)
                    bset      [HPRIO,x,Bit4.      ;Turn off E-clock output (for single chip mode)
#ifdef __ASPISYS__
                    jsr       SetChipSelects
                    lds       #RAM2_END
#endif
#ifdef __WSI__
                    jsr       SetupWSI
                    lds       #RAM2_END
#endif
                    clrb                          ;mainly, for SIM11x which doesn't
                    clry                          ;like uninitialized registers

                    lda       #BPS_RATE           ;9600bps, 8-N-1
                    os        fSetBAUD            ;this call also enables ints

#ifdef _RTI_
                    os        fInitRTI            ; Initialize RTI (8.2ms RTI @ 2MHz MCU E-Clock)
#endif

#ifdef _MTOS_
                    ldy       #500                ;maximum stack for task (use your own value)
                    os        fInitOS             ;start the multi-tasker (this call also enables ints)

                    ldx       #Task1              ;execution address of task
                    ldy       #500                ;maximum stack for task (use your own value)
;                   lda       #1                  ;initial task "ticks"
;                   ldb       #RUNNING            ;initial task state (use RUNNING or IDLE)
                    ldd       #RUNNING            ;A=0 (same as 1), B=initial status
                    os        fAddTask            ;define the task (and possibly start running it)

                    ldx       #Task2              ;execution address of task
                    ldy       #500                ;maximum stack for task (use your own value)
                    ldd       #RUNNING
                    os        fAddTask            ;define the task (and possibly start running it)

                    ldx       #Task3              ;execution address of task
                    ldy       #500                ;maximum stack for task (use your own value)
                    ldd       #RUNNING
                    os        fAddTask            ;define the task (and possibly start running it)
#endif
          ;falls thru to main task

Task0
;
; ---------------- add more instructions here ------------------------
;
                    bra       Task0

Task1
;
; ---------------- add more instructions here ------------------------
;
                    bra       Task1

Task2
;
; ---------------- add more instructions here ------------------------
;
                    bra       Task2

Task3
;
; ---------------- add more instructions here ------------------------
;
                    bra       Task3

#PAGE **************** INTERRUPT SERVICE ROUTINES ****************

                    #ROM
;**********************************************************************
;* IRQ - External Interrupt requests (IRQ and STRA) come here         *
;**********************************************************************
IRQ_Handler         equ       *
#ifndef __ASPISYS__ ;the following section does not apply to the ASPiSYS F1 Board
#ifndef __WSI__     ;or WSI's DK68HC11 Development Kit
                    lda       PIOC                ;Determine if IRQ was from STRA
                    bita      #STAF.              ;Is the STAF set?
                    beq       ?IRQ_Pin            ;No, go to IRQ pin interrupt
                    lda       PORTCL              ;Read latched data to clear STAF
;
; ---------------- add your code here --------------------------------
;
                    rti
?IRQ_Pin            equ       *
#endif
#endif
;
; ---------------- add your code here --------------------------------
;
?IRQ_Exit           rti

;**********************************************************************
;* SPI - Serial Peripheral Interface requests come here               *
;**********************************************************************
SPI_Handler         ldb       SPSR
                    bpl       ?SPI_Exit
                    lda       SPDR                ;get received data
;
; ---------------- add your code here --------------------------------
;
?SPI_Exit           rti

;**********************************************************************
;* PAI - Pulse Accumulator Input interrupt requests come here         *
;**********************************************************************
PAI_Handler         equ       *
;
; ---------------- add your code here --------------------------------
;
                    lda       #Bit5.              ;Reset the interrupt
                    sta       TFLG2
?PAI_Exit           rti

;**********************************************************************
;* PAO - Pulse Accumulator Overflow interrupt requests come here      *
;**********************************************************************
PAO_Handler         equ       *
;
; ---------------- add your code here --------------------------------
;
                    lda       #Bit4.              ;Reset the interrupt
                    sta       TFLG2
?PAO_Exit           rti

;**********************************************************************
;* RTO - Real Time Overflow interrupt requests come here              *
;**********************************************************************
RTO_Handler         equ       *
;
; ---------------- add your code here --------------------------------
;
                    lda       #Bit7.              ;Reset the interrupt
                    sta       TFLG2
?RTO_Exit           rti

;**********************************************************************
;* TIC4/TOC5 - TIC4 and/or TOC5 interrupt requests come here          *
;**********************************************************************
TIC4_Handler        equ       *
;
; ---------------- add your code here --------------------------------
;
?TIC4_Exit          rti

;**********************************************************************
;* TOC3 - TOC3 interrupt requests come here                           *
;**********************************************************************
TOC3_Handler        equ       *
;
; ---------------- add your code here --------------------------------
;
?TOC3_Exit          rti

;**********************************************************************
;* TOC2 - TOC2 interrupt requests come here                           *
;**********************************************************************
TOC2_Handler        equ       *
;
; ---------------- add your code here --------------------------------
;
?TOC2_Exit          rti

;**********************************************************************
;* TOC1 - TOC1 interrupt requests come here                           *
;**********************************************************************
TOC1_Handler        equ       *
;
; ---------------- add your code here --------------------------------
;
?TOC1_Exit          rti

;**********************************************************************
;* TIC3 - TIC3 interrupt requests come here                           *
;**********************************************************************
TIC3_Handler        equ       *
;
; ---------------- add your code here --------------------------------
;
?TIC3_Exit          rti

;**********************************************************************
;* TIC2 - TIC2 interrupt requests come here                           *
;**********************************************************************
TIC2_Handler        equ       *
;
; ---------------- add your code here --------------------------------
;
?TIC2_Exit          rti

;**********************************************************************
;* TIC1 - TIC1 interrupt requests come here                           *
;**********************************************************************
TIC1_Handler        equ       *
;
; ---------------- add your code here --------------------------------
;
?TIC1_Exit          rti

;**********************************************************************
;* XIRQ - External Interrupt requests come here                       *
;**********************************************************************
XIRQ_Handler        equ       *
#ifdef __ASPISYS__ ;on modified ASPiSYS F1 Board, XIRQ may be used for power-loss detection
                    clr       SCCR2               ;disable SCI
;
;----------- add code to save to EEPROM on power failure -------------
;
                    bra       Halt_MCU
#else
;
; ---------------- add your code here --------------------------------
;
          ; make sure we don't re-enter this routine (optional)
                    tsx
                    bset      CCR_,x,#X.          ;Disable further XIRQs
?XIRQ_Exit          rti
#endif

;**********************************************************************
;* ILLOP - Illegal Opcode Interrupt requests come here                *
;* Display a message with the offending PC address in hex and halt    *
;* If stack isn't usable (due to possible corruption) simply halt     *
;* Stack Needed: 22 (9 for caller + 13 for calls without subs)        *
;**********************************************************************
ILLOP_Handler       tsx                           ;First, check stack availability
                    cmpx      #RAM+30             ;Is enough stack space available?
                    blo       ILLOP_Halt          ;No, show simple message only
                    cmpx      #STACKTOP-9         ;Is it above possible stack top (after call)?
                    bhs       ILLOP_Halt          ;Yes, show simple message only
                    bsr       ILLOP_SetSCI        ;Reset the SCI to 9600bps 8-N-1
                    bcs       ILLOP_Exit          ;SCI setup failed, don't show message
                    tsy                           ;get pointer to stack frame in Y
                    os        fPrint              ;print first part of message
                    fcs       'Illegal opcode at $'
                    ldx       #'00'               ;create buffer on stack (4 bytes)
                    pshx:2                        ;..initialized to string '0000'
                    tsx                           ;and get its pointer in X
                    lda       #16                 ;conversion base
                    sta       ,x                  ;..set in buffer[1]
                    ldd       PC_,y               ;get offending PC address in RegD
          ; Display the offending address
                    ldy       #4                  ;the length of the buffer in Y
                    os        fBin2BCD            ;do the conversion of PC address to hex
                    lda       #4                  ;and a fifth byte with the length
                    psha
                    dex                           ;point to beginning of string
                    os        fWrite              ;and print hex PC address
                    ins                           ;restore stack (faster than PULA)
                    pulx:2
                    os        fPrint
                    fcs       '. '
ILLOP_Halt          lds       #STACKTOP           ;we can safely reset the stack now
                    bsr       ILLOP_SetSCI        ;Reset the SCI to 9600bps 8-N-1
                    bcs       ILLOP_Exit          ;SCI setup failed, don't show message
                    os        fPrint
                    fcs       'System halted!'
                    bsr       WaitASecond
ILLOP_Exit         ;bra       Halt_MCU            ;Go wait for processor RESET
                    #include  OS11/HALT_MCU.INC
ILLOP_SetSCI        bsr       WaitASecond
                    lda       #BPS_RATE           ;Next, re-set the SCI
                    os        fSetBAUD            ;..by random code
                    rts

WaitASecond         pshx
                    ldx       #1000
                    os        fDelayMS
                    pulx
                    rts

;**********************************************************************
;* COP - Computer Operating Properly RESET requests come here         *
;**********************************************************************
COP_Handler         equ       *
;
; ---------------- add your code here --------------------------------
;
?COP_Exit           jmp       Start               ;Cannot return with RTI

;**********************************************************************
;* CMF - Clock Monitor Failure RESET requests come here               *
;**********************************************************************
CMF_Handler         equ       *
;
; ---------------- add your code here --------------------------------
;
?CMF_Exit           jmp       Start               ;Cannot return with RTI

; ------------------ VECTOR SETUP --------------------
                    #VECTORS
                    org       *+2                 ;SCI Handler (in SCI_INT.MOD)
                    dw        SPI_Handler         ;SPI
                    dw        PAI_Handler         ;Pulse Accumulator Input
                    dw        PAO_Handler         ;Pulse Accumulator Overflow
                    dw        RTO_Handler         ;Timer Overflow
                    dw        TIC4_Handler        ;TIC4 / TOC5
                    org       *+2                 ;Timer Output Compare 4 (in MTOS.MOD)
                    dw        TOC3_Handler        ;Timer Output Compare 3
                    dw        TOC2_Handler        ;Timer Output Compare 2
                    dw        TOC1_Handler        ;Timer Output Compare 1
                    dw        TIC3_Handler        ;Timer Input Capture 3
                    dw        TIC2_Handler        ;Timer Input Capture 2
                    dw        TIC1_Handler        ;Timer Input Capture 1
                    org       *+2                 ;Timer interrupt (in RTI.MOD)
                    dw        IRQ_Handler         ;IRQ for module select
                    dw        XIRQ_Handler        ;XIRQ
                    org       *+2                 ;SoftWare Interrupt (in DISPATCH.MOD)
                    dw        ILLOP_Handler       ;Illegal Opcode Trap
                    dw        COP_Handler         ;COP Failure (RESET)
                    dw        CMF_Handler         ;Clock Monitor Failure (RESET)
                    dw        Start               ;RESET vector

                    end       Start