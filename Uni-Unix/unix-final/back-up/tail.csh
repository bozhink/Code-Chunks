#!/bin/tcsh
set arj=$1
set log=$2
set des=$3

tar -f $arj -r $log >& /dev/null

echo "Compressing $arj..."
bzip2 $arj

set arj=$arj".bz2"
echo "Sending $arj..."
scp $arj $des

if ($? == 0) then
    rm -f $arj
    rm -f $log
endif

