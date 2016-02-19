      PROGRAM RELAX3D
C======================================================================C
C                                                                      C
C                              RELAX3D                                 C
C                                                                      C
C  An interactive program for solving 2- and 3-dimensional             C
C  Poisson and Laplace equations.                                      C
C                                                                      C
C                    Version 3.1e  Sept/99                             C
C                                                                      C
C        Copyright (C) 1999  C.J. Kost and F.W. Jones, TRIUMF          C
C                      All rights reserved                             C
C                                                                      C
C======================================================================C

      COMMON/SOLN/LL,MAXX,MAXY,MAXZ
      COMMON/BLOCK1/HX,HY,HZ,WX,WY,WZ,COMFI,WYROT,WXAX,WYAX,COMFAX
      COMMON/BLOCK2/TOLER,IADRESS,MULT,OFF,OFF0,IOPT,BMAX
      COMMON/DEVICE/TERMTYPE,HARDTYPE
      CHARACTER*15 TERMTYPE,HARDTYPE

      PARAMETER (IJKDIM=10000000)
      REAL*4 V(IJKDIM)

C Initialize graph characteristics
      CALL RPLTI

      CALL DEV(TERMTYPE,HARDTYPE)

      WRITE(6,*)
      WRITE(6,*)'RELAX3D v3.1e     ',
     # 'Copyright (C) 1999.  All rights reserved.'
      WRITE(6,*)
      WRITE(6,*)
      WRITE(6,*)'  Terminal type: ',TERMTYPE
      WRITE(6,*)'  Hardcopy type: ',HARDTYPE
      WRITE(6,*)

10    WRITE(6,40)
40    FORMAT(' Enter grid size (Imax Jmax & Kmax): ',$)
      READ(5,*,ERR=10)IMAX,JMAX,KMAX
      MAXX=IMAX
      MAXY=JMAX
      MAXZ=KMAX
C
C Check validity of imax jmax kmax (reread if bad)
C
      IF(IMAX.LE.2.OR.JMAX.LE.2.OR.(KMAX.LE.2.AND.KMAX.NE.1))THEN
        WRITE(6,*)'Invalid IMAX,JMAX,KMAX'
        WRITE(6,*)'Requirements are:'
        WRITE(6,*)'  IMAX,JMAX > 2'
        WRITE(6,*)'  KMAX = 1 or KMAX > 2'
        GO TO 10
      ENDIF

      WRITE(6,*)
      WRITE(6,*)'Number of grid points is',IMAX*JMAX*KMAX

      WRITE(6,1000)
1000  FORMAT(/' Problem types selected by OPTION command are:'/
     #'   OPT 1: LAPLACE '/
     #'   OPT 2: LAPLACE with CYLINDRICAL SYMMETRY'/
     #'   OPT 3: POISSON'/
     #'   OPT 4: LAPLACE in DIELECTRICS'/
     #'   OPT 5: POISSON with CYLINDRICAL SYMMETRY'/
     #'   OPT 6: LAPLACE in DIELECTRICS with CYLINDRICAL SYMMETRY'/
     #'   OPT 7: LAPLACE in POLAR or CYLINDRICAL coordinates'/
     #'   OPT 8: POISSON in POLAR or CYLINDRICAL coordinates'/
     #'   OPT 0: Shows the current option.')

C Default interleaving factor and option:
      MULT=1
      IOPT=-1

      CALL RELAX(V,IMAX,JMAX,KMAX,IJKDIM)
      GO TO 10

      END !RELAX3D
