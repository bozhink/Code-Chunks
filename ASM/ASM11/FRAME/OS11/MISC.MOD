;*****************************************************************************
;* Module    : MISC.MOD
;* Programmer: Tony Papadimitriou
;* Purpose   : Miscellaneous OS-called routines
;* Language  : MC68HC11 (ASM11 v1.92+)
;* Status    : Copyright (c) 1999-2001 by Tony Papadimitriou
;* Segments  : RAM    : Variables
;*           : ROM    : Code
;*           : SEG9   : OS definitions (this allows adding more functions)
;* History   : 99.10.31 v1.00 Original (copied from 99.10.26 OS11.MOD)
;*           : 99.11.22 v1.01 Added fHexToBin
;*           : 99.12.12 v1.02 KickCOP exported, optimized fReverseByte
;*           : 99.12.22 v1.03 Moved fReverseByte to DISPATCH.MOD
;*           : 00.02.01 v1.04 Added fBlockFill
;*           : 00.07.01 v1.05 Added option to space fill result of fBin2BCD
;*           :                Moved fNoLeadChar from STRINGS.MOD to here
;*           : 00.12.27 v1.06 Corrected fConvertAD to cover complete range
;*           : 01.02.15 v1.07 Added fBCD2ASCII
;*           : 01.02.17       Added fBCD2Bin
;*           : 01.04.01       Removed errNotFound from fSearchTable
;*           : 01.05.28       Moved fHexToBin to DISPATCH.MOD
;*           : 01.06.23       Fixed description of fBCD2Bin
;*****************************************************************************

#ifmain
                    #LISTOFF
                    #INCLUDE  EXP-F1.INC
                    #LISTON
#endif
                    #SEG9
#ifndef OSCommands
OSCommands          exp       *
#endif

fCopyMem            exp       *-OSCommands/2      ;Copy a block of memory
                    dw        ?CopyMem

fBin2Dec            exp       *-OSCommands/2      ;Binary to Decimal conversion
                    dw        ?Bin2Dec

fBin2BCD            exp       *-OSCommands/2      ;Binary to BCD conversion (actually any base)
                    dw        ?Bin2BCD

fNoLeadChar         exp       *-OSCommands/2      ;Convert leading RegB chars to RegA char
                    dw        ?NoLeadChar

fSearchTable        exp       *-OSCommands/2      ;Search any data table
                    dw        ?SearchTable

fConvertAD          exp       *-OSCommands/2      ;Convert A/D value to volts
                    dw        ?ConvertAD

fKickCOP            exp       *-OSCommands/2      ;Kick the COP timer to prevent timeout resets
                    dw        KickCOP             ;Not a local label, called either way

fHexToASCII         exp       *-OSCommands/2      ;Convert a hex number to its ASCII equivalent
                    dw        ?HexToASCII

fGetBootMode        exp       *-OSCommands/2      ;Get the boot mode code
                    dw        ?GetBootMode

fIncBCD             exp       *-OSCommands/2      ;Increment a BCD number
                    dw        ?IncBCD

fDecBCD             exp       *-OSCommands/2      ;Decrement a BCD number
                    dw        ?DecBCD

fBCD2ASCII          exp       *-OSCommands/2      ;BCD to ASCII
                    dw        ?BCD2ASCII

fBCD2Bin            exp       *-OSCommands/2      ;BCD to Binary
                    dw        ?BCD2Bin

fBlockFill          exp       *-OSCommands/2      ;Block Fill with single value
                    dw        ?BlockFill

;*****************************************************************************
;*                 Operating System routines expanded                        *
;*****************************************************************************

                    #ROM

; Purpose: Copy (move) bytes from source to destination memory
; Input  : D holds number of bytes to copy
;        : Y points to start of source memory
;        : X points to start of destination memory
; Note(s): Correctly handles copies (even partially) to EEPROM
?CopyMem            pshy
                    lda       A_,y                ;load parameters
                    ldb       B_,y
                    ldx       X_,y
                    ldy       Y_,y
                    cmpd      #0                  ;any bytes to copy?
                    beq       ?CopyMem.NoError    ;no, get out of here
?CopyMem.Loop       pshd                          ;save counter between loops
#ifdef fWriteEE
                    cpx       #EEPROM             ;check destination for EEPROM
                    blo       ?CopyMem.RAM
                    cpx       #EEPROM_END
                    bhi       ?CopyMem.RAM
     ;?CopyMem.EEPROM
                    lda       ,y                  ;get a byte from source
                    os        fWriteEE            ;write EEPROM byte A to ,X
                    bcs       ?CopyMem.Error      ;on error...
                    bra       ?CopyMem.LoopEnd    ;no error, continue
