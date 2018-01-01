;*******************************************************************************
;* Module    : DISPATCH.MOD
;* Programmer: Tony Papadimitriou
;* Purpose   : The dispatcher module for OS calls
;* Language  : MC68HC11 (ASM11 v1.92+)
;* Status    : Copyright (c) 1999-2001 by Tony Papadimitriou
;* Segments  : RAM    : Variables
;*           : ROM    : Code
;*           : SEG9   : OS definitions (this allows adding more functions)
;*           : VECTORS: SWI vector
;* Note(s)   : Always INCLUDE last (i.e., after ALL OS-defining includes)
;*           : This file also contains functions that are used
;*           : practically in every program, such as fDelayMS
;*           : Occupies SWI vector
;* History   : 99.11.01 Original
;*           : 99.12.22 Moved fReverseByte from MISC.MOD to here
;*           : 00.03.10 Replaced Y with X after return from subroutine
;*           : 00.04.14 Remove Halt_MCU and replaced with soft reset
;*           :          Checks for invalid calls only when DEBUG is defined
;*           : 00.12.13 Added fOnErrorGoto and fOnErrorGosub
;*           : 01.05.28 Moved fHexToBin here
;*           : 01.06.22 Moved fOnErrorGoto and fOnErrorGosub to ERRORS.MOD
;*******************************************************************************

#ifmain ;-----------------------------------------------------------------------
                    #listoff
                    #include  EXP-F1.INC
                    #liston
#endif ;------------------------------------------------------------------------

_OS11_
_DISPATCH_

;*******************************************************************************
;*                        OS Error Codes                                       *
;*            (Any number from 0 to 255 may be defined)                        *
;*******************************************************************************
errNone             exp       0                   ;No Error (normally not used)
errOther            exp       1                   ;Other error
errUnused           exp       2                   ;Unused OS opcode
errBadParm          exp       3                   ;Bad parameter
errFailure          exp       4                   ;Operation failed
errOutOfRange       exp       5                   ;Value out of range
errNotFound         exp       6                   ;Not Found (Search, etc.)

                    #SEG9
#ifndef OSCommands
OSCommands          exp       *
#endif

fDelayMS            exp       *-OSCommands/2      ;Delay variable number of ms
                    dw        ?DelayMS

fUpcase             exp       *-OSCommands/2      ;Convert char in RegA to uppercase
                    dw        ?Upcase

fReverseByte        exp       *-OSCommands/2      ;Reverse a byte's bit order from MSB to LSB or back
                    dw        ?ReverseByte

fHexToBin           exp       *-OSCommands/2      ;Convert two hex digits (0-F) in RegD to the binary equivalent
                    dw        ?HexToBin

OS.Entries          exp       *-OSCommands/2      ;Number of opcodes defined

#if OS.Entries > 255
?OS_16BIT
                    #warning  Max. functions (256) exceeded, OS -> OSW
#endif

                    #ROM
;**********************************************************************
;*               OS DISPATCHER (OS CALLS COME HERE)                   *
;**********************************************************************
;* Call format: OS CallName                                           *
;* Returns    : No Carry if no error, B is unaffected                 *
;*            : Carry if error, B holds error code                    *
;* Note(s)    : Interrupts will be allowed during the call if the I   *
;*            : bit before the call was clear, otherwise they won't.  *
;* Total Stack: 11 (9 for caller + 2 for local storage without subs)  *
;**********************************************************************
                    #push
                    #mapoff
?SWI_Handler        tsy                           ;point Y to SWI stack frame
                    brset     CCR_,y,I.,?SWI_Continue ;if I bit was set before OS call, don't allow ints
                    cli                           ;Enable interrupts
?SWI_Continue       ldx       PC_,y               ;adjust PC for opcode
#ifdef ?OS_16BIT
                    ldd       ,x                  ;OSW type calls
                    inx                           ;skip 2nd opcode byte
#else
                    clra                          ;we're gonna use D (for OS calls)
                    ldb       ,x                  ;get OS opcode byte
#endif
                    inx                           ;skip 1st opcode byte
                    stx       PC_,y               ;and save new PC to return to
#ifdef DEBUG
                    cpd       #OS.Entries         ;is it a valid OpCode?
                    bhs       ?SWI_Ret
#endif
#ifdef ?OS_16BIT
                    lsld                          ;multiply by two (size of table entries)
                    addd      #OSCommands         ;add starting address
                    xgdx                          ;and put result in X
