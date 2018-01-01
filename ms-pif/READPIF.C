/*
READPIF.C
Copyright 1992,1993 Michael P. Maurice
This is very accurate and moderately tested.
This is originally based on documentation in Ralf Brown's interrupt list.

The bit structures that are passed to printf, etc, are not portable
and give a structure passed by value warning under Borland C.
*/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef unsigned char BYTE;
typedef unsigned short WORD;

#define FAR     _far

#include "pifstruc.h"

void display_NT(BLOCKNT *pPIF);
void display_386(DATA386 * pPIF);
void display_286(DATA286 * pPIF);
void display_comment(char * pPIFCOMMENT);
void usage(void);
void argcheck(int, char **);
void help(void);

/* make sure this is in public space & cleared to ZERO! */
char tbuf[MAX_PIFFILE_SIZE + 10];
char *ifilename;
int lflag; /* list linked records                       */
int cflag; /* list comment records                      */
int nflag; /* NT records                                */
int vflag; /* verbose listing, including the kitchen sink */
int nfile;
int flag2; /* 286 records only                          */
int flag3; /* 386 records only                          */

main(int argc, char **argv)
{
    FILE *ifil;
    BYTE tChkSum;
    unsigned int offset;
    int i;
    PIF *pPIF;
    char *pPIFCOMMENT;
    DATA286 *pPIF286;
    DATA386 *pPIF386;
    BLOCKNT *pPIFNT;
    char *pPIFEX;
    SECTIONHDR *pPrevSect, *pCurSect;
    SECTIONNAME *pName;
    char *pLastByte;

    if (argc < 2) usage();
    ifilename = *++argv;

    argcheck(argc,--argv);

    ifil = fopen(ifilename, "rb");
    if(!ifil) {
        printf("Failed Open: %s\n", ifilename);
        exit(1);
    }

    fputs("\n\nReading PIF: ", stdout);
    fputs(ifilename, stdout);
    fputs("\n", stdout);

    fread(tbuf, MAX_PIFFILE_SIZE ,1, ifil);
    fclose(ifil);

    for (i=2, tChkSum=0; i< PIFEX_OFFSET; i++)
        tChkSum += tbuf[i];
    if(vflag)
        printf("calc.chksum = 0x%x\n\n",(tChkSum & 0x00ff));

    pPIF = (PIF *)&tbuf;

#define PIF_String(a, b)  if(pPIF->a) printf("%s\n",b)

    if(tChkSum != pPIF->checksum)
        fputs("Checksum ERROR!!\n", stdout);

    if(vflag)
    {
        printf("\
resv1        = 0x%x\n\
checksum     = 0x%x\n",
        pPIF->resv1, pPIF->checksum & 0x00ff);

        printf("close_onexit = 0x%x  ,",pPIF->close_onexit);
    }/* vflag     */

    printf("\n\
title        = %.30s\n\
max_mem      = %d dec.\n\
min_mem      = %d dec.\n\
prog_path    = %.63s\n",
    pPIF->title, pPIF->max_mem,
    pPIF->min_mem, pPIF->prog_path);

    if(flag2)
    {
        PIF_String(close_onexit.Graph286, "Graphics 286");
        PIF_String(close_onexit.NoScreenExch, "No Screen Exchange 286");
        PIF_String(close_onexit.PreventSwitch, "Prevent Switch 286");
        PIF_String(close_onexit.Close_OnExit, "Close On exit");
        PIF_String(close_onexit.Com1, "Com 1 - 286");
        PIF_String(close_onexit.Com2, "Com 2 - 286");
    }/* flag2     */

    printf("def_drv = %s\n", pPIF->def_drv);
    printf("def_dir = %s\n", pPIF->def_dir);
    if(flag2)
        printf("286 opt. param = %.64s\n", pPIF->prog_param); /*vflag*/

    printf("\
initial_screenMode    = 0x%x\n\
text_pages            = 0x%x\n\
first_interrupt       = 0x%x\n\
last_interrupt        = 0x%x\n\
rows                  = %u dec.\n\
cols                  = %u dec.\n",
    pPIF->initial_screenMode & 0x00ff,pPIF->text_pages& 0x00ff,
    pPIF->first_interrupt& 0x00ff,pPIF->last_interrupt& 0x00ff,
    pPIF->rows & 0x00ff, pPIF->cols& 0x00ff);

    if(vflag) {
        printf("\
window_pos_row        = 0x%x\n\
window_pos_col        = 0x%x\n\
sys_memory            = 0x%x\n\
shared_prog_name      = %s\n\
shared_prog_data_file = %s\n\
flags1                = 0x%x\n\
flags2                = 0x%x\n",

        pPIF->window_pos_row& 0x00ff, pPIF->window_pos_col& 0x00ff,
        pPIF->sys_memory, pPIF->shared_prog_name,
        pPIF->shared_prog_data_file,
        pPIF->flags1& 0x00ff, pPIF->flags2& 0x00ff);
    }/* vflag     */

    pPIFEX = &tbuf[PIFEX_OFFSET];
    if(strcmp(pPIFEX, "MICROSOFT PIFEX"))
    {
        fputs("NOT a MICROSOFT PIF FILE\n", stdout);
        return 1;
    }

    fputs(" ********** pifex = ",stdout);
    fputs(pPIFEX, stdout);
    fputs("  *********************\n", stdout);

    pPrevSect = (SECTIONHDR *)&tbuf[PIFEX_OFFSET+sizeof(SECTIONNAME)];
    pName = (SECTIONNAME *)&tbuf[pPrevSect->next_section];
    pLastByte = &tbuf[MAX_PIFFILE_SIZE];

    for (i=0;i<40;i++)  {
        if(lflag) {
            printf("\n\
next_offset = 0x%x, \
current_section = 0x%x, \
size_section = 0x%x\n",
            pPrevSect->next_section, pPrevSect->current_section,
            pPrevSect->size_section);
        }/* sflag */

        if(pPrevSect->next_section == 0xFFFF)
            break;
        fputs("============================================\n",stdout);

        offset = pPrevSect->next_section+sizeof(SECTIONNAME);
        pCurSect =(SECTIONHDR *) &tbuf[offset];

        fputs("----------------- Record Type: ",stdout);
        if(pName->name_string[0] != 0)
            fputc(pName->name_string[0], stdout);
        else fputc('\x20', stdout);

        /* if the first char position is zero, the section is not in use */
        /* however, since this is a dump program, we will dump the section */

        fputs(pName->name_string+1, stdout);
        fputs(" ----\n", stdout);

        if(!strcmp(pName->name_string+1, "INDOWS 386 3.0"))
        {
            if(flag3)
            {
                pPIF386 = (DATA386 *)&tbuf[pCurSect->current_section];

                display_386(pPIF386);
                if(pPIF386->zero1 != 0) fputs("\7 386.zero1 != 0 \n", stdout);

                if((pPIF386->zero2[0] == 0) ||
                    (pPIF386->zero2[1] == 0) || (pPIF386->zero2[2] == 0) ||
                    (pPIF386->zero2[3] == 0) ||(pPIF386->zero2[4] == 0)) ;
                else
                    fputs("\7 386.zero2 != 0 \n", stdout);

                if((pPIF386->hot_key_flag == 0) ||
                    (pPIF386->hot_key_flag == 0xF)) ;
                else
                    fputs("\7 386.hot_key_flag has strange value\n", stdout);
            }/* flag3 */
        }
        if(!strcmp(pName->name_string+1, "INDOWS 286 3.0"))
            if(flag2)
            {
                pPIF286 = (DATA286 *)&tbuf[pCurSect->current_section];
                display_286(pPIF286);
            }/* vflag2 */

        if(!strcmp(pName->name_string+1, "INDOWS NT  3.1"))
            if(nflag)
            {
                pPIFNT = (BLOCKNT *)&tbuf[pCurSect->current_section];
                display_NT(pPIFNT);
            }/* nflag */

        /* here we document a technique for supporting comments in PIFs */
        if(!strcmp(pName->name_string, "COMMENT"))
            if(cflag)
            {
                pPIFCOMMENT =
                    (char *)&tbuf[pCurSect->current_section+sizeof(COMMENTS)];
                display_comment(pPIFCOMMENT);
            }/* cflag */

        pPrevSect = (SECTIONHDR *)&tbuf[pPrevSect->next_section +
            sizeof(SECTIONNAME)];
        pName = (SECTIONNAME *)&tbuf[pPrevSect->next_section];
        if((char *)pPrevSect > pLastByte) break;

    }/* for */

    if(pPrevSect->next_section == 0xFFFF)
        fputs("\n\n----Success: Last Record Found---- \n\n", stdout);
    else
        fputs("\n\n----ERROR: Last Record NOT Found---- \n\n", stdout);

    /* the offset defintions labeled unknown should have some kind of
       code to check for any deviation from the usual contents */

    return 0;
}