#endif
?CopyMem.RAM        lda       ,y                  ;get byte from source
                    sta       ,x                  ;put byte to destination
?CopyMem.LoopEnd    inx                           ;bump up both pointers
                    iny
                    puld                          ;get loop counter
                    decd                          ;and count down
                    bne       ?CopyMem.Loop
?CopyMem.NoError    puly
                    clc
                    rts
?CopyMem.Error      puld
                    puly
                    ldb       #errFailure
                    sec
AnRTS               rts                           ;Also, provides a globally accessed RTS

; Purpose: Convert from 16-bit value to 5-digit ASCII decimal
; Input  : D = binary word to convert to decimal
;        : X-> result buffer
;        : Carry: Set to convert leading zeros to spaces
; Output : X-> ASCII string result
; Note(s): Calls fBin2BCD for base-10 conversion
?Bin2Dec            ldx       X_,y
                    lda       #10
                    sta       ,x
                    lda       CCR_,y
                    tap
                    lda       A_,y
                    ldb       B_,y
                    ldy       #5
                    os        fBin2BCD
                    rts

; Purpose: Convert a binary word value to BCD or other base
; Input  : D holds word value
;        : X points to output buffer
;        : Y holds length of buffer
;        : Carry: Set to convert leading zeros to spaces
;        : First byte of buffer holds conversion base
; Note(s): Although user's stack frame is used for temporary storage,
;        : it is left intact.
?Bin2BCD            equ       *
          ; save original stack frame
                    ldx       Y_,y                ;Save stack frame's Y
                    pshx
                    ldx       X_,y                ;Save stack frame's X (pointer to buffer)
                    pshx
          ; check conversion base for validity
                    clra                          ;Get conversion base in D
                    ldb       ,x
                    cmpb      #2                  ;Check base to be 2 to 36
                    blo       ?Bin2BCD.Error
                    cmpb      #36
                    bhi       ?Bin2BCD.Error
          ; make buffer pointer point to end of buffer (last character)
                    xgdx                          ;Now X holds base, D holds buffer pointer
                    addd      Y_,y                ;add length of buffer
                    decd                          ;minus 1 to point to end of buffer
                    std       X_,y                ;and save in temp space

                    lda       A_,y                ;Load D register with word
                    ldb       B_,y                ;..to convert
                    pshx                          ;push needed for first pass of next loop

?Bin2BCD.01         pulx
                    pshx
                    idiv                          ;X should be holding base here
                    jsr       ToDigit

          ; save current digit to buffer and adjust buffer pointer backwards
                    pshx
                    ldx       X_,y                ;Point to current buffer character
                    stb       ,x                  ;Save remainder in output buffer
                    dex                           ;decrement pointer toward start of buffer
                    stx       X_,y                ;and save it
                    pulx

                    xgdx                          ;and use integer result as input for
                    dec       Y_+1,y              ;decrement [low byte] of Y counter
                    bne       ?Bin2BCD.01         ;2nd.last digit? if no, loop back
?Bin2BCD.Exit       pulx:2                        ;adjust stack and restore stack frame's X
                    stx       X_,y
                    brclr     CCR_,y,C.,?Bin2BCD.NoConvert
                    ldd       #' 0'
                    os        fNoLeadChar         ;change leading zeros to spaces
?Bin2BCD.NoConvert  pulx                          ;restore stack frame's Y
                    stx       Y_,y
                    clc
                    rts
?Bin2BCD.Error      pulx:2                        ;dummy PULLs to adjust stack
                    ldb       #errBadParm
                    sec
                    rts

; Routine: NoLeadChar
; Purpose: Convert leading RegB chars to RegA char
; Input  : A  Character to use for filling
;        : B  Character to be replaced
;        : X->Buffer area to change leading zeros to char in RegA
; Output : X->Buffer with leading RegB characters changed to RegA character
; Note(s): Terminates at first non-matching (RegB) character
?NoLeadChar         ldx       X_,y
                    lda       A_,y
                    ldb       B_,y
?NoLeadChar.Loop    cmpb      ,x
                    bne       ?NoLeadChar.Exit
                    sta       ,x                  ;replace with RegA character
                    inx
                    bne       ?NoLeadChar.Loop    ;avoids infinite loops
