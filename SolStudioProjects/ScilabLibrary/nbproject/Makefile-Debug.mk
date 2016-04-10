#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=GNU-Linux-x86
CND_CONF=Debug
CND_DISTDIR=dist

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=build/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/968817101/wmpadj.o \
	${OBJECTDIR}/_ext/1457928084/zs1s2.o \
	${OBJECTDIR}/_ext/968817101/sciblk.o \
	${OBJECTDIR}/_ext/968817101/qpgen1sci.o \
	${OBJECTDIR}/_ext/944810281/hybrd.o \
	${OBJECTDIR}/_ext/968817101/intdoldsvd.o \
	${OBJECTDIR}/_ext/968817101/cvdm.o \
	${OBJECTDIR}/_ext/968817101/genchi.o \
	${OBJECTDIR}/_ext/968817101/spif1b.o \
	${OBJECTDIR}/_ext/968817101/evtdly.o \
	${OBJECTDIR}/_ext/944810281/fdjac1.o \
	${OBJECTDIR}/_ext/968817101/sum2.o \
	${OBJECTDIR}/_ext/968817101/nlis2.o \
	${OBJECTDIR}/_ext/968817101/dspasp.o \
	${OBJECTDIR}/_ext/1457928084/zunik.o \
	${OBJECTDIR}/_ext/968817101/intogschur.o \
	${OBJECTDIR}/_ext/968817101/logblk.o \
	${OBJECTDIR}/_ext/968817101/icsec2.o \
	${OBJECTDIR}/_ext/968817101/intrpl.o \
	${OBJECTDIR}/_ext/968817101/empty.o \
	${OBJECTDIR}/_ext/1457928084/fdump.o \
	${OBJECTDIR}/_ext/1457928084/stack.o \
	${OBJECTDIR}/_ext/968817101/intreadmps.o \
	${OBJECTDIR}/_ext/1457928084/zmlri.o \
	${OBJECTDIR}/_ext/968817101/ddd2.o \
	${OBJECTDIR}/_ext/968817101/intl_e.o \
	${OBJECTDIR}/_ext/968817101/ouch.o \
	${OBJECTDIR}/_ext/968817101/deli1.o \
	${OBJECTDIR}/_ext/1457928084/dgamlm.o \
	${OBJECTDIR}/_ext/968817101/intzgecon.o \
	${OBJECTDIR}/_ext/968817101/logic.o \
	${OBJECTDIR}/_ext/968817101/allowptr.o \
	${OBJECTDIR}/_ext/968817101/cmdstr.o \
	${OBJECTDIR}/_ext/968817101/lspis.o \
	${OBJECTDIR}/_ext/57306600/spofa.o \
	${OBJECTDIR}/_ext/968817101/dset.o \
	${OBJECTDIR}/_ext/968817101/delip.o \
	${OBJECTDIR}/_ext/968817101/dmmul1.o \
	${OBJECTDIR}/_ext/944810281/fdjac2.o \
	${OBJECTDIR}/_ext/968817101/wipowe.o \
	${OBJECTDIR}/_ext/968817101/optml2.o \
	${OBJECTDIR}/_ext/968817101/waxpy.o \
	${OBJECTDIR}/_ext/968817101/intoschur.o \
	${OBJECTDIR}/_ext/968817101/rpoly.o \
	${OBJECTDIR}/_ext/968817101/btof.o \
	${OBJECTDIR}/_ext/968817101/zbesig.o \
	${OBJECTDIR}/_ext/968817101/dmdspf.o \
	${OBJECTDIR}/_ext/968817101/desi21.o \
	${OBJECTDIR}/_ext/968817101/spind.o \
	${OBJECTDIR}/_ext/968817101/dsqrtc.o \
	${OBJECTDIR}/_ext/968817101/wdotci.o \
	${OBJECTDIR}/_ext/968817101/fretc1.o \
	${OBJECTDIR}/_ext/968817101/poles.o \
	${OBJECTDIR}/_ext/968817101/DGELSY1.o \
	${OBJECTDIR}/_ext/968817101/callinter.o \
	${OBJECTDIR}/_ext/1457928084/d9lgmc.o \
	${OBJECTDIR}/_ext/968817101/dimin.o \
	${OBJECTDIR}/_ext/968817101/funs.o \
	${OBJECTDIR}/_ext/968817101/ftree2.o \
	${OBJECTDIR}/_ext/968817101/wspssp.o \
	${OBJECTDIR}/_ext/968817101/dqags.o \
	${OBJECTDIR}/_ext/968817101/wspdsp.o \
	${OBJECTDIR}/_ext/968817101/rdmps1.o \
	${OBJECTDIR}/_ext/968817101/ctonb.o \
	${OBJECTDIR}/_ext/968817101/i_mput.o \
	${OBJECTDIR}/_ext/968817101/daux.o \
	${OBJECTDIR}/_ext/968817101/d1mach.o \
	${OBJECTDIR}/_ext/944810281/hybrj1.o \
	${OBJECTDIR}/_ext/968817101/orthes.o \
	${OBJECTDIR}/_ext/968817101/vvtosci.o \
	${OBJECTDIR}/_ext/968817101/quad.o \
	${OBJECTDIR}/_ext/968817101/i_l_i.o \
	${OBJECTDIR}/_ext/968817101/rootgp.o \
	${OBJECTDIR}/_ext/968817101/mlist.o \
	${OBJECTDIR}/_ext/968817101/roots2.o \
	${OBJECTDIR}/_ext/968817101/v2unit.o \
	${OBJECTDIR}/_ext/968817101/findequal.o \
	${OBJECTDIR}/_ext/968817101/dmpadj.o \
	${OBJECTDIR}/_ext/968817101/dfft2.o \
	${OBJECTDIR}/_ext/968817101/xsetf.o \
	${OBJECTDIR}/_ext/968817101/dcompa.o \
	${OBJECTDIR}/_ext/968817101/rtitr.o \
	${OBJECTDIR}/_ext/968817101/vpythag.o \
	${OBJECTDIR}/_ext/968817101/dhetr.o \
	${OBJECTDIR}/_ext/968817101/demux.o \
	${OBJECTDIR}/_ext/968817101/uppertype.o \
	${OBJECTDIR}/_ext/968817101/chkvar.o \
	${OBJECTDIR}/_ext/968817101/insertfield.o \
	${OBJECTDIR}/_ext/968817101/getfunction.o \
	${OBJECTDIR}/_ext/968817101/iperm.o \
	${OBJECTDIR}/_ext/968817101/tranpo.o \
	${OBJECTDIR}/_ext/968817101/dexpm1.o \
	${OBJECTDIR}/_ext/968817101/fmt.o \
	${OBJECTDIR}/_ext/968817101/list2vars.o \
	${OBJECTDIR}/_ext/968817101/i_q_i.o \
	${OBJECTDIR}/_ext/968817101/wbdiag.o \
	${OBJECTDIR}/_ext/968817101/dcube.o \
	${OBJECTDIR}/_ext/968817101/split.o \
	${OBJECTDIR}/_ext/1457928084/zkscl.o \
	${OBJECTDIR}/_ext/1457928084/zuchk.o \
	${OBJECTDIR}/_ext/968817101/n1fc1a.o \
	${OBJECTDIR}/_ext/968817101/majz.o \
	${OBJECTDIR}/_ext/968817101/domout.o \
	${OBJECTDIR}/_ext/968817101/intdgesvd2.o \
	${OBJECTDIR}/_ext/968817101/lsodi.o \
	${OBJECTDIR}/_ext/968817101/gensqr.o \
	${OBJECTDIR}/_ext/968817101/n1fc1.o \
	${OBJECTDIR}/_ext/968817101/intddet.o \
	${OBJECTDIR}/_ext/968817101/dij2sp.o \
	${OBJECTDIR}/_ext/968817101/copyvar.o \
	${OBJECTDIR}/_ext/968817101/svcar1.o \
	${OBJECTDIR}/_ext/968817101/cshep2d.o \
	${OBJECTDIR}/_ext/968817101/calmaj.o \
	${OBJECTDIR}/_ext/968817101/nextj.o \
	${OBJECTDIR}/_ext/968817101/proj.o \
	${OBJECTDIR}/_ext/968817101/feq.o \
	${OBJECTDIR}/_ext/968817101/dclmat.o \
	${OBJECTDIR}/_ext/968817101/fmttyp.o \
	${OBJECTDIR}/_ext/968817101/delayv.o \
	${OBJECTDIR}/_ext/968817101/invblk.o \
	${OBJECTDIR}/_ext/968817101/zbeskg.o \
	${OBJECTDIR}/_ext/968817101/intdgecon.o \
	${OBJECTDIR}/_ext/968817101/dsn2.o \
	${OBJECTDIR}/_ext/968817101/pload.o \
	${OBJECTDIR}/_ext/968817101/rcsort.o \
	${OBJECTDIR}/_ext/968817101/namstr.o \
	${OBJECTDIR}/_ext/968817101/wspt.o \
	${OBJECTDIR}/_ext/968817101/relvar.o \
	${OBJECTDIR}/_ext/968817101/infinity.o \
	${OBJECTDIR}/_ext/968817101/fajc1.o \
	${OBJECTDIR}/_ext/968817101/sqrblk.o \
	${OBJECTDIR}/_ext/968817101/funnam.o \
	${OBJECTDIR}/_ext/968817101/lcompa.o \
	${OBJECTDIR}/_ext/968817101/isbrk.o \
	${OBJECTDIR}/_ext/968817101/snorm.o \
	${OBJECTDIR}/_ext/968817101/i_mget.o \
	${OBJECTDIR}/_ext/968817101/i_maxi.o \
	${OBJECTDIR}/_ext/968817101/dspmat.o \
	${OBJECTDIR}/_ext/968817101/dsearch.o \
	${OBJECTDIR}/_ext/968817101/gensin.o \
	${OBJECTDIR}/_ext/968817101/spt.o \
	${OBJECTDIR}/_ext/968817101/mptri.o \
	${OBJECTDIR}/_ext/968817101/folhp.o \
	${OBJECTDIR}/_ext/968817101/bitops.o \
	${OBJECTDIR}/_ext/968817101/scifunc.o \
	${OBJECTDIR}/_ext/968817101/inisci.o \
	${OBJECTDIR}/_ext/968817101/btofm.o \
	${OBJECTDIR}/_ext/1457928084/zunk2.o \
	${OBJECTDIR}/_ext/968817101/minblk.o \
	${OBJECTDIR}/_ext/968817101/order.o \
	${OBJECTDIR}/_ext/968817101/calbx.o \
	${OBJECTDIR}/_ext/968817101/blnumz.o \
	${OBJECTDIR}/_ext/1457928084/zbesj.o \
	${OBJECTDIR}/_ext/968817101/dmpad.o \
	${OBJECTDIR}/_ext/968817101/degl2.o \
	${OBJECTDIR}/_ext/968817101/fprf2.o \
	${OBJECTDIR}/_ext/968817101/defmat.o \
	${OBJECTDIR}/_ext/968817101/lsrgk.o \
	${OBJECTDIR}/_ext/968817101/fmc11b.o \
	${OBJECTDIR}/_ext/1457928084/zseri.o \
	${OBJECTDIR}/_ext/968817101/greatr.o \
	${OBJECTDIR}/_ext/968817101/exch.o \
	${OBJECTDIR}/_ext/1457928084/zshch.o \
	${OBJECTDIR}/_ext/968817101/rkbesl.o \
	${OBJECTDIR}/_ext/1457928084/zunhj.o \
	${OBJECTDIR}/_ext/1457928084/dlngam.o \
	${OBJECTDIR}/_ext/968817101/basnms.o \
	${OBJECTDIR}/_ext/968817101/icse1.o \
	${OBJECTDIR}/_ext/968817101/ccopy.o \
	${OBJECTDIR}/_ext/968817101/lsosp.o \
	${OBJECTDIR}/_ext/968817101/dellk.o \
	${OBJECTDIR}/_ext/968817101/wmmul.o \
	${OBJECTDIR}/_ext/968817101/dspcsp.o \
	${OBJECTDIR}/_ext/1457928084/initds.o \
	${OBJECTDIR}/_ext/968817101/odeint.o \
	${OBJECTDIR}/_ext/968817101/desib.o \
	${OBJECTDIR}/_ext/968817101/rndblk.o \
	${OBJECTDIR}/_ext/968817101/urand.o \
	${OBJECTDIR}/_ext/968817101/storl2.o \
	${OBJECTDIR}/_ext/57306600/dqrdc.o \
	${OBJECTDIR}/_ext/968817101/scaleg.o \
	${OBJECTDIR}/_ext/968817101/stacki2d.o \
	${OBJECTDIR}/_ext/968817101/ptover.o \
	${OBJECTDIR}/_ext/968817101/ddpowe.o \
	${OBJECTDIR}/_ext/968817101/frdf1.o \
	${OBJECTDIR}/_ext/968817101/iset.o \
	${OBJECTDIR}/_ext/968817101/imptra.o \
	${OBJECTDIR}/_ext/968817101/stack_convert.o \
	${OBJECTDIR}/_ext/1457928084/dbsk0e.o \
	${OBJECTDIR}/_ext/968817101/intzgschur.o \
	${OBJECTDIR}/_ext/968817101/icse2.o \
	${OBJECTDIR}/_ext/968817101/intdgeqpf3.o \
	${OBJECTDIR}/_ext/968817101/cbal.o \
	${OBJECTDIR}/_ext/968817101/rednor.o \
	${OBJECTDIR}/_ext/968817101/cmplxt.o \
	${OBJECTDIR}/_ext/968817101/hammin.o \
	${OBJECTDIR}/_ext/968817101/wspmsp.o \
	${OBJECTDIR}/_ext/968817101/lsstyp.o \
	${OBJECTDIR}/_ext/968817101/getnum.o \
	${OBJECTDIR}/_ext/968817101/dmptra.o \
	${OBJECTDIR}/_ext/968817101/gennf.o \
	${OBJECTDIR}/_ext/968817101/findl.o \
	${OBJECTDIR}/_ext/968817101/dwpow1.o \
	${OBJECTDIR}/_ext/944810281/dpmpar.o \
	${OBJECTDIR}/_ext/968817101/wspms.o \
	${OBJECTDIR}/_ext/968817101/dbesyg.o \
	${OBJECTDIR}/_ext/968817101/v2cunit.o \
	${OBJECTDIR}/_ext/968817101/ftree3.o \
	${OBJECTDIR}/_ext/968817101/i_a_i.o \
	${OBJECTDIR}/_ext/968817101/prepji.o \
	${OBJECTDIR}/_ext/57306600/pade.o \
	${OBJECTDIR}/_ext/968817101/setlnb.o \
	${OBJECTDIR}/_ext/968817101/getlin.o \
	${OBJECTDIR}/_ext/1457928084/zlog.o \
	${OBJECTDIR}/_ext/968817101/n1qn2.o \
	${OBJECTDIR}/_ext/968817101/blkslv.o \
	${OBJECTDIR}/_ext/968817101/watfac.o \
	${OBJECTDIR}/_ext/968817101/n1qn3a.o \
	${OBJECTDIR}/_ext/1457928084/zasyi.o \
	${OBJECTDIR}/_ext/968817101/wmpad.o \
	${OBJECTDIR}/_ext/968817101/dsmsp.o \
	${OBJECTDIR}/_ext/968817101/wspe2.o \
	${OBJECTDIR}/_ext/968817101/dsosp.o \
	${OBJECTDIR}/_ext/968817101/ql0001.o \
	${OBJECTDIR}/_ext/968817101/epsalg.o \
	${OBJECTDIR}/_ext/968817101/somespline.o \
	${OBJECTDIR}/_ext/968817101/scapol.o \
	${OBJECTDIR}/_ext/968817101/spcho1.o \
	${OBJECTDIR}/_ext/968817101/dspms.o \
	${OBJECTDIR}/_ext/968817101/dbesjg.o \
	${OBJECTDIR}/_ext/968817101/sawtth.o \
	${OBJECTDIR}/_ext/968817101/fmlag1.o \
	${OBJECTDIR}/_ext/1457928084/dbsi1e.o \
	${OBJECTDIR}/_ext/968817101/dwpow.o \
	${OBJECTDIR}/_ext/968817101/sfact1.o \
	${OBJECTDIR}/_ext/968817101/dmcopy.o \
	${OBJECTDIR}/_ext/968817101/ddif.o \
	${OBJECTDIR}/_ext/968817101/rkf45.o \
	${OBJECTDIR}/_ext/1457928084/dbesk1.o \
	${OBJECTDIR}/_ext/1457928084/dxlegf.o \
	${OBJECTDIR}/_ext/968817101/stack.o \
	${OBJECTDIR}/_ext/968817101/qitz.o \
	${OBJECTDIR}/_ext/968817101/clause.o \
	${OBJECTDIR}/_ext/968817101/svcma1.o \
	${OBJECTDIR}/_ext/968817101/memused.o \
	${OBJECTDIR}/_ext/1457928084/dbesk0.o \
	${OBJECTDIR}/_ext/968817101/sinblk.o \
	${OBJECTDIR}/_ext/968817101/outl2.o \
	${OBJECTDIR}/_ext/968817101/spsort.o \
	${OBJECTDIR}/_ext/968817101/intzggbal.o \
	${OBJECTDIR}/_ext/968817101/termf.o \
	${OBJECTDIR}/_ext/968817101/i_abs.o \
	${OBJECTDIR}/_ext/968817101/dbasin.o \
	${OBJECTDIR}/_ext/968817101/wmptra.o \
	${OBJECTDIR}/_ext/968817101/modul.o \
	${OBJECTDIR}/_ext/1457928084/d9b1mp.o \
	${OBJECTDIR}/_ext/968817101/writebuf.o \
	${OBJECTDIR}/_ext/968817101/compel.o \
	${OBJECTDIR}/_ext/968817101/dgbsl.o \
	${OBJECTDIR}/_ext/1457928084/dtensbs.o \
	${OBJECTDIR}/_ext/968817101/intdgesv4.o \
	${OBJECTDIR}/_ext/968817101/intzgeqpf3.o \
	${OBJECTDIR}/_ext/968817101/wspmat.o \
	${OBJECTDIR}/_ext/968817101/lstops.o \
	${OBJECTDIR}/_ext/968817101/intzgees1.o \
	${OBJECTDIR}/_ext/968817101/intdpotrf.o \
	${OBJECTDIR}/_ext/968817101/n1gc2a.o \
	${OBJECTDIR}/_ext/968817101/matra.o \
	${OBJECTDIR}/_ext/968817101/newest.o \
	${OBJECTDIR}/_ext/968817101/intdgees0.o \
	${OBJECTDIR}/_ext/968817101/fcomp1.o \
	${OBJECTDIR}/_ext/968817101/ddmpev.o \
	${OBJECTDIR}/_ext/968817101/i_x_i.o \
	${OBJECTDIR}/_ext/968817101/dipow.o \
	${OBJECTDIR}/_ext/968817101/wddiv.o \
	${OBJECTDIR}/_ext/968817101/horner.o \
	${OBJECTDIR}/_ext/968817101/trbipo.o \
	${OBJECTDIR}/_ext/968817101/lspful.o \
	${OBJECTDIR}/_ext/968817101/lst2vars.o \
	${OBJECTDIR}/_ext/968817101/prja.o \
	${OBJECTDIR}/_ext/968817101/wdrdiv.o \
	${OBJECTDIR}/_ext/968817101/intzgges.o \
	${OBJECTDIR}/_ext/968817101/sctree.o \
	${OBJECTDIR}/_ext/968817101/dgee01.o \
	${OBJECTDIR}/_ext/968817101/r4tx.o \
	${OBJECTDIR}/_ext/1457928084/dexint.o \
	${OBJECTDIR}/_ext/944810281/hybrj.o \
	${OBJECTDIR}/_ext/1457928084/dbesi.o \
	${OBJECTDIR}/_ext/968817101/wmsum.o \
	${OBJECTDIR}/_ext/1457928084/dgamrn.o \
	${OBJECTDIR}/_ext/968817101/udptr.o \
	${OBJECTDIR}/_ext/968817101/blkfct.o \
	${OBJECTDIR}/_ext/968817101/zqnbd.o \
	${OBJECTDIR}/_ext/968817101/ftree4.o \
	${OBJECTDIR}/_ext/968817101/wesidu.o \
	${OBJECTDIR}/_ext/968817101/lspmat.o \
	${OBJECTDIR}/_ext/968817101/wperm.o \
	${OBJECTDIR}/_ext/968817101/hpdel.o \
	${OBJECTDIR}/_ext/968817101/hilber.o \
	${OBJECTDIR}/_ext/1457928084/zbesi.o \
	${OBJECTDIR}/_ext/968817101/drdiv.o \
	${OBJECTDIR}/_ext/968817101/dmpdsp.o \
	${OBJECTDIR}/_ext/968817101/stoda.o \
	${OBJECTDIR}/_ext/968817101/degree.o \
	${OBJECTDIR}/_ext/968817101/maxblk.o \
	${OBJECTDIR}/_ext/1457928084/d9knus.o \
	${OBJECTDIR}/_ext/1457928084/zbunk.o \
	${OBJECTDIR}/_ext/968817101/wwrdiv.o \
	${OBJECTDIR}/_ext/968817101/phrtsd.o \
	${OBJECTDIR}/_ext/968817101/i_f_i.o \
	${OBJECTDIR}/_ext/968817101/delay.o \
	${OBJECTDIR}/_ext/968817101/intdgebal.o \
	${OBJECTDIR}/_ext/57306600/hhdml.o \
	${OBJECTDIR}/_ext/968817101/entier.o \
	${OBJECTDIR}/_ext/968817101/calcsc.o \
	${OBJECTDIR}/_ext/968817101/rcopy.o \
	${OBJECTDIR}/_ext/968817101/wrscal.o \
	${OBJECTDIR}/_ext/968817101/intzgees0.o \
	${OBJECTDIR}/_ext/968817101/hessl2.o \
	${OBJECTDIR}/_ext/57306600/dgeco.o \
	${OBJECTDIR}/_ext/968817101/varfunptr.o \
	${OBJECTDIR}/_ext/968817101/ribesl.o \
	${OBJECTDIR}/_ext/968817101/symfct.o \
	${OBJECTDIR}/_ext/968817101/dsslti.o \
	${OBJECTDIR}/_ext/1457928084/zbesk.o \
	${OBJECTDIR}/_ext/968817101/kaiser.o \
	${OBJECTDIR}/_ext/968817101/powblk.o \
	${OBJECTDIR}/_ext/968817101/spisp.o \
	${OBJECTDIR}/_ext/968817101/tcsltj.o \
	${OBJECTDIR}/_ext/968817101/fmulb1.o \
	${OBJECTDIR}/_ext/968817101/intdgeqpf4.o \
	${OBJECTDIR}/_ext/968817101/wdpow1.o \
	${OBJECTDIR}/_ext/968817101/blktit.o \
	${OBJECTDIR}/_ext/57306600/wgesl.o \
	${OBJECTDIR}/_ext/968817101/wshrsl.o \
	${OBJECTDIR}/_ext/968817101/psi.o \
	${OBJECTDIR}/_ext/968817101/rybesl.o \
	${OBJECTDIR}/_ext/968817101/nextk.o \
	${OBJECTDIR}/_ext/968817101/dspxs.o \
	${OBJECTDIR}/_ext/1457928084/dgamln.o \
	${OBJECTDIR}/_ext/968817101/corth.o \
	${OBJECTDIR}/_ext/1457928084/dyairy.o \
	${OBJECTDIR}/_ext/968817101/coef.o \
	${OBJECTDIR}/_ext/968817101/dwmpmu.o \
	${OBJECTDIR}/_ext/1457928084/dbsynu.o \
	${OBJECTDIR}/_ext/968817101/lusat.o \
	${OBJECTDIR}/_ext/968817101/bcomp.o \
	${OBJECTDIR}/_ext/968817101/cusum.o \
	${OBJECTDIR}/_ext/968817101/wspcle.o \
	${OBJECTDIR}/_ext/968817101/gcp.o \
	${OBJECTDIR}/_ext/968817101/isort.o \
	${OBJECTDIR}/_ext/968817101/scitovv.o \
	${OBJECTDIR}/_ext/968817101/zcross.o \
	${OBJECTDIR}/_ext/968817101/i_cumprod.o \
	${OBJECTDIR}/_ext/968817101/chebc.o \
	${OBJECTDIR}/_ext/968817101/dfrmg.o \
	${OBJECTDIR}/_ext/968817101/rattyp.o \
	${OBJECTDIR}/_ext/968817101/ddrdiv.o \
	${OBJECTDIR}/_ext/968817101/qnbd.o \
	${OBJECTDIR}/_ext/968817101/mrknmd.o \
	${OBJECTDIR}/_ext/968817101/stackr2d.o \
	${OBJECTDIR}/_ext/968817101/lspt.o \
	${OBJECTDIR}/_ext/968817101/n1gc2b.o \
	${OBJECTDIR}/_ext/968817101/fft842.o \
	${OBJECTDIR}/_ext/968817101/giv.o \
	${OBJECTDIR}/_ext/968817101/dperm.o \
	${OBJECTDIR}/_ext/968817101/i_b_i.o \
	${OBJECTDIR}/_ext/968817101/writebufsfact.o \
	${OBJECTDIR}/_ext/968817101/wdiv.o \
	${OBJECTDIR}/_ext/968817101/fsv.o \
	${OBJECTDIR}/_ext/944810281/r1updt.o \
	${OBJECTDIR}/_ext/968817101/i_tril.o \
	${OBJECTDIR}/_ext/968817101/showstack.o \
	${OBJECTDIR}/_ext/968817101/wwpow1.o \
	${OBJECTDIR}/_ext/968817101/wspos.o \
	${OBJECTDIR}/_ext/968817101/dbeskg.o \
	${OBJECTDIR}/_ext/968817101/zbeshg.o \
	${OBJECTDIR}/_ext/968817101/deli2.o \
	${OBJECTDIR}/_ext/968817101/iseye.o \
	${OBJECTDIR}/_ext/1457928084/zsqrt.o \
	${OBJECTDIR}/_ext/968817101/intzgehrd.o \
	${OBJECTDIR}/_ext/968817101/dspos.o \
	${OBJECTDIR}/_ext/944810281/hybrd1.o \
	${OBJECTDIR}/_ext/968817101/dpmul1.o \
	${OBJECTDIR}/_ext/1855634266/balbak.o \
	${OBJECTDIR}/_ext/968817101/dipowe.o \
	${OBJECTDIR}/_ext/968817101/wdotcr.o \
	${OBJECTDIR}/_ext/968817101/cupro.o \
	${OBJECTDIR}/_ext/968817101/arcosh.o \
	${OBJECTDIR}/_ext/968817101/rlbd.o \
	${OBJECTDIR}/_ext/968817101/indxg.o \
	${OBJECTDIR}/_ext/1457928084/dasyjy.o \
	${OBJECTDIR}/_ext/968817101/spcompack.o \
	${OBJECTDIR}/_ext/968817101/phi.o \
	${OBJECTDIR}/_ext/968817101/fnorm.o \
	${OBJECTDIR}/_ext/968817101/whereis.o \
	${OBJECTDIR}/_ext/968817101/dlradp.o \
	${OBJECTDIR}/_ext/968817101/watan.o \
	${OBJECTDIR}/_ext/968817101/cortr.o \
	${OBJECTDIR}/_ext/968817101/bexec.o \
	${OBJECTDIR}/_ext/968817101/syredi.o \
	${OBJECTDIR}/_ext/968817101/deli11.o \
	${OBJECTDIR}/_ext/968817101/intdgetrf.o \
	${OBJECTDIR}/_ext/968817101/quarul.o \
	${OBJECTDIR}/_ext/968817101/eselect.o \
	${OBJECTDIR}/_ext/968817101/intrp2.o \
	${OBJECTDIR}/_ext/968817101/prntid.o \
	${OBJECTDIR}/_ext/968817101/intozgschur.o \
	${OBJECTDIR}/_ext/968817101/amell.o \
	${OBJECTDIR}/_ext/968817101/dfftbi.o \
	${OBJECTDIR}/_ext/968817101/majysa.o \
	${OBJECTDIR}/_ext/968817101/lsposp.o \
	${OBJECTDIR}/_ext/968817101/dmp2pm.o \
	${OBJECTDIR}/_ext/1457928084/xersve.o \
	${OBJECTDIR}/_ext/968817101/wexchn.o \
	${OBJECTDIR}/_ext/968817101/wdmpad.o \
	${OBJECTDIR}/_ext/968817101/transn.o \
	${OBJECTDIR}/_ext/968817101/intdgees1.o \
	${OBJECTDIR}/_ext/968817101/shanph.o \
	${OBJECTDIR}/_ext/968817101/intinttype.o \
	${OBJECTDIR}/_ext/968817101/cerr.o \
	${OBJECTDIR}/_ext/968817101/dspful.o \
	${OBJECTDIR}/_ext/968817101/expblk.o \
	${OBJECTDIR}/_ext/1457928084/balanc.o \
	${OBJECTDIR}/_ext/968817101/spextr1.o \
	${OBJECTDIR}/_ext/968817101/ortran.o \
	${OBJECTDIR}/_ext/968817101/satur.o \
	${OBJECTDIR}/_ext/968817101/dlslv.o \
	${OBJECTDIR}/_ext/968817101/command.o \
	${OBJECTDIR}/_ext/968817101/dspfit.o \
	${OBJECTDIR}/_ext/968817101/icse.o \
	${OBJECTDIR}/_ext/968817101/lcomp.o \
	${OBJECTDIR}/_ext/968817101/wswap.o \
	${OBJECTDIR}/_ext/968817101/wdpow.o \
	${OBJECTDIR}/_ext/968817101/intzfschur.o \
	${OBJECTDIR}/_ext/968817101/i_s_i.o \
	${OBJECTDIR}/_ext/968817101/genprm.o \
	${OBJECTDIR}/_ext/968817101/mzdivq.o \
	${OBJECTDIR}/_ext/968817101/dspln.o \
	${OBJECTDIR}/_ext/968817101/isinstring.o \
	${OBJECTDIR}/_ext/968817101/stodi.o \
	${OBJECTDIR}/_ext/968817101/wij2sp.o \
	${OBJECTDIR}/_ext/968817101/shrslv.o \
	${OBJECTDIR}/_ext/968817101/sum3.o \
	${OBJECTDIR}/_ext/944810281/qrsolv.o \
	${OBJECTDIR}/_ext/968817101/n1gc2.o \
	${OBJECTDIR}/_ext/968817101/blkfc1.o \
	${OBJECTDIR}/_ext/968817101/intzgetri.o \
	${OBJECTDIR}/_ext/968817101/wmpcle.o \
	${OBJECTDIR}/_ext/968817101/ordmmd.o \
	${OBJECTDIR}/_ext/57306600/wgefa.o \
	${OBJECTDIR}/_ext/968817101/ajour.o \
	${OBJECTDIR}/_ext/968817101/i_diag.o \
	${OBJECTDIR}/_ext/968817101/fmuls1.o \
	${OBJECTDIR}/_ext/968817101/getfun.o \
	${OBJECTDIR}/_ext/1457928084/dbkisr.o \
	${OBJECTDIR}/_ext/968817101/wsposp.o \
	${OBJECTDIR}/_ext/968817101/desi11.o \
	${OBJECTDIR}/_ext/968817101/dad.o \
	${OBJECTDIR}/_ext/968817101/constinterp.o \
	${OBJECTDIR}/_ext/968817101/wpmul.o \
	${OBJECTDIR}/_ext/968817101/readf.o \
	${OBJECTDIR}/_ext/968817101/doldqr.o \
	${OBJECTDIR}/_ext/1457928084/zrati.o \
	${OBJECTDIR}/_ext/968817101/dwrdiv.o \
	${OBJECTDIR}/_ext/968817101/lful2sp.o \
	${OBJECTDIR}/_ext/968817101/genunf.o \
	${OBJECTDIR}/_ext/968817101/rchek2.o \
	${OBJECTDIR}/_ext/968817101/cheby.o \
	${OBJECTDIR}/_ext/57306600/dgbfa.o \
	${OBJECTDIR}/_ext/968817101/dmpcle.o \
	${OBJECTDIR}/_ext/968817101/majour.o \
	${OBJECTDIR}/_ext/1457928084/zmlt.o \
	${OBJECTDIR}/_ext/968817101/kronr.o \
	${OBJECTDIR}/_ext/968817101/dpodiv.o \
	${OBJECTDIR}/_ext/968817101/filbut.o \
	${OBJECTDIR}/_ext/968817101/fpq2.o \
	${OBJECTDIR}/_ext/1457928084/dbesi0.o \
	${OBJECTDIR}/_ext/968817101/matzs.o \
	${OBJECTDIR}/_ext/968817101/ino.o \
	${OBJECTDIR}/_ext/968817101/loren.o \
	${OBJECTDIR}/_ext/968817101/gennch.o \
	${OBJECTDIR}/_ext/1457928084/zuoik.o \
	${OBJECTDIR}/_ext/968817101/pythag.o \
	${OBJECTDIR}/_ext/968817101/ignnbn.o \
	${OBJECTDIR}/_ext/968817101/dprxc.o \
	${OBJECTDIR}/_ext/968817101/savlod.o \
	${OBJECTDIR}/_ext/1457928084/zairy.o \
	${OBJECTDIR}/_ext/968817101/wpmul1.o \
	${OBJECTDIR}/_ext/968817101/issymmetric.o \
	${OBJECTDIR}/_ext/968817101/imcopy.o \
	${OBJECTDIR}/_ext/968817101/fact.o \
	${OBJECTDIR}/_ext/968817101/wsosp.o \
	${OBJECTDIR}/_ext/968817101/dqag0.o \
	${OBJECTDIR}/_ext/968817101/lsode.o \
	${OBJECTDIR}/_ext/968817101/genexp.o \
	${OBJECTDIR}/_ext/1457928084/zbesy.o \
	${OBJECTDIR}/_ext/968817101/dvmul.o \
	${OBJECTDIR}/_ext/57306600/dgesl.o \
	${OBJECTDIR}/_ext/968817101/i_r_i.o \
	${OBJECTDIR}/_ext/968817101/idegre.o \
	${OBJECTDIR}/_ext/968817101/calsca.o \
	${OBJECTDIR}/_ext/968817101/wmpcnc.o \
	${OBJECTDIR}/_ext/944810281/r1mpyq.o \
	${OBJECTDIR}/_ext/968817101/wdegre.o \
	${OBJECTDIR}/_ext/968817101/desi24.o \
	${OBJECTDIR}/_ext/968817101/cuproi.o \
	${OBJECTDIR}/_ext/968817101/lspcsp.o \
	${OBJECTDIR}/_ext/968817101/wvmul.o \
	${OBJECTDIR}/_ext/968817101/jacl2.o \
	${OBJECTDIR}/_ext/57306600/dqrsl.o \
	${OBJECTDIR}/_ext/968817101/ta2lpd.o \
	${OBJECTDIR}/_ext/968817101/matz.o \
	${OBJECTDIR}/_ext/968817101/i_cumsum.o \
	${OBJECTDIR}/_ext/968817101/writbufode.o \
	${OBJECTDIR}/_ext/968817101/dspt.o \
	${OBJECTDIR}/_ext/968817101/arl2a.o \
	${OBJECTDIR}/_ext/968817101/wprxc.o \
	${OBJECTDIR}/_ext/968817101/r8tx.o \
	${OBJECTDIR}/_ext/968817101/dlgama.o \
	${OBJECTDIR}/_ext/968817101/sszer.o \
	${OBJECTDIR}/_ext/968817101/intp.o \
	${OBJECTDIR}/_ext/968817101/storeglobal.o \
	${OBJECTDIR}/_ext/968817101/intplt.o \
	${OBJECTDIR}/_ext/944810281/qrfac.o \
	${OBJECTDIR}/_ext/968817101/wmul.o \
	${OBJECTDIR}/_ext/968817101/mycmatptr.o \
	${OBJECTDIR}/_ext/968817101/bldenz.o \
	${OBJECTDIR}/_ext/968817101/basin.o \
	${OBJECTDIR}/_ext/968817101/intdgehrd.o \
	${OBJECTDIR}/_ext/968817101/gengam.o \
	${OBJECTDIR}/_ext/1457928084/dbesks.o \
	${OBJECTDIR}/_ext/968817101/error.o \
	${OBJECTDIR}/_ext/968817101/wmprod.o \
	${OBJECTDIR}/_ext/968817101/rpem.o \
	${OBJECTDIR}/_ext/968817101/lspasp.o \
	${OBJECTDIR}/_ext/1457928084/dbesy0.o \
	${OBJECTDIR}/_ext/968817101/wclmat.o \
	${OBJECTDIR}/_ext/968817101/qzflr.o \
	${OBJECTDIR}/_ext/968817101/wspcsp.o \
	${OBJECTDIR}/_ext/57306600/dpofa.o \
	${OBJECTDIR}/_ext/1457928084/xgetua.o \
	${OBJECTDIR}/_ext/968817101/sp2col.o \
	${OBJECTDIR}/_ext/968817101/cvname.o \
	${OBJECTDIR}/_ext/968817101/front.o \
	${OBJECTDIR}/_ext/968817101/magic.o \
	${OBJECTDIR}/_ext/968817101/lsodar.o \
	${OBJECTDIR}/_ext/968817101/unarybit.o \
	${OBJECTDIR}/_ext/968817101/bfgsd.o \
	${OBJECTDIR}/_ext/968817101/snell.o \
	${OBJECTDIR}/_ext/968817101/bnorm.o \
	${OBJECTDIR}/_ext/968817101/dadd.o \
	${OBJECTDIR}/_ext/968817101/majmin.o \
	${OBJECTDIR}/_ext/57306600/wgeco.o \
	${OBJECTDIR}/_ext/968817101/dspis.o \
	${OBJECTDIR}/_ext/1457928084/dbesj.o \
	${OBJECTDIR}/_ext/968817101/deg1l2.o \
	${OBJECTDIR}/_ext/968817101/solsy.o \
	${OBJECTDIR}/_ext/944810281/qform.o \
	${OBJECTDIR}/_ext/968817101/lookup.o \
	${OBJECTDIR}/_ext/968817101/tscccf.o \
	${OBJECTDIR}/_ext/968817101/lspe2.o \
	${OBJECTDIR}/_ext/968817101/compil.o \
	${OBJECTDIR}/_ext/968817101/ddpow1.o \
	${OBJECTDIR}/_ext/968817101/wscal.o \
	${OBJECTDIR}/_ext/968817101/intzgesvd2.o \
	${OBJECTDIR}/_ext/968817101/wwpowe.o \
	${OBJECTDIR}/_ext/968817101/writef.o \
	${OBJECTDIR}/_ext/1457928084/xermsg.o \
	${OBJECTDIR}/_ext/968817101/scitoi.o \
	${OBJECTDIR}/_ext/1457928084/zunk1.o \
	${OBJECTDIR}/_ext/968817101/wdmpmu.o \
	${OBJECTDIR}/_ext/968817101/svcom1.o \
	${OBJECTDIR}/_ext/968817101/isoval.o \
	${OBJECTDIR}/_ext/968817101/nearfloat.o \
	${OBJECTDIR}/_ext/1457928084/zuni2.o \
	${OBJECTDIR}/_ext/968817101/cfode.o \
	${OBJECTDIR}/_ext/968817101/stackp.o \
	${OBJECTDIR}/_ext/968817101/intdgesv3.o \
	${OBJECTDIR}/_ext/968817101/tcslti.o \
	${OBJECTDIR}/_ext/968817101/ddpow.o \
	${OBJECTDIR}/_ext/968817101/i_matrix.o \
	${OBJECTDIR}/_ext/968817101/intzgelsy.o \
	${OBJECTDIR}/_ext/968817101/i_triu.o \
	${OBJECTDIR}/_ext/968817101/tg02ad.o \
	${OBJECTDIR}/_ext/968817101/clunit.o \
	${OBJECTDIR}/_ext/968817101/colnew.o \
	${OBJECTDIR}/_ext/1457928084/djairy.o \
	${OBJECTDIR}/_ext/968817101/arl2.o \
	${OBJECTDIR}/_ext/968817101/wasum.o \
	${OBJECTDIR}/_ext/968817101/wcompa.o \
	${OBJECTDIR}/_ext/968817101/ricd.o \
	${OBJECTDIR}/_ext/968817101/tild.o \
	${OBJECTDIR}/_ext/968817101/dspcle.o \
	${OBJECTDIR}/_ext/968817101/fmc11z.o \
	${OBJECTDIR}/_ext/968817101/intdgesvd1.o \
	${OBJECTDIR}/_ext/968817101/complexify.o \
	${OBJECTDIR}/_ext/1457928084/dpsixn.o \
	${OBJECTDIR}/_ext/968817101/wsmsp.o \
	${OBJECTDIR}/_ext/968817101/tranze.o \
	${OBJECTDIR}/_ext/968817101/ref2val.o \
	${OBJECTDIR}/_ext/968817101/errmgr.o \
	${OBJECTDIR}/_ext/968817101/hpins.o \
	${OBJECTDIR}/_ext/968817101/dfftmx.o \
	${OBJECTDIR}/_ext/57306600/dqrsm.o \
	${OBJECTDIR}/_ext/968817101/dollar.o \
	${OBJECTDIR}/_ext/1457928084/pchim.o \
	${OBJECTDIR}/_ext/968817101/fremf1.o \
	${OBJECTDIR}/_ext/968817101/csslti.o \
	${OBJECTDIR}/_ext/968817101/israt.o \
	${OBJECTDIR}/_ext/968817101/i_d_i.o \
	${OBJECTDIR}/_ext/968817101/dpmul.o \
	${OBJECTDIR}/_ext/968817101/wasin.o \
	${OBJECTDIR}/_ext/968817101/wwpow.o \
	${OBJECTDIR}/_ext/968817101/kronc.o \
	${OBJECTDIR}/_ext/968817101/dtild.o \
	${OBJECTDIR}/_ext/968817101/rat.o \
	${OBJECTDIR}/_ext/1457928084/zacai.o \
	${OBJECTDIR}/_ext/968817101/n1qn1a.o \
	${OBJECTDIR}/_ext/968817101/atome.o \
	${OBJECTDIR}/_ext/968817101/expan.o \
	${OBJECTDIR}/_ext/968817101/dmsum.o \
	${OBJECTDIR}/_ext/968817101/dsposp.o \
	${OBJECTDIR}/_ext/968817101/lq.o \
	${OBJECTDIR}/_ext/968817101/getorient.o \
	${OBJECTDIR}/_ext/968817101/intl_i.o \
	${OBJECTDIR}/_ext/57306600/icopy.o \
	${OBJECTDIR}/_ext/968817101/wlog.o \
	${OBJECTDIR}/_ext/968817101/bezout.o \
	${OBJECTDIR}/_ext/968817101/lspxsp.o \
	${OBJECTDIR}/_ext/968817101/hltblk.o \
	${OBJECTDIR}/_ext/968817101/formatnumber.o \
	${OBJECTDIR}/_ext/968817101/spord.o \
	${OBJECTDIR}/_ext/968817101/intzdet.o \
	${OBJECTDIR}/_ext/968817101/dsum.o \
	${OBJECTDIR}/_ext/968817101/fout.o \
	${OBJECTDIR}/_ext/968817101/gennor.o \
	${OBJECTDIR}/_ext/968817101/fmc11a.o \
	${OBJECTDIR}/_ext/968817101/desia.o \
	${OBJECTDIR}/_ext/968817101/intzgesv3.o \
	${OBJECTDIR}/_ext/968817101/sigbas.o \
	${OBJECTDIR}/_ext/968817101/qpgen2.o \
	${OBJECTDIR}/_ext/968817101/bdiag.o \
	${OBJECTDIR}/_ext/1457928084/dbesi1.o \
	${OBJECTDIR}/_ext/968817101/nlis0.o \
	${OBJECTDIR}/_ext/968817101/desi00.o \
	${OBJECTDIR}/_ext/968817101/intstr.o \
	${OBJECTDIR}/_ext/968817101/extlarg.o \
	${OBJECTDIR}/_ext/1457928084/dgamma.o \
	${OBJECTDIR}/_ext/1855634266/hqror2.o \
	${OBJECTDIR}/_ext/968817101/intdggbal.o \
	${OBJECTDIR}/_ext/968817101/find.o \
	${OBJECTDIR}/_ext/968817101/fmc11e.o \
	${OBJECTDIR}/_ext/968817101/wsqrt.o \
	${OBJECTDIR}/_ext/968817101/spcho2.o \
	${OBJECTDIR}/_ext/968817101/bounn.o \
	${OBJECTDIR}/_ext/968817101/rkqc.o \
	${OBJECTDIR}/_ext/968817101/intdgelsy.o \
	${OBJECTDIR}/_ext/1457928084/dcsevl.o \
	${OBJECTDIR}/_ext/968817101/wcerr.o \
	${OBJECTDIR}/_ext/968817101/wspful.o \
	${OBJECTDIR}/_ext/968817101/mname.o \
	${OBJECTDIR}/_ext/1457928084/dasyik.o \
	${OBJECTDIR}/_ext/968817101/impcnc.o \
	${OBJECTDIR}/_ext/968817101/selblk.o \
	${OBJECTDIR}/_ext/968817101/romeg.o \
	${OBJECTDIR}/_ext/968817101/wspxs.o \
	${OBJECTDIR}/_ext/968817101/wpodiv.o \
	${OBJECTDIR}/_ext/968817101/isnum.o \
	${OBJECTDIR}/_ext/1457928084/j4save.o \
	${OBJECTDIR}/_ext/968817101/getdimfromvar.o \
	${OBJECTDIR}/_ext/1457928084/dbkias.o \
	${OBJECTDIR}/_ext/968817101/dspxsp.o \
	${OBJECTDIR}/_ext/968817101/rdmpsz.o \
	${OBJECTDIR}/_ext/968817101/qvalz.o \
	${OBJECTDIR}/_ext/968817101/intdy.o \
	${OBJECTDIR}/_ext/968817101/dspmax.o \
	${OBJECTDIR}/_ext/968817101/strang.o \
	${OBJECTDIR}/_ext/968817101/scitod.o \
	${OBJECTDIR}/_ext/944810281/lmder.o \
	${OBJECTDIR}/_ext/1457928084/dbesj0.o \
	${OBJECTDIR}/_ext/968817101/dful2sp.o \
	${OBJECTDIR}/_ext/968817101/mpdiag.o \
	${OBJECTDIR}/_ext/968817101/whatln.o \
	${OBJECTDIR}/_ext/968817101/vmnorm.o \
	${OBJECTDIR}/_ext/968817101/sputil.o \
	${OBJECTDIR}/_ext/968817101/i_e.o \
	${OBJECTDIR}/_ext/968817101/fmani1.o \
	${OBJECTDIR}/_ext/968817101/genmn.o \
	${OBJECTDIR}/_ext/968817101/twodq.o \
	${OBJECTDIR}/_ext/968817101/lsoda.o \
	${OBJECTDIR}/_ext/968817101/iocopy.o \
	${OBJECTDIR}/_ext/968817101/extractfields.o \
	${OBJECTDIR}/_ext/968817101/stackg.o \
	${OBJECTDIR}/_ext/968817101/dmmul.o \
	${OBJECTDIR}/_ext/1457928084/dbesy.o \
	${OBJECTDIR}/_ext/968817101/wsign.o \
	${OBJECTDIR}/_ext/968817101/dmpext.o \
	${OBJECTDIR}/_ext/968817101/skpins.o \
	${OBJECTDIR}/_ext/968817101/intzgebal.o \
	${OBJECTDIR}/_ext/968817101/i_convert.o \
	${OBJECTDIR}/_ext/1457928084/dbsi0e.o \
	${OBJECTDIR}/_ext/968817101/wmpmu.o \
	${OBJECTDIR}/_ext/968817101/intzgetrf.o \
	${OBJECTDIR}/_ext/968817101/icsei.o \
	${OBJECTDIR}/_ext/968817101/qztrn.o \
	${OBJECTDIR}/_ext/968817101/cvwm.o \
	${OBJECTDIR}/_ext/968817101/createref.o \
	${OBJECTDIR}/_ext/1457928084/dbskes.o \
	${OBJECTDIR}/_ext/968817101/getstr.o \
	${OBJECTDIR}/_ext/968817101/zbesyg.o \
	${OBJECTDIR}/_ext/968817101/dtosci.o \
	${OBJECTDIR}/_ext/1457928084/dbsk1e.o \
	${OBJECTDIR}/_ext/968817101/intfschur.o \
	${OBJECTDIR}/_ext/968817101/wacos.o \
	${OBJECTDIR}/_ext/968817101/i_mini.o \
	${OBJECTDIR}/_ext/57306600/util.o \
	${OBJECTDIR}/_ext/968817101/realit.o \
	${OBJECTDIR}/_ext/1457928084/zdiv.o \
	${OBJECTDIR}/_ext/968817101/hmcreate.o \
	${OBJECTDIR}/_ext/968817101/bezstp.o \
	${OBJECTDIR}/_ext/968817101/iwamax.o \
	${OBJECTDIR}/_ext/968817101/rscma1.o \
	${OBJECTDIR}/_ext/968817101/prompt.o \
	${OBJECTDIR}/_ext/968817101/xerrwv.o \
	${OBJECTDIR}/_ext/968817101/wspasp.o \
	${OBJECTDIR}/_ext/1457928084/xerprn.o \
	${OBJECTDIR}/_ext/968817101/i_prod.o \
	${OBJECTDIR}/_ext/968817101/dwdiv.o \
	${OBJECTDIR}/_ext/968817101/fuclid.o \
	${OBJECTDIR}/_ext/968817101/desi12.o \
	${OBJECTDIR}/_ext/57306600/dgefa.o \
	${OBJECTDIR}/_ext/968817101/integr.o \
	${OBJECTDIR}/_ext/968817101/basouttofile.o \
	${OBJECTDIR}/_ext/968817101/setgmn.o \
	${OBJECTDIR}/_ext/968817101/lsdisc.o \
	${OBJECTDIR}/_ext/968817101/qzrnd.o \
	${OBJECTDIR}/_ext/968817101/spreshape.o \
	${OBJECTDIR}/_ext/968817101/i_c_i.o \
	${OBJECTDIR}/_ext/968817101/zoldqr.o \
	${OBJECTDIR}/_ext/968817101/coselm.o \
	${OBJECTDIR}/_ext/968817101/n1qn1.o \
	${OBJECTDIR}/_ext/968817101/wspxsp.o \
	${OBJECTDIR}/_ext/968817101/lij2sp.o \
	${OBJECTDIR}/_ext/968817101/rchek.o \
	${OBJECTDIR}/_ext/968817101/followpath.o \
	${OBJECTDIR}/_ext/968817101/tanblk.o \
	${OBJECTDIR}/_ext/968817101/spifp.o \
	${OBJECTDIR}/_ext/968817101/icscof.o \
	${OBJECTDIR}/_ext/968817101/freque.o \
	${OBJECTDIR}/_ext/1457928084/zbinu.o \
	${OBJECTDIR}/_ext/1457928084/common_f2c.o \
	${OBJECTDIR}/_ext/968817101/rscar1.o \
	${OBJECTDIR}/_ext/968817101/prepj.o \
	${OBJECTDIR}/_ext/1457928084/dbsknu.o \
	${OBJECTDIR}/_ext/968817101/zgcbd.o \
	${OBJECTDIR}/_ext/968817101/gratyp.o \
	${OBJECTDIR}/_ext/1457928084/dbskin.o \
	${OBJECTDIR}/_ext/968817101/dbesig.o \
	${OBJECTDIR}/_ext/968817101/samphold.o \
	${OBJECTDIR}/_ext/968817101/forblk.o \
	${OBJECTDIR}/_ext/1457928084/xercnt.o \
	${OBJECTDIR}/_ext/968817101/spif.o \
	${OBJECTDIR}/_ext/968817101/stackc2i.o \
	${OBJECTDIR}/_ext/968817101/rksimp.o \
	${OBJECTDIR}/_ext/968817101/timblk.o \
	${OBJECTDIR}/_ext/968817101/i1mach.o \
	${OBJECTDIR}/_ext/968817101/dmprod.o \
	${OBJECTDIR}/_ext/968817101/xerbla.o \
	${OBJECTDIR}/_ext/968817101/sci_ffir.o \
	${OBJECTDIR}/_ext/968817101/strdsp.o \
	${OBJECTDIR}/_ext/968817101/nstabl.o \
	${OBJECTDIR}/_ext/968817101/coeft.o \
	${OBJECTDIR}/_ext/968817101/matc.o \
	${OBJECTDIR}/_ext/968817101/dzdivq.o \
	${OBJECTDIR}/_ext/968817101/sdot.o \
	${OBJECTDIR}/_ext/1457928084/dbesk.o \
	${OBJECTDIR}/_ext/968817101/scierr.o \
	${OBJECTDIR}/_ext/968817101/dwpowe.o \
	${OBJECTDIR}/_ext/968817101/icse0.o \
	${OBJECTDIR}/_ext/968817101/i_i_i.o \
	${OBJECTDIR}/_ext/968817101/wful2sp.o \
	${OBJECTDIR}/_ext/968817101/i_m_i.o \
	${OBJECTDIR}/_ext/968817101/vnorm.o \
	${OBJECTDIR}/_ext/968817101/ivimp.o \
	${OBJECTDIR}/_ext/968817101/ifthel.o \
	${OBJECTDIR}/_ext/968817101/dspmin.o \
	${OBJECTDIR}/_ext/968817101/intops.o \
	${OBJECTDIR}/_ext/968817101/sn.o \
	${OBJECTDIR}/_ext/968817101/qzcel.o \
	${OBJECTDIR}/_ext/968817101/stackgl.o \
	${OBJECTDIR}/_ext/1457928084/zabs.o \
	${OBJECTDIR}/_ext/968817101/fremf2.o \
	${OBJECTDIR}/_ext/968817101/diffblk.o \
	${OBJECTDIR}/_ext/968817101/parcha.o \
	${OBJECTDIR}/_ext/968817101/desi22.o \
	${OBJECTDIR}/_ext/968817101/rjbesl.o \
	${OBJECTDIR}/_ext/968817101/dldsp.o \
	${OBJECTDIR}/_ext/968817101/coshin.o \
	${OBJECTDIR}/_ext/968817101/dpspln.o \
	${OBJECTDIR}/_ext/968817101/ctcab.o \
	${OBJECTDIR}/_ext/968817101/dmpmu.o \
	${OBJECTDIR}/_ext/968817101/mtran.o \
	${OBJECTDIR}/_ext/968817101/lsplit.o \
	${OBJECTDIR}/_ext/968817101/dmdsp.o \
	${OBJECTDIR}/_ext/1457928084/zbesh.o \
	${OBJECTDIR}/_ext/1457928084/zexp.o \
	${OBJECTDIR}/_ext/968817101/isany.o \
	${OBJECTDIR}/_ext/968817101/fcube.o \
	${OBJECTDIR}/_ext/968817101/istrue.o \
	${OBJECTDIR}/_ext/968817101/wspisp.o \
	${OBJECTDIR}/_ext/968817101/wtan.o \
	${OBJECTDIR}/_ext/968817101/ddasrt.o \
	${OBJECTDIR}/_ext/968817101/cstblk.o \
	${OBJECTDIR}/_ext/968817101/i_t.o \
	${OBJECTDIR}/_ext/968817101/ptrback.o \
	${OBJECTDIR}/_ext/968817101/i_p.o \
	${OBJECTDIR}/_ext/968817101/macro.o \
	${OBJECTDIR}/_ext/968817101/dmptld.o \
	${OBJECTDIR}/_ext/968817101/sz2ptr.o \
	${OBJECTDIR}/_ext/968817101/simple.o \
	${OBJECTDIR}/_ext/968817101/mux.o \
	${OBJECTDIR}/_ext/968817101/skipvars.o \
	${OBJECTDIR}/_ext/1457928084/zwrsk.o \
	${OBJECTDIR}/_ext/968817101/intzpotrf.o \
	${OBJECTDIR}/_ext/1457928084/dhkseq.o \
	${OBJECTDIR}/_ext/57306600/wpade.o \
	${OBJECTDIR}/_ext/968817101/dcutet.o \
	${OBJECTDIR}/_ext/968817101/intzgesv4.o \
	${OBJECTDIR}/_ext/968817101/intdgges.o \
	${OBJECTDIR}/_ext/968817101/impext.o \
	${OBJECTDIR}/_ext/1457928084/zacon.o \
	${OBJECTDIR}/_ext/944810281/dogleg.o \
	${OBJECTDIR}/_ext/968817101/roots.o \
	${OBJECTDIR}/_ext/968817101/setippty.o \
	${OBJECTDIR}/_ext/968817101/dmrdsp.o \
	${OBJECTDIR}/_ext/968817101/intzschur.o \
	${OBJECTDIR}/_ext/968817101/quadsd.o \
	${OBJECTDIR}/_ext/968817101/n1qn2a.o \
	${OBJECTDIR}/_ext/968817101/rscom1.o \
	${OBJECTDIR}/_ext/968817101/dspe2.o \
	${OBJECTDIR}/_ext/968817101/ffinf1.o \
	${OBJECTDIR}/_ext/1457928084/zuni1.o \
	${OBJECTDIR}/_ext/968817101/mklist.o \
	${OBJECTDIR}/_ext/968817101/dmpcnc.o \
	${OBJECTDIR}/_ext/968817101/intzgeqpf4.o \
	${OBJECTDIR}/_ext/1457928084/zbknu.o \
	${OBJECTDIR}/_ext/968817101/wipow.o \
	${OBJECTDIR}/_ext/968817101/i_logic.o \
	${OBJECTDIR}/_ext/1457928084/gamma.o \
	${OBJECTDIR}/_ext/968817101/sfact2.o \
	${OBJECTDIR}/_ext/968817101/mkindx.o \
	${OBJECTDIR}/_ext/968817101/lspisp.o \
	${OBJECTDIR}/_ext/968817101/isort1.o \
	${OBJECTDIR}/_ext/968817101/newsave.o \
	${OBJECTDIR}/_ext/968817101/calerf.o \
	${OBJECTDIR}/_ext/968817101/gdcp2i.o \
	${OBJECTDIR}/_ext/968817101/dspmsp.o \
	${OBJECTDIR}/_ext/968817101/ftob.o \
	${OBJECTDIR}/_ext/1457928084/zbuni.o \
	${OBJECTDIR}/_ext/968817101/n1fc1o.o \
	${OBJECTDIR}/_ext/944810281/lmpar.o \
	${OBJECTDIR}/_ext/968817101/stode.o \
	${OBJECTDIR}/_ext/968817101/impins.o \
	${OBJECTDIR}/_ext/968817101/getch.o \
	${OBJECTDIR}/_ext/968817101/compcl.o \
	${OBJECTDIR}/_ext/968817101/putid.o \
	${OBJECTDIR}/_ext/968817101/rilac.o \
	${OBJECTDIR}/_ext/968817101/intpol.o \
	${OBJECTDIR}/_ext/968817101/dlblks.o \
	${OBJECTDIR}/_ext/968817101/print.o \
	${OBJECTDIR}/_ext/968817101/ainvg.o \
	${OBJECTDIR}/_ext/944810281/enorm.o \
	${OBJECTDIR}/_ext/968817101/seteol.o \
	${OBJECTDIR}/_ext/968817101/remez.o \
	${OBJECTDIR}/_ext/968817101/ddassl.o \
	${OBJECTDIR}/_ext/968817101/dspisp.o \
	${OBJECTDIR}/_ext/968817101/allops.o \
	${OBJECTDIR}/_ext/968817101/round.o \
	${OBJECTDIR}/_ext/968817101/gcbd.o \
	${OBJECTDIR}/_ext/968817101/i_kron.o \
	${OBJECTDIR}/_ext/968817101/belan.o \
	${OBJECTDIR}/_ext/968817101/isova0.o \
	${OBJECTDIR}/_ext/968817101/intzgesvd1.o \
	${OBJECTDIR}/_ext/968817101/intgschur.o \
	${OBJECTDIR}/_ext/968817101/i_sum.o \
	${OBJECTDIR}/_ext/968817101/forcerhs.o \
	${OBJECTDIR}/_ext/968817101/wmdsp.o \
	${OBJECTDIR}/_ext/968817101/lspos.o \
	${OBJECTDIR}/_ext/968817101/comqr3.o \
	${OBJECTDIR}/_ext/968817101/logops.o \
	${OBJECTDIR}/_ext/968817101/quadit.o \
	${OBJECTDIR}/_ext/968817101/lspops.o \
	${OBJECTDIR}/_ext/968817101/dsort.o \
	${OBJECTDIR}/_ext/968817101/n1qn3.o \
	${OBJECTDIR}/_ext/968817101/genf.o \
	${OBJECTDIR}/_ext/968817101/gee.o \
	${OBJECTDIR}/_ext/968817101/xsetun.o \
	${OBJECTDIR}/_ext/968817101/intzoldsvd.o \
	${OBJECTDIR}/_ext/968817101/spextr.o \
	${OBJECTDIR}/_ext/968817101/wmpins.o \
	${OBJECTDIR}/_ext/968817101/lspdsp.o \
	${OBJECTDIR}/_ext/968817101/mfclck.o \
	${OBJECTDIR}/_ext/968817101/onface.o \
	${OBJECTDIR}/_ext/968817101/genmul.o \
	${OBJECTDIR}/_ext/968817101/wspis.o \
	${OBJECTDIR}/_ext/968817101/stack.o \
	${OBJECTDIR}/_ext/968817101/lnblnk.o \
	${OBJECTDIR}/_ext/968817101/typ2cod.o \
	${OBJECTDIR}/_ext/968817101/r2tx.o \
	${OBJECTDIR}/_ext/968817101/misops.o \
	${OBJECTDIR}/_ext/944810281/lmdif.o \
	${OBJECTDIR}/_ext/968817101/hndlops.o \
	${OBJECTDIR}/_ext/968817101/cmpse3.o \
	${OBJECTDIR}/_ext/968817101/intdgetri.o \
	${OBJECTDIR}/_ext/968817101/wdpowe.o \
	${OBJECTDIR}/_ext/968817101/tradsl.o \
	${OBJECTDIR}/_ext/968817101/ewset.o \
	${OBJECTDIR}/_ext/968817101/fxshfr.o \
	${OBJECTDIR}/_ext/968817101/mpinsp.o \
	${OBJECTDIR}/_ext/968817101/expsum.o \
	${OBJECTDIR}/_ext/57306600/wcopy.o \
	${OBJECTDIR}/_ext/968817101/common_f2c.o \
	${OBJECTDIR}/_ext/968817101/residu.o \
	${OBJECTDIR}/_ext/968817101/itosci.o \
	${OBJECTDIR}/_ext/968817101/inpnv.o \
	${OBJECTDIR}/_ext/57306600/dgedi.o \
	${OBJECTDIR}/_ext/968817101/dspdsp.o \
	${OBJECTDIR}/_ext/968817101/recbez.o \
	${OBJECTDIR}/_ext/968817101/desi14.o \
	${OBJECTDIR}/_ext/1457928084/dbdiff.o \
	${OBJECTDIR}/_ext/968817101/dspssp.o \
	${OBJECTDIR}/_ext/968817101/wwdiv.o \
	${OBJECTDIR}/_ext/968817101/cmpse2.o \
	${OBJECTDIR}/_ext/968817101/scischur.o \
	${OBJECTDIR}/_ext/968817101/mpdegr.o \
	${OBJECTDIR}/_ext/968817101/desi01.o \
	${OBJECTDIR}/_ext/1457928084/dbesy1.o \
	${OBJECTDIR}/_ext/968817101/trbize.o \
	${OBJECTDIR}/_ext/1457928084/d9b0mp.o \
	${OBJECTDIR}/_ext/968817101/getsym.o \
	${OBJECTDIR}/_ext/968817101/zbesjg.o \
	${OBJECTDIR}/_ext/968817101/wexpm1.o \
	${OBJECTDIR}/_ext/968817101/franck.o \
	${OBJECTDIR}/_ext/968817101/dpsimp.o \
	${OBJECTDIR}/_ext/1457928084/dbesj1.o \
	${OBJECTDIR}/_ext/968817101/setgetmode.o \
	${OBJECTDIR}/_ext/968817101/trash.o \
	${OBJECTDIR}/_ext/968817101/dmpins.o \
	${OBJECTDIR}/_ext/968817101/memo.o \
	${OBJECTDIR}/_ext/968817101/qhesz.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-Debug.mk dist/Debug/GNU-Linux-x86/libscilablibrary.a