void usage(void)
{
    fputs("readpif infile \n", stdout);
    fputs("readpif -?, for help\n", stdout);
    exit(1);
}

void display_NT(BLOCKNT *pPIF)
{
    char *ptr = (char *) pPIF;
    ptr += 12; /* padding ?? */
    fputs(ptr, stdout);
    fputs("\n", stdout);
    ptr += 64; /* start of next string */
    fputs(ptr, stdout);
    fputs("\n", stdout);
}

void display_386(DATA386 * pPIF)
{
    printf("\
mem_req   = %d dec.\n\
mem_limit = %d dec.\n\
for_pri   = %u\n\
back_pri  = %u\n\
ems_min   = %u\n\
ems_max   = %u\n\
xms_min   = %u\n\
xms_max   = %u\n",
    pPIF->mem_req, pPIF->mem_limit, pPIF->for_pri,
    pPIF->back_pri, pPIF->ems_min, pPIF->ems_max,
    pPIF->xms_min, pPIF->xms_max);

    if(vflag)
        printf("flags_386 = 0x%x  ,", pPIF->flags_386);

    PIF_String(flags_386.AllowCloseAct, "Allow Close while Active");
    PIF_String(flags_386.ExclusiveON,"Exclusive ON");
    PIF_String(flags_386.BackgroundON,"Background ON");
    PIF_String(flags_386.FullScreenYes,"Full Screen YES");
    PIF_String(flags_386.RSV_ALTESC,"RSV_ALT ESC");
    PIF_String(flags_386.RSV_ALTTAB,"RSV_ALT TAB");
    PIF_String(flags_386.RSV_ALTSPACE,"RSV_ALT SPACE");
    PIF_String(flags_386.RSV_ALTENTER,"Reserve ALT-ENTER");
    PIF_String(flags_386.RSV_ALTPRTSCR,"Reserve ALT-PRT-SCR");
    PIF_String(flags_386.RSV_PRTSCR,"Reserve PRT-SCR");
    PIF_String(flags_386.RSV_CTRLESC,"Reserve CTRL-ESC");
    PIF_String(flags_386.Detect_Idle, "Detect Idle");
    PIF_String(flags_386.EMS_Locked,"EMS Locked");

    if(pPIF->flags_386.UseHMA) ;
    else fputs("Use HMA\n", stdout);

    if(vflag)
        printf("flagsXMS = 0x%x  ", pPIF->flags_XMS);
    PIF_String(flags_XMS.XMS_Locked,"XMS_Locked");
    PIF_String(flags_XMS.Allow_FastPst,"Allow_FastPst");
    PIF_String(flags_XMS.Lock_App,"Lock_App");
    fputs("\n",stdout);

    if(vflag)
        printf("video     = 0x%x, ", pPIF->video);

    if(pPIF->video.MonitorText) ;
    else fputs("Monitor Text\n", stdout);
    if(pPIF->video.MonitorMGr) ;
    else fputs("Monitor Med Gr\n", stdout);
    if(pPIF->video.MonitorHiGr) ;
    else fputs("Monitor Hi Gr\n", stdout);

    PIF_String(video.InitModeText,"Init Vid. Mode Text");
    PIF_String(video.InitModeHiGr,"Init Vid. Mode Gr");
    PIF_String(video.InitModeHiGr,"Init Vid. Mode Hi Gr");
    PIF_String(video.VidEmulateTxt,"EmulateTxt");
    PIF_String(video.VidRetainVid,"VidRetainVid");

    /* this test for a hot key defined may not be correct     */
    /* it may be that the test should be on hot_key_flag     */
    if(vflag)
        printf("hot key flag = 0x%x \n", pPIF->hot_key_flag);

    if(pPIF->hot_key_scan == 0)
        fputs("No Hot Key Defined\n",stdout);
    else {
        if(vflag)
            printf("hot_key_state = 0x%x\n", pPIF->hot_key_state);

        PIF_String(hot_key_state.HOT_KEYALT,"HOT-KEY ALT");
        PIF_String(hot_key_state.HOT_KEYCTRL,"HOT-KEY CTRL");
        PIF_String(hot_key_state.HOT_KEYSHIFT,"HOT-KEY SHIFT");

        printf(" - scan code = 0x%x hex\n", pPIF->hot_key_scan);
    }

    if(vflag)
    {
        printf(" zero1 = %x\n", pPIF->zero1);
        printf(" zero2 = %x %x %x %x %x\n", pPIF->zero2[0],
            (pPIF->zero2[1]), (pPIF->zero2[2]),
            (pPIF->zero2[3]), (pPIF->zero2[4]));
    }/* vflag */

    printf("386 optional parameters = %.64s\n",pPIF->opt_params );
}

