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
	${OBJECTDIR}/src/integ2d.o \
	${OBJECTDIR}/src/setriang.o \
	${OBJECTDIR}/src/twodq/greatr.o \
	${OBJECTDIR}/src/twodq/xerrwv.o \
	${OBJECTDIR}/src/twodq/hpins.o \
	${OBJECTDIR}/src/twodq/basout.o \
	${OBJECTDIR}/src/triangulation/triangulation.o \
	${OBJECTDIR}/src/twodq/twodq.o \
	${OBJECTDIR}/src/twodq/hpdel.o


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
	"${MAKE}"  -f nbproject/Makefile-Debug.mk dist/Debug/OracleSolarisStudio-Linux-x86/libinteg2d.so

dist/Debug/OracleSolarisStudio-Linux-x86/libinteg2d.so: ${OBJECTFILES}
	${MKDIR} -p dist/Debug/OracleSolarisStudio-Linux-x86
	${LINK.f} -G -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/libinteg2d.so -KPIC -norunpath -h libinteg2d.so ${OBJECTFILES} ${LDLIBSOPTIONS} 

${OBJECTDIR}/src/integ2d.o: src/integ2d.f 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -g -w1 -KPIC  -o ${OBJECTDIR}/src/integ2d.o src/integ2d.f

${OBJECTDIR}/src/setriang.o: src/setriang.f 
	${MKDIR} -p ${OBJECTDIR}/src
	$(COMPILE.f) -g -w1 -KPIC  -o ${OBJECTDIR}/src/setriang.o src/setriang.f

${OBJECTDIR}/src/twodq/greatr.o: src/twodq/greatr.f 
	${MKDIR} -p ${OBJECTDIR}/src/twodq
	$(COMPILE.f) -g -w1 -KPIC  -o ${OBJECTDIR}/src/twodq/greatr.o src/twodq/greatr.f

${OBJECTDIR}/src/twodq/xerrwv.o: src/twodq/xerrwv.f 
	${MKDIR} -p ${OBJECTDIR}/src/twodq
	$(COMPILE.f) -g -w1 -KPIC  -o ${OBJECTDIR}/src/twodq/xerrwv.o src/twodq/xerrwv.f

${OBJECTDIR}/src/twodq/hpins.o: src/twodq/hpins.f 
	${MKDIR} -p ${OBJECTDIR}/src/twodq
	$(COMPILE.f) -g -w1 -KPIC  -o ${OBJECTDIR}/src/twodq/hpins.o src/twodq/hpins.f

${OBJECTDIR}/src/twodq/basout.o: src/twodq/basout.f 
	${MKDIR} -p ${OBJECTDIR}/src/twodq
	$(COMPILE.f) -g -w1 -KPIC  -o ${OBJECTDIR}/src/twodq/basout.o src/twodq/basout.f

${OBJECTDIR}/src/triangulation/triangulation.o: src/triangulation/triangulation.f 
	${MKDIR} -p ${OBJECTDIR}/src/triangulation
	$(COMPILE.f) -g -w1 -KPIC  -o ${OBJECTDIR}/src/triangulation/triangulation.o src/triangulation/triangulation.f

${OBJECTDIR}/src/twodq/twodq.o: src/twodq/twodq.f 
	${MKDIR} -p ${OBJECTDIR}/src/twodq
	$(COMPILE.f) -g -w1 -KPIC  -o ${OBJECTDIR}/src/twodq/twodq.o src/twodq/twodq.f

${OBJECTDIR}/src/twodq/hpdel.o: src/twodq/hpdel.f 
	${MKDIR} -p ${OBJECTDIR}/src/twodq
	$(COMPILE.f) -g -w1 -KPIC  -o ${OBJECTDIR}/src/twodq/hpdel.o src/twodq/hpdel.f

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Debug
	${RM} dist/Debug/OracleSolarisStudio-Linux-x86/libinteg2d.so
	${RM} *.mod

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
