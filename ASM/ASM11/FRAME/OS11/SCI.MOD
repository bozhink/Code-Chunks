;*******************************************************************************
;* Module    : SCI.MOD
;* Programmer: Tony Papadimitriou
;* Purpose   : SCI-related OS-called routines
;* Language  : MC68HC11 (ASM11 v1.92+)
;* Status    : Copyright (c) 1999-2001 by Tony Papadimitriou
;* Segments  : RAM    : Variables
;*           : ROM    : Code
;*           : SEG9   : OS definitions (this allows adding more functions)
;* Note(s)   : Normally, not to be used with MTOS by more than one task
;* History   : 99.10.31 v1.00 Original (copied from 99.10.26 OS11.MOD)
;*           : 99.11.12 v1.01 Added fGetChar
;*           : 99.11.14       Change fSetBaud to polled mode only (simpler)
;*           : 99.11.27 v1.02 Added fGetPossibleChar (doesn't wait for char)
;*           : 00.07.01 v1.03 Corrected/Modified fError so it does nothing when no Carry
;*           : 00.12.28       Moved error handling routines to ERRORS.MOD
;*           : 01.04.11       Some optimization for size
;*           : 01.07.13       Some more optimizations
;*           :                Removed error code from fSetBAUD, fWriteZ, etc.
;*           :                Added fNextTask when used with MTOS.MOD
;*******************************************************************************

#ifmain ;--------------------------------------------------------------
                    #listoff
                    #include  EXP-F1.INC
                    #include  OS11/DISPATCH.MOD
                    #liston
#endif ;---------------------------------------------------------------

_SCI_

                    #SEG9
#ifndef OSCommands
OSCommands          exp       *
#endif

fSetBAUD            exp       *-OSCommands/2      ;Set SCI bps ("baud") rate
                    dw        ?SetBAUD

fPrint              exp       *-OSCommands/2      ;Print the following FCS string
                    dw        ?Print

fGetPossibleChar    exp       *-OSCommands/2      ;Read SCI char, if present, into RegA
                    dw        ?GetPossibleChar

fGetChar            exp       *-OSCommands/2      ;Read SCI char into RegA
                    dw        ?GetChar

fPutChar            exp       *-OSCommands/2      ;Write RegA character to the SCI
                    dw        ?PutChar

fWrite              exp       *-OSCommands/2      ;Write a "Pascal" string to SCI
                    dw        ?Write

fWriteln            exp       *-OSCommands/2      ;fWrite followed by CR,LF pair
                    dw        ?Writeln

fNewLine            exp       *-OSCommands/2      ;Send a CR,LF pair to the SCI
                    dw        ?NewLine

fWriteZ             exp       *-OSCommands/2      ;Write an ASCIZ string to SCI
                    dw        ?WriteZ

fWritelnZ           exp       *-OSCommands/2      ;fWriteZ followed by CR,LF pair
                    dw        ?WritelnZ

#PAGE ;Operating System routines expanded
**********************************************************************
*                 Operating System routines expanded                 *
**********************************************************************
                    #ROM

; Purpose: Set SCI BAUD rate to one of the following values (in A_,y)
;          3(00), 12(00), 24(00), 48(00), 96(00), 192(00), 125(000), 250(000)
;          (use number outside parentheses for corresponding baud rate)
; Input  : RegA = Baud Rate (without trailing zeros)
; Note(s): Assumes ?MHz XTAL (?MHz E-Clock) based on MHZ setting
;        : Certain bps rates available only under specific MHZ settings
?BPS_Table          equ       *
#ifdef __WSI__
                    db        12,$07              ;1200 bps
                    db        24,$06              ;2400 bps
                    db        48,$05              ;4800 bps
                    db        96,$04              ;9600 bps
                    db        192,$03             ;19200 bps
#else
#if MHZ = 16
                    db        3,$36               ;300 bps (user value, MCU value)
                    db        12,$34              ;1200 bps
                    db        24,$33              ;2400 bps
                    db        48,$32              ;4800 bps
                    db        96,$31              ;9600 bps
                    db        192,$30             ;19200 bps (only @16MHz)
                    db        250,$00             ;250000 bps
#endif
#if MHZ = 8
                    db        3,$35               ;300 bps (user value, MCU value)
                    db        12,$33              ;1200 bps
                    db        24,$34              ;2400 bps
                    db        48,$31              ;4800 bps
                    db        96,$30              ;9600 bps
                    db        125,$00             ;125000 bps
#endif
#if MHZ = 4
                    db        3,$34               ;300 bps (user value, MCU value)
                    db        12,$32              ;1200 bps
                    db        24,$31              ;2400 bps
                    db        48,$30              ;4800 bps
#endif
#endif
?BPS_Table.Entries  equ       *-?BPS_Table/2      ;number of entries in table

?SetBAUD            lda       A_,y                ;get user bps rate value
                    ldx       #?BPS_Table         ;point to table with MCU bps rates
                    ldb       #?BPS_Table.Entries ;get number of entries to test
?SetBAUD.BpsLoop    cmpa      ,x                  ;is it the same as in table?
                    beq       ?SetBAUD.SetBaud    ;go set it
                    inx:2                         ;point to next entry
                    decb                          ;are we done with all entries?
                    bne       ?SetBAUD.BpsLoop    ;if not, try again
?SetBAUD.Error      ldb       B_,y
                    sec
                    rts
?SetBAUD.SetBaud    lda       1,x                 ;get MCU bps rate value
                    clr       SCCR2               ;disable SCI while changing BAUD
                    sta       BAUD
                    clr       SCCR1
                    lda       #%1100              ;No interrupt mode RX/TX
                    sta       SCCR2
                    clc                           ;no error exit
                    rts

; Purpose: Print constant ASCIZ string following OS instruction (with FCS)
; Parms  : None
?Print              ldx       PC_,y               ;get address following OS
?Print.Loop         lda       ,x                  ;get character to print
                    beq       ?Print.Exit         ;at the end of ASCIZ string, exit
                    bsr       ?PutChar.Local      ;send the character to SCI
                    inx                           ;point to next character
                    bne       ?Print.Loop         ;avoids infinite loops
?Print.Exit         inx                           ;point after NUL
                    stx       PC_,y               ;..to use as return address
                    clc                           ;no errors
                    rts

; Purpose: Read SCI char, if present, into RegA
; Output : A holds character if Carry Clear
;        : Carry set if character not available
?GetPossibleChar    cli
                    nop                           ;a window of int opportunity
                    sei
                    lda       SCSR                ;wait for character waiting
                    anda      #$20
                    bne       ?GetChar.Common
                    ldb       B_,y                ;avoid destroying original B
                    sec
                    rts

; Purpose: Read SCI char into RegA
; Output : A holds character
?GetChar.Next
#ifdef _MTOS_
                    os        fNextTask
#endif
?GetChar            cli
                    nop                           ;a window of int opportunity
                    sei
                    lda       SCSR                ;wait for character waiting
                    anda      #$20
                    beq       ?GetChar.Next
?GetChar.Common     lda       SCDR                ;read character
                    sta       A_,y
                    clc                           ;never an error from here
                    rts

; Purpose: Write RegA character to the SCI
; Input  : A holds character
?PutChar            lda       A_,y
                    bra       ?PutChar.Local
?PutChar.Next
#ifdef _MTOS_
                    os        fNextTask
#endif
?PutChar.Local      cli
                    nop                           ;a window of int opportunity
                    sei
                    tst       SCSR                ;wait for ready to TX
                    bpl       ?PutChar.Next
                    sta       SCDR                ;send character
                    clc                           ;never an error from here
                    rts

; Purpose: Write (send) a string to the SCI
; Input  : X->buffer of Pascal-like string, ie., LengthByte,Char1,Char2,...
; Note(s): buffer should not be used for incoming chars, for it will be
;          messed up.
?Write              ldx       X_,y
                    ldb       ,x                  ;get length of string
                    beq       ?Write.NoError      ;if 0, nothing to send
?Write.Loop         inx                           ;point to data
                    lda       ,x
                    bsr       ?PutChar.Local
                    decb
                    bne       ?Write.Loop
?Write.NoError      clc
                    rts

; Purpose: Writeln (send) a string to the SCI followed by a CR,LF pair
; Input  : X->buffer of Pascal-like string, ie., LengthByte,Char1,Char2,...
?Writeln            bsr       ?Write              ;do regular fWrite
                    bcs       ?Writeln.Exit       ;on failure, exit
; Purpose: Advance a line sending a CR,LF pair to the SCI
?NewLine            lda       #CR                 ;send a CR
                    bsr       ?PutChar.Local
                    lda       #LF                 ;send a LF
                    bsr       ?PutChar.Local
?WriteZ.NoError     clc
?Writeln.Exit       rts

; Purpose: Write (send) a string to the SCI
; Input  : X->ASCIZ string, ie., Char1,Char2,...,0
; Note(s): buffer should not be used for incoming chars, for it will be
;          messed up.
?WriteZ             ldx       X_,y
?WriteZ.Loop        lda       ,x
                    beq       ?WriteZ.NoError
                    bsr       ?PutChar.Local
                    inx
                    bne       ?WriteZ.Loop        ;avoids infinite loops
                    ldb       B_,y
                    sec
                    rts

; Purpose: Writeln (send) a string to the SCI followed by a CR,LF pair
; Input  : X->ASCIZ string, ie., Char1,Char2,...,0
?WritelnZ           bsr       ?WriteZ             ;do regular fWriteZ
                    bcs       ?Writeln.Exit       ;on failure, exit
                    bra       ?NewLine