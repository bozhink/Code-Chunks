;*******************************************************************************
;* Module    : S19.MOD
;* Programmer: Tony Papadimitriou
;* Purpose   : S19 Loader and hex to binary conversion OS-called routines
;* Language  : MC68HC11 (ASM11 v1.84b+)
;* Status    : Copyright (c) 1999-2001 by Tony Papadimitriou
;* Segments  : RAM    : Variables
;*           : ROM    : Code
;*           : SEG9   : OS definitions (this allows adding more functions)
;* Note(s)   : Requires that SCI.MOD or SCI_INT.MOD be included as well.
;* History   : 99.10.31 v1.00 Original (copied from 99.10.26 OS11.MOD)
;*           : 99.11.29 v1.01 Added conditional to avoid duplicating fHexToBin
;*           ;                Adapted to word-size fHexToBin version
;*           : 00.01.11 v1.02 Added fUpcase to allow loading lowercase S19 files
;*           : 01.05.28       Moved fHexToBin to DISPATCH.MOD
;*           : 01.06.09       Fix bug of previous modification. Optimized a bit.
;*******************************************************************************

#ifmain ;-----------------------------------------------------------------------
                    #listoff
                    #include  EXP-F1.INC
                    #include  OS11/SCI_INT.MOD
                    #include  OS11/DISPATCH.MOD
                    #liston
#endif ;------------------------------------------------------------------------

_S19_

                    #SEG9
#ifndef OSCommands
OSCommands          exp       *
#endif

fLoadS19            exp       *-OSCommands/2      ;Load an S19 file via the SCI
                    dw        ?LoadS19

#PAGE ;Operating System routines expanded
**********************************************************************
*                 Operating System routines expanded                 *
**********************************************************************
                    #ROM

