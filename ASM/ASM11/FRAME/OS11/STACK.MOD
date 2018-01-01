;**********************************************************************
;* Module    : STACK.MOD
;* Programmer: Tony Papadimitriou
;* Purpose   : Stack handling routines
;* Language  : MC68HC11 (ASM11 v1.84b+)
;* Status    : Copyright (c) 1999-2001 by Tony Papadimitriou
;* Segments  : RAM    : Variables
;*           : ROM    : Code
;*           : SEG9   : OS definitions (this allows adding more functions)
;* History   : 99.10.01 Original
;*           : 01.01.20 Added fStackEmpty query
;*           :          Fixed ?Error to not destroy user's B
;**********************************************************************

;Four routines are provided along with the required RAM
;
;1.  fInitStack - Initialize the Stack
;2.  fPush      - Push RegA byte on to the stack
;3.  fPull      - Pull a byte from the stack in RegA
;4.  fStackEmpty- Simply checks if the stack is empty (no action)

#ifmain ;------------------------------------------------------------
                    #listoff
                    #include  EXP-F1.INC
                    #liston
#endif ;-------------------------------------------------------------

;********************************************************************
;*               LIBRARY ROUTINES FOR STACK MANIPULATION            *
;********************************************************************

?STACKSIZE          EQU       32                  ;size of Stack buffer in bytes

                    #RAM
?S.index            rmb       2                   ; -> first entry of Stack
?S.data             rmb       ?STACKSIZE

; ?S.index = $0000 indicates empty Stack condition

                    #SEG9
#ifndef OSCommands
OSCommands          exp       *
#endif

fInitStack          exp       *-OSCommands/2      ;Initialize the Stack
                    dw        ?InitStack

fPush               exp       *-OSCommands/2      ;Push RegA byte on to the stack
                    dw        ?Push

fPull               exp       *-OSCommands/2      ;Pull a byte from the stack in RegA
                    dw        ?Pull

fStackEmpty         exp       *-OSCommands/2      ;Check if stack is empty
                    dw        ?StackEmpty

                    #ROM
; Initialize the Stack structure before first time use
?InitStack          clr       ?S.index            ;make SP NIL
                    clr       ?S.index+1
                    ldx       #?S.data
?InitStack.Loop     clr       ,x
                    inx
                    cmpx      #?S.data+?STACKSIZE
                    blo       ?InitStack.Loop
                    rts

; Adds a byte to the end of the stack
; IN: RegA holds byte to push
?Push               pshx
                    ldx       ?S.index            ;get save position
                    beq       ?Push.First         ;first byte on stack
                    dex
                    cmpx      #?S.data            ;are past the allowed size?
                    bhs       ?Push.Save          ;no, continue
?ErrorX             pulx
?Error              ldb       B_,y                ;load dummy error (user's B)
                    sec                           ;general error exit
                    rts
?Push.First         ldx       #?S.data+?STACKSIZE-1
?Push.Save          stx       ?S.index
                    lda       A_,y                ;get parameter
                    sta       ,x                  ;save byte
?OKX                pulx
?OK                 clc
                    rts

; Removes a byte from the top of the stack
; OUT: RegA holds byte pulled
?Pull               pshx
                    ldx       ?S.index            ;get current index
                    beq       ?ErrorX             ;empty stack, exit with error
                    lda       ,x                  ;get value
                    sta       A_,y                ;return to caller
                    inx
                    cmpx      #?S.data+?STACKSIZE
                    bhs       ?Pull.NIL
?Pull.Save          stx       ?S.index            ;make it NIL (empty)
                    bra       ?OKX
?Pull.NIL           clrx
                    bra       ?Pull.Save

; Removes a byte from the top of the stack
; OUT: Carry Set if stack is empty, Clear otherwise
?StackEmpty         ldx       ?S.index            ;get current index
                    beq       ?OK
                    bra       ?Error

#ifmain
                    #include  OS11/DISPATCH.MOD
#endif