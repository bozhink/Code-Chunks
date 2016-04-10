      SUBROUTINE RPLTI
C======================================================================C
C  RELAX3D modified version of TPLTI by C.J Kost.
C  Initializes graph plotting parameters.
C======================================================================C
      COMMON/RCIL/IPENX,IPENY,IPS,IPC,IPCN,FACR,XM,SIZES,SIZEN,SIZEL,
     #  TICK,STEP,XSPAC,IPNAB,ITAPE,IB,IBC,IBYTE,IBASE,IMMET
      COMMON/RNCAXIS/NCBT,NDEC,NDIG

      IPENX=0
      IPENY=0
      IPS=3
      IPC=1
      IPCN=1
      FACR=1.
      XM=0.
      SIZES=8.
      SIZEN=15.
      SIZEL=20.
      TICK=10.
      STEP=1.
      XSPAC=15.
      IPNAB=0
      IBYTE=2
      IBASE=48
      IMMET=100
      NCBT=10
      NDEC=2
      NDIG=7

      RETURN
      END