#else
                    ldx       #OSCommands         ;point to command table
                    abx:2                         ;add offset twice (size of table entries)
#endif
                    ldx       ,x                  ;get function JMP vector
                    jsr       ,x                  ;Perform function
                    tsx                           ;Y may be destroyed, use X from here on

          ;now, we should prepare the stack frame to be
          ;returned with appropriate values

                    bcs       ?SWI_Error
                    bclr      CCR_,x,C.           ;clear Carry flag
                    rti                           ;no error exit
?SWI_Error          bset      CCR_,x,C.           ;set Carry flag
                    stb       B_,x                ;save error code for user
#ifndef AnRTI
AnRTI               exp       *
#endif
                    rti                           ;A globally accessed RTI

#ifdef DEBUG
; The following section handles invalid OS Opcodes
?SWI_Ret            ldx       PC_,y               ;adjust PC to start of opcode
                    dex:2                         ;..back 1 byte for operand and 1 for the OS opcode
                    stx       PC_,y               ;and save new PC to return to
                    ldx       ILLOP_VECTOR
                    cpx       #ERASED_STATE       ;Check if not initialized (for EPROM, ie., $FFFF)
                    beq       ?SWI_Ret.2
                    jmp       ,x                  ;Invalid System Call

?SWI_Ret.2          ldx       $FFFE               ;In case ILLOP handler not installed
                    jmp       ,x                  ;attemp to restart
#endif

                    #pull


; Purpose: Delay ~ RegX milliseconds (not counting caller's overhead)
?DelayMS            ldx       X_,y                ;Get milliseconds to delay
?DelayMS.Loop       pshx
                    ldx       #MSEC               ;constant for 1 millisecond
                    dex
                    bne       *-1
                    pulx
                    dex
                    bne       ?DelayMS.Loop
                    clc                           ;No errors in any case
                    rts

; Purpose: Convert ASCII character in A to uppercase
; Input  : RegA->char
; Output : RegA->CHAR
?Upcase             lda       A_,y
                    bsr       Upcase
                    bra       ?SaveAandExit

; Routine: Upcase
; Purpose: Convert character in A to uppercase
; Input  : A=character
; Output : A=CHARACTER
Upcase              exp       *                   ;direct entry with a JSR
                    cmpa      #'a'                ;less than 'A'?
                    blo       ?Upcase.Exit        ;yes, skip
                    cmpa      #'z'                ;greater than 'Z'?
                    bhi       ?Upcase.Exit        ;yes, skip
                    suba      #'a'-'A'            ;do the conversion
?Upcase.Exit        rts

; Routine: ReverseByte
; Purpose: Reverse a byte's bit order from MSB to LSB or back
; Input  : A=byte whose bit order to change
; Output : A=byte with bit order changed
?ReverseByte        ldb       #8                  ;number of bits
?ReverseByte.Loop   lsr       A_,y                ;get right-most bit in Carry
                    rola                          ;get Carry in right-most RegA bit
                    decb                          ;one less bit to process
                    bne       ?ReverseByte.Loop   ;repeat for all bits
?SaveAandExit       sta       A_,y                ;save result
                    clc                           ;never an error from here
                    rts

; Routine: HexToBin
; Purpose: Convert a hex string to binary number
; Input  : D=hex string
; Output : A=binary equivalent, Carry Clear
;        : Carry Set if digits not in 0-9, A-F/a-f character set
?HexToBin           lda       A_,y
                    bsr       Upcase
                    bsr       ?HexToBin.Digit
                    bcs       ?HexToBin.Error
                    lsla:4
                    tab                           ;keep it B for now
                    lda       B_,y
                    bsr       Upcase
                    bsr       ?HexToBin.Digit
                    bcs       ?HexToBin.Error
                    stb       A_,y
                    ora       A_,y
                    sta       A_,y                ;save it
                    clc                           ;never an error from here
                    rts
?HexToBin.Digit     cmpa      #'0'
                    blo       ?Error
                    cmpa      #'F'
                    bhi       ?Error
                    cmpa      #'9'
                    bls       ?HexToBin.Number
                    cmpa      #'A'
                    blo       ?Error
                    suba      #'A'-10-'0'
?HexToBin.Number    suba      #'0'
                    clc
                    rts
?HexToBin.Error     ldb       B_,y
?Error              sec
                    rts

                    #VECTORS
?vectors            equ       *

                    org       VECTORS+32          ;$FFF6
                    dw        ?SWI_Handler

                    org       ?vectors

                    end