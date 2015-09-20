// Explicit run-time linking
// LSPaper draw using OLE2 function if available on client

HINSTANCE hOle2Dll;

hOle2Dll = LoadLibrary ("OLE2.DLL");

if (hOle2Dll != NULL)
{
    FARPROC lpOleDraw;
    lpOleDraw = GetProcAddress ( hOle2Dll, "OleDraw");

    if ( lpOleDraw != (FARPROC)NULL )
    {
        (*lpOleDraw) (pUnknown, dwAspect, hdcDraw, lprcBounds);
    }
    FreeLibrary(hOle2Dll);
}