void display_comment(char *p)
{
    fputs(p, stdout);
    fputs("\n", stdout);
}

void display_286(DATA286 * pPIF)
{
    if(vflag)
        printf("flags_286 = 0x%x  - ", pPIF->flags_286);

    PIF_String(flags_286.AltTab286,"286 ALT TAB");
    PIF_String(flags_286.AltEsc286,"286 ALT ESC");
    PIF_String(flags_286.AltPrtScr286,"286 ALT PRT SCR");
    PIF_String(flags_286.PrtScr, "286 PRT SCR");
    PIF_String(flags_286.CtrlEsc286,"286 CTRL ESC");
    PIF_String(flags_286.SaveScreen,"Save Screen");

    printf("286 xms limits=%d req=%d\n",pPIF->xmsLimit286, pPIF->xmsReq286);
    printf("com_ports = 0x%x  - \n", pPIF->com_ports);

    PIF_String(com_ports.Com3,"COM 3");
    PIF_String(com_ports.Com4,"COM 4");
    fputs("\n", stdout);
}

void help(void)
{
    fputs("readpif -v  -l -n -2 -3 -c filename(.pif)\n", stdout);
    fputs("where -v = verbose\n", stdout);
    fputs("where -l = list linked records\n", stdout);
    fputs("where -n = print comment records\n", stdout);
    fputs("where -2 = print 286 records\n", stdout);
    fputs("where -3 = print 386 records\n", stdout);
    fputs("where -c = print comment records\n", stdout);
    exit(1);
}

#include <ctype.h>
void argcheck(int argc, char **argv)
{
    register char *p;
    register int c, i;
    int gotpattern;

    if (argc <= 1)
        fputs("No arguments\n", stdout);
    if (argc == 2 && argv[1][0] == '?' && argv[1][1] == 0) {
        help();
        return;
    }
    nfile = argc-1;
    gotpattern = 0;
    for (i=1; i < argc; ++i) {
        p = argv[i];
        if (*p == '-') {
            ++p;
            while (c = *p++) {
                switch(tolower(c)) {

                case '?': help();   break;
                case 'l': ++lflag;  break;
                case '2': ++flag2;  break;
                case '3': ++flag3;  break;
                case 'c': ++cflag;  break;
                case 'n': ++nflag;  break;

                case 'v': ++vflag;  ++lflag;    ++flag2;
                          ++flag3;  ++cflag;    ++nflag;  break;

                default:
                    fputs("Unknown flag\n", stdout);
                }
            }
            argv[i] = 0;
            --nfile;
        }
        else if (!gotpattern) {
            ifilename = p;
            argv[i] = 0;
            ++gotpattern;
            --nfile;
        }
    }
}
