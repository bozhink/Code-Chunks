;*******************************************************************************
;* Module    : SCI_INT.MOD
;* Programmer: Tony Papadimitriou
;* Purpose   : Interrupt-driven SCI RX and TX OS-called routines
;* Language  : MC68HC11 (ASM11 v1.92+)
;* Status    : Copyright (c) 1999-2001 by Tony Papadimitriou
;* Segments  : RAM    : Variables
;*           : ROM    : Code
;*           : SEG9   : OS definitions (this allows adding more functions)
;*           : VECTORS: SCI vector
;* Subsystems: Makes use of SCI interrupts
;* History   : 99.11.12 v1.00 Original (Started on 99.11.12)
;*           : 99.11.12 v1.01 Added fGetChar
;*           : 99.11.27 v1.02 Added fGetPossibleChar (doesn't wait for char)
;*           : 00.01.16 v1.03 Fixed empty/full conditions to always allow ints
;*           : 00.01.23 v1.04 Added implicit CLI in fSetBAUD
;*           : 00.03.14 v1.05 Optimized for MTOS (switches tasks when SCI not ready)
;*           : 00.07.01 v1.06 Corrected/Modified fError so it does nothing when no Carry
;*           : 00.10.04 v1.07 Minor adjustments
;*           : 00.11.21 v1.08 Changed queue to truly circular (much faster access)
;*           : 00.12.28       Moved error handling routines to ERRORS.MOD
;*           : 01.01.24 v1.09 Optimized a bit
;*           : 01.03.08       More optimizations (e.g., removed pshb/pulb from EnQ/DeQ)
;*           : 01.03.27       Removed unnecessary zero checking from GetChar routines
;*           : 01.04.11       Some optimization for size
;*           : 01.07.13       Some more optimizations
;*           :                Removed error code from fSetBAUD, fWriteZ, etc.
;*******************************************************************************

#ifmain ;---------- allows for separate compilation -------------------
                    #LISTOFF
                    #INCLUDE  EXP-F1.INC
                    #INCLUDE  OS11/DISPATCH.MOD
                    #LISTON
#endif ;---------------------------------------------------------------

_SCI_INT_
_SCI_

                    #RAM
; BE SURE TO MAKE ?MAXBUF A POWER OF TWO OR IT WON'T WORK WITH THE CODE PROVIDED
?MAXBUF             EQU       16                  ;RX and TX buffer lengths

#ifnz ?MAXBUF-1&?MAXBUF
                    #error ?MAXBUF not a power of two
#endif

; Note: Both RX and TX buffers must remain together (do not put other variables in between)
; Head = Tail indicates empty buffer

?RX.head            rmb       1                   ;head of RX buffer
?RX.tail            rmb       1                   ;tail of RX buffer
?RX.buffer          rmb       ?MAXBUF             ;buffer for received characters

?TX.head            rmb       1                   ;head of TX buffer
?TX.tail            rmb       1                   ;tail of TX buffer
?TX.buffer          rmb       ?MAXBUF             ;buffer for characters to transmit

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
                    lda       #%00101100          ;Interrupt RX and TX mode
                    sta       SCCR2
; Clear the buffer to be used for transmission/receipt of data
                    ldx       #?RX.head           ;get pointer to beginning of vars
                    ldb       #?MAXBUF+2*2        ;get length for both buffers and indices
?SetBAUD.Loop       clr       ,x                  ;clear buffer
                    inx                           ;advance pointer
                    decb                          ;one less to go
                    bne       ?SetBAUD.Loop       ;repeat until done
                    bclr      CCR_,y,I.           ;enable ints on return
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
?GetPossibleChar    ldx       #?RX.head
                    sei
                    jsr       ?DeQ
                    brset     CCR_,y,I.,?GetPChar.NoInt
                    cli
?GetPChar.NoInt     bcs       ?GetPChar.Error
                    sta       A_,y
                    rts
?GetPChar.Error     ldb       B_,y                ;avoid destroying original B
                    rts

; Purpose: Read SCI char into RegA
; Output : A holds character
?GetChar.Next
#ifdef _MTOS_
                    os        fNextTask
#endif
?GetChar            ldx       #?RX.head
                    sei
                    bsr       ?DeQ
                    brset     CCR_,y,I.,?GetChar.NoInt
                    cli
?GetChar.NoInt      bcs       ?GetChar.Next
?GetChar.OK         sta       A_,y
                    rts

; Purpose: Write RegA character to the SCI
; Input  : A holds character
?PutChar            lda       A_,y
?PutChar.Local      pshx
                    ldx       #?TX.head           ;point to TX buffer
?PutChar.Loop       sei
                    bsr       ?EnQ                ;attempt to enqueue char
                    brset     CCR_,y,I.,?PutChar.NoInt
?PutChar.Int        cli
#ifndef _MTOS_
?PutChar.NoInt      bcs       ?PutChar.Loop       ;wait if not ready yet
#else
?PutChar.NoInt      bcc       ?                   ;go on if ready
                    os        fNextTask           ;process other tasks
                    bra       ?PutChar.Loop       ;and wait for ready again
?
#endif
                    ldx       #REGS               ;enable TX ints
                    bset      [SCCR2,x,#TDRF.
                    bra       ?Q.Out

; Purpose: Write (send) a string to the SCI
; Input  : X->buffer of Pascal-like string, ie., LengthByte,Char1,Char2,...
; Note(s): buffer should not be used for incoming chars, for it will be
;          messed up.
?Write              ldx       X_,y
                    ldb       ,x                  ;get length of string
                    beq       ?Write.NoError      ;if 0, nothing to send
?Write.Loop         inx                           ;point to data
                    lda       ,x
                    pshb
                    bsr       ?PutChar.Local
                    pulb
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
                    clc
?Writeln.Exit       rts

; Purpose: Write (send) a string to the SCI
; Input  : X->ASCIZ string, ie., Char1,Char2,...,0
; Note(s): buffer should not be used for incoming chars, for it will be
;          messed up.
?WriteZ             ldx       X_,y
?WriteZ.Loop        lda       ,x
                    beq       ?Success
                    bsr       ?PutChar.Local
                    inx
                    bne       ?WriteZ.Loop        ;avoids infinite loops
                    ldb       B_,y
?Error              sec
                    rts

; Purpose: Writeln (send) a string to the SCI followed by a CR,LF pair
; Input  : X->ASCIZ string, ie., Char1,Char2,...,0
?WritelnZ           bsr       ?WriteZ             ;do regular fWriteZ
                    bcs       ?Writeln.Exit       ;on failure, exit
                    bra       ?NewLine

; EnQueue character in RegA to buffer pointed by X (RX.buffer or TX.buffer)
; RegB is destroyed
?EnQ                ldb       1,x                 ;B := tail index
                    incb                          ;index := index + 1
                    andb      #?MAXBUF-1          ;wrap around automatically
                    cmpb      ,x                  ;don't go past the head index
                    beq       ?Error              ;full condition, exit
                    stb       1,x                 ;save updated tail index
                    pshx
                    abx                           ;point to buffer[index]
                    sta       2,x                 ;and save character
?Q.Out              pulx
?Success            clc
                    rts

; DeQueue in RegA a character from buffer pointed by X (RX.index or TX.index)
; RegB is destroyed
?DeQ                ldb       ,x
                    cmpb      1,x
                    beq       ?Error              ;  exit with error
                    incb
                    andb      #?MAXBUF-1          ;wrap around automatically
                    stb       ,x                  ;update head index
                    pshx
                    abx
                    lda       2,x                 ;A := buffer[head+2]
                    bra       ?Q.Out

; SCI-related interrupt requests come here
?SCI_Handler        lda       SCSR                ;get status to determine cause of interrupt
                    bita      #$20                ;Anything received?
                    beq       ?SCI_Handler.TX     ;No, check TC flag

                    psha                          ;save status for later
                    lda       SCDR                ;get received character
                    ldx       #?RX.head
                    bsr       ?EnQ                ;put character in RX queue
                    pula                          ;restore SCSR status in A
                    bcs       ?SCI_Exit           ;if save not possible, exit

?SCI_Handler.TX     bita      #TDRF.              ;SCDR empty?
                    beq       ?SCI_Exit           ;no, get out

                    ldx       #?TX.head           ;point to string
                    bsr       ?DeQ                ;get a character from TX queue
                    bcc       ?SCI_Exit1          ;not done yet, leave TC ints active
                    lda       SCCR2               ;on empty queue, disable TX
                    anda      #NOT^TDRF.
                    sta       SCCR2               ;terminate further ints
?SCI_Exit           rti                           ;exit
?SCI_Exit1          sta       SCDR                ;send it (clearing TC flag)
                    rti

                    #VECTORS
?vectors            equ       *

                    org       VECTORS             ;$FFD6
                    dw        ?SCI_Handler

                    org       ?vectors