#!/bin/tcsh
if ($# < 1) then
	set d="."
else
	set d=$1
endif
set files=`ls -la $d | grep ^- | awk '{print $9}'`
foreach f ($files)
	set size=`ls -la $d/$f | awk '{print $5}'`
	echo $d/$f "\t" $size
end
