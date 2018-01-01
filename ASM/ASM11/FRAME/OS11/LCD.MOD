;**********************************************************************
;* Module    : LCD.MOD
;* Programmer: Tony Papadimitriou
;* Purpose   : LCD-related OS-called routines
;* Language  : MC68HC11 (ASM11 v1.84b+)
;* Status    : Copyright (c) 1999-2000 by Tony Papadimitriou
;* Segments  : RAM    : Variables
;*           : ROM    : Code
;*           : SEG9   : OS definitions (this allows adding more functions)
;* History   : 99.10.31 v1.00 Original (copied from 99.10.26 OS11.MOD)
;*           : 99.12.14 v1.01 Changed all names to start with fLCD
;*           : 99.12.21 v1.02 Synchronized with LCD_F1.MOD
;*           : 00.12.05 v1.03 Added fLCDLine1 and fLCDLine2
;*           : 01.01.08       Minor fixes
;**********************************************************************

#ifmain
                    #LISTOFF
                    #INCLUDE  EXP-F1.INC
                    #LISTON
#endif

_LCD_
                    #SEG9
#ifndef OSCommands
OSCommands          exp       *
#endif

fLCDInit            exp       *-OSCommands/2      ;Initialize the LCD display
                    dw        ?LCD.Init

fLCDLoadChar        exp       *-OSCommands/2      ;Load X-> character to code in RegA
                    dw        ?LoadChar

fLCDCls             exp       *-OSCommands/2      ;Clear the LCD display
                    dw        ?LCD.Cls

fLCDOn              exp       *-OSCommands/2      ;Enable the LCD display
                    dw        ?DispOn

fLCDDirLeft         exp       *-OSCommands/2      ;Set write direction towards left (eg. numbers)
                    dw        ?DirLeft

fLCDDirRght         exp       *-OSCommands/2      ;Set write direction towards right (normal)
                    dw        ?DirRght

fLCDSetAddr         exp       *-OSCommands/2      ;Set LCD address
                    dw        ?SetDDRAM

fLCDClrEOL          exp       *-OSCommands/2      ;Clear to the end of current LCD line
                    dw        ?ClrEOL

fLCDPutChar         exp       *-OSCommands/2      ;Put a character to the LCD display
                    dw        ?LCD.PutChar

fLCDPutRawChar      exp       *-OSCommands/2      ;Put an LCD code to the LCD display
                    dw        ?LCD.PutRawChar

fLCDPrint           exp       *-OSCommands/2      ;Print an ASCIZ string at current position
                    dw        ?LCDPrint

fLCDWrite           exp       *-OSCommands/2      ;Print an ASCIZ string at current position
                    dw        ?LCDWrite

fLCDWriteOnly       exp       *-OSCommands/2      ;Print ASCIZ string but do NOT clear EOL
                    dw        ?LCDWriteOnly

fLCDPrintLine1      exp       *-OSCommands/2      ;Print on LCD line 1
                    dw        ?LCDPrintLine1

fLCDPrintLine2      exp       *-OSCommands/2      ;Print on LCD line 2
                    dw        ?LCDPrintLine2

fLCDClearLine1      exp       *-OSCommands/2      ;Clear top LCD line
                    dw        ?ClearLine.1

fLCDClearLine2      exp       *-OSCommands/2      ;Clear bottom LCD line
                    dw        ?ClearLine.2

fLCDLine1           exp       *-OSCommands/2
                    dw        ?Line1

fLCDLine2           exp       *-OSCommands/2
                    dw        ?Line2

#PAGE ;Operating System routines expanded
**********************************************************************
*                 Operating System routines expanded                 *
**********************************************************************
                    #ROM

#PAGE ;GENERAL-PURPOSE ROUTINES
;*********************************************************************
;*                     GENERAL-PURPOSE ROUTINES                      *
;*********************************************************************

#PAGE
                    #RAM
?Address            rmb       1                   ;holds LCD address
?Direction          rmb       1                   ;holds current direction

                    #ROM
;*********************************************************************
;*   LCD PORT AND PIN EQUATES (CHANGE TO ACCOMMODATE YOUR HARDWARE)  *
;*********************************************************************
#ifndef DCS
                    #message LCD configured for EVBU
