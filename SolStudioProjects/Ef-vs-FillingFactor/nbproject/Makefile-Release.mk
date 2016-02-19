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
CC=cc
CCC=CC
CXX=CC
FC=f95
AS=as

# Macros
CND_PLATFORM=OracleSolarisStudio-Linux-x86
CND_CONF=Release
CND_DISTDIR=dist

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=build/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/_ext/1546181293/hpdel.o \
	${OBJECTDIR}/_ext/1546181293/xerrwv.o \
	${OBJECTDIR}/effill.o \
	${OBJECTDIR}/_ext/1546181293/hpins.o \
	${OBJECTDIR}/_ext/1279186697/triangulation.o \
	${OBJECTDIR}/_ext/1546181293/twodq.o \
	${OBJECTDIR}/_ext/1546181293/basout.o \
	${OBJECTDIR}/_ext/1445267685/linspace.o \
	${OBJECTDIR}/_ext/452446398/fermi.o \
	${OBJECTDIR}/_ext/1295769847/setriang.o \
	${OBJECTDIR}/_ext/452446398/blockdat.o \
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
	"${MAKE}"  -f nbproject/Makefile-Release.mk dist/Release/OracleSolarisStudio-Linux-x86/ef-vs-fillingfactor

dist/Release/OracleSolarisStudio-Linux-x86/ef-vs-fillingfactor: ${OBJECTFILES}
	${MKDIR} -p dist/Release/OracleSolarisStudio-Linux-x86
	${LINK.f} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/ef-vs-fillingfactor ${OBJECTFILES} ${LDLIBSOPTIONS} 

${OBJECTDIR}/_ext/1546181293/hpdel.o: ../integ2d/src/twodq/hpdel.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1546181293
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/1546181293/hpdel.o ../integ2d/src/twodq/hpdel.f

${OBJECTDIR}/_ext/1546181293/xerrwv.o: ../integ2d/src/twodq/xerrwv.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1546181293
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/1546181293/xerrwv.o ../integ2d/src/twodq/xerrwv.f

${OBJECTDIR}/effill.o: effill.f 
	${MKDIR} -p ${OBJECTDIR}
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/effill.o effill.f

${OBJECTDIR}/_ext/1546181293/hpins.o: ../integ2d/src/twodq/hpins.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1546181293
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/1546181293/hpins.o ../integ2d/src/twodq/hpins.f

${OBJECTDIR}/_ext/1279186697/triangulation.o: ../integ2d/src/triangulation/triangulation.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1279186697
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/1279186697/triangulation.o ../integ2d/src/triangulation/triangulation.f

${OBJECTDIR}/_ext/1546181293/twodq.o: ../integ2d/src/twodq/twodq.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1546181293
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/1546181293/twodq.o ../integ2d/src/twodq/twodq.f

${OBJECTDIR}/_ext/1546181293/basout.o: ../integ2d/src/twodq/basout.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1546181293
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/1546181293/basout.o ../integ2d/src/twodq/basout.f

${OBJECTDIR}/_ext/1445267685/linspace.o: ../../lib/linspace.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1445267685
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/1445267685/linspace.o ../../lib/linspace.f

${OBJECTDIR}/_ext/452446398/fermi.o: ../Superconductivity/src/fermi.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/452446398/fermi.o ../Superconductivity/src/fermi.f

${OBJECTDIR}/_ext/1295769847/setriang.o: ../integ2d/src/setriang.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1295769847
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/1295769847/setriang.o ../integ2d/src/setriang.f

${OBJECTDIR}/_ext/452446398/blockdat.o: ../Superconductivity/src/blockdat.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/452446398/blockdat.o ../Superconductivity/src/blockdat.f

${OBJECTDIR}/_ext/1295769847/integ2d.o: ../integ2d/src/integ2d.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1295769847
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/1295769847/integ2d.o ../integ2d/src/integ2d.f

${OBJECTDIR}/_ext/1546181293/greatr.o: ../integ2d/src/twodq/greatr.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/1546181293
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/1546181293/greatr.o ../integ2d/src/twodq/greatr.f

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Release
	${RM} dist/Release/OracleSolarisStudio-Linux-x86/ef-vs-fillingfactor
	${RM} *.mod

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