dist/Debug/GNU-Linux-x86/libscilablibrary.a: ${OBJECTFILES}
	${MKDIR} -p dist/Debug/GNU-Linux-x86
	${RM} dist/Debug/GNU-Linux-x86/libscilablibrary.a
	${AR} -rv ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libscilablibrary.a ${OBJECTFILES} 
	$(RANLIB) dist/Debug/GNU-Linux-x86/libscilablibrary.a

${OBJECTDIR}/_ext/968817101/wmpadj.o: ../../../lib/pkg/src/fortran/wmpadj.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wmpadj.o ../../../lib/pkg/src/fortran/wmpadj.f

${OBJECTDIR}/_ext/1457928084/zs1s2.o: ../../../lib/pkg/src/fortran/slatec/zs1s2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zs1s2.o ../../../lib/pkg/src/fortran/slatec/zs1s2.f

${OBJECTDIR}/_ext/968817101/sciblk.o: ../../../lib/pkg/src/fortran/sciblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sciblk.o ../../../lib/pkg/src/fortran/sciblk.f

${OBJECTDIR}/_ext/968817101/qpgen1sci.o: ../../../lib/pkg/src/fortran/qpgen1sci.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/qpgen1sci.o ../../../lib/pkg/src/fortran/qpgen1sci.f