?LCD_E              equ       Bit1.               ;for modified EVBU
?LCD_RW             equ       Bit2.               ;for modified EVBU
?LCD_RS             equ       Bit0.               ;for modified EVBU
#else
                    #message LCD configured for DCS board
?LCD_E              equ       Bit3.               ;Custom DCS Board
?LCD_RW             equ       Bit4.               ;
?LCD_RS             equ       Bit5.               ;
#endif

#ifdef DCS
?LCD_BUSY           equ       Bit0.
#else
?LCD_BUSY           equ       Bit7.               ;for modified EVBU
#endif

?LCD_CTRL           equ       PORTB               ;for modified EVBU
?LCD_Data           equ       PORTC               ;for modified EVBU
?LCD_DDR            equ       DDRC                ;for modified EVBU

;*********************************************************************
;*                        LCD COMMANDS                               *
;*********************************************************************
?cCLS               equ       %00000001           ;Clear LCD display
?cHOME              equ       %00000010           ;Home the cursor
?cDECNSHF           equ       %00000100           ;Decrement cursor, no display shift
?cDECSHF            equ       %00000101           ;Decrement cursor, display shift
?cINCNSHF           equ       %00000110           ;Increment cursor, no display shift
?cINCSHF            equ       %00000111           ;Increment cursor, display shift
?cND                equ       %00001000           ;Display OFF
?cDNCNB             equ       %00001100           ;Display ON, no cursor, no blink
?cDNCB              equ       %00001101           ;Display ON, no cursor, blink
?cDCNB              equ       %00001110           ;Display ON, cursor on, no blink
?cDCB               equ       %00001111           ;Display ON, cursor on, blink
?cSHIFTL            equ       %00011000           ;Display Shift Left
?cSHIFTR            equ       %00011100           ;Display Shift Right
?cMOVEL             equ       %00010000           ;Cursor Move Left
?cMOVER             equ       %00010100           ;Cursor Move Right

;*********************************************************************
;*                     LCD-RELATED ROUTINES                          *
;*********************************************************************

;*****
;* CLS - Clear the LCD display
;*****
?LCD.Cls            lda       #?cCLS
                    bsr       ?WCommLCD
                    ldx       #2
                    os        fDelayMS
                    bsr       ?WCommLCD
                    ldx       #2
                    os        fDelayMS
                    rts

;*****
;* Home - Home the cursor
;*****
?LCD.Home           lda       #?cHOME
                    bsr       ?WCommLCD
                    ldx       #2
                    os        fDelayMS
                    rts

;*****
;* Input: RegA holds ASCII character to display
;* NOTES: Character is displayed and cursor advanced
;*****
?LCD.PutChar        lda       A_,y
                    jsr       ?ASCIILCD           ;convert standard ASCII to LCD codes
                    bra       ?WDataLCD           ;write it out

;*****
;* Input: RegA holds LCD code character to display
;* NOTES: Character is displayed and cursor advanced
;*****
?LCD.PutRawChar     lda       A_,y
                    bra       ?WDataLCD           ;write it out

;*****
;* INPUT : Nothing
;* OUTPUT: Nothing
;* NOTES : LCD is initialized
;*****
?LCD.Init           lda       #$FF                ;set LCD port for writing
                    sta       ?LCD_DDR
                    ldx       #45                 ;wait for required 45ms
                    os        fDelayMS
                    lda       #%00111000          ;set 8-bit data, 1/16 duty, 5x7 dots
                    bsr       ?CommandModeLCD
                    bsr       ?WriteLCD
                    ldx       #5                  ;wait for required 4.1ms
                    os        fDelayMS
;do it once again in case it was originally set at 4-bit bus
                    bsr       ?WriteLCD
                    ldx       #2
                    os        fDelayMS            ;wait for required 100usec
                    bsr       ?WriteLCD
                    ldx       #2
                    os        fDelayMS            ;wait for required 100usec
                    bsr       ?WCommLCD
                    jsr       ?DirRght
                    bsr       ?LCD.Cls
                    bsr       ?DispOn
                    ldx       #?StartupMessage2
                    os        fLCDPrintLine2
                    ldx       #1000
                    os        fDelayMS
#ifdef GREEK
                    jmp       ?LoadGR             ;Load the Greek Character set
#else
                    rts
#endif
?StartupMessage2    fcs       'OS-11 LCD Driver'

