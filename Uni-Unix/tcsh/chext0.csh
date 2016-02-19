#!/bin/tcsh
if ($#argv < 1) then
	echo "Usage:"
	echo "   $0 <filenames>"
	exit 1
endif
##########
set i=1
while ($i <= $#argv)
	set oldname=$argv[$i]
	set newname=`echo $oldname | sed s:"JPG":"jpg":`
	if ($oldname != $newname) then
		mv $oldname $newname
	endif
	@ i++
end

