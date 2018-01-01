/* PIFEXEC.C -- Dr. Dobb's Journal "Undocumented Corner"
Andrew Schulman, April 1993 -- bcc -WS -DTESTING pifexec.c */

#include <stdlib.h>
#include <string.h>
#include "windows.h"
#include "pifstruc.h"

/* is this a valid Windows PIF file? */
BOOL IsPif(PIF far *fppif)
{
    BYTE far *fp = (BYTE far *) fppif;
    return (lstrcmp(&fp[PIFEX_OFFSET], "MICROSOFT PIFEX") == 0);
}
/* read PIF file into memory */
BOOL ReadPif(char far *name, PIF far *fppif)
{
    HFILE f;
    UINT cb;
    if ((f = _lopen(name, READ)) == HFILE_ERROR)
        return FALSE;
    if ((cb = _lread(f, fppif, MAX_PIFFILE_SIZE)) == HFILE_ERROR)
        return FALSE;
    if (cb < PIFEX_OFFSET)
        return FALSE;
    _lclose(f);
    return IsPif(fppif);
}
/* write PIF structure to file on disk */
BOOL WritePif(char far *name, PIF far *fppif)
{
    HFILE f;
    UINT cb;
    if ((f = _lcreat(name, 0)) == HFILE_ERROR)
        return FALSE;
    if ((cb = _lwrite(f, fppif, MAX_PIFFILE_SIZE)) == HFILE_ERROR)
        return FALSE;
    if (cb < MAX_PIFFILE_SIZE)
        return FALSE;
    _lclose(f);
    return TRUE;
}
/* return pointer to the Windows 386 section */
DATA386 far *GetPif386(PIF far *fppif)
{
    BYTE far *fp = ((BYTE far *) fppif) + PIFEX_OFFSET;
    SECTIONHDR far *fpsection =
        (SECTIONHDR far *) (fp + sizeof(SECTIONNAME));
    if (! IsPif(fppif))
        return (DATA386 far *) 0;
    for (;;)
    {
        if (lstrcmp(fp+1, "INDOWS 386 3.0") == 0)
            return (DATA386 far *) ((BYTE far *) fppif +
                fpsection->current_section);
        if (fpsection->next_section == 0xFFFF)
            break;
        fp = (BYTE far *) fppif + fpsection->next_section;
        fpsection = (SECTIONHDR far *) (fp + sizeof(SECTIONNAME));
    }
    /* still here */
    return (DATA386 far *) 0;
}
int _dos_delete_file(char far *filename)
{
    _asm push ds
    _asm lds dx, dword ptr filename
    _asm mov ah, 41h
    _asm int 21h
    _asm pop ds
    _asm jc error
    return 0;   // success
error:;
    // return error in AX
}
/* WinExec a DOS app, specifying a few PIF settings. This is intended only as
  an example; other PIF settings can similarly be manipulated programmatically.
  For example, the program's command line
   (ppif->prog_param), default directory (ppif->def_dir), and
   idle-detect flag (data386->flags386.Detect_Idle). */
UINT PifExec(char far *name, char far *title, BOOL background, BOOL windowed)
{
    static char *tmp_pif = "__tmp.pif";
    PIF *ppif;
    UINT retval = 0;
    DATA386 far *data386;
    char *pathname;

    if (! (pathname = (char *) malloc(256)))
        return FALSE;
    if (! (ppif = (PIF *) malloc(MAX_PIFFILE_SIZE)))
    {
        free(pathname);
        return FALSE;
    }
    /* read in the standard _DEFAULT.PIF file */
    GetWindowsDirectory(pathname, 256);
    strcat(pathname, "\\_default.pif");
    if (! ReadPif(pathname, ppif))
        goto done;
    /* modify some fields in the PIF structure */
    if ((lstrlen(name) > 63) || (lstrlen(title) > 30))
        goto done;
    lstrcpy(ppif->prog_path, name);
    lstrcpy(ppif->title, title);
    if (! (data386 = GetPif386(ppif)))
        goto done;
    data386->flags_386.BackgroundON = background;
    data386->flags_386.FullScreenYes = (! windowed);
    /* write out a new __TMP.PIF file, WinExec it, and delete it */
    if (WritePif(tmp_pif, ppif))
    {
        retval = WinExec(tmp_pif, SW_NORMAL);
        _dos_delete_file(tmp_pif);
    }
done:
    free(pathname);
    free(ppif);
    return retval;
}
#ifdef TESTING
/* Standalone test:  run with a DOS program name on the command
   line.  For example:  PIFEXEC \DOS\COMMAND.COM */
int PASCAL WinMain(HANDLE hInstance, HANDLE hPrevInstance,
    LPSTR lpszCmdLine, int nCmdShow)
{
    if (lpszCmdLine && *lpszCmdLine)
        PifExec(lpszCmdLine, "A Test of PifExec", 1, 1);
    else
        MessageBox(0, "usage: pifexec [program name]", "PIFEXEC", MB_OK);
    return 0;
}
#endif
