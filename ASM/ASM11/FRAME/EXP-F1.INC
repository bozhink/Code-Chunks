************************************************************
* MC68HC11F1 FRAMEWORK INCLUDE FILE FOR ASM11 ASSEMBLER    *
************************************************************

                    #message  旼컴컴컴컴컴컴컴컴컴컴컴컴커
                    #message  � Target: ASPiSYS F1 Board �
                    #message  읕컴컴컴컴컴컴컴컴컴컴컴컴켸

#ifndef F1
F1 ;Tells us this INCLUDE has been used
#endif
#ifndef __ASPISYS__
__ASPISYS__ ;Tells us the ASPISYS F1 INCLUDE has been used
#endif

                    #push
                    #listoff
                    #include  COMMON.INC
                    #pull

                    * MEMORY *

#ifdef BASEZERO
                    #message  REGS is set to zero page RAM
REGS                equ       $0000               ;Register Base Address
RAM                 equ       $0060               ;Start of USER RAM (past the REGS)
#else
REGS                equ       $1000               ;Register Base Address
RAM                 equ       $0000               ;Start of USER RAM
#endif

#ifndef RAM_END ;User can assemble with -DRAM_END:$xxxx option
RAM_END             equ       $03FF               ;End of on-chip RAM
#endif
RAM1                equ       $0400               ;External RAM
RAM1_END            equ       $0DFF
EEPROM              equ       $0E00               ;Start of EEPROM
EEPROM_END          equ       $0FFF               ;End of EEPROM
RAM2                equ       $1060               ;External RAM
RAM2_END            equ       $7FFF
STACKTOP            equ       RAM_END             ;Top of Stack
#ifndef ROM ;User can assemble with -DROM:$xxxx option
ROM                 equ       $8000               ;Start of ROM
#endif
#if ROM < $8000
                    #error    ROM cannot be set below $8000
#endif

ROM_END             equ       $FFBF               ;End of ROM
VECTORS             equ       $FFD6               ;Start of Vectors
RESERVED_VECTORS    equ       $FFC0               ;Reserved vectors (22 bytes)

                    #MEMORY   EEPROM    EEPROM_END
                    #MEMORY   ROM       ROM_END
                    #MEMORY   VECTORS   $FFFF

                    #SEG9
                    org       RESERVED_VECTORS-512
                    #RAM
                    org       RAM
                    #XRAM
                    org       RAM2
                    #EEPROM
                    org       EEPROM
                    #ROM
                    org       ROM

                  * REGISTER BLOCK ABSOLUTES *

PORTA               equ       REGS+$00            ;Port A Data
DDRA                equ       REGS+$01            ;Data Direction Register A
PORTG               equ       REGS+$02            ;Port G Data
DDRG                equ       REGS+$03            ;Data Direction Register G
PORTB               equ       REGS+$04            ;Port B Data
PORTF               equ       REGS+$05            ;Port F Data
PORTC               equ       REGS+$06            ;Port C Data
DDRC                equ       REGS+$07            ;Data Direction Register C
PORTD               equ       REGS+$08            ;Port D Data
DDRD                equ       REGS+$09            ;Data Direction Register D
PORTE               equ       REGS+$0A            ;Port E Data
CFORC               equ       REGS+$0B            ;Timer Compare Force
OC1M                equ       REGS+$0C            ;Output Compare 1 Mask
OC1D                equ       REGS+$0D            ;Output Compare 1 Data
TCNT                equ       REGS+$0E            ;Timer Count
TIC1                equ       REGS+$10            ;Timer Input Capture 1
TIC2                equ       REGS+$12            ;Timer Input Capture 2
TIC3                equ       REGS+$14            ;Timer Input Capture 3
TOC1                equ       REGS+$16            ;Timer Output Compare 1
TOC2                equ       REGS+$18            ;Timer Output Compare 2
TOC3                equ       REGS+$1A            ;Timer Output Compare 3
TOC4                equ       REGS+$1C            ;Timer Output Compare 4
TIC4                equ       REGS+$1E            ;Timer Input Capture 4
TOC5                equ       REGS+$1E            ;Timer Output Compare 5
TCTL1               equ       REGS+$20            ;Timer Control 1
TCTL2               equ       REGS+$21            ;Timer Control 2
TMSK1               equ       REGS+$22            ;Timer Interrupt Mask 1
TFLG1               equ       REGS+$23            ;Timer Interrupt Flag 1
TMSK2               equ       REGS+$24            ;Timer Interrupt Mask 2
TFLG2               equ       REGS+$25            ;Timer Interrupt Flag 2
PACTL               equ       REGS+$26            ;Pulse Accumulator Control
PACNT               equ       REGS+$27            ;Pulse Accumulator Counter
SPCR                equ       REGS+$28            ;SPI Control Register
SPSR                equ       REGS+$29            ;SPI Status Register
SPDR                equ       REGS+$2A            ;SPI Data Register
BAUD                equ       REGS+$2B            ;Baud Rate Control Register
SCCR1               equ       REGS+$2C            ;SCI Control 1
SCCR2               equ       REGS+$2D            ;SCI Control 2
SCSR                equ       REGS+$2E            ;SCI Status Register
SCDR                equ       REGS+$2F            ;SCI Data Register
ADCTL               equ       REGS+$30            ;AD Control Status Register
ADR1                equ       REGS+$31            ;AD Result 1
ADR2                equ       REGS+$32            ;AD Result 2
ADR3                equ       REGS+$33            ;AD Result 3
ADR4                equ       REGS+$34            ;AD Result 4
BPROT               equ       REGS+$35            ;Block Protect
OPT2                equ       REGS+$38            ;Additional Options
OPTION              equ       REGS+$39            ;System Configuration Options
COPRST              equ       REGS+$3A            ;COP Reset
PPROG               equ       REGS+$3B            ;EEPROM Programming Control
HPRIO               equ       REGS+$3C            ;Highest Interrupt Priority
INIT                equ       REGS+$3D            ;INIT
XINIT               equ       $103D               ;Out-of-reset INIT
CONFIG              equ       REGS+$3F            ;Configuration Register
CSSTRH              equ       REGS+$5C            ;Chip Select Clock Stretch
CSCTL               equ       REGS+$5D            ;Chip Select Program Control
CSGADR              equ       REGS+$5E            ;Chip Select General Address
CSGSIZ              equ       REGS+$5F            ;Chip Select General Address Size

