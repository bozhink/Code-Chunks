/* PIFSTRUC.H -- Structure of Windows PIF files --
Dr. Dobb's Journal "Undocumented Corner" -- Mike Maurice, July 1993 */

#define MAX_PIFFILE_SIZE        0x3FF
#define PIFEX_OFFSET            0x171

typedef struct {
    char name_string[16];
} SECTIONNAME, *npSECTIONNAME, FAR *fpSECTIONNAME;
typedef struct {
    WORD next_section; /* offset of section after this      */
    /* last section if contents = FFFF   */
    /* contents = 205, NT = 1A3          */
    WORD current_section; /* offset of data */
    /* contents = 19d                    */
    WORD size_section; /* sizeof section */
    /* contents = 68, NT = 06            */
} SECTIONHDR, *npSECTIONHDR, FAR *fpSECTIONHDR;
typedef struct {
    int Unused0 :1;
    int Graph286 :1;
    int PreventSwitch :1;
    int NoScreenExch :1;
    int Close_OnExit :1; /* only bit used in 386 mode */    // 0x10
    int Unused001 :1;
    int Com2 :1;
    int Com1 :1;
} CLOSEONEXIT;
typedef struct {
    int AllowCloseAct :1;       // 0x01
    int BackgroundON :1;        // 0x02
    int ExclusiveON :1;         // 0x04
    int FullScreenYes :1;       // 0x08
    int Unused1 :1;
    int RSV_ALTTAB :1;          // 0x20
    int RSV_ALTESC :1;          // 0x40
    int RSV_ALTSPACE :1;        // 0x80
    int RSV_ALTENTER :1;        // 0x01 << 8
    int RSV_ALTPRTSCR :1;       // 0x02 << 8
    int RSV_PRTSCR :1;          // 0x04 << 8
    int RSV_CTRLESC :1;         // 0x08 << 8
    int Detect_Idle :1;         // 0x10 << 8
    int UseHMA :1;              // 0x20 << 8
    int Unused2 :1;
    int EMS_Locked :1;          // 0x80 << 8
} FLAGS386;
typedef struct {
    int XMS_Locked :1;          // 0x01
    int Allow_FastPst :1;       // 0x02
    int Lock_App :1;            // 0x04
    int Unused3 :5+8;
} FLAGSXMS;
typedef struct {
    int VidEmulateTxt :1;       // 0x01
    int MonitorText :1;         // 0x02
    int MonitorMGr :1;          // 0x04
    int MonitorHiGr :1;         // 0x08
    int InitModeText :1;        // 0x10
    int InitModeMGr :1;         // 0x20
    int InitModeHiGr :1;        // 0x40
    int VidRetainVid :1;        // 0x80
    int VideoUnused :8;
} VIDEO;
typedef struct {
    int HOT_KEYSHIFT :1;    // 0x01
    int Unused4 :1;
    int HOT_KEYCTRL :1;     // 0x04
    int HOT_KEYALT :1;      // 0x08
    int Unused5 :4+8;
} HOTKEY;
typedef struct {
    int AltTab286 :1;
    int AltEsc286 :1;
    int AltPrtScr286 :1;
    int PrtScr :1;
    int CtrlEsc286 :1;
    int SaveScreen :1;
    int Unused10 :2;
} FLAGS286;
typedef struct {
    int Unused11 :4+2;
    int Com3 :1;
    int Com4 :1;
} COMPORT;
typedef struct {
    /* The offsets are accurate only for Windows -- *NOT* NT! */
    short mem_limit; /* 19d */
    short mem_req; /* 19f */
    WORD for_pri; /* 1a1  */
    WORD back_pri; /* 1a3  */
    short ems_max; /* 1a5  */
    WORD ems_min; /* 1a7  */
    short xms_max; /* 1a9  */
    WORD xms_min; /* 1ab  */
    FLAGS386 flags_386; /* 1ad  */
    FLAGSXMS flags_XMS; /* 1af  */
    VIDEO video; /* 1b1  */
    WORD zero1; /* 1b3  */
    WORD hot_key_scan; /* 1b5 */
    /* any other legal ky on board, a scan code number. */
    HOTKEY hot_key_state; /* 1b7,  alt, ctrl, shift.              */
    WORD hot_key_flag; /* 1b9, 0=no hot key, ? f= hot key defined */
    WORD zero2[5]; /* 1ba  */
    char opt_params[64]; /* 1c5, 386 mode for opt params         */
} DATA386, FAR *fpDATA386;
typedef struct {
    WORD xmsLimit286; /* 237  */
    WORD xmsReq286; /* 239  */
    FLAGS286 flags_286; /* 23b  */
    COMPORT com_ports; /* 23c  */
} DATA286, FAR *fpDATA286;
typedef struct {
    /* from 0 -170 hex, not used by Windows, unless so indicated. */
    /* Note that in some cases the PIF editor fills in a value,     */
    /* even though it does not SEEM to be used        */
    BYTE resv1;
    BYTE checksum; /* used by Windows                     */
    char title[30]; /* 02 used by 286,386 mode for title   */
    short max_mem; /* 20h used byt 286, 386 mem size      */
    short min_mem; /* 22h, these 2 are duplicates see 19c */
    char prog_path[63]; /* 24h used by 286,386 mode for program & path*/
    CLOSEONEXIT close_onexit; /* 63h, 286 and 386 modes     */
    BYTE def_drv; /* 64h  */
    char def_dir[64]; /* 65h used by 286,386 mode for start dir */
    char prog_param[64]; /* a5, used by 286 */
    BYTE initial_screenMode; /* usually zero, sometimes 7F hex         */
    BYTE text_pages; /* always one                             */
    BYTE first_interrupt; /* always zero                            */
    BYTE last_interrupt; /* always FF hex                          */
    BYTE rows; /* always 25                              */
    BYTE cols; /* always 80                              */
    BYTE window_pos_row;
    BYTE window_pos_col;
    WORD sys_memory; /* always 7  */
    char shared_prog_name[64];
    char shared_prog_data_file[64];
    BYTE flags1; /* 16f, usually zero  */
    BYTE flags2; /* 170, usually zero  */
    /* Microsoft PIF editor reads up to 3FF hex bytes in. When writing back */
    /* out it writes same number of byte read. This means a PIF file can    */
    /* be up to 3FF hex bytes with the assumption that any 3rd party        */
    /* utilities take this into account. NOTE 400 hex WILL NOT WORK !!      */
    /* Tested under Win 3.1 and NT (Oct 92 beta).                           */
} PIF, FAR *fpPIF; /* PIF structure    */
#ifdef DOCUMENTATION
/* ---   171h  Begin of Microsoft Windows Stuff */
SECTIONNAME pifex; /* 171,hard coded " MICROSOFT PIFEX"   */
SECTIONHDR section_zero; /* 181   */
SECTIONNAME first_name; /* 187, hard coded "WINDOWS 386 3.0", 286 if NT  */
SECTIONHDR section_one; /* 197, points to str_286A, or section_nameNT   */
#ifdef NT
DATA286 data_286; /* 19D   */
SECTIONNAME section_nameNT; /* 1A3, hard coded "WINDOWS 386 3.0"  */
SECTIONHDR section_hdrNT; /* 1B3   */
DATA386 data_386; /* 1B9   */
/* paded with zeros, from 220-22f hex.   */
#else
DATA386 data_386; /* 19D   */
/* ---205 hex, end of 386 material   */
/* start of 286 specific stuff       */
SECTIONNAME str286A; /* 205, hard coded " INDOWS 286 3.0" */
SECTIONHDR section_286A; /* 215,  */
DATA286 data_286A; /* 21B   */
SECTIONNAME str286B;/* 221, hard coded "WINDOWS 286 3.0"  */
SECTIONHDR section_286B; /* 231   */
DATA286 data_286B; /* 237   */
/* ends at 23c   */
#endif   /* NT */
/* 23d   */
#endif   /* DOCUMENTATION   */
typedef struct {
    SECTIONNAME SName;
    SECTIONHDR Hdr;
    DATA386 D386;
} BLOCK386, *npBLOCK386, FAR *fpBLOCK386;
typedef struct {
    SECTIONNAME SName;
    SECTIONHDR Hdr;
    //DATA386 D386;
} BLOCKNT, *npBLOCKNT, FAR *fpBLOCKNT;
typedef struct {
    SECTIONNAME SName;
    SECTIONHDR Hdr;
    DATA286 D286;
} BLOCK286, *npBLOCK286, FAR *fpBLOCK286;
typedef char FAR *fpBLOCKCMNT;
typedef char *npBLOCKCMNT;
typedef struct {
    SECTIONNAME SName;
    SECTIONHDR SHdr;
} BLOCKVOID, *npBLOCKVOID, FAR *fpBLOCKVOID;
typedef struct {
    char AuxName[8+1+3];
} SECTIONAUX, *npSECTIONAUX, FAR *fpSECTIONAUX;
typedef struct {
    BYTE Hdr1[3];
    BYTE HChkSum;
} SECTIONHDR1, *npSECTIONHDR1, FAR *fpSECTIONHDR1;
typedef struct {
    SECTIONHDR1 CHdr1;
    SECTIONAUX CAux;
} COMMENTS, *npCOMMENTS, FAR *fpCOMMENTS;