${OBJECTDIR}/_ext/944810281/hybrd.o: ../../../lib/pkg/src/fortran/minpack/hybrd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/hybrd.o ../../../lib/pkg/src/fortran/minpack/hybrd.f

${OBJECTDIR}/_ext/968817101/intdoldsvd.o: ../../../lib/pkg/src/fortran/intdoldsvd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdoldsvd.o ../../../lib/pkg/src/fortran/intdoldsvd.f

${OBJECTDIR}/_ext/968817101/cvdm.o: ../../../lib/pkg/src/fortran/cvdm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cvdm.o ../../../lib/pkg/src/fortran/cvdm.f

${OBJECTDIR}/_ext/968817101/genchi.o: ../../../lib/pkg/src/fortran/genchi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/genchi.o ../../../lib/pkg/src/fortran/genchi.f

${OBJECTDIR}/_ext/968817101/spif1b.o: ../../../lib/pkg/src/fortran/spif1b.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spif1b.o ../../../lib/pkg/src/fortran/spif1b.f

${OBJECTDIR}/_ext/968817101/evtdly.o: ../../../lib/pkg/src/fortran/evtdly.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/evtdly.o ../../../lib/pkg/src/fortran/evtdly.f

${OBJECTDIR}/_ext/944810281/fdjac1.o: ../../../lib/pkg/src/fortran/minpack/fdjac1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/fdjac1.o ../../../lib/pkg/src/fortran/minpack/fdjac1.f

${OBJECTDIR}/_ext/968817101/sum2.o: ../../../lib/pkg/src/fortran/sum2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sum2.o ../../../lib/pkg/src/fortran/sum2.f

${OBJECTDIR}/_ext/968817101/nlis2.o: ../../../lib/pkg/src/fortran/nlis2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/nlis2.o ../../../lib/pkg/src/fortran/nlis2.f

${OBJECTDIR}/_ext/968817101/dspasp.o: ../../../lib/pkg/src/fortran/dspasp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspasp.o ../../../lib/pkg/src/fortran/dspasp.f

${OBJECTDIR}/_ext/1457928084/zunik.o: ../../../lib/pkg/src/fortran/slatec/zunik.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zunik.o ../../../lib/pkg/src/fortran/slatec/zunik.f

${OBJECTDIR}/_ext/968817101/intogschur.o: ../../../lib/pkg/src/fortran/intogschur.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intogschur.o ../../../lib/pkg/src/fortran/intogschur.f

${OBJECTDIR}/_ext/968817101/logblk.o: ../../../lib/pkg/src/fortran/logblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/logblk.o ../../../lib/pkg/src/fortran/logblk.f

${OBJECTDIR}/_ext/968817101/icsec2.o: ../../../lib/pkg/src/fortran/icsec2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/icsec2.o ../../../lib/pkg/src/fortran/icsec2.f

${OBJECTDIR}/_ext/968817101/intrpl.o: ../../../lib/pkg/src/fortran/intrpl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intrpl.o ../../../lib/pkg/src/fortran/intrpl.f

${OBJECTDIR}/_ext/968817101/empty.o: ../../../lib/pkg/src/fortran/empty.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/empty.o ../../../lib/pkg/src/fortran/empty.f

${OBJECTDIR}/_ext/1457928084/fdump.o: ../../../lib/pkg/src/fortran/slatec/fdump.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/fdump.o ../../../lib/pkg/src/fortran/slatec/fdump.f

${OBJECTDIR}/_ext/1457928084/stack.o: ../../../lib/pkg/src/fortran/slatec/stack.h 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/stack.o ../../../lib/pkg/src/fortran/slatec/stack.h

${OBJECTDIR}/_ext/968817101/intreadmps.o: ../../../lib/pkg/src/fortran/intreadmps.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intreadmps.o ../../../lib/pkg/src/fortran/intreadmps.f

${OBJECTDIR}/_ext/1457928084/zmlri.o: ../../../lib/pkg/src/fortran/slatec/zmlri.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zmlri.o ../../../lib/pkg/src/fortran/slatec/zmlri.f

${OBJECTDIR}/_ext/968817101/ddd2.o: ../../../lib/pkg/src/fortran/ddd2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ddd2.o ../../../lib/pkg/src/fortran/ddd2.f

${OBJECTDIR}/_ext/968817101/intl_e.o: ../../../lib/pkg/src/fortran/intl_e.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intl_e.o ../../../lib/pkg/src/fortran/intl_e.f

${OBJECTDIR}/_ext/968817101/ouch.o: ../../../lib/pkg/src/fortran/ouch.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ouch.o ../../../lib/pkg/src/fortran/ouch.f

${OBJECTDIR}/_ext/968817101/deli1.o: ../../../lib/pkg/src/fortran/deli1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/deli1.o ../../../lib/pkg/src/fortran/deli1.f

${OBJECTDIR}/_ext/1457928084/dgamlm.o: ../../../lib/pkg/src/fortran/slatec/dgamlm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dgamlm.o ../../../lib/pkg/src/fortran/slatec/dgamlm.f

${OBJECTDIR}/_ext/968817101/intzgecon.o: ../../../lib/pkg/src/fortran/intzgecon.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgecon.o ../../../lib/pkg/src/fortran/intzgecon.f

${OBJECTDIR}/_ext/968817101/logic.o: ../../../lib/pkg/src/fortran/logic.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/logic.o ../../../lib/pkg/src/fortran/logic.f

${OBJECTDIR}/_ext/968817101/allowptr.o: ../../../lib/pkg/src/fortran/allowptr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/allowptr.o ../../../lib/pkg/src/fortran/allowptr.f

${OBJECTDIR}/_ext/968817101/cmdstr.o: ../../../lib/pkg/src/fortran/cmdstr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cmdstr.o ../../../lib/pkg/src/fortran/cmdstr.f

${OBJECTDIR}/_ext/968817101/lspis.o: ../../../lib/pkg/src/fortran/lspis.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lspis.o ../../../lib/pkg/src/fortran/lspis.f

${OBJECTDIR}/_ext/57306600/spofa.o: ../../../lib/pkg/src/fortran/linpack/spofa.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/spofa.o ../../../lib/pkg/src/fortran/linpack/spofa.f

${OBJECTDIR}/_ext/968817101/dset.o: ../../../lib/pkg/src/fortran/dset.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dset.o ../../../lib/pkg/src/fortran/dset.f

${OBJECTDIR}/_ext/968817101/delip.o: ../../../lib/pkg/src/fortran/delip.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/delip.o ../../../lib/pkg/src/fortran/delip.f

${OBJECTDIR}/_ext/968817101/dmmul1.o: ../../../lib/pkg/src/fortran/dmmul1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmmul1.o ../../../lib/pkg/src/fortran/dmmul1.f

${OBJECTDIR}/_ext/944810281/fdjac2.o: ../../../lib/pkg/src/fortran/minpack/fdjac2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/fdjac2.o ../../../lib/pkg/src/fortran/minpack/fdjac2.f

${OBJECTDIR}/_ext/968817101/wipowe.o: ../../../lib/pkg/src/fortran/wipowe.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wipowe.o ../../../lib/pkg/src/fortran/wipowe.f

${OBJECTDIR}/_ext/968817101/optml2.o: ../../../lib/pkg/src/fortran/optml2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/optml2.o ../../../lib/pkg/src/fortran/optml2.f

${OBJECTDIR}/_ext/968817101/waxpy.o: ../../../lib/pkg/src/fortran/waxpy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/waxpy.o ../../../lib/pkg/src/fortran/waxpy.f

${OBJECTDIR}/_ext/968817101/intoschur.o: ../../../lib/pkg/src/fortran/intoschur.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intoschur.o ../../../lib/pkg/src/fortran/intoschur.f

${OBJECTDIR}/_ext/968817101/rpoly.o: ../../../lib/pkg/src/fortran/rpoly.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rpoly.o ../../../lib/pkg/src/fortran/rpoly.f

${OBJECTDIR}/_ext/968817101/btof.o: ../../../lib/pkg/src/fortran/btof.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/btof.o ../../../lib/pkg/src/fortran/btof.f

${OBJECTDIR}/_ext/968817101/zbesig.o: ../../../lib/pkg/src/fortran/zbesig.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/zbesig.o ../../../lib/pkg/src/fortran/zbesig.f

${OBJECTDIR}/_ext/968817101/dmdspf.o: ../../../lib/pkg/src/fortran/dmdspf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmdspf.o ../../../lib/pkg/src/fortran/dmdspf.f

${OBJECTDIR}/_ext/968817101/desi21.o: ../../../lib/pkg/src/fortran/desi21.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/desi21.o ../../../lib/pkg/src/fortran/desi21.f

${OBJECTDIR}/_ext/968817101/spind.o: ../../../lib/pkg/src/fortran/spind.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spind.o ../../../lib/pkg/src/fortran/spind.f

${OBJECTDIR}/_ext/968817101/dsqrtc.o: ../../../lib/pkg/src/fortran/dsqrtc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dsqrtc.o ../../../lib/pkg/src/fortran/dsqrtc.f

${OBJECTDIR}/_ext/968817101/wdotci.o: ../../../lib/pkg/src/fortran/wdotci.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wdotci.o ../../../lib/pkg/src/fortran/wdotci.f

${OBJECTDIR}/_ext/968817101/fretc1.o: ../../../lib/pkg/src/fortran/fretc1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fretc1.o ../../../lib/pkg/src/fortran/fretc1.f

${OBJECTDIR}/_ext/968817101/poles.o: ../../../lib/pkg/src/fortran/poles.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/poles.o ../../../lib/pkg/src/fortran/poles.f

${OBJECTDIR}/_ext/968817101/DGELSY1.o: ../../../lib/pkg/src/fortran/DGELSY1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/DGELSY1.o ../../../lib/pkg/src/fortran/DGELSY1.f

${OBJECTDIR}/_ext/968817101/callinter.o: ../../../lib/pkg/src/fortran/callinter.h 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/callinter.o ../../../lib/pkg/src/fortran/callinter.h

${OBJECTDIR}/_ext/1457928084/d9lgmc.o: ../../../lib/pkg/src/fortran/slatec/d9lgmc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/d9lgmc.o ../../../lib/pkg/src/fortran/slatec/d9lgmc.f

${OBJECTDIR}/_ext/968817101/dimin.o: ../../../lib/pkg/src/fortran/dimin.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dimin.o ../../../lib/pkg/src/fortran/dimin.f

${OBJECTDIR}/_ext/968817101/funs.o: ../../../lib/pkg/src/fortran/funs.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/funs.o ../../../lib/pkg/src/fortran/funs.f

${OBJECTDIR}/_ext/968817101/ftree2.o: ../../../lib/pkg/src/fortran/ftree2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ftree2.o ../../../lib/pkg/src/fortran/ftree2.f

${OBJECTDIR}/_ext/968817101/wspssp.o: ../../../lib/pkg/src/fortran/wspssp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspssp.o ../../../lib/pkg/src/fortran/wspssp.f

${OBJECTDIR}/_ext/968817101/dqags.o: ../../../lib/pkg/src/fortran/dqags.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dqags.o ../../../lib/pkg/src/fortran/dqags.f

${OBJECTDIR}/_ext/968817101/wspdsp.o: ../../../lib/pkg/src/fortran/wspdsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspdsp.o ../../../lib/pkg/src/fortran/wspdsp.f

${OBJECTDIR}/_ext/968817101/rdmps1.o: ../../../lib/pkg/src/fortran/rdmps1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rdmps1.o ../../../lib/pkg/src/fortran/rdmps1.f

${OBJECTDIR}/_ext/968817101/ctonb.o: ../../../lib/pkg/src/fortran/ctonb.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ctonb.o ../../../lib/pkg/src/fortran/ctonb.f

${OBJECTDIR}/_ext/968817101/i_mput.o: ../../../lib/pkg/src/fortran/i_mput.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_mput.o ../../../lib/pkg/src/fortran/i_mput.f

${OBJECTDIR}/_ext/968817101/daux.o: ../../../lib/pkg/src/fortran/daux.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/daux.o ../../../lib/pkg/src/fortran/daux.f

${OBJECTDIR}/_ext/968817101/d1mach.o: ../../../lib/pkg/src/fortran/d1mach.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/d1mach.o ../../../lib/pkg/src/fortran/d1mach.f

${OBJECTDIR}/_ext/944810281/hybrj1.o: ../../../lib/pkg/src/fortran/minpack/hybrj1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/hybrj1.o ../../../lib/pkg/src/fortran/minpack/hybrj1.f

${OBJECTDIR}/_ext/968817101/orthes.o: ../../../lib/pkg/src/fortran/orthes.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/orthes.o ../../../lib/pkg/src/fortran/orthes.f

${OBJECTDIR}/_ext/968817101/vvtosci.o: ../../../lib/pkg/src/fortran/vvtosci.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/vvtosci.o ../../../lib/pkg/src/fortran/vvtosci.f

${OBJECTDIR}/_ext/968817101/quad.o: ../../../lib/pkg/src/fortran/quad.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/quad.o ../../../lib/pkg/src/fortran/quad.f

${OBJECTDIR}/_ext/968817101/i_l_i.o: ../../../lib/pkg/src/fortran/i_l_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_l_i.o ../../../lib/pkg/src/fortran/i_l_i.f

${OBJECTDIR}/_ext/968817101/rootgp.o: ../../../lib/pkg/src/fortran/rootgp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rootgp.o ../../../lib/pkg/src/fortran/rootgp.f

${OBJECTDIR}/_ext/968817101/mlist.o: ../../../lib/pkg/src/fortran/mlist.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mlist.o ../../../lib/pkg/src/fortran/mlist.f

${OBJECTDIR}/_ext/968817101/roots2.o: ../../../lib/pkg/src/fortran/roots2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/roots2.o ../../../lib/pkg/src/fortran/roots2.f

${OBJECTDIR}/_ext/968817101/v2unit.o: ../../../lib/pkg/src/fortran/v2unit.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/v2unit.o ../../../lib/pkg/src/fortran/v2unit.f

${OBJECTDIR}/_ext/968817101/findequal.o: ../../../lib/pkg/src/fortran/findequal.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/findequal.o ../../../lib/pkg/src/fortran/findequal.f

${OBJECTDIR}/_ext/968817101/dmpadj.o: ../../../lib/pkg/src/fortran/dmpadj.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmpadj.o ../../../lib/pkg/src/fortran/dmpadj.f

${OBJECTDIR}/_ext/968817101/dfft2.o: ../../../lib/pkg/src/fortran/dfft2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dfft2.o ../../../lib/pkg/src/fortran/dfft2.f

${OBJECTDIR}/_ext/968817101/xsetf.o: ../../../lib/pkg/src/fortran/xsetf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/xsetf.o ../../../lib/pkg/src/fortran/xsetf.f

${OBJECTDIR}/_ext/968817101/dcompa.o: ../../../lib/pkg/src/fortran/dcompa.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dcompa.o ../../../lib/pkg/src/fortran/dcompa.f

${OBJECTDIR}/_ext/968817101/rtitr.o: ../../../lib/pkg/src/fortran/rtitr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rtitr.o ../../../lib/pkg/src/fortran/rtitr.f

${OBJECTDIR}/_ext/968817101/vpythag.o: ../../../lib/pkg/src/fortran/vpythag.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/vpythag.o ../../../lib/pkg/src/fortran/vpythag.f

${OBJECTDIR}/_ext/968817101/dhetr.o: ../../../lib/pkg/src/fortran/dhetr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dhetr.o ../../../lib/pkg/src/fortran/dhetr.f

${OBJECTDIR}/_ext/968817101/demux.o: ../../../lib/pkg/src/fortran/demux.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/demux.o ../../../lib/pkg/src/fortran/demux.f

${OBJECTDIR}/_ext/968817101/uppertype.o: ../../../lib/pkg/src/fortran/uppertype.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/uppertype.o ../../../lib/pkg/src/fortran/uppertype.f

${OBJECTDIR}/_ext/968817101/chkvar.o: ../../../lib/pkg/src/fortran/chkvar.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/chkvar.o ../../../lib/pkg/src/fortran/chkvar.f

${OBJECTDIR}/_ext/968817101/insertfield.o: ../../../lib/pkg/src/fortran/insertfield.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/insertfield.o ../../../lib/pkg/src/fortran/insertfield.f

${OBJECTDIR}/_ext/968817101/getfunction.o: ../../../lib/pkg/src/fortran/getfunction.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/getfunction.o ../../../lib/pkg/src/fortran/getfunction.f

${OBJECTDIR}/_ext/968817101/iperm.o: ../../../lib/pkg/src/fortran/iperm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/iperm.o ../../../lib/pkg/src/fortran/iperm.f

${OBJECTDIR}/_ext/968817101/tranpo.o: ../../../lib/pkg/src/fortran/tranpo.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/tranpo.o ../../../lib/pkg/src/fortran/tranpo.f

${OBJECTDIR}/_ext/968817101/dexpm1.o: ../../../lib/pkg/src/fortran/dexpm1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dexpm1.o ../../../lib/pkg/src/fortran/dexpm1.f

${OBJECTDIR}/_ext/968817101/fmt.o: ../../../lib/pkg/src/fortran/fmt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fmt.o ../../../lib/pkg/src/fortran/fmt.f

${OBJECTDIR}/_ext/968817101/list2vars.o: ../../../lib/pkg/src/fortran/list2vars.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/list2vars.o ../../../lib/pkg/src/fortran/list2vars.f

${OBJECTDIR}/_ext/968817101/i_q_i.o: ../../../lib/pkg/src/fortran/i_q_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_q_i.o ../../../lib/pkg/src/fortran/i_q_i.f

${OBJECTDIR}/_ext/968817101/wbdiag.o: ../../../lib/pkg/src/fortran/wbdiag.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wbdiag.o ../../../lib/pkg/src/fortran/wbdiag.f

${OBJECTDIR}/_ext/968817101/dcube.o: ../../../lib/pkg/src/fortran/dcube.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dcube.o ../../../lib/pkg/src/fortran/dcube.f

${OBJECTDIR}/_ext/968817101/split.o: ../../../lib/pkg/src/fortran/split.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/split.o ../../../lib/pkg/src/fortran/split.f

${OBJECTDIR}/_ext/1457928084/zkscl.o: ../../../lib/pkg/src/fortran/slatec/zkscl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zkscl.o ../../../lib/pkg/src/fortran/slatec/zkscl.f

${OBJECTDIR}/_ext/1457928084/zuchk.o: ../../../lib/pkg/src/fortran/slatec/zuchk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zuchk.o ../../../lib/pkg/src/fortran/slatec/zuchk.f

${OBJECTDIR}/_ext/968817101/n1fc1a.o: ../../../lib/pkg/src/fortran/n1fc1a.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/n1fc1a.o ../../../lib/pkg/src/fortran/n1fc1a.f

${OBJECTDIR}/_ext/968817101/majz.o: ../../../lib/pkg/src/fortran/majz.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/majz.o ../../../lib/pkg/src/fortran/majz.f

${OBJECTDIR}/_ext/968817101/domout.o: ../../../lib/pkg/src/fortran/domout.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/domout.o ../../../lib/pkg/src/fortran/domout.f

${OBJECTDIR}/_ext/968817101/intdgesvd2.o: ../../../lib/pkg/src/fortran/intdgesvd2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgesvd2.o ../../../lib/pkg/src/fortran/intdgesvd2.f

${OBJECTDIR}/_ext/968817101/lsodi.o: ../../../lib/pkg/src/fortran/lsodi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lsodi.o ../../../lib/pkg/src/fortran/lsodi.f

${OBJECTDIR}/_ext/968817101/gensqr.o: ../../../lib/pkg/src/fortran/gensqr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/gensqr.o ../../../lib/pkg/src/fortran/gensqr.f

${OBJECTDIR}/_ext/968817101/n1fc1.o: ../../../lib/pkg/src/fortran/n1fc1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/n1fc1.o ../../../lib/pkg/src/fortran/n1fc1.f

${OBJECTDIR}/_ext/968817101/intddet.o: ../../../lib/pkg/src/fortran/intddet.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intddet.o ../../../lib/pkg/src/fortran/intddet.f

${OBJECTDIR}/_ext/968817101/dij2sp.o: ../../../lib/pkg/src/fortran/dij2sp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dij2sp.o ../../../lib/pkg/src/fortran/dij2sp.f

${OBJECTDIR}/_ext/968817101/copyvar.o: ../../../lib/pkg/src/fortran/copyvar.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/copyvar.o ../../../lib/pkg/src/fortran/copyvar.f

${OBJECTDIR}/_ext/968817101/svcar1.o: ../../../lib/pkg/src/fortran/svcar1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/svcar1.o ../../../lib/pkg/src/fortran/svcar1.f

${OBJECTDIR}/_ext/968817101/cshep2d.o: ../../../lib/pkg/src/fortran/cshep2d.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cshep2d.o ../../../lib/pkg/src/fortran/cshep2d.f

${OBJECTDIR}/_ext/968817101/calmaj.o: ../../../lib/pkg/src/fortran/calmaj.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/calmaj.o ../../../lib/pkg/src/fortran/calmaj.f

${OBJECTDIR}/_ext/968817101/nextj.o: ../../../lib/pkg/src/fortran/nextj.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/nextj.o ../../../lib/pkg/src/fortran/nextj.f

${OBJECTDIR}/_ext/968817101/proj.o: ../../../lib/pkg/src/fortran/proj.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/proj.o ../../../lib/pkg/src/fortran/proj.f

${OBJECTDIR}/_ext/968817101/feq.o: ../../../lib/pkg/src/fortran/feq.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/feq.o ../../../lib/pkg/src/fortran/feq.f

${OBJECTDIR}/_ext/968817101/dclmat.o: ../../../lib/pkg/src/fortran/dclmat.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dclmat.o ../../../lib/pkg/src/fortran/dclmat.f

${OBJECTDIR}/_ext/968817101/fmttyp.o: ../../../lib/pkg/src/fortran/fmttyp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fmttyp.o ../../../lib/pkg/src/fortran/fmttyp.f

${OBJECTDIR}/_ext/968817101/delayv.o: ../../../lib/pkg/src/fortran/delayv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/delayv.o ../../../lib/pkg/src/fortran/delayv.f

${OBJECTDIR}/_ext/968817101/invblk.o: ../../../lib/pkg/src/fortran/invblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/invblk.o ../../../lib/pkg/src/fortran/invblk.f

${OBJECTDIR}/_ext/968817101/zbeskg.o: ../../../lib/pkg/src/fortran/zbeskg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/zbeskg.o ../../../lib/pkg/src/fortran/zbeskg.f

${OBJECTDIR}/_ext/968817101/intdgecon.o: ../../../lib/pkg/src/fortran/intdgecon.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgecon.o ../../../lib/pkg/src/fortran/intdgecon.f

${OBJECTDIR}/_ext/968817101/dsn2.o: ../../../lib/pkg/src/fortran/dsn2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dsn2.o ../../../lib/pkg/src/fortran/dsn2.f

${OBJECTDIR}/_ext/968817101/pload.o: ../../../lib/pkg/src/fortran/pload.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/pload.o ../../../lib/pkg/src/fortran/pload.f

${OBJECTDIR}/_ext/968817101/rcsort.o: ../../../lib/pkg/src/fortran/rcsort.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rcsort.o ../../../lib/pkg/src/fortran/rcsort.f

${OBJECTDIR}/_ext/968817101/namstr.o: ../../../lib/pkg/src/fortran/namstr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/namstr.o ../../../lib/pkg/src/fortran/namstr.f

${OBJECTDIR}/_ext/968817101/wspt.o: ../../../lib/pkg/src/fortran/wspt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspt.o ../../../lib/pkg/src/fortran/wspt.f

${OBJECTDIR}/_ext/968817101/relvar.o: ../../../lib/pkg/src/fortran/relvar.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/relvar.o ../../../lib/pkg/src/fortran/relvar.f

${OBJECTDIR}/_ext/968817101/infinity.o: ../../../lib/pkg/src/fortran/infinity.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/infinity.o ../../../lib/pkg/src/fortran/infinity.f

${OBJECTDIR}/_ext/968817101/fajc1.o: ../../../lib/pkg/src/fortran/fajc1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fajc1.o ../../../lib/pkg/src/fortran/fajc1.f

${OBJECTDIR}/_ext/968817101/sqrblk.o: ../../../lib/pkg/src/fortran/sqrblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sqrblk.o ../../../lib/pkg/src/fortran/sqrblk.f

${OBJECTDIR}/_ext/968817101/funnam.o: ../../../lib/pkg/src/fortran/funnam.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/funnam.o ../../../lib/pkg/src/fortran/funnam.f

${OBJECTDIR}/_ext/968817101/lcompa.o: ../../../lib/pkg/src/fortran/lcompa.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lcompa.o ../../../lib/pkg/src/fortran/lcompa.f

${OBJECTDIR}/_ext/968817101/isbrk.o: ../../../lib/pkg/src/fortran/isbrk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/isbrk.o ../../../lib/pkg/src/fortran/isbrk.f

${OBJECTDIR}/_ext/968817101/snorm.o: ../../../lib/pkg/src/fortran/snorm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/snorm.o ../../../lib/pkg/src/fortran/snorm.f

${OBJECTDIR}/_ext/968817101/i_mget.o: ../../../lib/pkg/src/fortran/i_mget.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_mget.o ../../../lib/pkg/src/fortran/i_mget.f

${OBJECTDIR}/_ext/968817101/i_maxi.o: ../../../lib/pkg/src/fortran/i_maxi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_maxi.o ../../../lib/pkg/src/fortran/i_maxi.f

${OBJECTDIR}/_ext/968817101/dspmat.o: ../../../lib/pkg/src/fortran/dspmat.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspmat.o ../../../lib/pkg/src/fortran/dspmat.f

${OBJECTDIR}/_ext/968817101/dsearch.o: ../../../lib/pkg/src/fortran/dsearch.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dsearch.o ../../../lib/pkg/src/fortran/dsearch.f

${OBJECTDIR}/_ext/968817101/gensin.o: ../../../lib/pkg/src/fortran/gensin.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/gensin.o ../../../lib/pkg/src/fortran/gensin.f

${OBJECTDIR}/_ext/968817101/spt.o: ../../../lib/pkg/src/fortran/spt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spt.o ../../../lib/pkg/src/fortran/spt.f

${OBJECTDIR}/_ext/968817101/mptri.o: ../../../lib/pkg/src/fortran/mptri.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mptri.o ../../../lib/pkg/src/fortran/mptri.f

${OBJECTDIR}/_ext/968817101/folhp.o: ../../../lib/pkg/src/fortran/folhp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/folhp.o ../../../lib/pkg/src/fortran/folhp.f

${OBJECTDIR}/_ext/968817101/bitops.o: ../../../lib/pkg/src/fortran/bitops.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/bitops.o ../../../lib/pkg/src/fortran/bitops.f

${OBJECTDIR}/_ext/968817101/scifunc.o: ../../../lib/pkg/src/fortran/scifunc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/scifunc.o ../../../lib/pkg/src/fortran/scifunc.f

${OBJECTDIR}/_ext/968817101/inisci.o: ../../../lib/pkg/src/fortran/inisci.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/inisci.o ../../../lib/pkg/src/fortran/inisci.f

${OBJECTDIR}/_ext/968817101/btofm.o: ../../../lib/pkg/src/fortran/btofm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/btofm.o ../../../lib/pkg/src/fortran/btofm.f