?NoLeadChar.Exit    clc
                    rts

; Purpose: Search a data table for some value, and return its index
;        : Table must be terminated with zero (byte or word, depending
;        : on target size)
; Input  : B = number of bytes per entry (eg. 5)
;        : X points to beginning of table
;        : Y holds value to search for (if byte, lower 8-bits only)
;        : Carry Clear = Byte Search
;        : Carry Set   = Word Search
; Output : IF FOUND:     X points to matched table entry
;        :               Carry Clear
;        : IF NOT FOUND: X is unaffected
;        :               Carry Set
?SearchTable        ldb       B_,y                ;get size of entries in B
                    ldx       X_,y                ;get actual X value
                    brclr     CCR_,y,C.,?SearchTable.Byte ;go to the byte search part
?SearchTable.Loop   ldd       ,x                  ;get table value
                    beq       ?SearchTable.Fail   ;end-of-table, get out
                    cmpd      Y_,y                ;compare with word target
                    beq       ?SearchTable.Found  ;if equal, we found it!
                    ldb       B_,y                ;reload B with size of entries
                    abx                           ;point to next entry
                    bra       ?SearchTable.Loop   ;..and try again
?SearchTable.Found  stx       X_,y                ;save return result
;                   clc                           ;not really needed after BEQ true
                    rts
?SearchTable.Fail   ldb       B_,y
                    sec
                    rts
?SearchTable.Byte   lda       ,x                  ;get table value
                    beq       ?SearchTable.Fail   ;end-of-table, get out
                    cmpa      Y_+1,y              ;compare with byte target
                    beq       ?SearchTable.Found  ;if equal, we found it!
                    abx                           ;point to next entry
                    bra       ?SearchTable.Byte   ;..and try again

; Purpose: Convert an A/D reading (based on 5Volt Vrh-Vrl) to an ASCII
;        : string with the equivalent decimal number (10digits)
; Input  : X points to beginning of output buffer
;        : A holds A/D reading
; Output : Buffer pointed by X is filled with result
;        : Carry Clear
; Note(s): No registers are affected
?ConvertAD          ldx       X_,y                ;get actual X value
                    ldb       A_,y                ;get actual A value
                    clra
                    pshx
                    pshd                          ;1,y -> current dividend
                    ldb       #9                  ;number of digits
                    pshb                          ;temporary byte for counter
                    tsy                           ;point to new stack frame
?Convert.Loop       ldd       1,y                 ;get current dividend
                    pshx
                    ldx       #51                 ;5/255 = 1/51
                    idiv
                    lda       #10
                    mul
                    std       1,y                 ;save remainder for next loop
                    xgdx
                    pulx
                    addb      #'0'
                    stb       1,x
                    inx
                    dec       ,y
                    bne       ?Convert.Loop
                    pulx                          ;dummy to offset PSHD
                    ins                           ;kill temp (faster than PULB)
                    pulx
                    lda       1,x
                    ldb       #'.'
                    std       ,x
                    clc                           ;never an error from here
                    rts

; Routine: KickCOP
; Purpose: Kick the COP timer (Call this to prevent COP timeout resets)
; Input  : None
; Output : None
; Note(s): Call either way: "OS fKickCOP" or "JSR KickCOP" (faster)
KickCOP             exp       *
#ifdef NOINTS
                    pshd                          ;save registers to be used
                    tpa                           ;keep copy of CCR
                    sei                           ;no IRQs during sequence
#else
                    pshb                          ;save registers to be used
#endif
                    ldb       #$55
                    stb       COPRST
                    comb
                    stb       COPRST
#ifdef NOINTS
                    tap                           ;restore CCR (re-enable IRQs?)
                    puld                          ;restore used registers
#else
                    pulb                          ;restore used registers
#endif
                    clc                           ;never an error from here
                    rts

; Routine: HexToASCII
; Purpose: Convert a hex number in lower A to ASCII equivalent in D
; Input  : A holds binary number (higher nibble is ignored)
; Output : D holds ASCII equivalent of number
?HexToASCII         lda       A_,y
                    anda      #$0F                ;kill higher nibble just in case
                    adda      #0                  ;needed for DAA to work
                    daa                           ;convert to BCD
                    tab                           ;make a copy in B
                    lsra:4                        ;transfer A to lower half
                    andb      #$0F                ;clear upper half of B
                    addd      #'00'               ;finally, convert to ASCII
                    sta       A_,y                ;save result for caller
                    stb       B_,y