?$5555              EQU       $D555               ;AT28C256 special address
?$2AAA              EQU       $AAAA               ;AT28C256 special address

                    #MEMORY   CONFIG

                    #DATA
                    org       CONFIG
                    #message  CONFIG must be set to $0F
;                   db        $0F                 ;EEPROM at $0E00-$0FFF (for B11.EXE use)

                    #ROM
                    #push
                    #mapoff
#ifdef ATMEL
AT28C256.SDPOff     psha                          ;AT28C256 Software Data Protection Off (read-write)
                    tpa
                    sei
                    psha
                    ldaa      #$AA                ;Load $AA to $5555
                    staa      ?$5555
                    coma                          ;Load $55 to $2AAA
                    staa      ?$2AAA
                    ldaa      #$80                ;Load $80 to $5AAA
                    staa      ?$5555
                    ldaa      #$AA                ;Load $AA to $5555
                    staa      ?$5555
                    coma                          ;Load $55 to $2AAA
                    staa      ?$2AAA
                    ldaa      #$20                ;Load $20 to $5AAA
                    staa      ?$5555
                    pula
                    tap
                    pula
                    rts

AT28C256.SDPOn      psha                          ;AT28C256 Software Data Protection On (read-only)
                    tpa
                    sei
                    psha
                    ldaa      #$AA                ;Load $AA to $5555
                    staa      ?$5555
                    coma                          ;Load $55 to $2AAA
                    staa      ?$2AAA
                    ldaa      #$A0                ;Load $A0 to $5AAA
                    staa      ?$5555
                    pula
                    tap
                    pula
                    rts

AT28C256.ChipErase  psha                          ;AT28C256 Software Chip Erase
                    tpa
                    sei
                    psha
                    ldaa      #$AA                ;Load $AA to $5555
                    staa      ?$5555
                    coma                          ;Load $55 to $2AAA
                    staa      ?$2AAA
                    ldaa      #$80                ;Load $80 to $5AAA
                    staa      ?$5555
                    ldaa      #$AA                ;Load $AA to $5555
                    staa      ?$5555
                    coma                          ;Load $55 to $2AAA
                    staa      ?$2AAA
                    ldaa      #$10                ;Load $10 to $5AAA
                    staa      ?$5555
                    pula
                    tap
                    pula
                    rts
#endif

SetChipSelects      equ       *
#if MHZ <= 16
                    clr       CSSTRH              ;No clock stretch
#else
                    #message  1 clock stretch for EEPROM
                    lda       #1                  ;EEPROM 1 clock stretch
                    sta       CSSTRH              ;@16MHz crystal (4MHz bus)
#endif
                    clr       CSGADR              ;RAM at $0000
                    ldaa      #%1                 ;32K RAM
                    staa      CSGSIZ
                    ldaa      #%01000101          ;CSIO1 Active High, 32K ROM at $8000
                    staa      CSCTL
                    rts
                    #pull

                    * END OF FILE *