; Routine: LoadS19
; Purpose: Load an S19 file through the SCI port
; Input  : X -> Load Offset for S19 addresses (X holds two's complement offset)
; Output : X -> Execution address from S9 record (possibly zero)
; Stack  : Stack variables used (accessed by nnn,X) after an TSX
;          Load Offset Offset to adjust by      6,X  word
;          Temp        Temporary usage          5,X  byte
;          RecType     S-record type field      4,X  byte
;          Length      S-record length field    3,X  byte
;          Address     S-record address field   1,X  word
;          CRC         S-record running CRC     0,X  byte
?LoadS19            ldx       X_,y
                    pshx                          ;Save two's complement offset
                    clrx
                    pshx:3                        ;Reserve three words for variables (init to 0)
                    tsx                           ;Get base for variables
?LoadS19.New        jsr       ?LoadS19.ReadByte   ;Get first character
                    bcs       ?LoadS19.OK         ;if EOL, get out
                    cmpa      #'S'                ;Probable S record
                    bne       ?LoadS19.EOL        ;No, ignore rest of line
                    os        fPrint
                    fcs       '.'
                    jsr       ?LoadS19.ReadByte   ;Get next character
                    bcs       ?LoadS19.Error      ;if EOL, get out with error
                    cmpa      #'0'                ;Header record?
                    bne       ?LoadS19.S9
                    bsr       ?LoadS19.ToEOL      ;Yes, ignore rest of line
                    bra       ?LoadS19.New        ;go read another line
?LoadS19.S9         cmpa      #'9'                ;Terminator record
                    beq       ?LoadS19.OK
                    cmpa      #'1'                ;Code/data record
                    beq       ?LoadS19.OK
                    bra       ?LoadS19.EOL        ;Not a valid record type, ignore line
?LoadS19.OK         sta       4,x                 ;Save this type

          ;Get length of Record Bytes (including 16-bit address and 8-bit CRC)
                    jsr       ?LoadS19.ReadHex    ;Get next 2 characters in binary
                    bcs       ?LoadS19.Error      ;if something wrong, get out with error
                    bsr       ?LoadS19.UpdateCRC
                    suba      #3                  ;adjust for 2-byte address and 1-byte CRC
                    sta       3,X                 ;save Length of record

          ;Now, get the load address
                    jsr       ?LoadS19.ReadHex
                    bcs       ?LoadS19.Error
                    bsr       ?LoadS19.UpdateCRC
                    sta       1,X                 ;Save MSB
                    jsr       ?LoadS19.ReadHex
                    bcs       ?LoadS19.Error
                    bsr       ?LoadS19.UpdateCRC
                    sta       2,X                 ;Save LSB
                    ldd       6,X                 ;Get offset
                    addd      1,X                 ;Add actual address
                    std       1,X                 ;And re-save actual address

          ;Now, get the code/data bytes
                    tst       3,X                 ;Check Length of zero
?LoadS19.Loop       beq       ?LoadS19.CRC        ;Empty code/data section of record
                    bsr       ?LoadS19.ReadHex
                    bcs       ?LoadS19.Error      ;if something wrong, get out with error
                    bsr       ?LoadS19.UpdateCRC
                    bsr       ?LoadS19.StoreByte  ;save byte and advance pointer
                    dec       3,X                 ;One less byte to read
                    bra       ?LoadS19.Loop

?LoadS19.CRC        bsr       ?LoadS19.ReadHex    ;Get CRC byte
                    bcs       ?LoadS19.Error      ;if something wrong, get out with error
                    com       0,X                 ;Get one's complement of final CRC value
                    cmpa      0,X                 ;Is it the same as the one calculated
                    bne       ?LoadS19.Error      ;No, exit with error

          ;See if we're done
                    lda       4,X                 ;Check record type
                    cmpa      #'9'
                    beq       ?LoadS19.Exit       ;Done, get out without errors
                    bsr       ?LoadS19.ToEOL
                    pulx:4
                    bra       ?LoadS19            ;Go back to read another line

?LoadS19.Exit       ldx       1,X                 ;Load X with address
                    stx       X_,y                ;for use by OS11
                    bsr       ?LoadS19.ToEOL
                    pulx:4
                    clc
                    rts
?LoadS19.Error      bsr       ?LoadS19.ToEOL      ;1.01 addition (exit at end-of-line)
                    pulx:4
                    ldb       #errFailure         ;for use by OS11
                    sec
                    rts
?LoadS19.EOL        bsr       ?LoadS19.ToEOL
                    bra       ?LoadS19.Error      ;Always out from the error exit

?LoadS19.ToEOL      cmpa      #CR
                    beq       ?LoadS19.ToEOL.OK
                    cmpa      #LF
                    beq       ?LoadS19.ToEOL.OK
                    bsr       ?LoadS19.ReadByte
                    bra       ?LoadS19.ToEOL

?LoadS19.UpdateCRC  psha                          ;Adjust the CRC for the record
                    adda      0,X
                    sta       0,X
                    pula
?LoadS19.ToEOL.OK   rts

?LoadS19.StoreByte  pshx                          ;Save RegA to current [PC] address
                    ldx       1,X                 ;Get address in X
                    sta       ,X
                    pulx
                    pshd                          ;Adjust the PC value by 1
                    ldd       1,X
                    incd
                    std       1,X
                    puld
                    rts

          ;Sets Carry of end-of-line character found
?LoadS19.ReadByte   os        fGetChar            ;Get a character
                    os        fUpcase             ;Convert to uppercase
                    cmpa      #CR
                    bne       ?LoadS19.ReadByte0
                    cmpa      #LF
                    bne       ?LoadS19.ReadByte0
                    sec
                    rts
?LoadS19.ReadByte0  clc
                    rts

?LoadS19.ReadHex    bsr       ?LoadS19.ReadByte   ;Get next character
                    bcs       ?LoadS19.ReadHex1   ;if EOL, get out with error
                    pshb
                    tab
                    lda       #'0'
                    os        fHexToBin           ;Convert from Hex to Binary
                    pulb
                    bcs       ?LoadS19.ReadHex1   ;if EOL, get out with error
                    lsla:4                        ;Move to high nibble
                    sta       5,X                 ;and save in temporary location
                    bsr       ?LoadS19.ReadByte   ;Get next 2 characters
                    bcs       ?LoadS19.ReadHex1   ;if EOL, get out with error
                    pshb
                    tab
                    lda       #'0'
                    os        fHexToBin           ;Convert from Hex to Binary
                    pulb
                    bcs       ?LoadS19.ReadHex1   ;Invalid character, ignore rest of line
                    ora       5,X                 ;combine LSN with MSN
                    sta       5,X                 ;and save it back (optional)
                    clc                           ;Error-free exit
                    rts
?LoadS19.ReadHex1   ldb       #errFailure
                    sec                           ;Error exit
                    rts