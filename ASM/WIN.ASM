.386
.model flat,stdcall
option casemat:none

WinMain proto :DWORD,:DWORD,:DWORD,:DWORD

include \masm32\include\windows.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\gdi32.inc
includelib \masm32\include\user32.inc
includelib \masm32\include\kernel32.inc
includelib \masm32\include\gdi32.inc

.data
ClassName db "WhatClass",0
AppName db "Application",0

.data?
hInstance HINSTANCE ?
CommandLine LPSTR ?
hitpoint POINT <>

.code
start:
invoke GetModuleHandle, NULL
mov    hInstance,eax
invoke GetCommandLine
invoke WinMain,hInstance,NULL,CommadLine,SW_SHOWDEFAULT
end Start