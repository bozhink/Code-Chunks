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
	${OBJECTDIR}/_ext/452446398/spec.o \
	${OBJECTDIR}/getspec.o \
	${OBJECTDIR}/_ext/452446398/blockdat.o


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
	"${MAKE}"  -f nbproject/Makefile-Release.mk dist/Release/OracleSolarisStudio-Linux-x86/spec-h1212

dist/Release/OracleSolarisStudio-Linux-x86/spec-h1212: ${OBJECTFILES}
	${MKDIR} -p dist/Release/OracleSolarisStudio-Linux-x86
	${LINK.f} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/spec-h1212 ${OBJECTFILES} ${LDLIBSOPTIONS} 

${OBJECTDIR}/_ext/452446398/spec.o: ../Superconductivity/src/spec.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/452446398/spec.o ../Superconductivity/src/spec.f

${OBJECTDIR}/getspec.o: getspec.f 
	${MKDIR} -p ${OBJECTDIR}
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/getspec.o getspec.f

${OBJECTDIR}/_ext/452446398/blockdat.o: ../Superconductivity/src/blockdat.f 
	${MKDIR} -p ${OBJECTDIR}/_ext/452446398
	$(COMPILE.f) -fast -g -w1 -o ${OBJECTDIR}/_ext/452446398/blockdat.o ../Superconductivity/src/blockdat.f

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Release
	${RM} dist/Release/OracleSolarisStudio-Linux-x86/spec-h1212
	${RM} *.mod

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
