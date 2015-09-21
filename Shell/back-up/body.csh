#!/bin/tcsh
#
set BINDIR=$1
set CURRENTDIR=$2
set DATFILE=$3
set LEVEL=$4
set TMPDIR=$BINDIR/tmp
#
# FILES
#
set files=`ls -la "$CURRENTDIR" | grep ^- | awk '{print $8}'`
set ifany=`echo $files | wc -w`
#
level0:
#
set fcount=0
set loader=`cat $DATFILE`
set DESTINATION=$loader[1]
set MAXSIZE=$loader[2]
set ARCHIVENAME=$loader[3]
set ARCHIVENUM=$loader[4]
set TOTALSIZE=$loader[5]
set POSITION=$loader[6]
#
if ( $ifany < $POSITION ) goto level1
#
set log=$TMPDIR/$ARCHIVENAME$ARCHIVENUM".log"
set arj=$TMPDIR/$ARCHIVENAME$ARCHIVENUM".tar"

foreach f ($files[$POSITION-])
	set size = `ls -la "$CURRENTDIR/$f" | awk '{print $5}'`
	@ TOTALSIZE = $TOTALSIZE + $size
	@ fcount++

	echo "$CURRENTDIR/$f\t$size" >> $log
	
	if (-e $arj) then
		tar -f $arj -r $CURRENTDIR/$f >& /dev/null
	else
		tar -cf $arj $CURRENTDIR/$f >& /dev/null
	endif

	if ($TOTALSIZE > $MAXSIZE) then
	
		$BINDIR/tail.csh $arj $log $DESTINATION
		echo SPLITTING...
		@ POSITION = $fcount + $POSITION
		@ ARCHIVENUM++
		@ TOTALSIZE = 0	
		echo "$DESTINATION $MAXSIZE $ARCHIVENAME $ARCHIVENUM $TOTALSIZE $POSITION" > $DATFILE
		goto level0
	endif
end

echo "$DESTINATION $MAXSIZE $ARCHIVENAME $ARCHIVENUM $TOTALSIZE $POSITION" > $DATFILE

#
# SUBDIRS
#
level1:

set subdirs=`ls -la "$CURRENTDIR" | grep ^d | awk '{print $8}'`
@ newlevel = $LEVEL + 1

foreach sd ($subdirs)
	if ( ($sd != '.') && ($sd != '..') && ($sd != $BINDIR) ) then
		$0 $BINDIR $CURRENTDIR/$sd $DATFILE $newlevel
	endif
end
#
#
#
if ($LEVEL == 0) then
	set loader=`cat $DATFILE`
	set DESTINATION=$loader[1]
	set MAXSIZE=$loader[2]
	set ARCHIVENAME=$loader[3]
	set ARCHIVENUM=$loader[4]
	set TOTALSIZE=$loader[5]
	set POSITION=$loader[6]
	set log=$TMPDIR/$ARCHIVENAME$ARCHIVENUM".log"
	set arj=$TMPDIR/$ARCHIVENAME$ARCHIVENUM".tar"
	$BINDIR/tail.csh $arj $log $DESTINATION
endif

exit 0

