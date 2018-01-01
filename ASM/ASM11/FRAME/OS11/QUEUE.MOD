;*******************************************************************************
;* Module    : QUEUE.MOD
;* Programmer: Tony Papadimitriou
;* Purpose   : Queue handling routines
;* Language  : MC68HC11 (ASM11 v1.84b+)
;* Status    : Copyright (c) 1999-2001 by Tony Papadimitriou
;* Segments  : RAM    : Variables
;*           : ROM    : Code
;*           : SEG9   : OS definitions (this allows adding more functions)
;* History   : 99.09.30 Original
;*           : 00.12.28 Allowed for multiple [equal sized] queues
;*           : 01.01.14 Added critical sections under MTOS
;*           : 01.01.20 Added fQEmpty query
;*           :          Fixed ?Error to not destroy user's B
;*           : 01.03.09 Added fQTop
;*           :          Interrupt disabling during critical sections
;*           : 01.03.17 Added fEnQueue and fDeQequeue (like fEnQ/fDeQ w/ wait)
;*           : 01.03.30 Added fEnQTimed and fDeQTimed (like fEnQ/fDeQ w/ timed wait)
;*           : 01.04.23 Made f??QTimed delay user defined (in RegY)
;*           : 01.05.11 Added QUEUE_SIZE to define size of queue
;*******************************************************************************

;The following functions are provided
;
;1.  fInitQ    - Initialize the Queue (RegX points to RAM buffer)
;2.  fEnQ      - Put RegA byte in the queue pointed by RegX
;3.  fDeQ      - Get a byte from the queue pointed by RegX in RegA
;4.  fQEmpty   - Simply checks if the queue is empty (no action)
;5.  fQTop     - Return the top (first) queue element without removing it
;6.  fEnQueue  - fEnQ with wait
;7.  fDeQueue  - fDeQ with wait
;8.  fEnQTimed - fEnQueue with timed wait
;9.  fDeQTimed - fDeQueue with timed wait

#ifmain ;-----------------------------------------------------------------------
                    #listoff
                    #include  EXP-F1.INC
                    #liston
#endif ;------------------------------------------------------------------------

;*******************************************************************************
;*                   LIBRARY ROUTINES FOR QUEUE MANIPULATION                   *
;*******************************************************************************

?Q.first            equ       0                   ; -> first entry of Queue
?Q.last             equ       2                   ; -> last entry of Queue (next available)
?Q.data             equ       4                   ; -> pointer to beginning of data buffer
?Q.end              equ       6                   ; -> pointer to last byte of data buffer
?Q.buffer           equ       8                   ; -> actual buffer

; ?Q.first = ?Q.last indicates empty Queue condition

#ifndef QUEUE_SIZE
QUEUE_SIZE          equ       20                  ;default size
#endif
?QUEUESIZE          equ       QUEUE_SIZE          ;size of data buffer in bytes (one byte not used)
QUEUESIZE           EXP       ?QUEUESIZE+?Q.buffer

                    #SEG9
#ifndef OSCommands
OSCommands          exp       *
#endif

fInitQ              exp       *-OSCommands/2
                    dw        ?InitQ

fEnQ                exp       *-OSCommands/2
                    dw        ?EnQ

fDeQ                exp       *-OSCommands/2
                    dw        ?DeQ

fEnQueue            exp       *-OSCommands/2
                    dw        ?EnQueue

fDeQueue            exp       *-OSCommands/2
                    dw        ?DeQueue

fEnQTimed           exp       *-OSCommands/2
                    dw        ?EnQTimed

fDeQTimed           exp       *-OSCommands/2
                    dw        ?DeQTimed

fQEmpty             exp       *-OSCommands/2
                    dw        ?QEmpty

fQTop               exp       *-OSCommands/2
                    dw        ?QTop

                    #ROM
; Initialize the Queue structure before first time use
; IN : X -> queue buffer of at least QUEUESIZE bytes
?InitQ              ldx       X_,y                ;X := beginning of structure
                    ldd       X_,y                ;D := X
                    addd      #?Q.buffer          ;make both pointers
                    sei
                    std       ?Q.first,x          ;the same, indicating
                    std       ?Q.last,x           ;"queue empty" condition
                    std       ?Q.data,x           ;save beginning of data area
                    addd      #?QUEUESIZE
                    std       ?Q.end,x
                    ldd       #?QUEUESIZE
?InitQ.Loop         clr       ?Q.buffer,x
                    inx
                    decd
                    bne       ?InitQ.Loop
                    brset     CCR_,y,I.,?OK
                    cli
?OK                 clc                           ;general no error exit
?AnRTS              rts

