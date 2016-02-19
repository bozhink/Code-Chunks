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
CND_CONF=Debug
CND_DISTDIR=dist

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=build/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/src/triangulation.o \
	${OBJECTDIR}/src/twodq.o \
	${OBJECTDIR}/src/xerrwv.o \
	${OBJECTDIR}/src/basout.o \
	${OBJECTDIR}/src/twodqtst.o \
	${OBJECTDIR}/src/hpins.o \
	${OBJECTDIR}/src/greatr.o \
	${OBJECTDIR}/src/hpdel.o


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
	"${MAKE}"  -f nbproject/Makefile-Debug.mk dist/Debug/OracleSolarisStudio-Linux-x86/twodq

dist/Debug/OracleSolarisStudio-Linux-x86/twodq: ${OBJECTFILES}
	${MKDIR} -p dist/Debug/OracleSolarisStudio-Linux-x86
	${LINK.f} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/twodq ${OBJECTFILES} ${LDLIBSOPTIONS} 

${OBJECTDIR}/src/triangulation.o: src/triangulation.f 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -g -w1 -o ${OBJECTDIR}/src/triangulation.o src/triangulation.f

${OBJECTDIR}/src/twodq.o: src/twodq.f 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -g -w1 -o ${OBJECTDIR}/src/twodq.o src/twodq.f

${OBJECTDIR}/src/xerrwv.o: src/xerrwv.f 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -g -w1 -o ${OBJECTDIR}/src/xerrwv.o src/xerrwv.f

${OBJECTDIR}/src/basout.o: src/basout.f 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -g -w1 -o ${OBJECTDIR}/src/basout.o src/basout.f

${OBJECTDIR}/src/twodqtst.o: src/twodqtst.f 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -g -w1 -o ${OBJECTDIR}/src/twodqtst.o src/twodqtst.f

${OBJECTDIR}/src/hpins.o: src/hpins.f 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -g -w1 -o ${OBJECTDIR}/src/hpins.o src/hpins.f

${OBJECTDIR}/src/greatr.o: src/greatr.f 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -g -w1 -o ${OBJECTDIR}/src/greatr.o src/greatr.f

${OBJECTDIR}/src/hpdel.o: src/hpdel.f 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -g -w1 -o ${OBJECTDIR}/src/hpdel.o src/hpdel.f

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Debug
	${RM} dist/Debug/OracleSolarisStudio-Linux-x86/twodq
	${RM} *.mod

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