?HexToASCII.Exit    clc                           ;never an error from this routine
                    rts

; Routine: GetBootMode
; Purpose: Return the current Operating Mode as a code and ASCIZ string
; Input  : None
; Output : A=byte with bits 1-0 indicating boot mode as follows:
;          %00=Single-Chip, %01=Expanded, %10=Bootstrap, %11=SpecialTest
;        : X -> string with ASCIZ message indicating mode
?GetBootMode        lda       HPRIO               ;Get current HPRIO contents
                    anda      #%01100000          ;Mask off unwanted bits
                    lsra:5                        ;Move mode bits to lsb
                    sta       A_,y                ;save result
                    beq       ?GetBootMode.00
                    cmpa      #%01
                    beq       ?GetBootMode.01
                    cmpa      #%10
                    beq       ?GetBootMode.10
                    ldx       #?BootMsg.11
                    bra       ?GetBootMode.Exit
?GetBootMode.10     ldx       #?BootMsg.10
                    bra       ?GetBootMode.Exit
?GetBootMode.01     ldx       #?BootMsg.01
                    bra       ?GetBootMode.Exit
?GetBootMode.00     ldx       #?BootMsg.00
?GetBootMode.Exit   stx       X_,Y
                    clc                           ;never an error from here
                    rts
?BootMsg.00         fcs       'Single-Chip'
?BootMsg.01         fcs       'Expanded'
?BootMsg.10         fcs       'Bootstrap'
?BootMsg.11         fcs       'Special Test'

; Routine: IncBCD
; Purpose: Increment a BCD number
; Input  : A=BCD number to increment
; Output : A=incremented BCD number
?IncBCD             lda       A_,y                ;Get value to increment
                    adda      #1                  ;increment it (Do NOT use INCA
                    bra       ?IncDecBCD

; Routine: DecBCD
; Purpose: Decrement a BCD number
; Input  : A=BCD number to decrement
; Output : A=decremented BCD number
?DecBCD             lda       A_,y                ;Get value to decrement
                    suba      #1                  ;decrement it (Do NOT use DECA
?IncDecBCD          daa                           ;or DAA won't work)
                    sta       A_,y                ;save it
?BlockFill.Exit     clc                           ;never an error from here
                    rts

; Routine: BlockFill
; Purpose: Fill a block of memory with given value
; Input  : A=value
;        : X=starting address (if higher than Y, wraps around)
;        : Y=ending address
?BlockFill          lda       A_,y                ;get fill value
                    ldx       X_,y                ;point to starting memory
?BlockFill.Loop     sta       ,x                  ;save value
                    cmpx      Y_,y                ;are we done?
                    beq       ?BlockFill.Exit     ;yes, exit
                    inx                           ;no, point to next
                    bra       ?BlockFill.Loop     ;and repeat

; Routine: BCD2ASCII
; Purpose: Convert BCD pair in RegA to ASCII in RegD
; Input  : A=BCD value with first digit in higher nibble, second in lower
; Output : D=ASCII equivalent (RegA=higher digit, RegB=lower digit)
?BCD2ASCII          ldb       A_,y
                    andb      #$0F
                    bsr       ToDigit
                    stb       B_,y
                    ldb       A_,y
                    lsrb:4
                    bsr       ToDigit
                    stb       A_,y
                    clc
                    rts

; Routine: BCD2Bin
; Purpose: Convert BCD pair in RegA to its binary equivalent in RegD
; Input  : A=BCD value with first digit in higher nibble, second in lower
; Output : A=Binary equivalent of BCD number
?BCD2Bin            lda       A_,y
                    lsra:4                        ;move high nibble to low
                    ldb       #10
                    mul                           ;multiply by 10, result in B
                    lda       A_,y
                    anda      #$0F
                    aba
                    sta       A_,y
                    clc
                    rts

#PAGE
*********************************************************************
*                     GENERAL-PURPOSE ROUTINES                      *
*********************************************************************

; Purpose: Convert a binary number to ASCII equivalent
; Input  : B holds binary number
; Output : B holds ASCII equivalent
ToDigit             addb      #'0'                ;convert to ASCII
                    cmpb      #'9'
                    bls       ?ToDigit.Exit
                    addb      #'A'-'0'-10         ;adjust for appropriate letter
?ToDigit.Exit       clc
                    rts

#ifmain
                    #include  OS11/DISPATCH.MOD
#endif
                    #ROM