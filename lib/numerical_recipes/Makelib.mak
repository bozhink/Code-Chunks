# ------------------------------------------------------
# generated by builder.sce : Please do not edit this file
# see TEMPLATE makefile for Visual Studio
# see SCI/modules/dynamic_link/src/scripts/TEMPLATE_MAKEFILE.VC
# ------------------------------------------------------
SCIDIR = C:/PROGRA~1/SCILAB~1.1
SCIDIR1 = C:\PROGRA~1\SCILAB~1.1
# ------------------------------------------------------
# name of the dll to be built
LIBRARY = libsran3
# ------------------------------------------------------
# list of files
FILES_SRC = ran3.for
# ------------------------------------------------------
# list of objects file
OBJS = ran3.obj
OBJS_WITH_PATH = Release/ran3.obj
# ------------------------------------------------------
# added libraries
FORTRAN_RUNTIME_LIBRARIES = 
OTHERLIBS = 
# ------------------------------------------------------
!include $(SCIDIR1)\modules\dynamic_link\src\scripts\Makefile.incl.mak
# ------------------------------------------------------
#CC = 
# ------------------------------------------------------
CFLAGS = $(CC_OPTIONS) -DFORDLL  
# ------------------------------------------------------
FFLAGS = $(FC_OPTIONS) -DFORDLL  
# ------------------------------------------------------
EXTRA_LDFLAGS = 
# ------------------------------------------------------
!include $(SCIDIR1)\modules\dynamic_link\src\scripts\Makedll.incl
# ------------------------------------------------------