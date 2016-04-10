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
	${OBJECTDIR}/calc_eigen.o \
	${OBJECTDIR}/eigenvalue.o


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
	"${MAKE}"  -f nbproject/Makefile-Debug.mk dist/Debug/OracleSolarisStudio-Linux-x86/eigenvalue

dist/Debug/OracleSolarisStudio-Linux-x86/eigenvalue: ${OBJECTFILES}
	${MKDIR} -p dist/Debug/OracleSolarisStudio-Linux-x86
	${LINK.f} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/eigenvalue ${OBJECTFILES} ${LDLIBSOPTIONS} 

${OBJECTDIR}/calc_eigen.o: calc_eigen.f90 
	${MKDIR} -p ${OBJECTDIR}
	$(COMPILE.f) -g -w1 -o ${OBJECTDIR}/calc_eigen.o calc_eigen.f90

${OBJECTDIR}/eigenvalue.o: eigenvalue.f90 
	${MKDIR} -p ${OBJECTDIR}
	$(COMPILE.f) -g -w1 -o ${OBJECTDIR}/eigenvalue.o eigenvalue.f90

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/Debug
	${RM} dist/Debug/OracleSolarisStudio-Linux-x86/eigenvalue
	${RM} *.mod

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
