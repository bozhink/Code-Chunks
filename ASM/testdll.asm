; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

      .486                      ; create 32 bit code
      .model flat, stdcall      ; 32 bit memory model
      option casemap :none      ; case sensitive 

;     include files
;     ~~~~~~~~~~~~~
      include \masm32\include\windows.inc
      include \masm32\include\masm32.inc
      include \masm32\include\gdi32.inc
      include \masm32\include\user32.inc
      include \masm32\include\kernel32.inc
      include \masm32\include\Comctl32.inc
      include \masm32\include\comdlg32.inc
      include \masm32\include\shell32.inc
      include \masm32\include\oleaut32.inc
      include \masm32\include\dialogs.inc
      include \masm32\macros\macros.asm     ; the macro file

;     libraries
;     ~~~~~~~~~
      includelib \masm32\lib\masm32.lib
      includelib \masm32\lib\gdi32.lib
      includelib \masm32\lib\user32.lib
      includelib \masm32\lib\kernel32.lib
      includelib \masm32\lib\Comctl32.lib
      includelib \masm32\lib\comdlg32.lib
      includelib \masm32\lib\shell32.lib
      includelib \masm32\lib\oleaut32.lib

    ; ----------------------------------------
    ; prototypes for local procedures go here
    ; ----------------------------------------

      .data?
        hInstance dd ?

      .code

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

LibMain proc instance:DWORD,reason:DWORD,unused:DWORD 

    .if reason == DLL_PROCESS_ATTACH
      push instance
      pop hInstance
      mov eax, TRUE

    .elseif reason == DLL_PROCESS_DETACH

    .elseif reason == DLL_THREAD_ATTACH

    .elseif reason == DLL_THREAD_DETACH

    .endif

    ret

LibMain endp

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

  comment * -----------------------------------------------------
          You should add the procedures your DLL requires AFTER
          the LibMain procedure. For each procedure that you
          wish to EXPORT you must place its name in the "testdll.def"
          file so that the linker will know which procedures to
          put in the EXPORT table in the DLL. Use the following
          syntax AFTER the LIBRARY name on the 1st line.
          LIBRARY testdll
          EXPORTS YourProcName
          EXPORTS AnotherProcName
          ------------------------------------------------------- *

; ллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллллл

end LibMain
