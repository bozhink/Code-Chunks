#!/bin/tcsh
set d=$1
set subdirs=`ls -la "$d" | grep ^d | awk '{print $8}'`
foreach sd ($subdirs)
	if ( ($sd != '.') && ($sd != '..') ) then
		$0 $d/$sd
	endif
end

set files=`ls -la "$d" | grep ^- | awk '{print $8}'`
set totalsize=0
set fcount=0
echo "::DIRECTORY:: $d"
foreach f ($files)
	set size = `ls -la "$d"/"$f" | awk '{print $5}'`
	@ totalsize = $totalsize + $size
	@ fcount++
	echo "$d"/"$f" " " $size
end
echo "::TOTAL SIZE:: $totalsize"
echo "::NUMBER OF FILES:: $fcount"

