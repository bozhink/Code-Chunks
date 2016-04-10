#!/bin/tcsh
set curdir=$1
set logname=$2 #name of log file, placed in destination directory
set destdir=$3 #destination directory

#-------------------------------------------------------------------

set files=`ls -la "$curdir" | grep ^- | awk '{print $9}'`
set totalsize=0
set fcount=0

set header=">>>> ::DIRECTORY:: $curdir\n"
set finfo=""

foreach f ($files)
	set size = `ls -la "$curdir/$f" | awk '{print $5}'`
	@ totalsize = $totalsize + $size
	@ fcount++
	set finfo = $finfo `echo "$curdir/$f $size\n"`
end

set footer=">>>> ::TOTAL SIZE:: $totalsize\n>>>> ::NUMBER OF FILES:: $fcount\n____________________________________________________________\n"

echo $header
echo $footer