${OBJECTDIR}/_ext/1457928084/zunk2.o: ../../../lib/pkg/src/fortran/slatec/zunk2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zunk2.o ../../../lib/pkg/src/fortran/slatec/zunk2.f

${OBJECTDIR}/_ext/968817101/minblk.o: ../../../lib/pkg/src/fortran/minblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/minblk.o ../../../lib/pkg/src/fortran/minblk.f

${OBJECTDIR}/_ext/968817101/order.o: ../../../lib/pkg/src/fortran/order.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/order.o ../../../lib/pkg/src/fortran/order.f

${OBJECTDIR}/_ext/968817101/calbx.o: ../../../lib/pkg/src/fortran/calbx.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/calbx.o ../../../lib/pkg/src/fortran/calbx.f

${OBJECTDIR}/_ext/968817101/blnumz.o: ../../../lib/pkg/src/fortran/blnumz.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/blnumz.o ../../../lib/pkg/src/fortran/blnumz.f

${OBJECTDIR}/_ext/1457928084/zbesj.o: ../../../lib/pkg/src/fortran/slatec/zbesj.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zbesj.o ../../../lib/pkg/src/fortran/slatec/zbesj.f

${OBJECTDIR}/_ext/968817101/dmpad.o: ../../../lib/pkg/src/fortran/dmpad.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmpad.o ../../../lib/pkg/src/fortran/dmpad.f

${OBJECTDIR}/_ext/968817101/degl2.o: ../../../lib/pkg/src/fortran/degl2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/degl2.o ../../../lib/pkg/src/fortran/degl2.f

${OBJECTDIR}/_ext/968817101/fprf2.o: ../../../lib/pkg/src/fortran/fprf2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fprf2.o ../../../lib/pkg/src/fortran/fprf2.f

${OBJECTDIR}/_ext/968817101/defmat.o: ../../../lib/pkg/src/fortran/defmat.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/defmat.o ../../../lib/pkg/src/fortran/defmat.f

${OBJECTDIR}/_ext/968817101/lsrgk.o: ../../../lib/pkg/src/fortran/lsrgk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lsrgk.o ../../../lib/pkg/src/fortran/lsrgk.f

${OBJECTDIR}/_ext/968817101/fmc11b.o: ../../../lib/pkg/src/fortran/fmc11b.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fmc11b.o ../../../lib/pkg/src/fortran/fmc11b.f

${OBJECTDIR}/_ext/1457928084/zseri.o: ../../../lib/pkg/src/fortran/slatec/zseri.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zseri.o ../../../lib/pkg/src/fortran/slatec/zseri.f

${OBJECTDIR}/_ext/968817101/greatr.o: ../../../lib/pkg/src/fortran/greatr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/greatr.o ../../../lib/pkg/src/fortran/greatr.f

${OBJECTDIR}/_ext/968817101/exch.o: ../../../lib/pkg/src/fortran/exch.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/exch.o ../../../lib/pkg/src/fortran/exch.f

${OBJECTDIR}/_ext/1457928084/zshch.o: ../../../lib/pkg/src/fortran/slatec/zshch.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zshch.o ../../../lib/pkg/src/fortran/slatec/zshch.f

${OBJECTDIR}/_ext/968817101/rkbesl.o: ../../../lib/pkg/src/fortran/rkbesl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rkbesl.o ../../../lib/pkg/src/fortran/rkbesl.f

${OBJECTDIR}/_ext/1457928084/zunhj.o: ../../../lib/pkg/src/fortran/slatec/zunhj.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zunhj.o ../../../lib/pkg/src/fortran/slatec/zunhj.f

${OBJECTDIR}/_ext/1457928084/dlngam.o: ../../../lib/pkg/src/fortran/slatec/dlngam.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dlngam.o ../../../lib/pkg/src/fortran/slatec/dlngam.f

${OBJECTDIR}/_ext/968817101/basnms.o: ../../../lib/pkg/src/fortran/basnms.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/basnms.o ../../../lib/pkg/src/fortran/basnms.f

${OBJECTDIR}/_ext/968817101/icse1.o: ../../../lib/pkg/src/fortran/icse1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/icse1.o ../../../lib/pkg/src/fortran/icse1.f

${OBJECTDIR}/_ext/968817101/ccopy.o: ../../../lib/pkg/src/fortran/ccopy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ccopy.o ../../../lib/pkg/src/fortran/ccopy.f

${OBJECTDIR}/_ext/968817101/lsosp.o: ../../../lib/pkg/src/fortran/lsosp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lsosp.o ../../../lib/pkg/src/fortran/lsosp.f

${OBJECTDIR}/_ext/968817101/dellk.o: ../../../lib/pkg/src/fortran/dellk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dellk.o ../../../lib/pkg/src/fortran/dellk.f

${OBJECTDIR}/_ext/968817101/wmmul.o: ../../../lib/pkg/src/fortran/wmmul.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wmmul.o ../../../lib/pkg/src/fortran/wmmul.f

${OBJECTDIR}/_ext/968817101/dspcsp.o: ../../../lib/pkg/src/fortran/dspcsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspcsp.o ../../../lib/pkg/src/fortran/dspcsp.f

${OBJECTDIR}/_ext/1457928084/initds.o: ../../../lib/pkg/src/fortran/slatec/initds.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/initds.o ../../../lib/pkg/src/fortran/slatec/initds.f

${OBJECTDIR}/_ext/968817101/odeint.o: ../../../lib/pkg/src/fortran/odeint.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/odeint.o ../../../lib/pkg/src/fortran/odeint.f

${OBJECTDIR}/_ext/968817101/desib.o: ../../../lib/pkg/src/fortran/desib.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/desib.o ../../../lib/pkg/src/fortran/desib.f

${OBJECTDIR}/_ext/968817101/rndblk.o: ../../../lib/pkg/src/fortran/rndblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rndblk.o ../../../lib/pkg/src/fortran/rndblk.f

${OBJECTDIR}/_ext/968817101/urand.o: ../../../lib/pkg/src/fortran/urand.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/urand.o ../../../lib/pkg/src/fortran/urand.f

${OBJECTDIR}/_ext/968817101/storl2.o: ../../../lib/pkg/src/fortran/storl2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/storl2.o ../../../lib/pkg/src/fortran/storl2.f

${OBJECTDIR}/_ext/57306600/dqrdc.o: ../../../lib/pkg/src/fortran/linpack/dqrdc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/dqrdc.o ../../../lib/pkg/src/fortran/linpack/dqrdc.f

${OBJECTDIR}/_ext/968817101/scaleg.o: ../../../lib/pkg/src/fortran/scaleg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/scaleg.o ../../../lib/pkg/src/fortran/scaleg.f

${OBJECTDIR}/_ext/968817101/stacki2d.o: ../../../lib/pkg/src/fortran/stacki2d.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/stacki2d.o ../../../lib/pkg/src/fortran/stacki2d.f

${OBJECTDIR}/_ext/968817101/ptover.o: ../../../lib/pkg/src/fortran/ptover.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ptover.o ../../../lib/pkg/src/fortran/ptover.f

${OBJECTDIR}/_ext/968817101/ddpowe.o: ../../../lib/pkg/src/fortran/ddpowe.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ddpowe.o ../../../lib/pkg/src/fortran/ddpowe.f

${OBJECTDIR}/_ext/968817101/frdf1.o: ../../../lib/pkg/src/fortran/frdf1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/frdf1.o ../../../lib/pkg/src/fortran/frdf1.f

${OBJECTDIR}/_ext/968817101/iset.o: ../../../lib/pkg/src/fortran/iset.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/iset.o ../../../lib/pkg/src/fortran/iset.f

${OBJECTDIR}/_ext/968817101/imptra.o: ../../../lib/pkg/src/fortran/imptra.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/imptra.o ../../../lib/pkg/src/fortran/imptra.f

${OBJECTDIR}/_ext/968817101/stack_convert.o: ../../../lib/pkg/src/fortran/stack_convert.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/stack_convert.o ../../../lib/pkg/src/fortran/stack_convert.f

${OBJECTDIR}/_ext/1457928084/dbsk0e.o: ../../../lib/pkg/src/fortran/slatec/dbsk0e.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbsk0e.o ../../../lib/pkg/src/fortran/slatec/dbsk0e.f

${OBJECTDIR}/_ext/968817101/intzgschur.o: ../../../lib/pkg/src/fortran/intzgschur.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgschur.o ../../../lib/pkg/src/fortran/intzgschur.f

${OBJECTDIR}/_ext/968817101/icse2.o: ../../../lib/pkg/src/fortran/icse2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/icse2.o ../../../lib/pkg/src/fortran/icse2.f

${OBJECTDIR}/_ext/968817101/intdgeqpf3.o: ../../../lib/pkg/src/fortran/intdgeqpf3.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgeqpf3.o ../../../lib/pkg/src/fortran/intdgeqpf3.f

${OBJECTDIR}/_ext/968817101/cbal.o: ../../../lib/pkg/src/fortran/cbal.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cbal.o ../../../lib/pkg/src/fortran/cbal.f

${OBJECTDIR}/_ext/968817101/rednor.o: ../../../lib/pkg/src/fortran/rednor.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rednor.o ../../../lib/pkg/src/fortran/rednor.f

${OBJECTDIR}/_ext/968817101/cmplxt.o: ../../../lib/pkg/src/fortran/cmplxt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cmplxt.o ../../../lib/pkg/src/fortran/cmplxt.f

${OBJECTDIR}/_ext/968817101/hammin.o: ../../../lib/pkg/src/fortran/hammin.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/hammin.o ../../../lib/pkg/src/fortran/hammin.f

${OBJECTDIR}/_ext/968817101/wspmsp.o: ../../../lib/pkg/src/fortran/wspmsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspmsp.o ../../../lib/pkg/src/fortran/wspmsp.f

${OBJECTDIR}/_ext/968817101/lsstyp.o: ../../../lib/pkg/src/fortran/lsstyp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lsstyp.o ../../../lib/pkg/src/fortran/lsstyp.f

${OBJECTDIR}/_ext/968817101/getnum.o: ../../../lib/pkg/src/fortran/getnum.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/getnum.o ../../../lib/pkg/src/fortran/getnum.f

${OBJECTDIR}/_ext/968817101/dmptra.o: ../../../lib/pkg/src/fortran/dmptra.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmptra.o ../../../lib/pkg/src/fortran/dmptra.f

${OBJECTDIR}/_ext/968817101/gennf.o: ../../../lib/pkg/src/fortran/gennf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/gennf.o ../../../lib/pkg/src/fortran/gennf.f

${OBJECTDIR}/_ext/968817101/findl.o: ../../../lib/pkg/src/fortran/findl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/findl.o ../../../lib/pkg/src/fortran/findl.f

${OBJECTDIR}/_ext/968817101/dwpow1.o: ../../../lib/pkg/src/fortran/dwpow1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dwpow1.o ../../../lib/pkg/src/fortran/dwpow1.f

${OBJECTDIR}/_ext/944810281/dpmpar.o: ../../../lib/pkg/src/fortran/minpack/dpmpar.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/dpmpar.o ../../../lib/pkg/src/fortran/minpack/dpmpar.f

${OBJECTDIR}/_ext/968817101/wspms.o: ../../../lib/pkg/src/fortran/wspms.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspms.o ../../../lib/pkg/src/fortran/wspms.f

${OBJECTDIR}/_ext/968817101/dbesyg.o: ../../../lib/pkg/src/fortran/dbesyg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dbesyg.o ../../../lib/pkg/src/fortran/dbesyg.f

${OBJECTDIR}/_ext/968817101/v2cunit.o: ../../../lib/pkg/src/fortran/v2cunit.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/v2cunit.o ../../../lib/pkg/src/fortran/v2cunit.f

${OBJECTDIR}/_ext/968817101/ftree3.o: ../../../lib/pkg/src/fortran/ftree3.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ftree3.o ../../../lib/pkg/src/fortran/ftree3.f

${OBJECTDIR}/_ext/968817101/i_a_i.o: ../../../lib/pkg/src/fortran/i_a_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_a_i.o ../../../lib/pkg/src/fortran/i_a_i.f

${OBJECTDIR}/_ext/968817101/prepji.o: ../../../lib/pkg/src/fortran/prepji.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/prepji.o ../../../lib/pkg/src/fortran/prepji.f

${OBJECTDIR}/_ext/57306600/pade.o: ../../../lib/pkg/src/fortran/linpack/pade.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/pade.o ../../../lib/pkg/src/fortran/linpack/pade.f

${OBJECTDIR}/_ext/968817101/setlnb.o: ../../../lib/pkg/src/fortran/setlnb.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/setlnb.o ../../../lib/pkg/src/fortran/setlnb.f

${OBJECTDIR}/_ext/968817101/getlin.o: ../../../lib/pkg/src/fortran/getlin.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/getlin.o ../../../lib/pkg/src/fortran/getlin.f

${OBJECTDIR}/_ext/1457928084/zlog.o: ../../../lib/pkg/src/fortran/slatec/zlog.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zlog.o ../../../lib/pkg/src/fortran/slatec/zlog.f

${OBJECTDIR}/_ext/968817101/n1qn2.o: ../../../lib/pkg/src/fortran/n1qn2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/n1qn2.o ../../../lib/pkg/src/fortran/n1qn2.f

${OBJECTDIR}/_ext/968817101/blkslv.o: ../../../lib/pkg/src/fortran/blkslv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/blkslv.o ../../../lib/pkg/src/fortran/blkslv.f

${OBJECTDIR}/_ext/968817101/watfac.o: ../../../lib/pkg/src/fortran/watfac.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/watfac.o ../../../lib/pkg/src/fortran/watfac.f

${OBJECTDIR}/_ext/968817101/n1qn3a.o: ../../../lib/pkg/src/fortran/n1qn3a.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/n1qn3a.o ../../../lib/pkg/src/fortran/n1qn3a.f

${OBJECTDIR}/_ext/1457928084/zasyi.o: ../../../lib/pkg/src/fortran/slatec/zasyi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zasyi.o ../../../lib/pkg/src/fortran/slatec/zasyi.f

${OBJECTDIR}/_ext/968817101/wmpad.o: ../../../lib/pkg/src/fortran/wmpad.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wmpad.o ../../../lib/pkg/src/fortran/wmpad.f

${OBJECTDIR}/_ext/968817101/dsmsp.o: ../../../lib/pkg/src/fortran/dsmsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dsmsp.o ../../../lib/pkg/src/fortran/dsmsp.f

${OBJECTDIR}/_ext/968817101/wspe2.o: ../../../lib/pkg/src/fortran/wspe2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspe2.o ../../../lib/pkg/src/fortran/wspe2.f

${OBJECTDIR}/_ext/968817101/dsosp.o: ../../../lib/pkg/src/fortran/dsosp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dsosp.o ../../../lib/pkg/src/fortran/dsosp.f

${OBJECTDIR}/_ext/968817101/ql0001.o: ../../../lib/pkg/src/fortran/ql0001.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ql0001.o ../../../lib/pkg/src/fortran/ql0001.f

${OBJECTDIR}/_ext/968817101/epsalg.o: ../../../lib/pkg/src/fortran/epsalg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/epsalg.o ../../../lib/pkg/src/fortran/epsalg.f

${OBJECTDIR}/_ext/968817101/somespline.o: ../../../lib/pkg/src/fortran/somespline.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/somespline.o ../../../lib/pkg/src/fortran/somespline.f

${OBJECTDIR}/_ext/968817101/scapol.o: ../../../lib/pkg/src/fortran/scapol.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/scapol.o ../../../lib/pkg/src/fortran/scapol.f

${OBJECTDIR}/_ext/968817101/spcho1.o: ../../../lib/pkg/src/fortran/spcho1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spcho1.o ../../../lib/pkg/src/fortran/spcho1.f

${OBJECTDIR}/_ext/968817101/dspms.o: ../../../lib/pkg/src/fortran/dspms.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspms.o ../../../lib/pkg/src/fortran/dspms.f

${OBJECTDIR}/_ext/968817101/dbesjg.o: ../../../lib/pkg/src/fortran/dbesjg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dbesjg.o ../../../lib/pkg/src/fortran/dbesjg.f

${OBJECTDIR}/_ext/968817101/sawtth.o: ../../../lib/pkg/src/fortran/sawtth.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sawtth.o ../../../lib/pkg/src/fortran/sawtth.f

${OBJECTDIR}/_ext/968817101/fmlag1.o: ../../../lib/pkg/src/fortran/fmlag1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fmlag1.o ../../../lib/pkg/src/fortran/fmlag1.f

${OBJECTDIR}/_ext/1457928084/dbsi1e.o: ../../../lib/pkg/src/fortran/slatec/dbsi1e.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbsi1e.o ../../../lib/pkg/src/fortran/slatec/dbsi1e.f

${OBJECTDIR}/_ext/968817101/dwpow.o: ../../../lib/pkg/src/fortran/dwpow.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dwpow.o ../../../lib/pkg/src/fortran/dwpow.f

${OBJECTDIR}/_ext/968817101/sfact1.o: ../../../lib/pkg/src/fortran/sfact1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sfact1.o ../../../lib/pkg/src/fortran/sfact1.f

${OBJECTDIR}/_ext/968817101/dmcopy.o: ../../../lib/pkg/src/fortran/dmcopy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmcopy.o ../../../lib/pkg/src/fortran/dmcopy.f

${OBJECTDIR}/_ext/968817101/ddif.o: ../../../lib/pkg/src/fortran/ddif.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ddif.o ../../../lib/pkg/src/fortran/ddif.f

${OBJECTDIR}/_ext/968817101/rkf45.o: ../../../lib/pkg/src/fortran/rkf45.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rkf45.o ../../../lib/pkg/src/fortran/rkf45.f

${OBJECTDIR}/_ext/1457928084/dbesk1.o: ../../../lib/pkg/src/fortran/slatec/dbesk1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesk1.o ../../../lib/pkg/src/fortran/slatec/dbesk1.f

${OBJECTDIR}/_ext/1457928084/dxlegf.o: ../../../lib/pkg/src/fortran/slatec/dxlegf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dxlegf.o ../../../lib/pkg/src/fortran/slatec/dxlegf.f

${OBJECTDIR}/_ext/968817101/stack.o: ../../../lib/pkg/src/fortran/stack.h 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/stack.o ../../../lib/pkg/src/fortran/stack.h

${OBJECTDIR}/_ext/968817101/qitz.o: ../../../lib/pkg/src/fortran/qitz.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/qitz.o ../../../lib/pkg/src/fortran/qitz.f

${OBJECTDIR}/_ext/968817101/clause.o: ../../../lib/pkg/src/fortran/clause.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/clause.o ../../../lib/pkg/src/fortran/clause.f

${OBJECTDIR}/_ext/968817101/svcma1.o: ../../../lib/pkg/src/fortran/svcma1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/svcma1.o ../../../lib/pkg/src/fortran/svcma1.f

${OBJECTDIR}/_ext/968817101/memused.o: ../../../lib/pkg/src/fortran/memused.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/memused.o ../../../lib/pkg/src/fortran/memused.f

${OBJECTDIR}/_ext/1457928084/dbesk0.o: ../../../lib/pkg/src/fortran/slatec/dbesk0.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesk0.o ../../../lib/pkg/src/fortran/slatec/dbesk0.f

${OBJECTDIR}/_ext/968817101/sinblk.o: ../../../lib/pkg/src/fortran/sinblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sinblk.o ../../../lib/pkg/src/fortran/sinblk.f

${OBJECTDIR}/_ext/968817101/outl2.o: ../../../lib/pkg/src/fortran/outl2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/outl2.o ../../../lib/pkg/src/fortran/outl2.f

${OBJECTDIR}/_ext/968817101/spsort.o: ../../../lib/pkg/src/fortran/spsort.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spsort.o ../../../lib/pkg/src/fortran/spsort.f

${OBJECTDIR}/_ext/968817101/intzggbal.o: ../../../lib/pkg/src/fortran/intzggbal.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzggbal.o ../../../lib/pkg/src/fortran/intzggbal.f

${OBJECTDIR}/_ext/968817101/termf.o: ../../../lib/pkg/src/fortran/termf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/termf.o ../../../lib/pkg/src/fortran/termf.f

${OBJECTDIR}/_ext/968817101/i_abs.o: ../../../lib/pkg/src/fortran/i_abs.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_abs.o ../../../lib/pkg/src/fortran/i_abs.f

${OBJECTDIR}/_ext/968817101/dbasin.o: ../../../lib/pkg/src/fortran/dbasin.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dbasin.o ../../../lib/pkg/src/fortran/dbasin.f

${OBJECTDIR}/_ext/968817101/wmptra.o: ../../../lib/pkg/src/fortran/wmptra.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wmptra.o ../../../lib/pkg/src/fortran/wmptra.f

${OBJECTDIR}/_ext/968817101/modul.o: ../../../lib/pkg/src/fortran/modul.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/modul.o ../../../lib/pkg/src/fortran/modul.f

${OBJECTDIR}/_ext/1457928084/d9b1mp.o: ../../../lib/pkg/src/fortran/slatec/d9b1mp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/d9b1mp.o ../../../lib/pkg/src/fortran/slatec/d9b1mp.f

${OBJECTDIR}/_ext/968817101/writebuf.o: ../../../lib/pkg/src/fortran/writebuf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/writebuf.o ../../../lib/pkg/src/fortran/writebuf.f

${OBJECTDIR}/_ext/968817101/compel.o: ../../../lib/pkg/src/fortran/compel.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/compel.o ../../../lib/pkg/src/fortran/compel.f

${OBJECTDIR}/_ext/968817101/dgbsl.o: ../../../lib/pkg/src/fortran/dgbsl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dgbsl.o ../../../lib/pkg/src/fortran/dgbsl.f

${OBJECTDIR}/_ext/1457928084/dtensbs.o: ../../../lib/pkg/src/fortran/slatec/dtensbs.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dtensbs.o ../../../lib/pkg/src/fortran/slatec/dtensbs.f

${OBJECTDIR}/_ext/968817101/intdgesv4.o: ../../../lib/pkg/src/fortran/intdgesv4.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgesv4.o ../../../lib/pkg/src/fortran/intdgesv4.f

${OBJECTDIR}/_ext/968817101/intzgeqpf3.o: ../../../lib/pkg/src/fortran/intzgeqpf3.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgeqpf3.o ../../../lib/pkg/src/fortran/intzgeqpf3.f

${OBJECTDIR}/_ext/968817101/wspmat.o: ../../../lib/pkg/src/fortran/wspmat.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspmat.o ../../../lib/pkg/src/fortran/wspmat.f

${OBJECTDIR}/_ext/968817101/lstops.o: ../../../lib/pkg/src/fortran/lstops.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lstops.o ../../../lib/pkg/src/fortran/lstops.f

${OBJECTDIR}/_ext/968817101/intzgees1.o: ../../../lib/pkg/src/fortran/intzgees1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgees1.o ../../../lib/pkg/src/fortran/intzgees1.f

${OBJECTDIR}/_ext/968817101/intdpotrf.o: ../../../lib/pkg/src/fortran/intdpotrf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdpotrf.o ../../../lib/pkg/src/fortran/intdpotrf.f

${OBJECTDIR}/_ext/968817101/n1gc2a.o: ../../../lib/pkg/src/fortran/n1gc2a.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/n1gc2a.o ../../../lib/pkg/src/fortran/n1gc2a.f

${OBJECTDIR}/_ext/968817101/matra.o: ../../../lib/pkg/src/fortran/matra.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/matra.o ../../../lib/pkg/src/fortran/matra.f

${OBJECTDIR}/_ext/968817101/newest.o: ../../../lib/pkg/src/fortran/newest.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/newest.o ../../../lib/pkg/src/fortran/newest.f

${OBJECTDIR}/_ext/968817101/intdgees0.o: ../../../lib/pkg/src/fortran/intdgees0.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgees0.o ../../../lib/pkg/src/fortran/intdgees0.f

${OBJECTDIR}/_ext/968817101/fcomp1.o: ../../../lib/pkg/src/fortran/fcomp1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fcomp1.o ../../../lib/pkg/src/fortran/fcomp1.f

${OBJECTDIR}/_ext/968817101/ddmpev.o: ../../../lib/pkg/src/fortran/ddmpev.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ddmpev.o ../../../lib/pkg/src/fortran/ddmpev.f

${OBJECTDIR}/_ext/968817101/i_x_i.o: ../../../lib/pkg/src/fortran/i_x_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_x_i.o ../../../lib/pkg/src/fortran/i_x_i.f

${OBJECTDIR}/_ext/968817101/dipow.o: ../../../lib/pkg/src/fortran/dipow.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dipow.o ../../../lib/pkg/src/fortran/dipow.f

${OBJECTDIR}/_ext/968817101/wddiv.o: ../../../lib/pkg/src/fortran/wddiv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wddiv.o ../../../lib/pkg/src/fortran/wddiv.f

${OBJECTDIR}/_ext/968817101/horner.o: ../../../lib/pkg/src/fortran/horner.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/horner.o ../../../lib/pkg/src/fortran/horner.f

${OBJECTDIR}/_ext/968817101/trbipo.o: ../../../lib/pkg/src/fortran/trbipo.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/trbipo.o ../../../lib/pkg/src/fortran/trbipo.f

${OBJECTDIR}/_ext/968817101/lspful.o: ../../../lib/pkg/src/fortran/lspful.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lspful.o ../../../lib/pkg/src/fortran/lspful.f

${OBJECTDIR}/_ext/968817101/lst2vars.o: ../../../lib/pkg/src/fortran/lst2vars.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lst2vars.o ../../../lib/pkg/src/fortran/lst2vars.f

${OBJECTDIR}/_ext/968817101/prja.o: ../../../lib/pkg/src/fortran/prja.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/prja.o ../../../lib/pkg/src/fortran/prja.f

${OBJECTDIR}/_ext/968817101/wdrdiv.o: ../../../lib/pkg/src/fortran/wdrdiv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wdrdiv.o ../../../lib/pkg/src/fortran/wdrdiv.f

${OBJECTDIR}/_ext/968817101/intzgges.o: ../../../lib/pkg/src/fortran/intzgges.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgges.o ../../../lib/pkg/src/fortran/intzgges.f

${OBJECTDIR}/_ext/968817101/sctree.o: ../../../lib/pkg/src/fortran/sctree.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sctree.o ../../../lib/pkg/src/fortran/sctree.f

${OBJECTDIR}/_ext/968817101/dgee01.o: ../../../lib/pkg/src/fortran/dgee01.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dgee01.o ../../../lib/pkg/src/fortran/dgee01.f

${OBJECTDIR}/_ext/968817101/r4tx.o: ../../../lib/pkg/src/fortran/r4tx.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/r4tx.o ../../../lib/pkg/src/fortran/r4tx.f

${OBJECTDIR}/_ext/1457928084/dexint.o: ../../../lib/pkg/src/fortran/slatec/dexint.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dexint.o ../../../lib/pkg/src/fortran/slatec/dexint.f

${OBJECTDIR}/_ext/944810281/hybrj.o: ../../../lib/pkg/src/fortran/minpack/hybrj.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/hybrj.o ../../../lib/pkg/src/fortran/minpack/hybrj.f

${OBJECTDIR}/_ext/1457928084/dbesi.o: ../../../lib/pkg/src/fortran/slatec/dbesi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesi.o ../../../lib/pkg/src/fortran/slatec/dbesi.f

${OBJECTDIR}/_ext/968817101/wmsum.o: ../../../lib/pkg/src/fortran/wmsum.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wmsum.o ../../../lib/pkg/src/fortran/wmsum.f

${OBJECTDIR}/_ext/1457928084/dgamrn.o: ../../../lib/pkg/src/fortran/slatec/dgamrn.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dgamrn.o ../../../lib/pkg/src/fortran/slatec/dgamrn.f

${OBJECTDIR}/_ext/968817101/udptr.o: ../../../lib/pkg/src/fortran/udptr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/udptr.o ../../../lib/pkg/src/fortran/udptr.f

${OBJECTDIR}/_ext/968817101/blkfct.o: ../../../lib/pkg/src/fortran/blkfct.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/blkfct.o ../../../lib/pkg/src/fortran/blkfct.f

${OBJECTDIR}/_ext/968817101/zqnbd.o: ../../../lib/pkg/src/fortran/zqnbd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/zqnbd.o ../../../lib/pkg/src/fortran/zqnbd.f

${OBJECTDIR}/_ext/968817101/ftree4.o: ../../../lib/pkg/src/fortran/ftree4.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ftree4.o ../../../lib/pkg/src/fortran/ftree4.f

${OBJECTDIR}/_ext/968817101/wesidu.o: ../../../lib/pkg/src/fortran/wesidu.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wesidu.o ../../../lib/pkg/src/fortran/wesidu.f

${OBJECTDIR}/_ext/968817101/lspmat.o: ../../../lib/pkg/src/fortran/lspmat.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lspmat.o ../../../lib/pkg/src/fortran/lspmat.f

${OBJECTDIR}/_ext/968817101/wperm.o: ../../../lib/pkg/src/fortran/wperm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wperm.o ../../../lib/pkg/src/fortran/wperm.f

${OBJECTDIR}/_ext/968817101/hpdel.o: ../../../lib/pkg/src/fortran/hpdel.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/hpdel.o ../../../lib/pkg/src/fortran/hpdel.f

${OBJECTDIR}/_ext/968817101/hilber.o: ../../../lib/pkg/src/fortran/hilber.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/hilber.o ../../../lib/pkg/src/fortran/hilber.f

${OBJECTDIR}/_ext/1457928084/zbesi.o: ../../../lib/pkg/src/fortran/slatec/zbesi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zbesi.o ../../../lib/pkg/src/fortran/slatec/zbesi.f

${OBJECTDIR}/_ext/968817101/drdiv.o: ../../../lib/pkg/src/fortran/drdiv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/drdiv.o ../../../lib/pkg/src/fortran/drdiv.f

${OBJECTDIR}/_ext/968817101/dmpdsp.o: ../../../lib/pkg/src/fortran/dmpdsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmpdsp.o ../../../lib/pkg/src/fortran/dmpdsp.f

${OBJECTDIR}/_ext/968817101/stoda.o: ../../../lib/pkg/src/fortran/stoda.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/stoda.o ../../../lib/pkg/src/fortran/stoda.f

${OBJECTDIR}/_ext/968817101/degree.o: ../../../lib/pkg/src/fortran/degree.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/degree.o ../../../lib/pkg/src/fortran/degree.f

${OBJECTDIR}/_ext/968817101/maxblk.o: ../../../lib/pkg/src/fortran/maxblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/maxblk.o ../../../lib/pkg/src/fortran/maxblk.f

${OBJECTDIR}/_ext/1457928084/d9knus.o: ../../../lib/pkg/src/fortran/slatec/d9knus.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/d9knus.o ../../../lib/pkg/src/fortran/slatec/d9knus.f

${OBJECTDIR}/_ext/1457928084/zbunk.o: ../../../lib/pkg/src/fortran/slatec/zbunk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zbunk.o ../../../lib/pkg/src/fortran/slatec/zbunk.f

${OBJECTDIR}/_ext/968817101/wwrdiv.o: ../../../lib/pkg/src/fortran/wwrdiv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wwrdiv.o ../../../lib/pkg/src/fortran/wwrdiv.f