?Error              ldb       B_,y                ;load dummy error (user's B)
                    sec                           ;general error exit
                    rts

; Return the top (first) element
; IN : X -> queue buffer of at least QUEUESIZE bytes
; OUT: Carry Set if empty
;    : Carry Clear if non-empty, RegA holds top (first) byte of queue
?QTop               ldx       X_,y
                    sei
                    ldd       ?Q.first,x
                    cmpd      ?Q.last,x
                    beq       ?Crit.Error
                    xgdx
                    lda       ,x                  ;get value
                    sta       A_,y                ;return it to caller
                    brset     CCR_,y,I.,?QTop.NoInts
                    cli
?QTop.NoInts        clc
                    rts

; Check if the queue is empty
; IN : X -> queue buffer of at least QUEUESIZE bytes
; OUT: Carry Set if empty, Clear otherwise
?QEmpty             ldx       X_,y
                    sei
                    ldd       ?Q.first,x
                    cmpd      ?Q.last,x
                    brset     CCR_,y,I.,?QEmpty.NoInts
                    cli
?QEmpty.NoInts      beq       ?Error
                    clc
                    rts

; Adds a byte to the end of the queue
; IN : RegA holds byte to enqueue
;    : X -> queue buffer of at least QUEUESIZE bytes
?EnQ                ldx       X_,y
                    sei
                    ldx       ?Q.last,x
                    pshx
                    bsr       ?EnlargeQ           ;prepare new index in ?Q.last
                    pulx
                    bcs       ?Crit.Error         ;exit with error
                    lda       A_,y                ;get parameter byte
                    sta       ,x                  ;save byte
                    brset     CCR_,y,I.,?EnQ.NoInts
                    cli
?EnQ.NoInts         clc
                    rts

; Adjust queue index to make queue bigger
; IN : X_,y -> queue buffer of at least QUEUESIZE bytes
?EnlargeQ           ldx       X_,y
                    ldd       ?Q.last,x
                    incd
                    cmpd      ?Q.end,x            ;must we wraparound?
                    blo       ?EnlargeQ.NoWrap
                    ldd       ?Q.data,x           ;reset to beginning of buffer
?EnlargeQ.NoWrap    cmpd      ?Q.first,x          ;is it the same as the first pointer
                    beq       ?Crit.Error         ;yes, queue is FULL
                    std       ?Q.last,x           ;else, save new index
                    clc                           ;no error exit
                    rts

?Crit.Error         brset     CCR_,y,I.,?Crit.NoInts
                    cli
?Crit.NoInts        bra       ?Error

; Removes a byte from the beginning of the queue
; IN : X -> queue buffer of at least QUEUESIZE bytes
; OUT: RegA holds byte dequeued
?DeQ                ldx       X_,y
                    sei
                    ldd       ?Q.first,x          ;get current index
                    cmpd      ?Q.last,x           ;check empty condition
                    beq       ?Crit.Error         ;exit with error

                    xgdx
                    lda       ,x                  ;get value
                    sta       A_,y                ;return it to caller

; Adjust queue index to make queue smaller
; IN : X_,y -> queue buffer of at least QUEUESIZE bytes
?ShrinkQ            ldx       X_,y
                    ldd       ?Q.first,x          ;get current index
                    incd                          ;point to next location
                    cmpd      ?Q.end,x            ;must we wraparound
                    blo       ?ShrinkQ.NoWrap
                    ldd       ?Q.data,x           ;reset to beginning of buffer
?ShrinkQ.NoWrap     std       ?Q.first,x          ;save new index
                    brset     CCR_,y,I.,?ShrinkQ.NoInts
                    cli
?ShrinkQ.NoInts     clc                           ;no error exit
                    rts

; Adds a byte to the end of the queue. Waits if queue is full.
; IN : RegA holds byte to enqueue
;    : X -> queue buffer of at least QUEUESIZE bytes
?EnQueue.NotReady
#ifdef _MTOS_
                    os        fNextTask
#endif
?EnQueue            bsr       ?EnQ
                    bcs       ?EnQueue.NotReady
                    rts

; Removes a byte from the beginning of the queue. Waits if queue is empty
; IN : X -> queue buffer of at least QUEUESIZE bytes
; OUT: RegA holds byte dequeued
?DeQueue.NotReady
#ifdef _MTOS_
                    os        fNextTask
#endif
?DeQueue            bsr       ?DeQ
                    bcs       ?DeQueue.NotReady
                    rts

; Adds a byte to the end of the queue. Waits a bit if queue is full.
; IN : RegA holds byte to enqueue
;    : X -> queue buffer of at least QUEUESIZE bytes
;    : Y = time delay constant (under MTOS number of task switches)
; OUT: Carry set if timeout
?EnQTimed.NotReady
#ifdef _MTOS_
                    os        fNextTask
                    bra       ?EnQTimed.Loop
#endif
?EnQTimed           ldx       Y_,y
?EnQTimed.Loop      pshx
                    bsr       ?EnQ
                    pulx
                    bcc       ?Done
                    dex
                    bne       ?EnQTimed.NotReady
                    bra       ?TimeOut

; Removes a byte from the beginning of the queue. Waits a bit if queue is empty
; IN : X -> queue buffer of at least QUEUESIZE bytes
;    : Y = time delay constant (under MTOS number of task switches)
; OUT: RegA holds byte dequeued, Carry Clear
;    : Carry set if timeout (RegA unaffected)
?DeQTimed.NotReady
#ifdef _MTOS_
                    os        fNextTask
                    bra       ?DeQTimed.Loop
#endif
?DeQTimed           ldx       Y_,y
?DeQTimed.Loop      pshx
                    bsr       ?DeQ
                    pulx
                    bcc       ?Done
                    dex
                    bne       ?DeQTimed.NotReady
?TimeOut            ldb       B_,y
                    sec
?Done               rts

#ifmain ;-----------------------------------------------------------------------
                    #include  OS11/DISPATCH.MOD
#endif ;------------------------------------------------------------------------