#!/bin/tcsh
if ($# < 3) then
echo "Usage: $0 <ARCHIVE-NAME> <TARGET-DIR> <DESTINATION>"
exit 1
endif


set BINDIR=`pwd`
set ARNAME=$1
set TARGET=$2
set DESTIN=$3
set TMPDIR=$BINDIR/tmp
set DATFILE=$TMPDIR/.dat
rm -rf $TMPDIR
mkdir $TMPDIR

set MAXSIZE=5000000
set ARCHIVENUM=0
set TOTALSIZE=0
set POSITION=1

echo "$DESTIN $MAXSIZE $ARNAME $ARCHIVENUM $TOTALSIZE $POSITION" > $DATFILE

$BINDIR/body.csh $BINDIR $TARGET $DATFILE 0
if ( $? == 0 ) then
	rm -rf $TMPDIR
else
	echo "Something went wrong..."
endif