${OBJECTDIR}/_ext/968817101/phrtsd.o: ../../../lib/pkg/src/fortran/phrtsd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/phrtsd.o ../../../lib/pkg/src/fortran/phrtsd.f

${OBJECTDIR}/_ext/968817101/i_f_i.o: ../../../lib/pkg/src/fortran/i_f_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_f_i.o ../../../lib/pkg/src/fortran/i_f_i.f

${OBJECTDIR}/_ext/968817101/delay.o: ../../../lib/pkg/src/fortran/delay.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/delay.o ../../../lib/pkg/src/fortran/delay.f

${OBJECTDIR}/_ext/968817101/intdgebal.o: ../../../lib/pkg/src/fortran/intdgebal.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgebal.o ../../../lib/pkg/src/fortran/intdgebal.f

${OBJECTDIR}/_ext/57306600/hhdml.o: ../../../lib/pkg/src/fortran/linpack/hhdml.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/hhdml.o ../../../lib/pkg/src/fortran/linpack/hhdml.f

${OBJECTDIR}/_ext/968817101/entier.o: ../../../lib/pkg/src/fortran/entier.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/entier.o ../../../lib/pkg/src/fortran/entier.f

${OBJECTDIR}/_ext/968817101/calcsc.o: ../../../lib/pkg/src/fortran/calcsc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/calcsc.o ../../../lib/pkg/src/fortran/calcsc.f

${OBJECTDIR}/_ext/968817101/rcopy.o: ../../../lib/pkg/src/fortran/rcopy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rcopy.o ../../../lib/pkg/src/fortran/rcopy.f

${OBJECTDIR}/_ext/968817101/wrscal.o: ../../../lib/pkg/src/fortran/wrscal.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wrscal.o ../../../lib/pkg/src/fortran/wrscal.f

${OBJECTDIR}/_ext/968817101/intzgees0.o: ../../../lib/pkg/src/fortran/intzgees0.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgees0.o ../../../lib/pkg/src/fortran/intzgees0.f

${OBJECTDIR}/_ext/968817101/hessl2.o: ../../../lib/pkg/src/fortran/hessl2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/hessl2.o ../../../lib/pkg/src/fortran/hessl2.f

${OBJECTDIR}/_ext/57306600/dgeco.o: ../../../lib/pkg/src/fortran/linpack/dgeco.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/dgeco.o ../../../lib/pkg/src/fortran/linpack/dgeco.f

${OBJECTDIR}/_ext/968817101/varfunptr.o: ../../../lib/pkg/src/fortran/varfunptr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/varfunptr.o ../../../lib/pkg/src/fortran/varfunptr.f

${OBJECTDIR}/_ext/968817101/ribesl.o: ../../../lib/pkg/src/fortran/ribesl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ribesl.o ../../../lib/pkg/src/fortran/ribesl.f

${OBJECTDIR}/_ext/968817101/symfct.o: ../../../lib/pkg/src/fortran/symfct.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/symfct.o ../../../lib/pkg/src/fortran/symfct.f

${OBJECTDIR}/_ext/968817101/dsslti.o: ../../../lib/pkg/src/fortran/dsslti.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dsslti.o ../../../lib/pkg/src/fortran/dsslti.f

${OBJECTDIR}/_ext/1457928084/zbesk.o: ../../../lib/pkg/src/fortran/slatec/zbesk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zbesk.o ../../../lib/pkg/src/fortran/slatec/zbesk.f

${OBJECTDIR}/_ext/968817101/kaiser.o: ../../../lib/pkg/src/fortran/kaiser.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/kaiser.o ../../../lib/pkg/src/fortran/kaiser.f

${OBJECTDIR}/_ext/968817101/powblk.o: ../../../lib/pkg/src/fortran/powblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/powblk.o ../../../lib/pkg/src/fortran/powblk.f

${OBJECTDIR}/_ext/968817101/spisp.o: ../../../lib/pkg/src/fortran/spisp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spisp.o ../../../lib/pkg/src/fortran/spisp.f

${OBJECTDIR}/_ext/968817101/tcsltj.o: ../../../lib/pkg/src/fortran/tcsltj.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/tcsltj.o ../../../lib/pkg/src/fortran/tcsltj.f

${OBJECTDIR}/_ext/968817101/fmulb1.o: ../../../lib/pkg/src/fortran/fmulb1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fmulb1.o ../../../lib/pkg/src/fortran/fmulb1.f

${OBJECTDIR}/_ext/968817101/intdgeqpf4.o: ../../../lib/pkg/src/fortran/intdgeqpf4.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgeqpf4.o ../../../lib/pkg/src/fortran/intdgeqpf4.f

${OBJECTDIR}/_ext/968817101/wdpow1.o: ../../../lib/pkg/src/fortran/wdpow1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wdpow1.o ../../../lib/pkg/src/fortran/wdpow1.f

${OBJECTDIR}/_ext/968817101/blktit.o: ../../../lib/pkg/src/fortran/blktit.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/blktit.o ../../../lib/pkg/src/fortran/blktit.f

${OBJECTDIR}/_ext/57306600/wgesl.o: ../../../lib/pkg/src/fortran/linpack/wgesl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/wgesl.o ../../../lib/pkg/src/fortran/linpack/wgesl.f

${OBJECTDIR}/_ext/968817101/wshrsl.o: ../../../lib/pkg/src/fortran/wshrsl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wshrsl.o ../../../lib/pkg/src/fortran/wshrsl.f

${OBJECTDIR}/_ext/968817101/psi.o: ../../../lib/pkg/src/fortran/psi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/psi.o ../../../lib/pkg/src/fortran/psi.f

${OBJECTDIR}/_ext/968817101/rybesl.o: ../../../lib/pkg/src/fortran/rybesl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rybesl.o ../../../lib/pkg/src/fortran/rybesl.f

${OBJECTDIR}/_ext/968817101/nextk.o: ../../../lib/pkg/src/fortran/nextk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/nextk.o ../../../lib/pkg/src/fortran/nextk.f

${OBJECTDIR}/_ext/968817101/dspxs.o: ../../../lib/pkg/src/fortran/dspxs.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspxs.o ../../../lib/pkg/src/fortran/dspxs.f

${OBJECTDIR}/_ext/1457928084/dgamln.o: ../../../lib/pkg/src/fortran/slatec/dgamln.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dgamln.o ../../../lib/pkg/src/fortran/slatec/dgamln.f

${OBJECTDIR}/_ext/968817101/corth.o: ../../../lib/pkg/src/fortran/corth.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/corth.o ../../../lib/pkg/src/fortran/corth.f

${OBJECTDIR}/_ext/1457928084/dyairy.o: ../../../lib/pkg/src/fortran/slatec/dyairy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dyairy.o ../../../lib/pkg/src/fortran/slatec/dyairy.f

${OBJECTDIR}/_ext/968817101/coef.o: ../../../lib/pkg/src/fortran/coef.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/coef.o ../../../lib/pkg/src/fortran/coef.f

${OBJECTDIR}/_ext/968817101/dwmpmu.o: ../../../lib/pkg/src/fortran/dwmpmu.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dwmpmu.o ../../../lib/pkg/src/fortran/dwmpmu.f

${OBJECTDIR}/_ext/1457928084/dbsynu.o: ../../../lib/pkg/src/fortran/slatec/dbsynu.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbsynu.o ../../../lib/pkg/src/fortran/slatec/dbsynu.f

${OBJECTDIR}/_ext/968817101/lusat.o: ../../../lib/pkg/src/fortran/lusat.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lusat.o ../../../lib/pkg/src/fortran/lusat.f

${OBJECTDIR}/_ext/968817101/bcomp.o: ../../../lib/pkg/src/fortran/bcomp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/bcomp.o ../../../lib/pkg/src/fortran/bcomp.f

${OBJECTDIR}/_ext/968817101/cusum.o: ../../../lib/pkg/src/fortran/cusum.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cusum.o ../../../lib/pkg/src/fortran/cusum.f

${OBJECTDIR}/_ext/968817101/wspcle.o: ../../../lib/pkg/src/fortran/wspcle.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspcle.o ../../../lib/pkg/src/fortran/wspcle.f

${OBJECTDIR}/_ext/968817101/gcp.o: ../../../lib/pkg/src/fortran/gcp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/gcp.o ../../../lib/pkg/src/fortran/gcp.f

${OBJECTDIR}/_ext/968817101/isort.o: ../../../lib/pkg/src/fortran/isort.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/isort.o ../../../lib/pkg/src/fortran/isort.f

${OBJECTDIR}/_ext/968817101/scitovv.o: ../../../lib/pkg/src/fortran/scitovv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/scitovv.o ../../../lib/pkg/src/fortran/scitovv.f

${OBJECTDIR}/_ext/968817101/zcross.o: ../../../lib/pkg/src/fortran/zcross.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/zcross.o ../../../lib/pkg/src/fortran/zcross.f

${OBJECTDIR}/_ext/968817101/i_cumprod.o: ../../../lib/pkg/src/fortran/i_cumprod.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_cumprod.o ../../../lib/pkg/src/fortran/i_cumprod.f

${OBJECTDIR}/_ext/968817101/chebc.o: ../../../lib/pkg/src/fortran/chebc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/chebc.o ../../../lib/pkg/src/fortran/chebc.f

${OBJECTDIR}/_ext/968817101/dfrmg.o: ../../../lib/pkg/src/fortran/dfrmg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dfrmg.o ../../../lib/pkg/src/fortran/dfrmg.f

${OBJECTDIR}/_ext/968817101/rattyp.o: ../../../lib/pkg/src/fortran/rattyp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rattyp.o ../../../lib/pkg/src/fortran/rattyp.f

${OBJECTDIR}/_ext/968817101/ddrdiv.o: ../../../lib/pkg/src/fortran/ddrdiv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ddrdiv.o ../../../lib/pkg/src/fortran/ddrdiv.f

${OBJECTDIR}/_ext/968817101/qnbd.o: ../../../lib/pkg/src/fortran/qnbd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/qnbd.o ../../../lib/pkg/src/fortran/qnbd.f

${OBJECTDIR}/_ext/968817101/mrknmd.o: ../../../lib/pkg/src/fortran/mrknmd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mrknmd.o ../../../lib/pkg/src/fortran/mrknmd.f

${OBJECTDIR}/_ext/968817101/stackr2d.o: ../../../lib/pkg/src/fortran/stackr2d.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/stackr2d.o ../../../lib/pkg/src/fortran/stackr2d.f

${OBJECTDIR}/_ext/968817101/lspt.o: ../../../lib/pkg/src/fortran/lspt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lspt.o ../../../lib/pkg/src/fortran/lspt.f

${OBJECTDIR}/_ext/968817101/n1gc2b.o: ../../../lib/pkg/src/fortran/n1gc2b.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/n1gc2b.o ../../../lib/pkg/src/fortran/n1gc2b.f

${OBJECTDIR}/_ext/968817101/fft842.o: ../../../lib/pkg/src/fortran/fft842.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fft842.o ../../../lib/pkg/src/fortran/fft842.f

${OBJECTDIR}/_ext/968817101/giv.o: ../../../lib/pkg/src/fortran/giv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/giv.o ../../../lib/pkg/src/fortran/giv.f

${OBJECTDIR}/_ext/968817101/dperm.o: ../../../lib/pkg/src/fortran/dperm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dperm.o ../../../lib/pkg/src/fortran/dperm.f

${OBJECTDIR}/_ext/968817101/i_b_i.o: ../../../lib/pkg/src/fortran/i_b_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_b_i.o ../../../lib/pkg/src/fortran/i_b_i.f

${OBJECTDIR}/_ext/968817101/writebufsfact.o: ../../../lib/pkg/src/fortran/writebufsfact.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/writebufsfact.o ../../../lib/pkg/src/fortran/writebufsfact.f

${OBJECTDIR}/_ext/968817101/wdiv.o: ../../../lib/pkg/src/fortran/wdiv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wdiv.o ../../../lib/pkg/src/fortran/wdiv.f

${OBJECTDIR}/_ext/968817101/fsv.o: ../../../lib/pkg/src/fortran/fsv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fsv.o ../../../lib/pkg/src/fortran/fsv.f

${OBJECTDIR}/_ext/944810281/r1updt.o: ../../../lib/pkg/src/fortran/minpack/r1updt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/r1updt.o ../../../lib/pkg/src/fortran/minpack/r1updt.f

${OBJECTDIR}/_ext/968817101/i_tril.o: ../../../lib/pkg/src/fortran/i_tril.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_tril.o ../../../lib/pkg/src/fortran/i_tril.f

${OBJECTDIR}/_ext/968817101/showstack.o: ../../../lib/pkg/src/fortran/showstack.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/showstack.o ../../../lib/pkg/src/fortran/showstack.f

${OBJECTDIR}/_ext/968817101/wwpow1.o: ../../../lib/pkg/src/fortran/wwpow1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wwpow1.o ../../../lib/pkg/src/fortran/wwpow1.f

${OBJECTDIR}/_ext/968817101/wspos.o: ../../../lib/pkg/src/fortran/wspos.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspos.o ../../../lib/pkg/src/fortran/wspos.f

${OBJECTDIR}/_ext/968817101/dbeskg.o: ../../../lib/pkg/src/fortran/dbeskg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dbeskg.o ../../../lib/pkg/src/fortran/dbeskg.f

${OBJECTDIR}/_ext/968817101/zbeshg.o: ../../../lib/pkg/src/fortran/zbeshg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/zbeshg.o ../../../lib/pkg/src/fortran/zbeshg.f

${OBJECTDIR}/_ext/968817101/deli2.o: ../../../lib/pkg/src/fortran/deli2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/deli2.o ../../../lib/pkg/src/fortran/deli2.f

${OBJECTDIR}/_ext/968817101/iseye.o: ../../../lib/pkg/src/fortran/iseye.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/iseye.o ../../../lib/pkg/src/fortran/iseye.f

${OBJECTDIR}/_ext/1457928084/zsqrt.o: ../../../lib/pkg/src/fortran/slatec/zsqrt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zsqrt.o ../../../lib/pkg/src/fortran/slatec/zsqrt.f

${OBJECTDIR}/_ext/968817101/intzgehrd.o: ../../../lib/pkg/src/fortran/intzgehrd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgehrd.o ../../../lib/pkg/src/fortran/intzgehrd.f

${OBJECTDIR}/_ext/968817101/dspos.o: ../../../lib/pkg/src/fortran/dspos.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspos.o ../../../lib/pkg/src/fortran/dspos.f

${OBJECTDIR}/_ext/944810281/hybrd1.o: ../../../lib/pkg/src/fortran/minpack/hybrd1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/hybrd1.o ../../../lib/pkg/src/fortran/minpack/hybrd1.f

${OBJECTDIR}/_ext/968817101/dpmul1.o: ../../../lib/pkg/src/fortran/dpmul1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dpmul1.o ../../../lib/pkg/src/fortran/dpmul1.f

${OBJECTDIR}/_ext/1855634266/balbak.o: ../../../lib/pkg/src/fortran/eispack/balbak.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1855634266
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1855634266/balbak.o ../../../lib/pkg/src/fortran/eispack/balbak.f

${OBJECTDIR}/_ext/968817101/dipowe.o: ../../../lib/pkg/src/fortran/dipowe.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dipowe.o ../../../lib/pkg/src/fortran/dipowe.f

${OBJECTDIR}/_ext/968817101/wdotcr.o: ../../../lib/pkg/src/fortran/wdotcr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wdotcr.o ../../../lib/pkg/src/fortran/wdotcr.f

${OBJECTDIR}/_ext/968817101/cupro.o: ../../../lib/pkg/src/fortran/cupro.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cupro.o ../../../lib/pkg/src/fortran/cupro.f

${OBJECTDIR}/_ext/968817101/arcosh.o: ../../../lib/pkg/src/fortran/arcosh.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/arcosh.o ../../../lib/pkg/src/fortran/arcosh.f

${OBJECTDIR}/_ext/968817101/rlbd.o: ../../../lib/pkg/src/fortran/rlbd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rlbd.o ../../../lib/pkg/src/fortran/rlbd.f

${OBJECTDIR}/_ext/968817101/indxg.o: ../../../lib/pkg/src/fortran/indxg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/indxg.o ../../../lib/pkg/src/fortran/indxg.f

${OBJECTDIR}/_ext/1457928084/dasyjy.o: ../../../lib/pkg/src/fortran/slatec/dasyjy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dasyjy.o ../../../lib/pkg/src/fortran/slatec/dasyjy.f

${OBJECTDIR}/_ext/968817101/spcompack.o: ../../../lib/pkg/src/fortran/spcompack.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spcompack.o ../../../lib/pkg/src/fortran/spcompack.f

${OBJECTDIR}/_ext/968817101/phi.o: ../../../lib/pkg/src/fortran/phi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/phi.o ../../../lib/pkg/src/fortran/phi.f

${OBJECTDIR}/_ext/968817101/fnorm.o: ../../../lib/pkg/src/fortran/fnorm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fnorm.o ../../../lib/pkg/src/fortran/fnorm.f

${OBJECTDIR}/_ext/968817101/whereis.o: ../../../lib/pkg/src/fortran/whereis.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/whereis.o ../../../lib/pkg/src/fortran/whereis.f

${OBJECTDIR}/_ext/968817101/dlradp.o: ../../../lib/pkg/src/fortran/dlradp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dlradp.o ../../../lib/pkg/src/fortran/dlradp.f

${OBJECTDIR}/_ext/968817101/watan.o: ../../../lib/pkg/src/fortran/watan.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/watan.o ../../../lib/pkg/src/fortran/watan.f

${OBJECTDIR}/_ext/968817101/cortr.o: ../../../lib/pkg/src/fortran/cortr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cortr.o ../../../lib/pkg/src/fortran/cortr.f

${OBJECTDIR}/_ext/968817101/bexec.o: ../../../lib/pkg/src/fortran/bexec.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/bexec.o ../../../lib/pkg/src/fortran/bexec.f

${OBJECTDIR}/_ext/968817101/syredi.o: ../../../lib/pkg/src/fortran/syredi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/syredi.o ../../../lib/pkg/src/fortran/syredi.f

${OBJECTDIR}/_ext/968817101/deli11.o: ../../../lib/pkg/src/fortran/deli11.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/deli11.o ../../../lib/pkg/src/fortran/deli11.f

${OBJECTDIR}/_ext/968817101/intdgetrf.o: ../../../lib/pkg/src/fortran/intdgetrf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgetrf.o ../../../lib/pkg/src/fortran/intdgetrf.f

${OBJECTDIR}/_ext/968817101/quarul.o: ../../../lib/pkg/src/fortran/quarul.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/quarul.o ../../../lib/pkg/src/fortran/quarul.f

${OBJECTDIR}/_ext/968817101/eselect.o: ../../../lib/pkg/src/fortran/eselect.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/eselect.o ../../../lib/pkg/src/fortran/eselect.f

${OBJECTDIR}/_ext/968817101/intrp2.o: ../../../lib/pkg/src/fortran/intrp2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intrp2.o ../../../lib/pkg/src/fortran/intrp2.f

${OBJECTDIR}/_ext/968817101/prntid.o: ../../../lib/pkg/src/fortran/prntid.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/prntid.o ../../../lib/pkg/src/fortran/prntid.f

${OBJECTDIR}/_ext/968817101/intozgschur.o: ../../../lib/pkg/src/fortran/intozgschur.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intozgschur.o ../../../lib/pkg/src/fortran/intozgschur.f

${OBJECTDIR}/_ext/968817101/amell.o: ../../../lib/pkg/src/fortran/amell.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/amell.o ../../../lib/pkg/src/fortran/amell.f

${OBJECTDIR}/_ext/968817101/dfftbi.o: ../../../lib/pkg/src/fortran/dfftbi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dfftbi.o ../../../lib/pkg/src/fortran/dfftbi.f

${OBJECTDIR}/_ext/968817101/majysa.o: ../../../lib/pkg/src/fortran/majysa.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/majysa.o ../../../lib/pkg/src/fortran/majysa.f

${OBJECTDIR}/_ext/968817101/lsposp.o: ../../../lib/pkg/src/fortran/lsposp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lsposp.o ../../../lib/pkg/src/fortran/lsposp.f

${OBJECTDIR}/_ext/968817101/dmp2pm.o: ../../../lib/pkg/src/fortran/dmp2pm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmp2pm.o ../../../lib/pkg/src/fortran/dmp2pm.f

${OBJECTDIR}/_ext/1457928084/xersve.o: ../../../lib/pkg/src/fortran/slatec/xersve.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/xersve.o ../../../lib/pkg/src/fortran/slatec/xersve.f

${OBJECTDIR}/_ext/968817101/wexchn.o: ../../../lib/pkg/src/fortran/wexchn.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wexchn.o ../../../lib/pkg/src/fortran/wexchn.f

${OBJECTDIR}/_ext/968817101/wdmpad.o: ../../../lib/pkg/src/fortran/wdmpad.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wdmpad.o ../../../lib/pkg/src/fortran/wdmpad.f

${OBJECTDIR}/_ext/968817101/transn.o: ../../../lib/pkg/src/fortran/transn.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/transn.o ../../../lib/pkg/src/fortran/transn.f

${OBJECTDIR}/_ext/968817101/intdgees1.o: ../../../lib/pkg/src/fortran/intdgees1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgees1.o ../../../lib/pkg/src/fortran/intdgees1.f

${OBJECTDIR}/_ext/968817101/shanph.o: ../../../lib/pkg/src/fortran/shanph.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/shanph.o ../../../lib/pkg/src/fortran/shanph.f

${OBJECTDIR}/_ext/968817101/intinttype.o: ../../../lib/pkg/src/fortran/intinttype.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intinttype.o ../../../lib/pkg/src/fortran/intinttype.f

${OBJECTDIR}/_ext/968817101/cerr.o: ../../../lib/pkg/src/fortran/cerr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cerr.o ../../../lib/pkg/src/fortran/cerr.f

${OBJECTDIR}/_ext/968817101/dspful.o: ../../../lib/pkg/src/fortran/dspful.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspful.o ../../../lib/pkg/src/fortran/dspful.f

${OBJECTDIR}/_ext/968817101/expblk.o: ../../../lib/pkg/src/fortran/expblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/expblk.o ../../../lib/pkg/src/fortran/expblk.f

${OBJECTDIR}/_ext/1457928084/balanc.o: ../../../lib/pkg/src/fortran/slatec/balanc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/balanc.o ../../../lib/pkg/src/fortran/slatec/balanc.f

${OBJECTDIR}/_ext/968817101/spextr1.o: ../../../lib/pkg/src/fortran/spextr1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spextr1.o ../../../lib/pkg/src/fortran/spextr1.f

${OBJECTDIR}/_ext/968817101/ortran.o: ../../../lib/pkg/src/fortran/ortran.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ortran.o ../../../lib/pkg/src/fortran/ortran.f

${OBJECTDIR}/_ext/968817101/satur.o: ../../../lib/pkg/src/fortran/satur.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/satur.o ../../../lib/pkg/src/fortran/satur.f

${OBJECTDIR}/_ext/968817101/dlslv.o: ../../../lib/pkg/src/fortran/dlslv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dlslv.o ../../../lib/pkg/src/fortran/dlslv.f

${OBJECTDIR}/_ext/968817101/command.o: ../../../lib/pkg/src/fortran/command.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/command.o ../../../lib/pkg/src/fortran/command.f

${OBJECTDIR}/_ext/968817101/dspfit.o: ../../../lib/pkg/src/fortran/dspfit.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspfit.o ../../../lib/pkg/src/fortran/dspfit.f

${OBJECTDIR}/_ext/968817101/icse.o: ../../../lib/pkg/src/fortran/icse.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/icse.o ../../../lib/pkg/src/fortran/icse.f

${OBJECTDIR}/_ext/968817101/lcomp.o: ../../../lib/pkg/src/fortran/lcomp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lcomp.o ../../../lib/pkg/src/fortran/lcomp.f

${OBJECTDIR}/_ext/968817101/wswap.o: ../../../lib/pkg/src/fortran/wswap.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wswap.o ../../../lib/pkg/src/fortran/wswap.f

${OBJECTDIR}/_ext/968817101/wdpow.o: ../../../lib/pkg/src/fortran/wdpow.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wdpow.o ../../../lib/pkg/src/fortran/wdpow.f

${OBJECTDIR}/_ext/968817101/intzfschur.o: ../../../lib/pkg/src/fortran/intzfschur.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzfschur.o ../../../lib/pkg/src/fortran/intzfschur.f

${OBJECTDIR}/_ext/968817101/i_s_i.o: ../../../lib/pkg/src/fortran/i_s_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_s_i.o ../../../lib/pkg/src/fortran/i_s_i.f

${OBJECTDIR}/_ext/968817101/genprm.o: ../../../lib/pkg/src/fortran/genprm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/genprm.o ../../../lib/pkg/src/fortran/genprm.f

${OBJECTDIR}/_ext/968817101/mzdivq.o: ../../../lib/pkg/src/fortran/mzdivq.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mzdivq.o ../../../lib/pkg/src/fortran/mzdivq.f

${OBJECTDIR}/_ext/968817101/dspln.o: ../../../lib/pkg/src/fortran/dspln.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspln.o ../../../lib/pkg/src/fortran/dspln.f

${OBJECTDIR}/_ext/968817101/isinstring.o: ../../../lib/pkg/src/fortran/isinstring.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/isinstring.o ../../../lib/pkg/src/fortran/isinstring.f

${OBJECTDIR}/_ext/968817101/stodi.o: ../../../lib/pkg/src/fortran/stodi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/stodi.o ../../../lib/pkg/src/fortran/stodi.f

${OBJECTDIR}/_ext/968817101/wij2sp.o: ../../../lib/pkg/src/fortran/wij2sp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wij2sp.o ../../../lib/pkg/src/fortran/wij2sp.f

${OBJECTDIR}/_ext/968817101/shrslv.o: ../../../lib/pkg/src/fortran/shrslv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/shrslv.o ../../../lib/pkg/src/fortran/shrslv.f

${OBJECTDIR}/_ext/968817101/sum3.o: ../../../lib/pkg/src/fortran/sum3.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sum3.o ../../../lib/pkg/src/fortran/sum3.f

${OBJECTDIR}/_ext/944810281/qrsolv.o: ../../../lib/pkg/src/fortran/minpack/qrsolv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/qrsolv.o ../../../lib/pkg/src/fortran/minpack/qrsolv.f

${OBJECTDIR}/_ext/968817101/n1gc2.o: ../../../lib/pkg/src/fortran/n1gc2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/n1gc2.o ../../../lib/pkg/src/fortran/n1gc2.f

${OBJECTDIR}/_ext/968817101/blkfc1.o: ../../../lib/pkg/src/fortran/blkfc1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/blkfc1.o ../../../lib/pkg/src/fortran/blkfc1.f

${OBJECTDIR}/_ext/968817101/intzgetri.o: ../../../lib/pkg/src/fortran/intzgetri.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgetri.o ../../../lib/pkg/src/fortran/intzgetri.f

${OBJECTDIR}/_ext/968817101/wmpcle.o: ../../../lib/pkg/src/fortran/wmpcle.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wmpcle.o ../../../lib/pkg/src/fortran/wmpcle.f

${OBJECTDIR}/_ext/968817101/ordmmd.o: ../../../lib/pkg/src/fortran/ordmmd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ordmmd.o ../../../lib/pkg/src/fortran/ordmmd.f

${OBJECTDIR}/_ext/57306600/wgefa.o: ../../../lib/pkg/src/fortran/linpack/wgefa.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/wgefa.o ../../../lib/pkg/src/fortran/linpack/wgefa.f

${OBJECTDIR}/_ext/968817101/ajour.o: ../../../lib/pkg/src/fortran/ajour.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ajour.o ../../../lib/pkg/src/fortran/ajour.f

${OBJECTDIR}/_ext/968817101/i_diag.o: ../../../lib/pkg/src/fortran/i_diag.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_diag.o ../../../lib/pkg/src/fortran/i_diag.f

${OBJECTDIR}/_ext/968817101/fmuls1.o: ../../../lib/pkg/src/fortran/fmuls1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fmuls1.o ../../../lib/pkg/src/fortran/fmuls1.f

${OBJECTDIR}/_ext/968817101/getfun.o: ../../../lib/pkg/src/fortran/getfun.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/getfun.o ../../../lib/pkg/src/fortran/getfun.f

${OBJECTDIR}/_ext/1457928084/dbkisr.o: ../../../lib/pkg/src/fortran/slatec/dbkisr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbkisr.o ../../../lib/pkg/src/fortran/slatec/dbkisr.f

${OBJECTDIR}/_ext/968817101/wsposp.o: ../../../lib/pkg/src/fortran/wsposp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wsposp.o ../../../lib/pkg/src/fortran/wsposp.f

${OBJECTDIR}/_ext/968817101/desi11.o: ../../../lib/pkg/src/fortran/desi11.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/desi11.o ../../../lib/pkg/src/fortran/desi11.f

${OBJECTDIR}/_ext/968817101/dad.o: ../../../lib/pkg/src/fortran/dad.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dad.o ../../../lib/pkg/src/fortran/dad.f

${OBJECTDIR}/_ext/968817101/constinterp.o: ../../../lib/pkg/src/fortran/constinterp.h 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/constinterp.o ../../../lib/pkg/src/fortran/constinterp.h

${OBJECTDIR}/_ext/968817101/wpmul.o: ../../../lib/pkg/src/fortran/wpmul.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wpmul.o ../../../lib/pkg/src/fortran/wpmul.f

${OBJECTDIR}/_ext/968817101/readf.o: ../../../lib/pkg/src/fortran/readf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/readf.o ../../../lib/pkg/src/fortran/readf.f

${OBJECTDIR}/_ext/968817101/doldqr.o: ../../../lib/pkg/src/fortran/doldqr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/doldqr.o ../../../lib/pkg/src/fortran/doldqr.f

${OBJECTDIR}/_ext/1457928084/zrati.o: ../../../lib/pkg/src/fortran/slatec/zrati.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zrati.o ../../../lib/pkg/src/fortran/slatec/zrati.f

${OBJECTDIR}/_ext/968817101/dwrdiv.o: ../../../lib/pkg/src/fortran/dwrdiv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dwrdiv.o ../../../lib/pkg/src/fortran/dwrdiv.f

${OBJECTDIR}/_ext/968817101/lful2sp.o: ../../../lib/pkg/src/fortran/lful2sp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lful2sp.o ../../../lib/pkg/src/fortran/lful2sp.f

${OBJECTDIR}/_ext/968817101/genunf.o: ../../../lib/pkg/src/fortran/genunf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/genunf.o ../../../lib/pkg/src/fortran/genunf.f

${OBJECTDIR}/_ext/968817101/rchek2.o: ../../../lib/pkg/src/fortran/rchek2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rchek2.o ../../../lib/pkg/src/fortran/rchek2.f

${OBJECTDIR}/_ext/968817101/cheby.o: ../../../lib/pkg/src/fortran/cheby.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cheby.o ../../../lib/pkg/src/fortran/cheby.f

