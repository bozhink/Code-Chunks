#!/bin/tcsh
if ($# < 3) then
	echo "Usage: $0 <PREFIX> <SUFIX> <files>"
	exit 1
endif

set PREFIX=$1
set SUFIX=$2

@ num = 1
if ($# >= 10 && $# < 100) then
	@ num = 2
else if ($# >= 100 && $# < 1000) then
	@ num = 3
else if ($# >= 1000 && $# < 10000) then
	@ num = 4
else
	echo "$0: ERROR: too many input arguments"
	echo "$0: Maximal number of arguments < 10000"
	exit 2
endif

set format=`printf "%%%d.%dd" $num $num`

set i=3
while ($i <= $#)
	@ j = $i - 2
	set infix=`printf $format $j`
	set name=$PREFIX$infix$SUFIX
	echo $argv[$i]"  ==>  "$name
	mv $argv[$i] $name
	@ i++
end

