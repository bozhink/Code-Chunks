                    #listoff
; MCU specific include selector
; This file will decide (based on user conditionals) which MCU specific
; INCLUDE to use.

#ifdef DEBUG
                    #message  DEBUG Mode Assembly (do NOT burn device)
#endif

#ifdef F1
#ifndef MHZ
MHZ                 equ       16                  ;default MHZ setting
#endif
                    #include  EXP-F1.INC
#else
 #ifdef NOICE
#ifndef MHZ
MHZ                 equ       16                  ;default MHZ setting
#endif
                    #include  NOICE.INC
 #else
  #ifdef E2
#ifndef MHZ
MHZ                 equ       8                   ;default MHZ setting
#endif
                    #include  811E2.INC
  #else
   #ifdef E9
#ifndef MHZ
MHZ                 equ       8                   ;default MHZ setting
#endif
                    #include  711E9.INC
   #else
    #ifdef WSI
                    #include  WSI.INC
    #else
     #ifdef EVBU
#ifndef MHZ
MHZ                 equ       8                   ;default MHZ setting
#endif
                    #include  EVBU.INC
     #else
#ifndef MHZ
MHZ                 equ       16                  ;default MHZ setting
#endif
                    #include  EXP-F1.INC          ;default MCU
     #endif
    #endif
   #endif
  #endif
 #endif
#endif
                    #liston