${OBJECTDIR}/_ext/57306600/dgbfa.o: ../../../lib/pkg/src/fortran/linpack/dgbfa.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/dgbfa.o ../../../lib/pkg/src/fortran/linpack/dgbfa.f

${OBJECTDIR}/_ext/968817101/dmpcle.o: ../../../lib/pkg/src/fortran/dmpcle.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmpcle.o ../../../lib/pkg/src/fortran/dmpcle.f

${OBJECTDIR}/_ext/968817101/majour.o: ../../../lib/pkg/src/fortran/majour.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/majour.o ../../../lib/pkg/src/fortran/majour.f

${OBJECTDIR}/_ext/1457928084/zmlt.o: ../../../lib/pkg/src/fortran/slatec/zmlt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zmlt.o ../../../lib/pkg/src/fortran/slatec/zmlt.f

${OBJECTDIR}/_ext/968817101/kronr.o: ../../../lib/pkg/src/fortran/kronr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/kronr.o ../../../lib/pkg/src/fortran/kronr.f

${OBJECTDIR}/_ext/968817101/dpodiv.o: ../../../lib/pkg/src/fortran/dpodiv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dpodiv.o ../../../lib/pkg/src/fortran/dpodiv.f

${OBJECTDIR}/_ext/968817101/filbut.o: ../../../lib/pkg/src/fortran/filbut.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/filbut.o ../../../lib/pkg/src/fortran/filbut.f

${OBJECTDIR}/_ext/968817101/fpq2.o: ../../../lib/pkg/src/fortran/fpq2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fpq2.o ../../../lib/pkg/src/fortran/fpq2.f

${OBJECTDIR}/_ext/1457928084/dbesi0.o: ../../../lib/pkg/src/fortran/slatec/dbesi0.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesi0.o ../../../lib/pkg/src/fortran/slatec/dbesi0.f

${OBJECTDIR}/_ext/968817101/matzs.o: ../../../lib/pkg/src/fortran/matzs.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/matzs.o ../../../lib/pkg/src/fortran/matzs.f

${OBJECTDIR}/_ext/968817101/ino.o: ../../../lib/pkg/src/fortran/ino.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ino.o ../../../lib/pkg/src/fortran/ino.f

${OBJECTDIR}/_ext/968817101/loren.o: ../../../lib/pkg/src/fortran/loren.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/loren.o ../../../lib/pkg/src/fortran/loren.f

${OBJECTDIR}/_ext/968817101/gennch.o: ../../../lib/pkg/src/fortran/gennch.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/gennch.o ../../../lib/pkg/src/fortran/gennch.f

${OBJECTDIR}/_ext/1457928084/zuoik.o: ../../../lib/pkg/src/fortran/slatec/zuoik.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zuoik.o ../../../lib/pkg/src/fortran/slatec/zuoik.f

${OBJECTDIR}/_ext/968817101/pythag.o: ../../../lib/pkg/src/fortran/pythag.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/pythag.o ../../../lib/pkg/src/fortran/pythag.f

${OBJECTDIR}/_ext/968817101/ignnbn.o: ../../../lib/pkg/src/fortran/ignnbn.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ignnbn.o ../../../lib/pkg/src/fortran/ignnbn.f

${OBJECTDIR}/_ext/968817101/dprxc.o: ../../../lib/pkg/src/fortran/dprxc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dprxc.o ../../../lib/pkg/src/fortran/dprxc.f

${OBJECTDIR}/_ext/968817101/savlod.o: ../../../lib/pkg/src/fortran/savlod.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/savlod.o ../../../lib/pkg/src/fortran/savlod.f

${OBJECTDIR}/_ext/1457928084/zairy.o: ../../../lib/pkg/src/fortran/slatec/zairy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zairy.o ../../../lib/pkg/src/fortran/slatec/zairy.f

${OBJECTDIR}/_ext/968817101/wpmul1.o: ../../../lib/pkg/src/fortran/wpmul1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wpmul1.o ../../../lib/pkg/src/fortran/wpmul1.f

${OBJECTDIR}/_ext/968817101/issymmetric.o: ../../../lib/pkg/src/fortran/issymmetric.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/issymmetric.o ../../../lib/pkg/src/fortran/issymmetric.f

${OBJECTDIR}/_ext/968817101/imcopy.o: ../../../lib/pkg/src/fortran/imcopy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/imcopy.o ../../../lib/pkg/src/fortran/imcopy.f

${OBJECTDIR}/_ext/968817101/fact.o: ../../../lib/pkg/src/fortran/fact.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fact.o ../../../lib/pkg/src/fortran/fact.f

${OBJECTDIR}/_ext/968817101/wsosp.o: ../../../lib/pkg/src/fortran/wsosp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wsosp.o ../../../lib/pkg/src/fortran/wsosp.f

${OBJECTDIR}/_ext/968817101/dqag0.o: ../../../lib/pkg/src/fortran/dqag0.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dqag0.o ../../../lib/pkg/src/fortran/dqag0.f

${OBJECTDIR}/_ext/968817101/lsode.o: ../../../lib/pkg/src/fortran/lsode.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lsode.o ../../../lib/pkg/src/fortran/lsode.f

${OBJECTDIR}/_ext/968817101/genexp.o: ../../../lib/pkg/src/fortran/genexp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/genexp.o ../../../lib/pkg/src/fortran/genexp.f

${OBJECTDIR}/_ext/1457928084/zbesy.o: ../../../lib/pkg/src/fortran/slatec/zbesy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zbesy.o ../../../lib/pkg/src/fortran/slatec/zbesy.f

${OBJECTDIR}/_ext/968817101/dvmul.o: ../../../lib/pkg/src/fortran/dvmul.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dvmul.o ../../../lib/pkg/src/fortran/dvmul.f

${OBJECTDIR}/_ext/57306600/dgesl.o: ../../../lib/pkg/src/fortran/linpack/dgesl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/dgesl.o ../../../lib/pkg/src/fortran/linpack/dgesl.f

${OBJECTDIR}/_ext/968817101/i_r_i.o: ../../../lib/pkg/src/fortran/i_r_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_r_i.o ../../../lib/pkg/src/fortran/i_r_i.f

${OBJECTDIR}/_ext/968817101/idegre.o: ../../../lib/pkg/src/fortran/idegre.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/idegre.o ../../../lib/pkg/src/fortran/idegre.f

${OBJECTDIR}/_ext/968817101/calsca.o: ../../../lib/pkg/src/fortran/calsca.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/calsca.o ../../../lib/pkg/src/fortran/calsca.f

${OBJECTDIR}/_ext/968817101/wmpcnc.o: ../../../lib/pkg/src/fortran/wmpcnc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wmpcnc.o ../../../lib/pkg/src/fortran/wmpcnc.f

${OBJECTDIR}/_ext/944810281/r1mpyq.o: ../../../lib/pkg/src/fortran/minpack/r1mpyq.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/r1mpyq.o ../../../lib/pkg/src/fortran/minpack/r1mpyq.f

${OBJECTDIR}/_ext/968817101/wdegre.o: ../../../lib/pkg/src/fortran/wdegre.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wdegre.o ../../../lib/pkg/src/fortran/wdegre.f

${OBJECTDIR}/_ext/968817101/desi24.o: ../../../lib/pkg/src/fortran/desi24.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/desi24.o ../../../lib/pkg/src/fortran/desi24.f

${OBJECTDIR}/_ext/968817101/cuproi.o: ../../../lib/pkg/src/fortran/cuproi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cuproi.o ../../../lib/pkg/src/fortran/cuproi.f

${OBJECTDIR}/_ext/968817101/lspcsp.o: ../../../lib/pkg/src/fortran/lspcsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lspcsp.o ../../../lib/pkg/src/fortran/lspcsp.f

${OBJECTDIR}/_ext/968817101/wvmul.o: ../../../lib/pkg/src/fortran/wvmul.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wvmul.o ../../../lib/pkg/src/fortran/wvmul.f

${OBJECTDIR}/_ext/968817101/jacl2.o: ../../../lib/pkg/src/fortran/jacl2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/jacl2.o ../../../lib/pkg/src/fortran/jacl2.f

${OBJECTDIR}/_ext/57306600/dqrsl.o: ../../../lib/pkg/src/fortran/linpack/dqrsl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/dqrsl.o ../../../lib/pkg/src/fortran/linpack/dqrsl.f

${OBJECTDIR}/_ext/968817101/ta2lpd.o: ../../../lib/pkg/src/fortran/ta2lpd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ta2lpd.o ../../../lib/pkg/src/fortran/ta2lpd.f

${OBJECTDIR}/_ext/968817101/matz.o: ../../../lib/pkg/src/fortran/matz.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/matz.o ../../../lib/pkg/src/fortran/matz.f

${OBJECTDIR}/_ext/968817101/i_cumsum.o: ../../../lib/pkg/src/fortran/i_cumsum.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_cumsum.o ../../../lib/pkg/src/fortran/i_cumsum.f

${OBJECTDIR}/_ext/968817101/writbufode.o: ../../../lib/pkg/src/fortran/writbufode.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/writbufode.o ../../../lib/pkg/src/fortran/writbufode.f

${OBJECTDIR}/_ext/968817101/dspt.o: ../../../lib/pkg/src/fortran/dspt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspt.o ../../../lib/pkg/src/fortran/dspt.f

${OBJECTDIR}/_ext/968817101/arl2a.o: ../../../lib/pkg/src/fortran/arl2a.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/arl2a.o ../../../lib/pkg/src/fortran/arl2a.f

${OBJECTDIR}/_ext/968817101/wprxc.o: ../../../lib/pkg/src/fortran/wprxc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wprxc.o ../../../lib/pkg/src/fortran/wprxc.f

${OBJECTDIR}/_ext/968817101/r8tx.o: ../../../lib/pkg/src/fortran/r8tx.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/r8tx.o ../../../lib/pkg/src/fortran/r8tx.f

${OBJECTDIR}/_ext/968817101/dlgama.o: ../../../lib/pkg/src/fortran/dlgama.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dlgama.o ../../../lib/pkg/src/fortran/dlgama.f

${OBJECTDIR}/_ext/968817101/sszer.o: ../../../lib/pkg/src/fortran/sszer.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sszer.o ../../../lib/pkg/src/fortran/sszer.f

${OBJECTDIR}/_ext/968817101/intp.o: ../../../lib/pkg/src/fortran/intp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intp.o ../../../lib/pkg/src/fortran/intp.f

${OBJECTDIR}/_ext/968817101/storeglobal.o: ../../../lib/pkg/src/fortran/storeglobal.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/storeglobal.o ../../../lib/pkg/src/fortran/storeglobal.f

${OBJECTDIR}/_ext/968817101/intplt.o: ../../../lib/pkg/src/fortran/intplt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intplt.o ../../../lib/pkg/src/fortran/intplt.f

${OBJECTDIR}/_ext/944810281/qrfac.o: ../../../lib/pkg/src/fortran/minpack/qrfac.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/qrfac.o ../../../lib/pkg/src/fortran/minpack/qrfac.f

${OBJECTDIR}/_ext/968817101/wmul.o: ../../../lib/pkg/src/fortran/wmul.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wmul.o ../../../lib/pkg/src/fortran/wmul.f

${OBJECTDIR}/_ext/968817101/mycmatptr.o: ../../../lib/pkg/src/fortran/mycmatptr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mycmatptr.o ../../../lib/pkg/src/fortran/mycmatptr.f

${OBJECTDIR}/_ext/968817101/bldenz.o: ../../../lib/pkg/src/fortran/bldenz.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/bldenz.o ../../../lib/pkg/src/fortran/bldenz.f

${OBJECTDIR}/_ext/968817101/basin.o: ../../../lib/pkg/src/fortran/basin.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/basin.o ../../../lib/pkg/src/fortran/basin.f

${OBJECTDIR}/_ext/968817101/intdgehrd.o: ../../../lib/pkg/src/fortran/intdgehrd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgehrd.o ../../../lib/pkg/src/fortran/intdgehrd.f

${OBJECTDIR}/_ext/968817101/gengam.o: ../../../lib/pkg/src/fortran/gengam.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/gengam.o ../../../lib/pkg/src/fortran/gengam.f

${OBJECTDIR}/_ext/1457928084/dbesks.o: ../../../lib/pkg/src/fortran/slatec/dbesks.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesks.o ../../../lib/pkg/src/fortran/slatec/dbesks.f

${OBJECTDIR}/_ext/968817101/error.o: ../../../lib/pkg/src/fortran/error.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/error.o ../../../lib/pkg/src/fortran/error.f

${OBJECTDIR}/_ext/968817101/wmprod.o: ../../../lib/pkg/src/fortran/wmprod.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wmprod.o ../../../lib/pkg/src/fortran/wmprod.f

${OBJECTDIR}/_ext/968817101/rpem.o: ../../../lib/pkg/src/fortran/rpem.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rpem.o ../../../lib/pkg/src/fortran/rpem.f

${OBJECTDIR}/_ext/968817101/lspasp.o: ../../../lib/pkg/src/fortran/lspasp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lspasp.o ../../../lib/pkg/src/fortran/lspasp.f

${OBJECTDIR}/_ext/1457928084/dbesy0.o: ../../../lib/pkg/src/fortran/slatec/dbesy0.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesy0.o ../../../lib/pkg/src/fortran/slatec/dbesy0.f

${OBJECTDIR}/_ext/968817101/wclmat.o: ../../../lib/pkg/src/fortran/wclmat.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wclmat.o ../../../lib/pkg/src/fortran/wclmat.f

${OBJECTDIR}/_ext/968817101/qzflr.o: ../../../lib/pkg/src/fortran/qzflr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/qzflr.o ../../../lib/pkg/src/fortran/qzflr.f

${OBJECTDIR}/_ext/968817101/wspcsp.o: ../../../lib/pkg/src/fortran/wspcsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspcsp.o ../../../lib/pkg/src/fortran/wspcsp.f

${OBJECTDIR}/_ext/57306600/dpofa.o: ../../../lib/pkg/src/fortran/linpack/dpofa.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/dpofa.o ../../../lib/pkg/src/fortran/linpack/dpofa.f

${OBJECTDIR}/_ext/1457928084/xgetua.o: ../../../lib/pkg/src/fortran/slatec/xgetua.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/xgetua.o ../../../lib/pkg/src/fortran/slatec/xgetua.f

${OBJECTDIR}/_ext/968817101/sp2col.o: ../../../lib/pkg/src/fortran/sp2col.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sp2col.o ../../../lib/pkg/src/fortran/sp2col.f

${OBJECTDIR}/_ext/968817101/cvname.o: ../../../lib/pkg/src/fortran/cvname.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cvname.o ../../../lib/pkg/src/fortran/cvname.f

${OBJECTDIR}/_ext/968817101/front.o: ../../../lib/pkg/src/fortran/front.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/front.o ../../../lib/pkg/src/fortran/front.f

${OBJECTDIR}/_ext/968817101/magic.o: ../../../lib/pkg/src/fortran/magic.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/magic.o ../../../lib/pkg/src/fortran/magic.f

${OBJECTDIR}/_ext/968817101/lsodar.o: ../../../lib/pkg/src/fortran/lsodar.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lsodar.o ../../../lib/pkg/src/fortran/lsodar.f

${OBJECTDIR}/_ext/968817101/unarybit.o: ../../../lib/pkg/src/fortran/unarybit.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/unarybit.o ../../../lib/pkg/src/fortran/unarybit.f

${OBJECTDIR}/_ext/968817101/bfgsd.o: ../../../lib/pkg/src/fortran/bfgsd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/bfgsd.o ../../../lib/pkg/src/fortran/bfgsd.f

${OBJECTDIR}/_ext/968817101/snell.o: ../../../lib/pkg/src/fortran/snell.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/snell.o ../../../lib/pkg/src/fortran/snell.f

${OBJECTDIR}/_ext/968817101/bnorm.o: ../../../lib/pkg/src/fortran/bnorm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/bnorm.o ../../../lib/pkg/src/fortran/bnorm.f

${OBJECTDIR}/_ext/968817101/dadd.o: ../../../lib/pkg/src/fortran/dadd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dadd.o ../../../lib/pkg/src/fortran/dadd.f

${OBJECTDIR}/_ext/968817101/majmin.o: ../../../lib/pkg/src/fortran/majmin.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/majmin.o ../../../lib/pkg/src/fortran/majmin.f

${OBJECTDIR}/_ext/57306600/wgeco.o: ../../../lib/pkg/src/fortran/linpack/wgeco.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/wgeco.o ../../../lib/pkg/src/fortran/linpack/wgeco.f

${OBJECTDIR}/_ext/968817101/dspis.o: ../../../lib/pkg/src/fortran/dspis.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspis.o ../../../lib/pkg/src/fortran/dspis.f

${OBJECTDIR}/_ext/1457928084/dbesj.o: ../../../lib/pkg/src/fortran/slatec/dbesj.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesj.o ../../../lib/pkg/src/fortran/slatec/dbesj.f

${OBJECTDIR}/_ext/968817101/deg1l2.o: ../../../lib/pkg/src/fortran/deg1l2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/deg1l2.o ../../../lib/pkg/src/fortran/deg1l2.f

${OBJECTDIR}/_ext/968817101/solsy.o: ../../../lib/pkg/src/fortran/solsy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/solsy.o ../../../lib/pkg/src/fortran/solsy.f

${OBJECTDIR}/_ext/944810281/qform.o: ../../../lib/pkg/src/fortran/minpack/qform.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/qform.o ../../../lib/pkg/src/fortran/minpack/qform.f

${OBJECTDIR}/_ext/968817101/lookup.o: ../../../lib/pkg/src/fortran/lookup.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lookup.o ../../../lib/pkg/src/fortran/lookup.f

${OBJECTDIR}/_ext/968817101/tscccf.o: ../../../lib/pkg/src/fortran/tscccf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/tscccf.o ../../../lib/pkg/src/fortran/tscccf.f

${OBJECTDIR}/_ext/968817101/lspe2.o: ../../../lib/pkg/src/fortran/lspe2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lspe2.o ../../../lib/pkg/src/fortran/lspe2.f

${OBJECTDIR}/_ext/968817101/compil.o: ../../../lib/pkg/src/fortran/compil.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/compil.o ../../../lib/pkg/src/fortran/compil.f

${OBJECTDIR}/_ext/968817101/ddpow1.o: ../../../lib/pkg/src/fortran/ddpow1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ddpow1.o ../../../lib/pkg/src/fortran/ddpow1.f

${OBJECTDIR}/_ext/968817101/wscal.o: ../../../lib/pkg/src/fortran/wscal.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wscal.o ../../../lib/pkg/src/fortran/wscal.f

${OBJECTDIR}/_ext/968817101/intzgesvd2.o: ../../../lib/pkg/src/fortran/intzgesvd2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgesvd2.o ../../../lib/pkg/src/fortran/intzgesvd2.f

${OBJECTDIR}/_ext/968817101/wwpowe.o: ../../../lib/pkg/src/fortran/wwpowe.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wwpowe.o ../../../lib/pkg/src/fortran/wwpowe.f

${OBJECTDIR}/_ext/968817101/writef.o: ../../../lib/pkg/src/fortran/writef.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/writef.o ../../../lib/pkg/src/fortran/writef.f

${OBJECTDIR}/_ext/1457928084/xermsg.o: ../../../lib/pkg/src/fortran/slatec/xermsg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/xermsg.o ../../../lib/pkg/src/fortran/slatec/xermsg.f

${OBJECTDIR}/_ext/968817101/scitoi.o: ../../../lib/pkg/src/fortran/scitoi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/scitoi.o ../../../lib/pkg/src/fortran/scitoi.f

${OBJECTDIR}/_ext/1457928084/zunk1.o: ../../../lib/pkg/src/fortran/slatec/zunk1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zunk1.o ../../../lib/pkg/src/fortran/slatec/zunk1.f

${OBJECTDIR}/_ext/968817101/wdmpmu.o: ../../../lib/pkg/src/fortran/wdmpmu.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wdmpmu.o ../../../lib/pkg/src/fortran/wdmpmu.f

${OBJECTDIR}/_ext/968817101/svcom1.o: ../../../lib/pkg/src/fortran/svcom1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/svcom1.o ../../../lib/pkg/src/fortran/svcom1.f

${OBJECTDIR}/_ext/968817101/isoval.o: ../../../lib/pkg/src/fortran/isoval.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/isoval.o ../../../lib/pkg/src/fortran/isoval.f

${OBJECTDIR}/_ext/968817101/nearfloat.o: ../../../lib/pkg/src/fortran/nearfloat.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/nearfloat.o ../../../lib/pkg/src/fortran/nearfloat.f

${OBJECTDIR}/_ext/1457928084/zuni2.o: ../../../lib/pkg/src/fortran/slatec/zuni2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zuni2.o ../../../lib/pkg/src/fortran/slatec/zuni2.f

${OBJECTDIR}/_ext/968817101/cfode.o: ../../../lib/pkg/src/fortran/cfode.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cfode.o ../../../lib/pkg/src/fortran/cfode.f

${OBJECTDIR}/_ext/968817101/stackp.o: ../../../lib/pkg/src/fortran/stackp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/stackp.o ../../../lib/pkg/src/fortran/stackp.f

${OBJECTDIR}/_ext/968817101/intdgesv3.o: ../../../lib/pkg/src/fortran/intdgesv3.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgesv3.o ../../../lib/pkg/src/fortran/intdgesv3.f

${OBJECTDIR}/_ext/968817101/tcslti.o: ../../../lib/pkg/src/fortran/tcslti.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/tcslti.o ../../../lib/pkg/src/fortran/tcslti.f

${OBJECTDIR}/_ext/968817101/ddpow.o: ../../../lib/pkg/src/fortran/ddpow.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ddpow.o ../../../lib/pkg/src/fortran/ddpow.f

${OBJECTDIR}/_ext/968817101/i_matrix.o: ../../../lib/pkg/src/fortran/i_matrix.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_matrix.o ../../../lib/pkg/src/fortran/i_matrix.f

${OBJECTDIR}/_ext/968817101/intzgelsy.o: ../../../lib/pkg/src/fortran/intzgelsy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgelsy.o ../../../lib/pkg/src/fortran/intzgelsy.f

${OBJECTDIR}/_ext/968817101/i_triu.o: ../../../lib/pkg/src/fortran/i_triu.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_triu.o ../../../lib/pkg/src/fortran/i_triu.f

${OBJECTDIR}/_ext/968817101/tg02ad.o: ../../../lib/pkg/src/fortran/tg02ad.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/tg02ad.o ../../../lib/pkg/src/fortran/tg02ad.f

${OBJECTDIR}/_ext/968817101/clunit.o: ../../../lib/pkg/src/fortran/clunit.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/clunit.o ../../../lib/pkg/src/fortran/clunit.f

${OBJECTDIR}/_ext/968817101/colnew.o: ../../../lib/pkg/src/fortran/colnew.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/colnew.o ../../../lib/pkg/src/fortran/colnew.f

${OBJECTDIR}/_ext/1457928084/djairy.o: ../../../lib/pkg/src/fortran/slatec/djairy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/djairy.o ../../../lib/pkg/src/fortran/slatec/djairy.f

${OBJECTDIR}/_ext/968817101/arl2.o: ../../../lib/pkg/src/fortran/arl2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/arl2.o ../../../lib/pkg/src/fortran/arl2.f

${OBJECTDIR}/_ext/968817101/wasum.o: ../../../lib/pkg/src/fortran/wasum.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wasum.o ../../../lib/pkg/src/fortran/wasum.f

${OBJECTDIR}/_ext/968817101/wcompa.o: ../../../lib/pkg/src/fortran/wcompa.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wcompa.o ../../../lib/pkg/src/fortran/wcompa.f

${OBJECTDIR}/_ext/968817101/ricd.o: ../../../lib/pkg/src/fortran/ricd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ricd.o ../../../lib/pkg/src/fortran/ricd.f

${OBJECTDIR}/_ext/968817101/tild.o: ../../../lib/pkg/src/fortran/tild.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/tild.o ../../../lib/pkg/src/fortran/tild.f

${OBJECTDIR}/_ext/968817101/dspcle.o: ../../../lib/pkg/src/fortran/dspcle.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspcle.o ../../../lib/pkg/src/fortran/dspcle.f

${OBJECTDIR}/_ext/968817101/fmc11z.o: ../../../lib/pkg/src/fortran/fmc11z.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fmc11z.o ../../../lib/pkg/src/fortran/fmc11z.f

${OBJECTDIR}/_ext/968817101/intdgesvd1.o: ../../../lib/pkg/src/fortran/intdgesvd1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgesvd1.o ../../../lib/pkg/src/fortran/intdgesvd1.f

${OBJECTDIR}/_ext/968817101/complexify.o: ../../../lib/pkg/src/fortran/complexify.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/complexify.o ../../../lib/pkg/src/fortran/complexify.f

${OBJECTDIR}/_ext/1457928084/dpsixn.o: ../../../lib/pkg/src/fortran/slatec/dpsixn.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dpsixn.o ../../../lib/pkg/src/fortran/slatec/dpsixn.f

${OBJECTDIR}/_ext/968817101/wsmsp.o: ../../../lib/pkg/src/fortran/wsmsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wsmsp.o ../../../lib/pkg/src/fortran/wsmsp.f

${OBJECTDIR}/_ext/968817101/tranze.o: ../../../lib/pkg/src/fortran/tranze.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/tranze.o ../../../lib/pkg/src/fortran/tranze.f

${OBJECTDIR}/_ext/968817101/ref2val.o: ../../../lib/pkg/src/fortran/ref2val.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ref2val.o ../../../lib/pkg/src/fortran/ref2val.f

${OBJECTDIR}/_ext/968817101/errmgr.o: ../../../lib/pkg/src/fortran/errmgr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/errmgr.o ../../../lib/pkg/src/fortran/errmgr.f

${OBJECTDIR}/_ext/968817101/hpins.o: ../../../lib/pkg/src/fortran/hpins.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/hpins.o ../../../lib/pkg/src/fortran/hpins.f

${OBJECTDIR}/_ext/968817101/dfftmx.o: ../../../lib/pkg/src/fortran/dfftmx.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dfftmx.o ../../../lib/pkg/src/fortran/dfftmx.f

${OBJECTDIR}/_ext/57306600/dqrsm.o: ../../../lib/pkg/src/fortran/linpack/dqrsm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/dqrsm.o ../../../lib/pkg/src/fortran/linpack/dqrsm.f

${OBJECTDIR}/_ext/968817101/dollar.o: ../../../lib/pkg/src/fortran/dollar.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dollar.o ../../../lib/pkg/src/fortran/dollar.f

${OBJECTDIR}/_ext/1457928084/pchim.o: ../../../lib/pkg/src/fortran/slatec/pchim.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/pchim.o ../../../lib/pkg/src/fortran/slatec/pchim.f

${OBJECTDIR}/_ext/968817101/fremf1.o: ../../../lib/pkg/src/fortran/fremf1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fremf1.o ../../../lib/pkg/src/fortran/fremf1.f

${OBJECTDIR}/_ext/968817101/csslti.o: ../../../lib/pkg/src/fortran/csslti.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/csslti.o ../../../lib/pkg/src/fortran/csslti.f

${OBJECTDIR}/_ext/968817101/israt.o: ../../../lib/pkg/src/fortran/israt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/israt.o ../../../lib/pkg/src/fortran/israt.f

${OBJECTDIR}/_ext/968817101/i_d_i.o: ../../../lib/pkg/src/fortran/i_d_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_d_i.o ../../../lib/pkg/src/fortran/i_d_i.f

${OBJECTDIR}/_ext/968817101/dpmul.o: ../../../lib/pkg/src/fortran/dpmul.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dpmul.o ../../../lib/pkg/src/fortran/dpmul.f

${OBJECTDIR}/_ext/968817101/wasin.o: ../../../lib/pkg/src/fortran/wasin.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wasin.o ../../../lib/pkg/src/fortran/wasin.f

${OBJECTDIR}/_ext/968817101/wwpow.o: ../../../lib/pkg/src/fortran/wwpow.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wwpow.o ../../../lib/pkg/src/fortran/wwpow.f

${OBJECTDIR}/_ext/968817101/kronc.o: ../../../lib/pkg/src/fortran/kronc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/kronc.o ../../../lib/pkg/src/fortran/kronc.f

${OBJECTDIR}/_ext/968817101/dtild.o: ../../../lib/pkg/src/fortran/dtild.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dtild.o ../../../lib/pkg/src/fortran/dtild.f

${OBJECTDIR}/_ext/968817101/rat.o: ../../../lib/pkg/src/fortran/rat.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rat.o ../../../lib/pkg/src/fortran/rat.f

${OBJECTDIR}/_ext/1457928084/zacai.o: ../../../lib/pkg/src/fortran/slatec/zacai.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zacai.o ../../../lib/pkg/src/fortran/slatec/zacai.f

${OBJECTDIR}/_ext/968817101/n1qn1a.o: ../../../lib/pkg/src/fortran/n1qn1a.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/n1qn1a.o ../../../lib/pkg/src/fortran/n1qn1a.f

${OBJECTDIR}/_ext/968817101/atome.o: ../../../lib/pkg/src/fortran/atome.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/atome.o ../../../lib/pkg/src/fortran/atome.f

${OBJECTDIR}/_ext/968817101/expan.o: ../../../lib/pkg/src/fortran/expan.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/expan.o ../../../lib/pkg/src/fortran/expan.f

${OBJECTDIR}/_ext/968817101/dmsum.o: ../../../lib/pkg/src/fortran/dmsum.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmsum.o ../../../lib/pkg/src/fortran/dmsum.f

${OBJECTDIR}/_ext/968817101/dsposp.o: ../../../lib/pkg/src/fortran/dsposp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dsposp.o ../../../lib/pkg/src/fortran/dsposp.f

${OBJECTDIR}/_ext/968817101/lq.o: ../../../lib/pkg/src/fortran/lq.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lq.o ../../../lib/pkg/src/fortran/lq.f

${OBJECTDIR}/_ext/968817101/getorient.o: ../../../lib/pkg/src/fortran/getorient.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/getorient.o ../../../lib/pkg/src/fortran/getorient.f

${OBJECTDIR}/_ext/968817101/intl_i.o: ../../../lib/pkg/src/fortran/intl_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intl_i.o ../../../lib/pkg/src/fortran/intl_i.f

${OBJECTDIR}/_ext/57306600/icopy.o: ../../../lib/pkg/src/fortran/linpack/icopy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/icopy.o ../../../lib/pkg/src/fortran/linpack/icopy.f

${OBJECTDIR}/_ext/968817101/wlog.o: ../../../lib/pkg/src/fortran/wlog.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wlog.o ../../../lib/pkg/src/fortran/wlog.f

${OBJECTDIR}/_ext/968817101/bezout.o: ../../../lib/pkg/src/fortran/bezout.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/bezout.o ../../../lib/pkg/src/fortran/bezout.f

${OBJECTDIR}/_ext/968817101/lspxsp.o: ../../../lib/pkg/src/fortran/lspxsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lspxsp.o ../../../lib/pkg/src/fortran/lspxsp.f

${OBJECTDIR}/_ext/968817101/hltblk.o: ../../../lib/pkg/src/fortran/hltblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/hltblk.o ../../../lib/pkg/src/fortran/hltblk.f