;*****
;* Turn the LCD display on, no cursor
;*****
?DispOn             lda       #?cDNCNB
          ; falls through to ?WCommLCD

;*****
;* Write the LCD command (NO REGISTERS ARE DESTROYED) A holds instruction
;*****
?WCommLCD           jsr       ?WaitBusy
                    bsr       ?CommandModeLCD
                    bsr       ?WriteLCD
                    jmp       ?WaitBusy           ;get cursor address

;*****
;* Write LCD Data and toggle Write enable on/off
;*****
?WriteLCD           pshx
                    ldx       #REGS
                    bset      [?LCD_CTRL,x,?LCD_E ;enable Write operation
#ifdef DCS
                    psha
                    os        fReverseByte
#endif
                    sta       ?LCD_Data           ;put command data on bus
#ifdef DCS
                    pula
#endif
                    bclr      [?LCD_CTRL,x,?LCD_E ;disable Write operation
                    pulx
                    rts

*****
* Write the LCD data (NO REGISTERS ARE DESTROYED) A holds data
*****
?WDataLCD           jsr       ?WaitBusy
                    bsr       ?DataModeLCD
                    bsr       ?WriteLCD
                    jmp       ?WaitBusy           ;get cursor address

?DataModeLCD        pshx
                    ldx       #REGS
                    bset      [?LCD_CTRL,x,?LCD_RS ;--- select data
                    bclr      [?LCD_CTRL,x,?LCD_RW ;--- write mode
                    pulx
                    rts

?CommandModeLCD     pshx
                    ldx       #REGS
                    bclr      [?LCD_CTRL,x,?LCD_RS+?LCD_RW ;select command write mode
                    pulx
                    rts

;*****
;* SetCGRAM - Set CG RAM address (A holds address 0-255)
;*****
?SetCGRAM           anda      #%00111111          ;mask off non-address bits
                    ora       #%01000000          ;mix with SET CGRAM command
                    bra       ?WCommLCD

;*****
;* FixAddr - Fix LCD DDRAM address format to SetDDRAM address format
;*           A holds LCD format address on input, SetDDRAM format on output
;*****
?FixAddr            cmpa      #$40                ;is it line 2?
                    blo       ?FixAddr.Line1      ;address is in correct format
                    suba      #$40                ;convert to column without line info
                    ora       #$80                ;add line 2 info
?FixAddr.Line1      rts

;*****
;* LoadChar - Load a custom character into custom LCD character location
;* IN : A Character Code to use (0-7)
;*      X -> 8 bytes of character data
;* OUT: None
;*****
?LoadChar           lda       A_,Y                ;beginning address to write
                    cmpa      #7
                    bhi       ?LoadChar1.Error    ;invalid character code
                    lsla:3                        ;multiply by 8 (size of character data)
                    bsr       ?SetCGRAM
                    ldx       X_,Y                ;user's character start
                    ldb       #8                  ;number of bytes to load
?LoadChar1          lda       ,x
                    jsr       ?WaitBusy
                    anda      #%00011111          ;mask off unused bits just in case
                    bsr       ?WDataLCD
                    inx                           ;point to next sequence or code
                    decb                          ;one less byte to load
                    bne       ?LoadChar1
                    clra                          ;get away from CG RAM and into DD RAM
                    bra       ?SetDDRAM.Local
?LoadChar1.Error    ldb       B_,Y                ;keep original B
                    sec
                    rts

#ifdef GREEK
*****
* LoadGR - Load the Greek character set into unused LCD characters
*****
?LoadGR             clra                          ;beginning address to write
                    bsr       ?SetCGRAM
                    ldx       #?GreekTab          ;start at beginning of data table
?LoadGR1            lda       ,x
                    jsr       ?WaitBusy
                    bsr       ?DataModeLCD
                    anda      #%00011111          ;mask off unused bits just in case
                    bsr       ?WriteLCD
                    inx                           ;point to next sequence or code
                    cpx       #?GreekTabEnd       ;have we loaded all characters?
                    blo       ?LoadGR1
                    clra                          ;get away from CG RAM and into DD RAM
                    bra       ?SetDDRAM.Local
?GreekTab           equ       *                   ;Table of Greek 5x7(8) dot characters
; DELTA
                    fcb       %00100              ;  *
                    fcb       %01010              ; * *
                    fcb       %10001              ;*   *
                    fcb       %10001              ;*   *
                    fcb       %10001              ;*   *
                    fcb       %10001              ;*   *
                    fcb       %11111              ;*****
                    fcb       %00000              ;-----
; Sigma final
                    fcb       %00000              ;
                    fcb       %00000              ;
                    fcb       %01110              ; ***
                    fcb       %10001              ;*   *
                    fcb       %10000              ;*
                    fcb       %01110              ; ***
                    fcb       %00001              ;    *
                    fcb       %00010              ;   *
; phi lowercase
                    fcb       %00000              ;
                    fcb       %00100              ;  *
                    fcb       %01110              ; ***
                    fcb       %10101              ;* * *
                    fcb       %10101              ;* * *
                    fcb       %01110              ; ***
                    fcb       %00100              ;  *
                    fcb       %00100              ;  *
; chi lowercase
                    fcb       %00000              ;
                    fcb       %00000              ;
                    fcb       %11010              ;** *
                    fcb       %00100              ;  *
                    fcb       %00100              ;  *
                    fcb       %01010              ; * *
                    fcb       %01010              ; * *
                    fcb       %10001              ;*   *

                    #include  chr/(c).chr         ;Copyright symbol (code 4)
?GreekTabEnd        equ       *                   ;End of Table of Greek
#endif

;*****
;* INPUT : Param (or A) holds address as follows:
;*         Row (either 1 or 2) is in bit 7 as 0 or 1 respectively
;*         Column (0 through 39) is in bits 6-0
;* OUTPUT: SetDDRAM instruction is executed for the given address
;*****
?SetDDRAM           lda       A_,y
?SetDDRAM.Local     tsta                          ;is address given for row 2?
                    bpl       ?SetDRAM2           ;no, skip row 2 adjustment
?SetDRAM1           adda      #$40                ;yes, adjust column address for row 2
?SetDRAM2           ora       #$80                ;mix address with SET DDRAM command
#ifdef GREEK
                    jsr       ?WCommLCD
#else
                    bsr       ?WCommLCD
#endif
                    ldb       B_,y
                    rts

?Line1              clra
                    bra       ?SetDDRAM.Local

?Line2              lda       #$80
                    bra       ?SetDDRAM.Local

;*****
;* Convert from standard ASCII to LCD codes (LCDs may have different codes)
;*****
?ASCIILCD           pshx
                    ldx       #?ASCII.Table
?ASCIILCD.Loop      cmpa      ,x
                    beq       ?ASCIILCD.Found
                    inx:2
                    cmpx      #?ASCII.TableEnd
                    blo       ?ASCIILCD.Loop
                    pulx
                    rts
?ASCIILCD.Found     lda       1,x
                    pulx
                    rts

; First column is character to be replaced by character in second column
?ASCII.Table        fcb       'Ä','A'
                    fcb       'Å','B'
                    fcb       'Ç',212
                    fcb       'É',0
                    fcb       'Ñ','E'
                    fcb       'Ö','Z'
                    fcb       'Ü','H'
                    fcb       'á',214
                    fcb       'à','I'
                    fcb       'â','K'
                    fcb       'ä',215
                    fcb       'ã','M'
                    fcb       'å','N'
                    fcb       'ç',216
                    fcb       'é','O'
                    fcb       'è',217
                    fcb       'ê','P'
                    fcb       'ë',218
                    fcb       'í','T'
                    fcb       'ì','Y'
                    fcb       'î',220
                    fcb       'ï','X'
                    fcb       'ñ',221
                    fcb       'ó',222
                    fcb       'ò',223
                    fcb       'ô',224
                    fcb       'ö',242
                    fcb       'õ',226
                    fcb       'ú',227
                    fcb       'ù',228
                    fcb       'û',229
                    fcb       'ü',230
                    fcb       '†',231
                    fcb       '°',232
                    fcb       '¢',233
                    fcb       '£',234
                    fcb       '§',235
                    fcb       '•',236
                    fcb       '¶','o'
                    fcb       'ß',237
                    fcb       '®',238
                    fcb       '©',239
                    fcb       '™',1
                    fcb       '´',240
                    fcb       '¨',241
                    fcb       '≠',2
                    fcb       'Æ',3
                    fcb       'Ø',243
                    fcb       '‡',244
                    fcb       '·',223
                    fcb       '‚',227
                    fcb       'Â',161
                    fcb       'Ê',162
                    fcb       'Á',163
                    fcb       '‰',139
                    fcb       'Ë',154
?ASCII.TableEnd     equ       *

;*****
;* fClrEOL - Clear to end of line
;*****
?ClrEOL             bsr       ?WaitBusy           ;get the current DDRAM address in Address
                    lda       ?Address            ;save current DDRAM address in A
                    psha
                    cmpa      #$40                ;is it line 1 or 2?
                    blo       ?ClrEOL.Line1       ;skip subtraction
                    suba      #$40                ;get column number regardless of line
?ClrEOL.Line1       nega                          ;column = -column
                    adda      #40                 ;A = line length - column
                    tab                           ;Move counter to B
                    lda       #' '                ;get a space character in A
?ClrEOL.Loop        jsr       ?WDataLCD
                    decb
                    bne       ?ClrEOL.Loop
                    pula
                    jsr       ?FixAddr            ;convert to proper format for SetDDRAM
                    jmp       ?SetDDRAM.Local

;*****
;* DirLeft - Set write direction towards left (eg. numbers)
;* DirRght - Set write direction towards right (normal)
;*****
?DirLeft            lda       #?cDECNSHF
                    bra       ?SetDirection

?DirRght            lda       #?cINCNSHF

?SetDirection       sta       ?Direction
                    jmp       ?WCommLCD

;****
;* Clear the top LCD line
;****
?ClearLine.1        clra                          ;point to line 1
                    bra       ?ClearLine.Both

;****
;* Clear the bottom LCD line
;****
?ClearLine.2        lda       #$40                ;point to line 2
?ClearLine.Both     jsr       ?SetDDRAM.Local
?LCDWrite.Exit      os        fLCDClrEOL          ;and clear to the end of line
                    clc
                    rts

; Print message pointed by X on LCD line 2
; IN : X points to ASCIZ message
?LCDPrintLine2      lda       #$40                ;point to line 2
                    jsr       ?SetDDRAM.Local
                    ldx       X_,Y                ;get string pointer
                    bra       ?LCDWrite.Loop

; Print message pointed by X on LCD line 1
; IN : X points to ASCIZ message
?LCDPrintLine1      clra                          ;point to line 1
                    jsr       ?SetDDRAM.Local

; Print message pointed by X on current line and cursor position
?LCDWrite           ldx       X_,Y
?LCDWrite.Loop      lda       ,x
                    beq       ?LCDWrite.Exit
                    os        fLCDPutChar
                    inx
                    bra       ?LCDWrite.Loop

; Print message pointed by X on current line and cursor position
; but do NOT clear to end of line
?LCDWriteOnly       ldx       X_,Y
?LCDWriteOnly.Loop  lda       ,x
                    beq       ?LCDWriteOnly.Exit
                    os        fLCDPutChar
                    inx
                    bra       ?LCDWriteOnly.Loop
?LCDWriteOnly.Exit  clc
                    rts

; Print message following instruction OS fLCDPrint (do NOT clear EOL)
?LCDPrint           ldx       PC_,Y
                    bsr       ?LCDWriteOnly.Loop
                    inx
                    stx       PC_,Y
                    clc
                    rts

*****
* Wait while LCD is busy. On exit Address holds address read from LCD
*****
?WaitBusy           psha
                    pshx
                    ldx       #REGS
                    clr       [?LCD_DDR,x         ;change Data register to inputs
                    bclr      [?LCD_CTRL,x,?LCD_RS ;configure check busy flag/address mode
                    bset      [?LCD_CTRL,x,?LCD_RW+?LCD_E ;enable Read operation
                    brset     [?LCD_Data,x,?LCD_BUSY,* ;wait for busy flag to reset
                    lda       ?LCD_Data           ;get the Address
#ifdef DCS
                    os        fReverseByte
#endif
                    bclr      [?LCD_CTRL,x,?LCD_E+?LCD_RW ;disable Read operation and change to instruction mode
                    sta       ?Address            ;save address read
                    com       [?LCD_DDR,x         ;set Data register to outputs
                    pulx
                    pula
                    clc
                    rts

#ifmain
                    #listoff
                    #include  OS11/DISPATCH.MOD
#endif