;*******************************************************************************
;* Module    : EEPROM.MOD
;* Programmer: Tony Papadimitriou
;* Purpose   : Various OS-called routines
;* Language  : MC68HC11 (ASM11 v1.84b+)
;* Status    : Copyright (c) 1999-2001 by Tony Papadimitriou
;* Segments  : RAM    : Variables
;*           : ROM    : Code
;*           : SEG9   : OS definitions (this allows adding more functions)
;* History   : 99.10.31 v1.00 Original (copied from 99.10.26 OS11.MOD)
;*           : 01.06.17 v1.01 Removed fDelay10MS, used fDelayMS instead
;*           :                Added conditional lock on semaFLASH
;*           :                Added fReadEE to provide locked read
;*           : 01.06.20       Added check for EEPROM limits
;*           :                Added Carry parameter to control locking
;*           : 01.06.30       Made EraseEE.Local not fUnlock semaFLASH
;*******************************************************************************

#ifmain ;-----------------------------------------------------------------------
                    #listoff
                    #include  EXP-F1.INC
                    #include  OS11/DISPATCH.MOD
                    #liston
#endif ;------------------------------------------------------------------------

                    #SEG9
#ifndef OSCommands
OSCommands          exp       *
#endif

fReadEE             exp       *-OSCommands/2      ;Read one EEPROM byte (uses lock)
                    dw        ?ReadEE

fWriteEE            exp       *-OSCommands/2      ;Write one EEPROM byte
                    dw        ?WriteEE

fEraseEE            exp       *-OSCommands/2      ;Erase one EEPROM byte
                    dw        ?EraseEE

fBulkEraseEE        exp       *-OSCommands/2      ;Bulk Erase EEPROM
                    dw        ?BulkEraseEE

;*******************************************************************************
;*                     Operating System routines expanded                      *
;*******************************************************************************
#ifndef _MTOS_&semaFLASH
                    #message  EEPROM.MOD does NOT use locks
#endif

                    #ROM

; Check if address range is valid
?Valid?             cmpx      #CONFIG
                    beq       ?Yes
                    cmpx      #EEPROM
                    blo       ?No
                    cmpx      #EEPROM_END
                    bls       ?Yes
?No                 sec
                    rts

; Purpose: Delay 10 msec
?Delay10MS          pshx
                    ldx       #10
                    os        fDelayMS
                    pulx
?Yes                clc
                    rts

; Purpose: Read an internal EEPROM location
; Input  : X_,y->address to read
; Output : A_,y->value read
?ReadEE             equ       *
#ifdef _MTOS_&semaFLASH
                    brclr     CCR_,y,C.,?ReadEE.NoLock
                    lda       #semaFLASH
                    os        fLock
?ReadEE.NoLock
#endif
                    ldx       X_,y
                    bsr       ?Valid?
                    bcs       ?Error
                    lda       ,x
                    sta       A_,y
                    jmp       ?Exit

; Purpose: Program an internal EEPROM location
; Input  : A_,y->value to be programmed
;        : X_,y->address to program
?WriteEE            equ       *
#ifdef _MTOS_&semaFLASH
                    brclr     CCR_,y,C.,?WriteEE.NoLock
                    lda       #semaFLASH
                    os        fLock
?WriteEE.NoLock
#endif
                    lda       A_,y
                    ldx       X_,y
                    bsr       ?Valid?
                    bcs       ?Error
                    cmpa      ,x                  ;is it already programmed?
                    beq       ?Exit               ;yes, no need to program it
                    ldb       ,x
                    cmpb      #[ERASED_STATE
                    beq       ?WriteEE.Erased     ;already erase, skip erasure
                    psha
                    bsr       ?EraseEE.Local      ;erase previous contents
#ifdef _MTOS_&semaFLASH
                    brclr     CCR_,y,C.,?WriteEE.NoLock2
                    lda       #semaFLASH
                    os        fLock
?WriteEE.NoLock2
#endif
                    pula
?WriteEE.Erased     ldb       #$02                ;EELAT = 1
                    stb       PPROG               ;Set EELAT bit
                    sta       ,x                  ;save data to address
                    incb                          ;EELAT = 1 and EPGM = 1
                    stb       PPROG               ;Turn on programming voltage
                    bsr       ?Delay10MS          ;Delay 10 msec
                    clr       PPROG               ;Turn off programming voltage
                    cmpa      ,x                  ;Compare with value written
                    beq       ?Exit               ;if equal, get out, no errors
?Error
#ifdef _MTOS_&semaFLASH
                    brclr     CCR_,y,C.,?Error.NoLock
                    lda       #semaFLASH
                    os        fUnlock
?Error.NoLock
#endif
                    ldb       B_,y                ;dummy error
                    sec
                    rts

; Purpose: Byte Erase an internal EEPROM location
; Input  : X_,y->address to erase
?EraseEE            equ       *
#ifdef _MTOS_&semaFLASH
                    brclr     CCR_,y,C.,?EraseEE.NoLock
                    lda       #semaFLASH
                    os        fLock
?EraseEE.NoLock
#endif
                    ldx       X_,y
                    jsr       ?Valid?
                    bcs       ?Error
                    bsr       ?EraseEE.Local
                    bcs       ?Error
#ifdef _MTOS_&semaFLASH
                    brclr     CCR_,y,C.,?Exit.NoLock
                    lda       #semaFLASH
                    os        fUnlock
?Exit.NoLock
#endif
                    clc
                    rts

?EraseEE.Local      lda       #[ERASED_STATE      ;get the erased state for comparison
                    cmpa      ,x                  ;is it already erased?
                    beq       ?Exit               ;yes, no need to erase
                    ldb       #$16                ;BYTE = 1, ERASE = 1, EELAT = 1
                    stb       PPROG
                    stb       ,x                  ;any data to this address will do
                    incb                          ;BYTE = 1, ERASE = 1, EELAT = 1, EPGM = 1
                    stb       PPROG               ;Turn on programming voltage
                    jsr       ?Delay10MS          ;Delay 10 msec
                    clr       PPROG               ;Turn off programming voltage
                    cmpa      ,x                  ;is it erased ($FF)?
                    jne       ?No                 ;if not equal, get out with errors
?Exit               clc
                    rts

; Purpose: Bulk Erase EEPROM
?BulkEraseEE        equ       *
#ifdef _MTOS_&semaFLASH
                    brclr     CCR_,y,C.,?BulkEraseEE.NoLock
                    lda       #semaFLASH
                    os        fLock
?BulkEraseEE.NoLock
#endif
                    ldb       #$06                ;EELAT = 1
                    stb       PPROG
                    stb       EEPROM              ;any EEPROM address will do
                    incb                          ;EELAT = 1 and EPGM = 1
                    stb       PPROG               ;Turn on programming voltage
                    jsr       ?Delay10MS          ;Delay 10 msec
                    clr       PPROG               ;Turn off programming voltage
                    ldx       #EEPROM             ;Check if all EEPROM is erased
                    ldd       #ERASED_STATE       ;Value for erased words
?BulkEraseEE.Check  cmpd      ,x                  ;Is word at ,X erased?
                    bne       ?Error              ;No, get out with error
                    inx:2                         ;Yes, get ready for next word
                    cmpx      #EEPROM_END         ;At the end of EEPROM?
                    blo       ?BulkEraseEE.Check  ;No, let's do it again
                    bra       ?Exit               ;Yes, no errors encountered