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
	${OBJECTDIR}/_ext/1546181293/hpdel.o \
	${OBJECTDIR}/_ext/452446398/integrand.o \
	${OBJECTDIR}/_ext/1546181293/xerrwv.o \
	${OBJECTDIR}/_ext/452446398/epchip.o \
	${OBJECTDIR}/_ext/452446398/tcintegrand.o \
	${OBJECTDIR}/_ext/1546181293/hpins.o \
	${OBJECTDIR}/_ext/1279186697/triangulation.o \
	${OBJECTDIR}/_ext/452446398/secant.o \
	${OBJECTDIR}/_ext/452446398/i1.o \
	${OBJECTDIR}/_ext/452446398/eigen.o \
	${OBJECTDIR}/_ext/1546181293/twodq.o \
	${OBJECTDIR}/_ext/1546181293/basout.o \
	${OBJECTDIR}/_ext/1445267685/linspace.o \
	${OBJECTDIR}/_ext/452446398/fermi.o \
	${OBJECTDIR}/_ext/452446398/hamilt.o \
	${OBJECTDIR}/findtc.o \
	${OBJECTDIR}/_ext/452446398/th.o \
	${OBJECTDIR}/_ext/1295769847/setriang.o \
	${OBJECTDIR}/_ext/452446398/blockdat.o \
	${OBJECTDIR}/_ext/452446398/spec.o \
	${OBJECTDIR}/_ext/1295769847/integ2d.o \
	${OBJECTDIR}/_ext/1546181293/greatr.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=-lblas -llapack

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-Debug.mk dist/Debug/GNU-Linux-x86/findtc

dist/Debug/GNU-Linux-x86/findtc: ${OBJECTFILES}
	${MKDIR} -p dist/Debug/GNU-Linux-x86
	${LINK.f} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/findtc ${OBJECTFILES} ${LDLIBSOPTIONS} 

${OBJECTDIR}/_ext/1546181293/hpdel.o: ../integ2d/src/twodq/hpdel.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1546181293
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1546181293/hpdel.o ../integ2d/src/twodq/hpdel.f

${OBJECTDIR}/_ext/452446398/integrand.o: ../Superconductivity/src/integrand.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/452446398/integrand.o ../Superconductivity/src/integrand.f

${OBJECTDIR}/_ext/1546181293/xerrwv.o: ../integ2d/src/twodq/xerrwv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1546181293
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1546181293/xerrwv.o ../integ2d/src/twodq/xerrwv.f

${OBJECTDIR}/_ext/452446398/epchip.o: ../Superconductivity/src/epchip.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/452446398/epchip.o ../Superconductivity/src/epchip.f

${OBJECTDIR}/_ext/452446398/tcintegrand.o: ../Superconductivity/src/tcintegrand.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/452446398/tcintegrand.o ../Superconductivity/src/tcintegrand.f

${OBJECTDIR}/_ext/1546181293/hpins.o: ../integ2d/src/twodq/hpins.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1546181293
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1546181293/hpins.o ../integ2d/src/twodq/hpins.f

${OBJECTDIR}/_ext/1279186697/triangulation.o: ../integ2d/src/triangulation/triangulation.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1279186697
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1279186697/triangulation.o ../integ2d/src/triangulation/triangulation.f

${OBJECTDIR}/_ext/452446398/secant.o: ../Superconductivity/src/secant.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/452446398/secant.o ../Superconductivity/src/secant.f

${OBJECTDIR}/_ext/452446398/i1.o: ../Superconductivity/src/i1.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/452446398/i1.o ../Superconductivity/src/i1.f

${OBJECTDIR}/_ext/452446398/eigen.o: ../Superconductivity/src/eigen.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/452446398/eigen.o ../Superconductivity/src/eigen.f

${OBJECTDIR}/_ext/1546181293/twodq.o: ../integ2d/src/twodq/twodq.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1546181293
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1546181293/twodq.o ../integ2d/src/twodq/twodq.f

${OBJECTDIR}/_ext/1546181293/basout.o: ../integ2d/src/twodq/basout.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1546181293
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1546181293/basout.o ../integ2d/src/twodq/basout.f

${OBJECTDIR}/_ext/1445267685/linspace.o: ../../lib/linspace.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1445267685
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1445267685/linspace.o ../../lib/linspace.f

${OBJECTDIR}/_ext/452446398/fermi.o: ../Superconductivity/src/fermi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/452446398/fermi.o ../Superconductivity/src/fermi.f

${OBJECTDIR}/_ext/452446398/hamilt.o: ../Superconductivity/src/hamilt.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/452446398/hamilt.o ../Superconductivity/src/hamilt.f

${OBJECTDIR}/findtc.o: findtc.f 
	${MKDIR} -p ${OBJECTDIR}
	$(COMPILE.f) -g -o ${OBJECTDIR}/findtc.o findtc.f

${OBJECTDIR}/_ext/452446398/th.o: ../Superconductivity/src/th.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/452446398/th.o ../Superconductivity/src/th.f

${OBJECTDIR}/_ext/1295769847/setriang.o: ../integ2d/src/setriang.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1295769847
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1295769847/setriang.o ../integ2d/src/setriang.f

${OBJECTDIR}/_ext/452446398/blockdat.o: ../Superconductivity/src/blockdat.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/452446398/blockdat.o ../Superconductivity/src/blockdat.f

${OBJECTDIR}/_ext/452446398/spec.o: ../Superconductivity/src/spec.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/452446398/spec.o ../Superconductivity/src/spec.f

${OBJECTDIR}/_ext/1295769847/integ2d.o: ../integ2d/src/integ2d.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1295769847
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1295769847/integ2d.o ../integ2d/src/integ2d.f

${OBJECTDIR}/_ext/1546181293/greatr.o: ../integ2d/src/twodq/greatr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1546181293
	$(COMPILE.f) -g -o ${OBJECTDIR}/_ext/1546181293/greatr.o ../integ2d/src/twodq/greatr.f

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Debug
	${RM} dist/Debug/GNU-Linux-x86/findtc
	${RM} *.mod

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