${OBJECTDIR}/_ext/968817101/formatnumber.o: ../../../lib/pkg/src/fortran/formatnumber.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/formatnumber.o ../../../lib/pkg/src/fortran/formatnumber.f

${OBJECTDIR}/_ext/968817101/spord.o: ../../../lib/pkg/src/fortran/spord.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spord.o ../../../lib/pkg/src/fortran/spord.f

${OBJECTDIR}/_ext/968817101/intzdet.o: ../../../lib/pkg/src/fortran/intzdet.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzdet.o ../../../lib/pkg/src/fortran/intzdet.f

${OBJECTDIR}/_ext/968817101/dsum.o: ../../../lib/pkg/src/fortran/dsum.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dsum.o ../../../lib/pkg/src/fortran/dsum.f

${OBJECTDIR}/_ext/968817101/fout.o: ../../../lib/pkg/src/fortran/fout.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fout.o ../../../lib/pkg/src/fortran/fout.f

${OBJECTDIR}/_ext/968817101/gennor.o: ../../../lib/pkg/src/fortran/gennor.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/gennor.o ../../../lib/pkg/src/fortran/gennor.f

${OBJECTDIR}/_ext/968817101/fmc11a.o: ../../../lib/pkg/src/fortran/fmc11a.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fmc11a.o ../../../lib/pkg/src/fortran/fmc11a.f

${OBJECTDIR}/_ext/968817101/desia.o: ../../../lib/pkg/src/fortran/desia.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/desia.o ../../../lib/pkg/src/fortran/desia.f

${OBJECTDIR}/_ext/968817101/intzgesv3.o: ../../../lib/pkg/src/fortran/intzgesv3.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgesv3.o ../../../lib/pkg/src/fortran/intzgesv3.f

${OBJECTDIR}/_ext/968817101/sigbas.o: ../../../lib/pkg/src/fortran/sigbas.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sigbas.o ../../../lib/pkg/src/fortran/sigbas.f

${OBJECTDIR}/_ext/968817101/qpgen2.o: ../../../lib/pkg/src/fortran/qpgen2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/qpgen2.o ../../../lib/pkg/src/fortran/qpgen2.f

${OBJECTDIR}/_ext/968817101/bdiag.o: ../../../lib/pkg/src/fortran/bdiag.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/bdiag.o ../../../lib/pkg/src/fortran/bdiag.f

${OBJECTDIR}/_ext/1457928084/dbesi1.o: ../../../lib/pkg/src/fortran/slatec/dbesi1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesi1.o ../../../lib/pkg/src/fortran/slatec/dbesi1.f

${OBJECTDIR}/_ext/968817101/nlis0.o: ../../../lib/pkg/src/fortran/nlis0.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/nlis0.o ../../../lib/pkg/src/fortran/nlis0.f

${OBJECTDIR}/_ext/968817101/desi00.o: ../../../lib/pkg/src/fortran/desi00.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/desi00.o ../../../lib/pkg/src/fortran/desi00.f

${OBJECTDIR}/_ext/968817101/intstr.o: ../../../lib/pkg/src/fortran/intstr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intstr.o ../../../lib/pkg/src/fortran/intstr.f

${OBJECTDIR}/_ext/968817101/extlarg.o: ../../../lib/pkg/src/fortran/extlarg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/extlarg.o ../../../lib/pkg/src/fortran/extlarg.f

${OBJECTDIR}/_ext/1457928084/dgamma.o: ../../../lib/pkg/src/fortran/slatec/dgamma.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dgamma.o ../../../lib/pkg/src/fortran/slatec/dgamma.f

${OBJECTDIR}/_ext/1855634266/hqror2.o: ../../../lib/pkg/src/fortran/eispack/hqror2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1855634266
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1855634266/hqror2.o ../../../lib/pkg/src/fortran/eispack/hqror2.f

${OBJECTDIR}/_ext/968817101/intdggbal.o: ../../../lib/pkg/src/fortran/intdggbal.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdggbal.o ../../../lib/pkg/src/fortran/intdggbal.f

${OBJECTDIR}/_ext/968817101/find.o: ../../../lib/pkg/src/fortran/find.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/find.o ../../../lib/pkg/src/fortran/find.f

${OBJECTDIR}/_ext/968817101/fmc11e.o: ../../../lib/pkg/src/fortran/fmc11e.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fmc11e.o ../../../lib/pkg/src/fortran/fmc11e.f

${OBJECTDIR}/_ext/968817101/wsqrt.o: ../../../lib/pkg/src/fortran/wsqrt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wsqrt.o ../../../lib/pkg/src/fortran/wsqrt.f

${OBJECTDIR}/_ext/968817101/spcho2.o: ../../../lib/pkg/src/fortran/spcho2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spcho2.o ../../../lib/pkg/src/fortran/spcho2.f

${OBJECTDIR}/_ext/968817101/bounn.o: ../../../lib/pkg/src/fortran/bounn.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/bounn.o ../../../lib/pkg/src/fortran/bounn.f

${OBJECTDIR}/_ext/968817101/rkqc.o: ../../../lib/pkg/src/fortran/rkqc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rkqc.o ../../../lib/pkg/src/fortran/rkqc.f

${OBJECTDIR}/_ext/968817101/intdgelsy.o: ../../../lib/pkg/src/fortran/intdgelsy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgelsy.o ../../../lib/pkg/src/fortran/intdgelsy.f

${OBJECTDIR}/_ext/1457928084/dcsevl.o: ../../../lib/pkg/src/fortran/slatec/dcsevl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dcsevl.o ../../../lib/pkg/src/fortran/slatec/dcsevl.f

${OBJECTDIR}/_ext/968817101/wcerr.o: ../../../lib/pkg/src/fortran/wcerr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wcerr.o ../../../lib/pkg/src/fortran/wcerr.f

${OBJECTDIR}/_ext/968817101/wspful.o: ../../../lib/pkg/src/fortran/wspful.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspful.o ../../../lib/pkg/src/fortran/wspful.f

${OBJECTDIR}/_ext/968817101/mname.o: ../../../lib/pkg/src/fortran/mname.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mname.o ../../../lib/pkg/src/fortran/mname.f

${OBJECTDIR}/_ext/1457928084/dasyik.o: ../../../lib/pkg/src/fortran/slatec/dasyik.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dasyik.o ../../../lib/pkg/src/fortran/slatec/dasyik.f

${OBJECTDIR}/_ext/968817101/impcnc.o: ../../../lib/pkg/src/fortran/impcnc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/impcnc.o ../../../lib/pkg/src/fortran/impcnc.f

${OBJECTDIR}/_ext/968817101/selblk.o: ../../../lib/pkg/src/fortran/selblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/selblk.o ../../../lib/pkg/src/fortran/selblk.f

${OBJECTDIR}/_ext/968817101/romeg.o: ../../../lib/pkg/src/fortran/romeg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/romeg.o ../../../lib/pkg/src/fortran/romeg.f

${OBJECTDIR}/_ext/968817101/wspxs.o: ../../../lib/pkg/src/fortran/wspxs.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspxs.o ../../../lib/pkg/src/fortran/wspxs.f

${OBJECTDIR}/_ext/968817101/wpodiv.o: ../../../lib/pkg/src/fortran/wpodiv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wpodiv.o ../../../lib/pkg/src/fortran/wpodiv.f

${OBJECTDIR}/_ext/968817101/isnum.o: ../../../lib/pkg/src/fortran/isnum.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/isnum.o ../../../lib/pkg/src/fortran/isnum.f

${OBJECTDIR}/_ext/1457928084/j4save.o: ../../../lib/pkg/src/fortran/slatec/j4save.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/j4save.o ../../../lib/pkg/src/fortran/slatec/j4save.f

${OBJECTDIR}/_ext/968817101/getdimfromvar.o: ../../../lib/pkg/src/fortran/getdimfromvar.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/getdimfromvar.o ../../../lib/pkg/src/fortran/getdimfromvar.f

${OBJECTDIR}/_ext/1457928084/dbkias.o: ../../../lib/pkg/src/fortran/slatec/dbkias.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbkias.o ../../../lib/pkg/src/fortran/slatec/dbkias.f

${OBJECTDIR}/_ext/968817101/dspxsp.o: ../../../lib/pkg/src/fortran/dspxsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspxsp.o ../../../lib/pkg/src/fortran/dspxsp.f

${OBJECTDIR}/_ext/968817101/rdmpsz.o: ../../../lib/pkg/src/fortran/rdmpsz.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rdmpsz.o ../../../lib/pkg/src/fortran/rdmpsz.f

${OBJECTDIR}/_ext/968817101/qvalz.o: ../../../lib/pkg/src/fortran/qvalz.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/qvalz.o ../../../lib/pkg/src/fortran/qvalz.f

${OBJECTDIR}/_ext/968817101/intdy.o: ../../../lib/pkg/src/fortran/intdy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdy.o ../../../lib/pkg/src/fortran/intdy.f

${OBJECTDIR}/_ext/968817101/dspmax.o: ../../../lib/pkg/src/fortran/dspmax.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspmax.o ../../../lib/pkg/src/fortran/dspmax.f

${OBJECTDIR}/_ext/968817101/strang.o: ../../../lib/pkg/src/fortran/strang.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/strang.o ../../../lib/pkg/src/fortran/strang.f

${OBJECTDIR}/_ext/968817101/scitod.o: ../../../lib/pkg/src/fortran/scitod.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/scitod.o ../../../lib/pkg/src/fortran/scitod.f

${OBJECTDIR}/_ext/944810281/lmder.o: ../../../lib/pkg/src/fortran/minpack/lmder.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/lmder.o ../../../lib/pkg/src/fortran/minpack/lmder.f

${OBJECTDIR}/_ext/1457928084/dbesj0.o: ../../../lib/pkg/src/fortran/slatec/dbesj0.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesj0.o ../../../lib/pkg/src/fortran/slatec/dbesj0.f

${OBJECTDIR}/_ext/968817101/dful2sp.o: ../../../lib/pkg/src/fortran/dful2sp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dful2sp.o ../../../lib/pkg/src/fortran/dful2sp.f

${OBJECTDIR}/_ext/968817101/mpdiag.o: ../../../lib/pkg/src/fortran/mpdiag.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mpdiag.o ../../../lib/pkg/src/fortran/mpdiag.f

${OBJECTDIR}/_ext/968817101/whatln.o: ../../../lib/pkg/src/fortran/whatln.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/whatln.o ../../../lib/pkg/src/fortran/whatln.f

${OBJECTDIR}/_ext/968817101/vmnorm.o: ../../../lib/pkg/src/fortran/vmnorm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/vmnorm.o ../../../lib/pkg/src/fortran/vmnorm.f

${OBJECTDIR}/_ext/968817101/sputil.o: ../../../lib/pkg/src/fortran/sputil.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sputil.o ../../../lib/pkg/src/fortran/sputil.f

${OBJECTDIR}/_ext/968817101/i_e.o: ../../../lib/pkg/src/fortran/i_e.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_e.o ../../../lib/pkg/src/fortran/i_e.f

${OBJECTDIR}/_ext/968817101/fmani1.o: ../../../lib/pkg/src/fortran/fmani1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fmani1.o ../../../lib/pkg/src/fortran/fmani1.f

${OBJECTDIR}/_ext/968817101/genmn.o: ../../../lib/pkg/src/fortran/genmn.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/genmn.o ../../../lib/pkg/src/fortran/genmn.f

${OBJECTDIR}/_ext/968817101/twodq.o: ../../../lib/pkg/src/fortran/twodq.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/twodq.o ../../../lib/pkg/src/fortran/twodq.f

${OBJECTDIR}/_ext/968817101/lsoda.o: ../../../lib/pkg/src/fortran/lsoda.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lsoda.o ../../../lib/pkg/src/fortran/lsoda.f

${OBJECTDIR}/_ext/968817101/iocopy.o: ../../../lib/pkg/src/fortran/iocopy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/iocopy.o ../../../lib/pkg/src/fortran/iocopy.f

${OBJECTDIR}/_ext/968817101/extractfields.o: ../../../lib/pkg/src/fortran/extractfields.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/extractfields.o ../../../lib/pkg/src/fortran/extractfields.f

${OBJECTDIR}/_ext/968817101/stackg.o: ../../../lib/pkg/src/fortran/stackg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/stackg.o ../../../lib/pkg/src/fortran/stackg.f

${OBJECTDIR}/_ext/968817101/dmmul.o: ../../../lib/pkg/src/fortran/dmmul.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmmul.o ../../../lib/pkg/src/fortran/dmmul.f

${OBJECTDIR}/_ext/1457928084/dbesy.o: ../../../lib/pkg/src/fortran/slatec/dbesy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesy.o ../../../lib/pkg/src/fortran/slatec/dbesy.f

${OBJECTDIR}/_ext/968817101/wsign.o: ../../../lib/pkg/src/fortran/wsign.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wsign.o ../../../lib/pkg/src/fortran/wsign.f

${OBJECTDIR}/_ext/968817101/dmpext.o: ../../../lib/pkg/src/fortran/dmpext.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmpext.o ../../../lib/pkg/src/fortran/dmpext.f

${OBJECTDIR}/_ext/968817101/skpins.o: ../../../lib/pkg/src/fortran/skpins.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/skpins.o ../../../lib/pkg/src/fortran/skpins.f

${OBJECTDIR}/_ext/968817101/intzgebal.o: ../../../lib/pkg/src/fortran/intzgebal.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgebal.o ../../../lib/pkg/src/fortran/intzgebal.f

${OBJECTDIR}/_ext/968817101/i_convert.o: ../../../lib/pkg/src/fortran/i_convert.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_convert.o ../../../lib/pkg/src/fortran/i_convert.f

${OBJECTDIR}/_ext/1457928084/dbsi0e.o: ../../../lib/pkg/src/fortran/slatec/dbsi0e.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbsi0e.o ../../../lib/pkg/src/fortran/slatec/dbsi0e.f

${OBJECTDIR}/_ext/968817101/wmpmu.o: ../../../lib/pkg/src/fortran/wmpmu.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wmpmu.o ../../../lib/pkg/src/fortran/wmpmu.f

${OBJECTDIR}/_ext/968817101/intzgetrf.o: ../../../lib/pkg/src/fortran/intzgetrf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgetrf.o ../../../lib/pkg/src/fortran/intzgetrf.f

${OBJECTDIR}/_ext/968817101/icsei.o: ../../../lib/pkg/src/fortran/icsei.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/icsei.o ../../../lib/pkg/src/fortran/icsei.f

${OBJECTDIR}/_ext/968817101/qztrn.o: ../../../lib/pkg/src/fortran/qztrn.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/qztrn.o ../../../lib/pkg/src/fortran/qztrn.f

${OBJECTDIR}/_ext/968817101/cvwm.o: ../../../lib/pkg/src/fortran/cvwm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cvwm.o ../../../lib/pkg/src/fortran/cvwm.f

${OBJECTDIR}/_ext/968817101/createref.o: ../../../lib/pkg/src/fortran/createref.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/createref.o ../../../lib/pkg/src/fortran/createref.f

${OBJECTDIR}/_ext/1457928084/dbskes.o: ../../../lib/pkg/src/fortran/slatec/dbskes.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbskes.o ../../../lib/pkg/src/fortran/slatec/dbskes.f

${OBJECTDIR}/_ext/968817101/getstr.o: ../../../lib/pkg/src/fortran/getstr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/getstr.o ../../../lib/pkg/src/fortran/getstr.f

${OBJECTDIR}/_ext/968817101/zbesyg.o: ../../../lib/pkg/src/fortran/zbesyg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/zbesyg.o ../../../lib/pkg/src/fortran/zbesyg.f

${OBJECTDIR}/_ext/968817101/dtosci.o: ../../../lib/pkg/src/fortran/dtosci.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dtosci.o ../../../lib/pkg/src/fortran/dtosci.f

${OBJECTDIR}/_ext/1457928084/dbsk1e.o: ../../../lib/pkg/src/fortran/slatec/dbsk1e.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbsk1e.o ../../../lib/pkg/src/fortran/slatec/dbsk1e.f

${OBJECTDIR}/_ext/968817101/intfschur.o: ../../../lib/pkg/src/fortran/intfschur.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intfschur.o ../../../lib/pkg/src/fortran/intfschur.f

${OBJECTDIR}/_ext/968817101/wacos.o: ../../../lib/pkg/src/fortran/wacos.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wacos.o ../../../lib/pkg/src/fortran/wacos.f

${OBJECTDIR}/_ext/968817101/i_mini.o: ../../../lib/pkg/src/fortran/i_mini.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_mini.o ../../../lib/pkg/src/fortran/i_mini.f

${OBJECTDIR}/_ext/57306600/util.o: ../../../lib/pkg/src/fortran/linpack/util.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/util.o ../../../lib/pkg/src/fortran/linpack/util.f

${OBJECTDIR}/_ext/968817101/realit.o: ../../../lib/pkg/src/fortran/realit.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/realit.o ../../../lib/pkg/src/fortran/realit.f

${OBJECTDIR}/_ext/1457928084/zdiv.o: ../../../lib/pkg/src/fortran/slatec/zdiv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zdiv.o ../../../lib/pkg/src/fortran/slatec/zdiv.f

${OBJECTDIR}/_ext/968817101/hmcreate.o: ../../../lib/pkg/src/fortran/hmcreate.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/hmcreate.o ../../../lib/pkg/src/fortran/hmcreate.f

${OBJECTDIR}/_ext/968817101/bezstp.o: ../../../lib/pkg/src/fortran/bezstp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/bezstp.o ../../../lib/pkg/src/fortran/bezstp.f

${OBJECTDIR}/_ext/968817101/iwamax.o: ../../../lib/pkg/src/fortran/iwamax.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/iwamax.o ../../../lib/pkg/src/fortran/iwamax.f

${OBJECTDIR}/_ext/968817101/rscma1.o: ../../../lib/pkg/src/fortran/rscma1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rscma1.o ../../../lib/pkg/src/fortran/rscma1.f

${OBJECTDIR}/_ext/968817101/prompt.o: ../../../lib/pkg/src/fortran/prompt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/prompt.o ../../../lib/pkg/src/fortran/prompt.f

${OBJECTDIR}/_ext/968817101/xerrwv.o: ../../../lib/pkg/src/fortran/xerrwv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/xerrwv.o ../../../lib/pkg/src/fortran/xerrwv.f

${OBJECTDIR}/_ext/968817101/wspasp.o: ../../../lib/pkg/src/fortran/wspasp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspasp.o ../../../lib/pkg/src/fortran/wspasp.f

${OBJECTDIR}/_ext/1457928084/xerprn.o: ../../../lib/pkg/src/fortran/slatec/xerprn.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/xerprn.o ../../../lib/pkg/src/fortran/slatec/xerprn.f

${OBJECTDIR}/_ext/968817101/i_prod.o: ../../../lib/pkg/src/fortran/i_prod.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_prod.o ../../../lib/pkg/src/fortran/i_prod.f

${OBJECTDIR}/_ext/968817101/dwdiv.o: ../../../lib/pkg/src/fortran/dwdiv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dwdiv.o ../../../lib/pkg/src/fortran/dwdiv.f

${OBJECTDIR}/_ext/968817101/fuclid.o: ../../../lib/pkg/src/fortran/fuclid.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fuclid.o ../../../lib/pkg/src/fortran/fuclid.f

${OBJECTDIR}/_ext/968817101/desi12.o: ../../../lib/pkg/src/fortran/desi12.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/desi12.o ../../../lib/pkg/src/fortran/desi12.f

${OBJECTDIR}/_ext/57306600/dgefa.o: ../../../lib/pkg/src/fortran/linpack/dgefa.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/dgefa.o ../../../lib/pkg/src/fortran/linpack/dgefa.f

${OBJECTDIR}/_ext/968817101/integr.o: ../../../lib/pkg/src/fortran/integr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/integr.o ../../../lib/pkg/src/fortran/integr.f

${OBJECTDIR}/_ext/968817101/basouttofile.o: ../../../lib/pkg/src/fortran/basouttofile.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/basouttofile.o ../../../lib/pkg/src/fortran/basouttofile.f

${OBJECTDIR}/_ext/968817101/setgmn.o: ../../../lib/pkg/src/fortran/setgmn.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/setgmn.o ../../../lib/pkg/src/fortran/setgmn.f

${OBJECTDIR}/_ext/968817101/lsdisc.o: ../../../lib/pkg/src/fortran/lsdisc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lsdisc.o ../../../lib/pkg/src/fortran/lsdisc.f

${OBJECTDIR}/_ext/968817101/qzrnd.o: ../../../lib/pkg/src/fortran/qzrnd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/qzrnd.o ../../../lib/pkg/src/fortran/qzrnd.f

${OBJECTDIR}/_ext/968817101/spreshape.o: ../../../lib/pkg/src/fortran/spreshape.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spreshape.o ../../../lib/pkg/src/fortran/spreshape.f

${OBJECTDIR}/_ext/968817101/i_c_i.o: ../../../lib/pkg/src/fortran/i_c_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_c_i.o ../../../lib/pkg/src/fortran/i_c_i.f

${OBJECTDIR}/_ext/968817101/zoldqr.o: ../../../lib/pkg/src/fortran/zoldqr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/zoldqr.o ../../../lib/pkg/src/fortran/zoldqr.f

${OBJECTDIR}/_ext/968817101/coselm.o: ../../../lib/pkg/src/fortran/coselm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/coselm.o ../../../lib/pkg/src/fortran/coselm.f

${OBJECTDIR}/_ext/968817101/n1qn1.o: ../../../lib/pkg/src/fortran/n1qn1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/n1qn1.o ../../../lib/pkg/src/fortran/n1qn1.f

${OBJECTDIR}/_ext/968817101/wspxsp.o: ../../../lib/pkg/src/fortran/wspxsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspxsp.o ../../../lib/pkg/src/fortran/wspxsp.f

${OBJECTDIR}/_ext/968817101/lij2sp.o: ../../../lib/pkg/src/fortran/lij2sp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lij2sp.o ../../../lib/pkg/src/fortran/lij2sp.f

${OBJECTDIR}/_ext/968817101/rchek.o: ../../../lib/pkg/src/fortran/rchek.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rchek.o ../../../lib/pkg/src/fortran/rchek.f

${OBJECTDIR}/_ext/968817101/followpath.o: ../../../lib/pkg/src/fortran/followpath.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/followpath.o ../../../lib/pkg/src/fortran/followpath.f

${OBJECTDIR}/_ext/968817101/tanblk.o: ../../../lib/pkg/src/fortran/tanblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/tanblk.o ../../../lib/pkg/src/fortran/tanblk.f

${OBJECTDIR}/_ext/968817101/spifp.o: ../../../lib/pkg/src/fortran/spifp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spifp.o ../../../lib/pkg/src/fortran/spifp.f

${OBJECTDIR}/_ext/968817101/icscof.o: ../../../lib/pkg/src/fortran/icscof.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/icscof.o ../../../lib/pkg/src/fortran/icscof.f

${OBJECTDIR}/_ext/968817101/freque.o: ../../../lib/pkg/src/fortran/freque.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/freque.o ../../../lib/pkg/src/fortran/freque.f

${OBJECTDIR}/_ext/1457928084/zbinu.o: ../../../lib/pkg/src/fortran/slatec/zbinu.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zbinu.o ../../../lib/pkg/src/fortran/slatec/zbinu.f

${OBJECTDIR}/_ext/1457928084/common_f2c.o: ../../../lib/pkg/src/fortran/slatec/common_f2c.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	${RM} $@.d
	$(COMPILE.c) -g -MMD -MP -MF $@.d -o ${OBJECTDIR}/_ext/1457928084/common_f2c.o ../../../lib/pkg/src/fortran/slatec/common_f2c.c

${OBJECTDIR}/_ext/968817101/rscar1.o: ../../../lib/pkg/src/fortran/rscar1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rscar1.o ../../../lib/pkg/src/fortran/rscar1.f

${OBJECTDIR}/_ext/968817101/prepj.o: ../../../lib/pkg/src/fortran/prepj.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/prepj.o ../../../lib/pkg/src/fortran/prepj.f

${OBJECTDIR}/_ext/1457928084/dbsknu.o: ../../../lib/pkg/src/fortran/slatec/dbsknu.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbsknu.o ../../../lib/pkg/src/fortran/slatec/dbsknu.f

${OBJECTDIR}/_ext/968817101/zgcbd.o: ../../../lib/pkg/src/fortran/zgcbd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/zgcbd.o ../../../lib/pkg/src/fortran/zgcbd.f

${OBJECTDIR}/_ext/968817101/gratyp.o: ../../../lib/pkg/src/fortran/gratyp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/gratyp.o ../../../lib/pkg/src/fortran/gratyp.f

${OBJECTDIR}/_ext/1457928084/dbskin.o: ../../../lib/pkg/src/fortran/slatec/dbskin.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbskin.o ../../../lib/pkg/src/fortran/slatec/dbskin.f

${OBJECTDIR}/_ext/968817101/dbesig.o: ../../../lib/pkg/src/fortran/dbesig.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dbesig.o ../../../lib/pkg/src/fortran/dbesig.f

${OBJECTDIR}/_ext/968817101/samphold.o: ../../../lib/pkg/src/fortran/samphold.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/samphold.o ../../../lib/pkg/src/fortran/samphold.f

${OBJECTDIR}/_ext/968817101/forblk.o: ../../../lib/pkg/src/fortran/forblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/forblk.o ../../../lib/pkg/src/fortran/forblk.f

${OBJECTDIR}/_ext/1457928084/xercnt.o: ../../../lib/pkg/src/fortran/slatec/xercnt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/xercnt.o ../../../lib/pkg/src/fortran/slatec/xercnt.f

${OBJECTDIR}/_ext/968817101/spif.o: ../../../lib/pkg/src/fortran/spif.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spif.o ../../../lib/pkg/src/fortran/spif.f

${OBJECTDIR}/_ext/968817101/stackc2i.o: ../../../lib/pkg/src/fortran/stackc2i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/stackc2i.o ../../../lib/pkg/src/fortran/stackc2i.f

${OBJECTDIR}/_ext/968817101/rksimp.o: ../../../lib/pkg/src/fortran/rksimp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rksimp.o ../../../lib/pkg/src/fortran/rksimp.f

${OBJECTDIR}/_ext/968817101/timblk.o: ../../../lib/pkg/src/fortran/timblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/timblk.o ../../../lib/pkg/src/fortran/timblk.f

${OBJECTDIR}/_ext/968817101/i1mach.o: ../../../lib/pkg/src/fortran/i1mach.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i1mach.o ../../../lib/pkg/src/fortran/i1mach.f

${OBJECTDIR}/_ext/968817101/dmprod.o: ../../../lib/pkg/src/fortran/dmprod.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmprod.o ../../../lib/pkg/src/fortran/dmprod.f

${OBJECTDIR}/_ext/968817101/xerbla.o: ../../../lib/pkg/src/fortran/xerbla.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/xerbla.o ../../../lib/pkg/src/fortran/xerbla.f

${OBJECTDIR}/_ext/968817101/sci_ffir.o: ../../../lib/pkg/src/fortran/sci_ffir.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sci_ffir.o ../../../lib/pkg/src/fortran/sci_ffir.f

${OBJECTDIR}/_ext/968817101/strdsp.o: ../../../lib/pkg/src/fortran/strdsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/strdsp.o ../../../lib/pkg/src/fortran/strdsp.f

${OBJECTDIR}/_ext/968817101/nstabl.o: ../../../lib/pkg/src/fortran/nstabl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/nstabl.o ../../../lib/pkg/src/fortran/nstabl.f

${OBJECTDIR}/_ext/968817101/coeft.o: ../../../lib/pkg/src/fortran/coeft.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/coeft.o ../../../lib/pkg/src/fortran/coeft.f

${OBJECTDIR}/_ext/968817101/matc.o: ../../../lib/pkg/src/fortran/matc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/matc.o ../../../lib/pkg/src/fortran/matc.f

${OBJECTDIR}/_ext/968817101/dzdivq.o: ../../../lib/pkg/src/fortran/dzdivq.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dzdivq.o ../../../lib/pkg/src/fortran/dzdivq.f

${OBJECTDIR}/_ext/968817101/sdot.o: ../../../lib/pkg/src/fortran/sdot.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sdot.o ../../../lib/pkg/src/fortran/sdot.f

${OBJECTDIR}/_ext/1457928084/dbesk.o: ../../../lib/pkg/src/fortran/slatec/dbesk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesk.o ../../../lib/pkg/src/fortran/slatec/dbesk.f

${OBJECTDIR}/_ext/968817101/scierr.o: ../../../lib/pkg/src/fortran/scierr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/scierr.o ../../../lib/pkg/src/fortran/scierr.f

${OBJECTDIR}/_ext/968817101/dwpowe.o: ../../../lib/pkg/src/fortran/dwpowe.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dwpowe.o ../../../lib/pkg/src/fortran/dwpowe.f

${OBJECTDIR}/_ext/968817101/icse0.o: ../../../lib/pkg/src/fortran/icse0.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/icse0.o ../../../lib/pkg/src/fortran/icse0.f

${OBJECTDIR}/_ext/968817101/i_i_i.o: ../../../lib/pkg/src/fortran/i_i_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_i_i.o ../../../lib/pkg/src/fortran/i_i_i.f

${OBJECTDIR}/_ext/968817101/wful2sp.o: ../../../lib/pkg/src/fortran/wful2sp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wful2sp.o ../../../lib/pkg/src/fortran/wful2sp.f

${OBJECTDIR}/_ext/968817101/i_m_i.o: ../../../lib/pkg/src/fortran/i_m_i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_m_i.o ../../../lib/pkg/src/fortran/i_m_i.f

${OBJECTDIR}/_ext/968817101/vnorm.o: ../../../lib/pkg/src/fortran/vnorm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/vnorm.o ../../../lib/pkg/src/fortran/vnorm.f

${OBJECTDIR}/_ext/968817101/ivimp.o: ../../../lib/pkg/src/fortran/ivimp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ivimp.o ../../../lib/pkg/src/fortran/ivimp.f

${OBJECTDIR}/_ext/968817101/ifthel.o: ../../../lib/pkg/src/fortran/ifthel.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ifthel.o ../../../lib/pkg/src/fortran/ifthel.f

${OBJECTDIR}/_ext/968817101/dspmin.o: ../../../lib/pkg/src/fortran/dspmin.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspmin.o ../../../lib/pkg/src/fortran/dspmin.f

${OBJECTDIR}/_ext/968817101/intops.o: ../../../lib/pkg/src/fortran/intops.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intops.o ../../../lib/pkg/src/fortran/intops.f

${OBJECTDIR}/_ext/968817101/sn.o: ../../../lib/pkg/src/fortran/sn.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sn.o ../../../lib/pkg/src/fortran/sn.f

${OBJECTDIR}/_ext/968817101/qzcel.o: ../../../lib/pkg/src/fortran/qzcel.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/qzcel.o ../../../lib/pkg/src/fortran/qzcel.f

${OBJECTDIR}/_ext/968817101/stackgl.o: ../../../lib/pkg/src/fortran/stackgl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/stackgl.o ../../../lib/pkg/src/fortran/stackgl.f

