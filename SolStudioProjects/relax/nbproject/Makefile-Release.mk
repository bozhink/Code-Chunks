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
CND_CONF=Release
CND_DISTDIR=dist

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=build/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/src/tourb1.o \
	${OBJECTDIR}/src/ison.o \
	${OBJECTDIR}/src/cross_menu.o \
	${OBJECTDIR}/src/getpar.o \
	${OBJECTDIR}/src/unix/bnd_generic.o \
	${OBJECTDIR}/src/field3.o \
	${OBJECTDIR}/src/expand.o \
	${OBJECTDIR}/src/cflux.o \
	${OBJECTDIR}/src/unix/exe_cut.o \
	${OBJECTDIR}/src/reduce.o \
	${OBJECTDIR}/src/prnt.o \
	${OBJECTDIR}/src/dev.o \
	${OBJECTDIR}/src/relax.o \
	${OBJECTDIR}/src/relax3d.o \
	${OBJECTDIR}/src/tourt.o \
	${OBJECTDIR}/src/rnum.o \
	${OBJECTDIR}/src/toura.o \
	${OBJECTDIR}/src/exfield.o \
	${OBJECTDIR}/src/cntour.o \
	${OBJECTDIR}/src/rplti.o \
	${OBJECTDIR}/src/iterat3.o \
	${OBJECTDIR}/src/unix/bnd_dummy.o \
	${OBJECTDIR}/src/rnumr.o \
	${OBJECTDIR}/src/cross.o \
	${OBJECTDIR}/src/iterat.o \
	${OBJECTDIR}/src/plot1.o \
	${OBJECTDIR}/src/field.o \
	${OBJECTDIR}/src/view.o \
	${OBJECTDIR}/src/plot2.o \
	${OBJECTDIR}/src/xxxx.o \
	${OBJECTDIR}/src/raxis.o \
	${OBJECTDIR}/src/cldisp.o \
	${OBJECTDIR}/src/expari.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=-Dunix -Dg77 -fno-second-underscore -fno-automatic -finit-local-zero

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-Release.mk dist/Release/GNU-Linux-x86/librelax.a

dist/Release/GNU-Linux-x86/librelax.a: ${OBJECTFILES}
	${MKDIR} -p dist/Release/GNU-Linux-x86
	${RM} dist/Release/GNU-Linux-x86/librelax.a
	${AR} -rv ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/librelax.a ${OBJECTFILES} 
	$(RANLIB) dist/Release/GNU-Linux-x86/librelax.a

${OBJECTDIR}/src/tourb1.o: src/tourb1.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/tourb1.o src/tourb1.F

${OBJECTDIR}/src/ison.o: src/ison.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/ison.o src/ison.F

${OBJECTDIR}/src/cross_menu.o: src/cross_menu.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/cross_menu.o src/cross_menu.F

${OBJECTDIR}/src/getpar.o: src/getpar.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/getpar.o src/getpar.F

${OBJECTDIR}/src/unix/bnd_generic.o: src/unix/bnd_generic.F 
	${MKDIR} -p ${OBJECTDIR}/src/unix
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/unix/bnd_generic.o src/unix/bnd_generic.F

${OBJECTDIR}/src/field3.o: src/field3.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/field3.o src/field3.F

${OBJECTDIR}/src/expand.o: src/expand.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/expand.o src/expand.F

${OBJECTDIR}/src/cflux.o: src/cflux.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/cflux.o src/cflux.F

${OBJECTDIR}/src/unix/exe_cut.o: src/unix/exe_cut.F 
	${MKDIR} -p ${OBJECTDIR}/src/unix
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/unix/exe_cut.o src/unix/exe_cut.F

${OBJECTDIR}/src/reduce.o: src/reduce.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/reduce.o src/reduce.F

${OBJECTDIR}/src/prnt.o: src/prnt.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/prnt.o src/prnt.F

${OBJECTDIR}/src/dev.o: src/dev.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/dev.o src/dev.F

${OBJECTDIR}/src/relax.o: src/relax.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/relax.o src/relax.F

${OBJECTDIR}/src/relax3d.o: src/relax3d.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/relax3d.o src/relax3d.F

${OBJECTDIR}/src/tourt.o: src/tourt.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/tourt.o src/tourt.F

${OBJECTDIR}/src/rnum.o: src/rnum.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/rnum.o src/rnum.F

${OBJECTDIR}/src/toura.o: src/toura.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/toura.o src/toura.F

${OBJECTDIR}/src/exfield.o: src/exfield.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/exfield.o src/exfield.F

${OBJECTDIR}/src/cntour.o: src/cntour.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/cntour.o src/cntour.F

${OBJECTDIR}/src/rplti.o: src/rplti.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/rplti.o src/rplti.F

${OBJECTDIR}/src/iterat3.o: src/iterat3.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/iterat3.o src/iterat3.F

${OBJECTDIR}/src/unix/bnd_dummy.o: src/unix/bnd_dummy.F 
	${MKDIR} -p ${OBJECTDIR}/src/unix
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/unix/bnd_dummy.o src/unix/bnd_dummy.F

${OBJECTDIR}/src/rnumr.o: src/rnumr.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/rnumr.o src/rnumr.F

${OBJECTDIR}/src/cross.o: src/cross.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/cross.o src/cross.F

${OBJECTDIR}/src/iterat.o: src/iterat.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/iterat.o src/iterat.F

${OBJECTDIR}/src/plot1.o: src/plot1.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/plot1.o src/plot1.F

${OBJECTDIR}/src/field.o: src/field.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/field.o src/field.F

${OBJECTDIR}/src/view.o: src/view.c 
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} $@.d
	$(COMPILE.c) -O2 -MMD -MP -MF $@.d -o ${OBJECTDIR}/src/view.o src/view.c

${OBJECTDIR}/src/plot2.o: src/plot2.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/plot2.o src/plot2.F

${OBJECTDIR}/src/xxxx.o: src/xxxx.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/xxxx.o src/xxxx.F

${OBJECTDIR}/src/raxis.o: src/raxis.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/raxis.o src/raxis.F

${OBJECTDIR}/src/cldisp.o: src/cldisp.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/cldisp.o src/cldisp.F

${OBJECTDIR}/src/expari.o: src/expari.F 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -O2 -o ${OBJECTDIR}/src/expari.o src/expari.F

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Release
	${RM} dist/Release/GNU-Linux-x86/librelax.a
	${RM} *.mod

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