${OBJECTDIR}/_ext/1457928084/zabs.o: ../../../lib/pkg/src/fortran/slatec/zabs.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zabs.o ../../../lib/pkg/src/fortran/slatec/zabs.f

${OBJECTDIR}/_ext/968817101/fremf2.o: ../../../lib/pkg/src/fortran/fremf2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fremf2.o ../../../lib/pkg/src/fortran/fremf2.f

${OBJECTDIR}/_ext/968817101/diffblk.o: ../../../lib/pkg/src/fortran/diffblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/diffblk.o ../../../lib/pkg/src/fortran/diffblk.f

${OBJECTDIR}/_ext/968817101/parcha.o: ../../../lib/pkg/src/fortran/parcha.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/parcha.o ../../../lib/pkg/src/fortran/parcha.f

${OBJECTDIR}/_ext/968817101/desi22.o: ../../../lib/pkg/src/fortran/desi22.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/desi22.o ../../../lib/pkg/src/fortran/desi22.f

${OBJECTDIR}/_ext/968817101/rjbesl.o: ../../../lib/pkg/src/fortran/rjbesl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rjbesl.o ../../../lib/pkg/src/fortran/rjbesl.f

${OBJECTDIR}/_ext/968817101/dldsp.o: ../../../lib/pkg/src/fortran/dldsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dldsp.o ../../../lib/pkg/src/fortran/dldsp.f

${OBJECTDIR}/_ext/968817101/coshin.o: ../../../lib/pkg/src/fortran/coshin.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/coshin.o ../../../lib/pkg/src/fortran/coshin.f

${OBJECTDIR}/_ext/968817101/dpspln.o: ../../../lib/pkg/src/fortran/dpspln.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dpspln.o ../../../lib/pkg/src/fortran/dpspln.f

${OBJECTDIR}/_ext/968817101/ctcab.o: ../../../lib/pkg/src/fortran/ctcab.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ctcab.o ../../../lib/pkg/src/fortran/ctcab.f

${OBJECTDIR}/_ext/968817101/dmpmu.o: ../../../lib/pkg/src/fortran/dmpmu.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmpmu.o ../../../lib/pkg/src/fortran/dmpmu.f

${OBJECTDIR}/_ext/968817101/mtran.o: ../../../lib/pkg/src/fortran/mtran.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mtran.o ../../../lib/pkg/src/fortran/mtran.f

${OBJECTDIR}/_ext/968817101/lsplit.o: ../../../lib/pkg/src/fortran/lsplit.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lsplit.o ../../../lib/pkg/src/fortran/lsplit.f

${OBJECTDIR}/_ext/968817101/dmdsp.o: ../../../lib/pkg/src/fortran/dmdsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmdsp.o ../../../lib/pkg/src/fortran/dmdsp.f

${OBJECTDIR}/_ext/1457928084/zbesh.o: ../../../lib/pkg/src/fortran/slatec/zbesh.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zbesh.o ../../../lib/pkg/src/fortran/slatec/zbesh.f

${OBJECTDIR}/_ext/1457928084/zexp.o: ../../../lib/pkg/src/fortran/slatec/zexp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zexp.o ../../../lib/pkg/src/fortran/slatec/zexp.f

${OBJECTDIR}/_ext/968817101/isany.o: ../../../lib/pkg/src/fortran/isany.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/isany.o ../../../lib/pkg/src/fortran/isany.f

${OBJECTDIR}/_ext/968817101/fcube.o: ../../../lib/pkg/src/fortran/fcube.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fcube.o ../../../lib/pkg/src/fortran/fcube.f

${OBJECTDIR}/_ext/968817101/istrue.o: ../../../lib/pkg/src/fortran/istrue.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/istrue.o ../../../lib/pkg/src/fortran/istrue.f

${OBJECTDIR}/_ext/968817101/wspisp.o: ../../../lib/pkg/src/fortran/wspisp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspisp.o ../../../lib/pkg/src/fortran/wspisp.f

${OBJECTDIR}/_ext/968817101/wtan.o: ../../../lib/pkg/src/fortran/wtan.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wtan.o ../../../lib/pkg/src/fortran/wtan.f

${OBJECTDIR}/_ext/968817101/ddasrt.o: ../../../lib/pkg/src/fortran/ddasrt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ddasrt.o ../../../lib/pkg/src/fortran/ddasrt.f

${OBJECTDIR}/_ext/968817101/cstblk.o: ../../../lib/pkg/src/fortran/cstblk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cstblk.o ../../../lib/pkg/src/fortran/cstblk.f

${OBJECTDIR}/_ext/968817101/i_t.o: ../../../lib/pkg/src/fortran/i_t.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_t.o ../../../lib/pkg/src/fortran/i_t.f

${OBJECTDIR}/_ext/968817101/ptrback.o: ../../../lib/pkg/src/fortran/ptrback.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ptrback.o ../../../lib/pkg/src/fortran/ptrback.f

${OBJECTDIR}/_ext/968817101/i_p.o: ../../../lib/pkg/src/fortran/i_p.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_p.o ../../../lib/pkg/src/fortran/i_p.f

${OBJECTDIR}/_ext/968817101/macro.o: ../../../lib/pkg/src/fortran/macro.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/macro.o ../../../lib/pkg/src/fortran/macro.f

${OBJECTDIR}/_ext/968817101/dmptld.o: ../../../lib/pkg/src/fortran/dmptld.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmptld.o ../../../lib/pkg/src/fortran/dmptld.f

${OBJECTDIR}/_ext/968817101/sz2ptr.o: ../../../lib/pkg/src/fortran/sz2ptr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sz2ptr.o ../../../lib/pkg/src/fortran/sz2ptr.f

${OBJECTDIR}/_ext/968817101/simple.o: ../../../lib/pkg/src/fortran/simple.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/simple.o ../../../lib/pkg/src/fortran/simple.f

${OBJECTDIR}/_ext/968817101/mux.o: ../../../lib/pkg/src/fortran/mux.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mux.o ../../../lib/pkg/src/fortran/mux.f

${OBJECTDIR}/_ext/968817101/skipvars.o: ../../../lib/pkg/src/fortran/skipvars.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/skipvars.o ../../../lib/pkg/src/fortran/skipvars.f

${OBJECTDIR}/_ext/1457928084/zwrsk.o: ../../../lib/pkg/src/fortran/slatec/zwrsk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zwrsk.o ../../../lib/pkg/src/fortran/slatec/zwrsk.f

${OBJECTDIR}/_ext/968817101/intzpotrf.o: ../../../lib/pkg/src/fortran/intzpotrf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzpotrf.o ../../../lib/pkg/src/fortran/intzpotrf.f

${OBJECTDIR}/_ext/1457928084/dhkseq.o: ../../../lib/pkg/src/fortran/slatec/dhkseq.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dhkseq.o ../../../lib/pkg/src/fortran/slatec/dhkseq.f

${OBJECTDIR}/_ext/57306600/wpade.o: ../../../lib/pkg/src/fortran/linpack/wpade.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/wpade.o ../../../lib/pkg/src/fortran/linpack/wpade.f

${OBJECTDIR}/_ext/968817101/dcutet.o: ../../../lib/pkg/src/fortran/dcutet.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dcutet.o ../../../lib/pkg/src/fortran/dcutet.f

${OBJECTDIR}/_ext/968817101/intzgesv4.o: ../../../lib/pkg/src/fortran/intzgesv4.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgesv4.o ../../../lib/pkg/src/fortran/intzgesv4.f

${OBJECTDIR}/_ext/968817101/intdgges.o: ../../../lib/pkg/src/fortran/intdgges.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgges.o ../../../lib/pkg/src/fortran/intdgges.f

${OBJECTDIR}/_ext/968817101/impext.o: ../../../lib/pkg/src/fortran/impext.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/impext.o ../../../lib/pkg/src/fortran/impext.f

${OBJECTDIR}/_ext/1457928084/zacon.o: ../../../lib/pkg/src/fortran/slatec/zacon.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zacon.o ../../../lib/pkg/src/fortran/slatec/zacon.f

${OBJECTDIR}/_ext/944810281/dogleg.o: ../../../lib/pkg/src/fortran/minpack/dogleg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/dogleg.o ../../../lib/pkg/src/fortran/minpack/dogleg.f

${OBJECTDIR}/_ext/968817101/roots.o: ../../../lib/pkg/src/fortran/roots.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/roots.o ../../../lib/pkg/src/fortran/roots.f

${OBJECTDIR}/_ext/968817101/setippty.o: ../../../lib/pkg/src/fortran/setippty.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/setippty.o ../../../lib/pkg/src/fortran/setippty.f

${OBJECTDIR}/_ext/968817101/dmrdsp.o: ../../../lib/pkg/src/fortran/dmrdsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmrdsp.o ../../../lib/pkg/src/fortran/dmrdsp.f

${OBJECTDIR}/_ext/968817101/intzschur.o: ../../../lib/pkg/src/fortran/intzschur.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzschur.o ../../../lib/pkg/src/fortran/intzschur.f

${OBJECTDIR}/_ext/968817101/quadsd.o: ../../../lib/pkg/src/fortran/quadsd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/quadsd.o ../../../lib/pkg/src/fortran/quadsd.f

${OBJECTDIR}/_ext/968817101/n1qn2a.o: ../../../lib/pkg/src/fortran/n1qn2a.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/n1qn2a.o ../../../lib/pkg/src/fortran/n1qn2a.f

${OBJECTDIR}/_ext/968817101/rscom1.o: ../../../lib/pkg/src/fortran/rscom1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rscom1.o ../../../lib/pkg/src/fortran/rscom1.f

${OBJECTDIR}/_ext/968817101/dspe2.o: ../../../lib/pkg/src/fortran/dspe2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspe2.o ../../../lib/pkg/src/fortran/dspe2.f

${OBJECTDIR}/_ext/968817101/ffinf1.o: ../../../lib/pkg/src/fortran/ffinf1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ffinf1.o ../../../lib/pkg/src/fortran/ffinf1.f

${OBJECTDIR}/_ext/1457928084/zuni1.o: ../../../lib/pkg/src/fortran/slatec/zuni1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zuni1.o ../../../lib/pkg/src/fortran/slatec/zuni1.f

${OBJECTDIR}/_ext/968817101/mklist.o: ../../../lib/pkg/src/fortran/mklist.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mklist.o ../../../lib/pkg/src/fortran/mklist.f

${OBJECTDIR}/_ext/968817101/dmpcnc.o: ../../../lib/pkg/src/fortran/dmpcnc.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmpcnc.o ../../../lib/pkg/src/fortran/dmpcnc.f

${OBJECTDIR}/_ext/968817101/intzgeqpf4.o: ../../../lib/pkg/src/fortran/intzgeqpf4.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgeqpf4.o ../../../lib/pkg/src/fortran/intzgeqpf4.f

${OBJECTDIR}/_ext/1457928084/zbknu.o: ../../../lib/pkg/src/fortran/slatec/zbknu.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zbknu.o ../../../lib/pkg/src/fortran/slatec/zbknu.f

${OBJECTDIR}/_ext/968817101/wipow.o: ../../../lib/pkg/src/fortran/wipow.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wipow.o ../../../lib/pkg/src/fortran/wipow.f

${OBJECTDIR}/_ext/968817101/i_logic.o: ../../../lib/pkg/src/fortran/i_logic.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_logic.o ../../../lib/pkg/src/fortran/i_logic.f

${OBJECTDIR}/_ext/1457928084/gamma.o: ../../../lib/pkg/src/fortran/slatec/gamma.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/gamma.o ../../../lib/pkg/src/fortran/slatec/gamma.f

${OBJECTDIR}/_ext/968817101/sfact2.o: ../../../lib/pkg/src/fortran/sfact2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/sfact2.o ../../../lib/pkg/src/fortran/sfact2.f

${OBJECTDIR}/_ext/968817101/mkindx.o: ../../../lib/pkg/src/fortran/mkindx.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mkindx.o ../../../lib/pkg/src/fortran/mkindx.f

${OBJECTDIR}/_ext/968817101/lspisp.o: ../../../lib/pkg/src/fortran/lspisp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lspisp.o ../../../lib/pkg/src/fortran/lspisp.f

${OBJECTDIR}/_ext/968817101/isort1.o: ../../../lib/pkg/src/fortran/isort1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/isort1.o ../../../lib/pkg/src/fortran/isort1.f

${OBJECTDIR}/_ext/968817101/newsave.o: ../../../lib/pkg/src/fortran/newsave.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/newsave.o ../../../lib/pkg/src/fortran/newsave.f

${OBJECTDIR}/_ext/968817101/calerf.o: ../../../lib/pkg/src/fortran/calerf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/calerf.o ../../../lib/pkg/src/fortran/calerf.f

${OBJECTDIR}/_ext/968817101/gdcp2i.o: ../../../lib/pkg/src/fortran/gdcp2i.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/gdcp2i.o ../../../lib/pkg/src/fortran/gdcp2i.f

${OBJECTDIR}/_ext/968817101/dspmsp.o: ../../../lib/pkg/src/fortran/dspmsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspmsp.o ../../../lib/pkg/src/fortran/dspmsp.f

${OBJECTDIR}/_ext/968817101/ftob.o: ../../../lib/pkg/src/fortran/ftob.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ftob.o ../../../lib/pkg/src/fortran/ftob.f

${OBJECTDIR}/_ext/1457928084/zbuni.o: ../../../lib/pkg/src/fortran/slatec/zbuni.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/zbuni.o ../../../lib/pkg/src/fortran/slatec/zbuni.f

${OBJECTDIR}/_ext/968817101/n1fc1o.o: ../../../lib/pkg/src/fortran/n1fc1o.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/n1fc1o.o ../../../lib/pkg/src/fortran/n1fc1o.f

${OBJECTDIR}/_ext/944810281/lmpar.o: ../../../lib/pkg/src/fortran/minpack/lmpar.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/lmpar.o ../../../lib/pkg/src/fortran/minpack/lmpar.f

${OBJECTDIR}/_ext/968817101/stode.o: ../../../lib/pkg/src/fortran/stode.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/stode.o ../../../lib/pkg/src/fortran/stode.f

${OBJECTDIR}/_ext/968817101/impins.o: ../../../lib/pkg/src/fortran/impins.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/impins.o ../../../lib/pkg/src/fortran/impins.f

${OBJECTDIR}/_ext/968817101/getch.o: ../../../lib/pkg/src/fortran/getch.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/getch.o ../../../lib/pkg/src/fortran/getch.f

${OBJECTDIR}/_ext/968817101/compcl.o: ../../../lib/pkg/src/fortran/compcl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/compcl.o ../../../lib/pkg/src/fortran/compcl.f

${OBJECTDIR}/_ext/968817101/putid.o: ../../../lib/pkg/src/fortran/putid.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/putid.o ../../../lib/pkg/src/fortran/putid.f

${OBJECTDIR}/_ext/968817101/rilac.o: ../../../lib/pkg/src/fortran/rilac.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/rilac.o ../../../lib/pkg/src/fortran/rilac.f

${OBJECTDIR}/_ext/968817101/intpol.o: ../../../lib/pkg/src/fortran/intpol.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intpol.o ../../../lib/pkg/src/fortran/intpol.f

${OBJECTDIR}/_ext/968817101/dlblks.o: ../../../lib/pkg/src/fortran/dlblks.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dlblks.o ../../../lib/pkg/src/fortran/dlblks.f

${OBJECTDIR}/_ext/968817101/print.o: ../../../lib/pkg/src/fortran/print.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/print.o ../../../lib/pkg/src/fortran/print.f

${OBJECTDIR}/_ext/968817101/ainvg.o: ../../../lib/pkg/src/fortran/ainvg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ainvg.o ../../../lib/pkg/src/fortran/ainvg.f

${OBJECTDIR}/_ext/944810281/enorm.o: ../../../lib/pkg/src/fortran/minpack/enorm.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/enorm.o ../../../lib/pkg/src/fortran/minpack/enorm.f

${OBJECTDIR}/_ext/968817101/seteol.o: ../../../lib/pkg/src/fortran/seteol.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/seteol.o ../../../lib/pkg/src/fortran/seteol.f

${OBJECTDIR}/_ext/968817101/remez.o: ../../../lib/pkg/src/fortran/remez.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/remez.o ../../../lib/pkg/src/fortran/remez.f

${OBJECTDIR}/_ext/968817101/ddassl.o: ../../../lib/pkg/src/fortran/ddassl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ddassl.o ../../../lib/pkg/src/fortran/ddassl.f

${OBJECTDIR}/_ext/968817101/dspisp.o: ../../../lib/pkg/src/fortran/dspisp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspisp.o ../../../lib/pkg/src/fortran/dspisp.f

${OBJECTDIR}/_ext/968817101/allops.o: ../../../lib/pkg/src/fortran/allops.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/allops.o ../../../lib/pkg/src/fortran/allops.f

${OBJECTDIR}/_ext/968817101/round.o: ../../../lib/pkg/src/fortran/round.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/round.o ../../../lib/pkg/src/fortran/round.f

${OBJECTDIR}/_ext/968817101/gcbd.o: ../../../lib/pkg/src/fortran/gcbd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/gcbd.o ../../../lib/pkg/src/fortran/gcbd.f

${OBJECTDIR}/_ext/968817101/i_kron.o: ../../../lib/pkg/src/fortran/i_kron.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_kron.o ../../../lib/pkg/src/fortran/i_kron.f

${OBJECTDIR}/_ext/968817101/belan.o: ../../../lib/pkg/src/fortran/belan.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/belan.o ../../../lib/pkg/src/fortran/belan.f

${OBJECTDIR}/_ext/968817101/isova0.o: ../../../lib/pkg/src/fortran/isova0.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/isova0.o ../../../lib/pkg/src/fortran/isova0.f

${OBJECTDIR}/_ext/968817101/intzgesvd1.o: ../../../lib/pkg/src/fortran/intzgesvd1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzgesvd1.o ../../../lib/pkg/src/fortran/intzgesvd1.f

${OBJECTDIR}/_ext/968817101/intgschur.o: ../../../lib/pkg/src/fortran/intgschur.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intgschur.o ../../../lib/pkg/src/fortran/intgschur.f

${OBJECTDIR}/_ext/968817101/i_sum.o: ../../../lib/pkg/src/fortran/i_sum.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/i_sum.o ../../../lib/pkg/src/fortran/i_sum.f

${OBJECTDIR}/_ext/968817101/forcerhs.o: ../../../lib/pkg/src/fortran/forcerhs.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/forcerhs.o ../../../lib/pkg/src/fortran/forcerhs.f

${OBJECTDIR}/_ext/968817101/wmdsp.o: ../../../lib/pkg/src/fortran/wmdsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wmdsp.o ../../../lib/pkg/src/fortran/wmdsp.f

${OBJECTDIR}/_ext/968817101/lspos.o: ../../../lib/pkg/src/fortran/lspos.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lspos.o ../../../lib/pkg/src/fortran/lspos.f

${OBJECTDIR}/_ext/968817101/comqr3.o: ../../../lib/pkg/src/fortran/comqr3.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/comqr3.o ../../../lib/pkg/src/fortran/comqr3.f

${OBJECTDIR}/_ext/968817101/logops.o: ../../../lib/pkg/src/fortran/logops.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/logops.o ../../../lib/pkg/src/fortran/logops.f

${OBJECTDIR}/_ext/968817101/quadit.o: ../../../lib/pkg/src/fortran/quadit.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/quadit.o ../../../lib/pkg/src/fortran/quadit.f

${OBJECTDIR}/_ext/968817101/lspops.o: ../../../lib/pkg/src/fortran/lspops.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lspops.o ../../../lib/pkg/src/fortran/lspops.f

${OBJECTDIR}/_ext/968817101/dsort.o: ../../../lib/pkg/src/fortran/dsort.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dsort.o ../../../lib/pkg/src/fortran/dsort.f

${OBJECTDIR}/_ext/968817101/n1qn3.o: ../../../lib/pkg/src/fortran/n1qn3.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/n1qn3.o ../../../lib/pkg/src/fortran/n1qn3.f

${OBJECTDIR}/_ext/968817101/genf.o: ../../../lib/pkg/src/fortran/genf.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/genf.o ../../../lib/pkg/src/fortran/genf.f

${OBJECTDIR}/_ext/968817101/gee.o: ../../../lib/pkg/src/fortran/gee.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/gee.o ../../../lib/pkg/src/fortran/gee.f

${OBJECTDIR}/_ext/968817101/xsetun.o: ../../../lib/pkg/src/fortran/xsetun.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/xsetun.o ../../../lib/pkg/src/fortran/xsetun.f

${OBJECTDIR}/_ext/968817101/intzoldsvd.o: ../../../lib/pkg/src/fortran/intzoldsvd.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intzoldsvd.o ../../../lib/pkg/src/fortran/intzoldsvd.f

${OBJECTDIR}/_ext/968817101/spextr.o: ../../../lib/pkg/src/fortran/spextr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/spextr.o ../../../lib/pkg/src/fortran/spextr.f

${OBJECTDIR}/_ext/968817101/wmpins.o: ../../../lib/pkg/src/fortran/wmpins.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wmpins.o ../../../lib/pkg/src/fortran/wmpins.f

${OBJECTDIR}/_ext/968817101/lspdsp.o: ../../../lib/pkg/src/fortran/lspdsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lspdsp.o ../../../lib/pkg/src/fortran/lspdsp.f

${OBJECTDIR}/_ext/968817101/mfclck.o: ../../../lib/pkg/src/fortran/mfclck.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mfclck.o ../../../lib/pkg/src/fortran/mfclck.f

${OBJECTDIR}/_ext/968817101/onface.o: ../../../lib/pkg/src/fortran/onface.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/onface.o ../../../lib/pkg/src/fortran/onface.f

${OBJECTDIR}/_ext/968817101/genmul.o: ../../../lib/pkg/src/fortran/genmul.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/genmul.o ../../../lib/pkg/src/fortran/genmul.f

${OBJECTDIR}/_ext/968817101/wspis.o: ../../../lib/pkg/src/fortran/wspis.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wspis.o ../../../lib/pkg/src/fortran/wspis.f

${OBJECTDIR}/_ext/968817101/stack.o: ../../../lib/pkg/src/fortran/stack.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/stack.o ../../../lib/pkg/src/fortran/stack.f

${OBJECTDIR}/_ext/968817101/lnblnk.o: ../../../lib/pkg/src/fortran/lnblnk.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/lnblnk.o ../../../lib/pkg/src/fortran/lnblnk.f

${OBJECTDIR}/_ext/968817101/typ2cod.o: ../../../lib/pkg/src/fortran/typ2cod.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/typ2cod.o ../../../lib/pkg/src/fortran/typ2cod.f

${OBJECTDIR}/_ext/968817101/r2tx.o: ../../../lib/pkg/src/fortran/r2tx.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/r2tx.o ../../../lib/pkg/src/fortran/r2tx.f

${OBJECTDIR}/_ext/968817101/misops.o: ../../../lib/pkg/src/fortran/misops.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/misops.o ../../../lib/pkg/src/fortran/misops.f

${OBJECTDIR}/_ext/944810281/lmdif.o: ../../../lib/pkg/src/fortran/minpack/lmdif.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/944810281
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/944810281/lmdif.o ../../../lib/pkg/src/fortran/minpack/lmdif.f

${OBJECTDIR}/_ext/968817101/hndlops.o: ../../../lib/pkg/src/fortran/hndlops.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/hndlops.o ../../../lib/pkg/src/fortran/hndlops.f

${OBJECTDIR}/_ext/968817101/cmpse3.o: ../../../lib/pkg/src/fortran/cmpse3.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cmpse3.o ../../../lib/pkg/src/fortran/cmpse3.f

${OBJECTDIR}/_ext/968817101/intdgetri.o: ../../../lib/pkg/src/fortran/intdgetri.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/intdgetri.o ../../../lib/pkg/src/fortran/intdgetri.f

${OBJECTDIR}/_ext/968817101/wdpowe.o: ../../../lib/pkg/src/fortran/wdpowe.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wdpowe.o ../../../lib/pkg/src/fortran/wdpowe.f

${OBJECTDIR}/_ext/968817101/tradsl.o: ../../../lib/pkg/src/fortran/tradsl.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/tradsl.o ../../../lib/pkg/src/fortran/tradsl.f

${OBJECTDIR}/_ext/968817101/ewset.o: ../../../lib/pkg/src/fortran/ewset.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/ewset.o ../../../lib/pkg/src/fortran/ewset.f

${OBJECTDIR}/_ext/968817101/fxshfr.o: ../../../lib/pkg/src/fortran/fxshfr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/fxshfr.o ../../../lib/pkg/src/fortran/fxshfr.f

${OBJECTDIR}/_ext/968817101/mpinsp.o: ../../../lib/pkg/src/fortran/mpinsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mpinsp.o ../../../lib/pkg/src/fortran/mpinsp.f

${OBJECTDIR}/_ext/968817101/expsum.o: ../../../lib/pkg/src/fortran/expsum.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/expsum.o ../../../lib/pkg/src/fortran/expsum.f

${OBJECTDIR}/_ext/57306600/wcopy.o: ../../../lib/pkg/src/fortran/linpack/wcopy.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/wcopy.o ../../../lib/pkg/src/fortran/linpack/wcopy.f

${OBJECTDIR}/_ext/968817101/common_f2c.o: ../../../lib/pkg/src/fortran/common_f2c.c 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	${RM} $@.d
	$(COMPILE.c) -g -MMD -MP -MF $@.d -o ${OBJECTDIR}/_ext/968817101/common_f2c.o ../../../lib/pkg/src/fortran/common_f2c.c

${OBJECTDIR}/_ext/968817101/residu.o: ../../../lib/pkg/src/fortran/residu.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/residu.o ../../../lib/pkg/src/fortran/residu.f

${OBJECTDIR}/_ext/968817101/itosci.o: ../../../lib/pkg/src/fortran/itosci.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/itosci.o ../../../lib/pkg/src/fortran/itosci.f

${OBJECTDIR}/_ext/968817101/inpnv.o: ../../../lib/pkg/src/fortran/inpnv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/inpnv.o ../../../lib/pkg/src/fortran/inpnv.f

${OBJECTDIR}/_ext/57306600/dgedi.o: ../../../lib/pkg/src/fortran/linpack/dgedi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/57306600
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/57306600/dgedi.o ../../../lib/pkg/src/fortran/linpack/dgedi.f

${OBJECTDIR}/_ext/968817101/dspdsp.o: ../../../lib/pkg/src/fortran/dspdsp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspdsp.o ../../../lib/pkg/src/fortran/dspdsp.f

${OBJECTDIR}/_ext/968817101/recbez.o: ../../../lib/pkg/src/fortran/recbez.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/recbez.o ../../../lib/pkg/src/fortran/recbez.f

${OBJECTDIR}/_ext/968817101/desi14.o: ../../../lib/pkg/src/fortran/desi14.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/desi14.o ../../../lib/pkg/src/fortran/desi14.f

${OBJECTDIR}/_ext/1457928084/dbdiff.o: ../../../lib/pkg/src/fortran/slatec/dbdiff.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbdiff.o ../../../lib/pkg/src/fortran/slatec/dbdiff.f

${OBJECTDIR}/_ext/968817101/dspssp.o: ../../../lib/pkg/src/fortran/dspssp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dspssp.o ../../../lib/pkg/src/fortran/dspssp.f

${OBJECTDIR}/_ext/968817101/wwdiv.o: ../../../lib/pkg/src/fortran/wwdiv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wwdiv.o ../../../lib/pkg/src/fortran/wwdiv.f

${OBJECTDIR}/_ext/968817101/cmpse2.o: ../../../lib/pkg/src/fortran/cmpse2.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/cmpse2.o ../../../lib/pkg/src/fortran/cmpse2.f

${OBJECTDIR}/_ext/968817101/scischur.o: ../../../lib/pkg/src/fortran/scischur.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/scischur.o ../../../lib/pkg/src/fortran/scischur.f

${OBJECTDIR}/_ext/968817101/mpdegr.o: ../../../lib/pkg/src/fortran/mpdegr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/mpdegr.o ../../../lib/pkg/src/fortran/mpdegr.f

${OBJECTDIR}/_ext/968817101/desi01.o: ../../../lib/pkg/src/fortran/desi01.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/desi01.o ../../../lib/pkg/src/fortran/desi01.f

${OBJECTDIR}/_ext/1457928084/dbesy1.o: ../../../lib/pkg/src/fortran/slatec/dbesy1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesy1.o ../../../lib/pkg/src/fortran/slatec/dbesy1.f

${OBJECTDIR}/_ext/968817101/trbize.o: ../../../lib/pkg/src/fortran/trbize.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/trbize.o ../../../lib/pkg/src/fortran/trbize.f

${OBJECTDIR}/_ext/1457928084/d9b0mp.o: ../../../lib/pkg/src/fortran/slatec/d9b0mp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/d9b0mp.o ../../../lib/pkg/src/fortran/slatec/d9b0mp.f

${OBJECTDIR}/_ext/968817101/getsym.o: ../../../lib/pkg/src/fortran/getsym.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/getsym.o ../../../lib/pkg/src/fortran/getsym.f

${OBJECTDIR}/_ext/968817101/zbesjg.o: ../../../lib/pkg/src/fortran/zbesjg.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/zbesjg.o ../../../lib/pkg/src/fortran/zbesjg.f

${OBJECTDIR}/_ext/968817101/wexpm1.o: ../../../lib/pkg/src/fortran/wexpm1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/wexpm1.o ../../../lib/pkg/src/fortran/wexpm1.f

${OBJECTDIR}/_ext/968817101/franck.o: ../../../lib/pkg/src/fortran/franck.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/franck.o ../../../lib/pkg/src/fortran/franck.f

${OBJECTDIR}/_ext/968817101/dpsimp.o: ../../../lib/pkg/src/fortran/dpsimp.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dpsimp.o ../../../lib/pkg/src/fortran/dpsimp.f

${OBJECTDIR}/_ext/1457928084/dbesj1.o: ../../../lib/pkg/src/fortran/slatec/dbesj1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1457928084
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1457928084/dbesj1.o ../../../lib/pkg/src/fortran/slatec/dbesj1.f

${OBJECTDIR}/_ext/968817101/setgetmode.o: ../../../lib/pkg/src/fortran/setgetmode.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/setgetmode.o ../../../lib/pkg/src/fortran/setgetmode.f

${OBJECTDIR}/_ext/968817101/trash.o: ../../../lib/pkg/src/fortran/trash.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/trash.o ../../../lib/pkg/src/fortran/trash.f

${OBJECTDIR}/_ext/968817101/dmpins.o: ../../../lib/pkg/src/fortran/dmpins.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/dmpins.o ../../../lib/pkg/src/fortran/dmpins.f

${OBJECTDIR}/_ext/968817101/memo.o: ../../../lib/pkg/src/fortran/memo.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/memo.o ../../../lib/pkg/src/fortran/memo.f

${OBJECTDIR}/_ext/968817101/qhesz.o: ../../../lib/pkg/src/fortran/qhesz.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/968817101
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/968817101/qhesz.o ../../../lib/pkg/src/fortran/qhesz.f

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Debug
	${RM} dist/Debug/GNU-Linux-x86/libscilablibrary.a
	${RM} *.mod

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
