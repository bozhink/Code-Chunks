#!/bin/bash
if [ $# -lt 2 ]
then
	echo "Usage: $0 <Directory-to-back-up> <Archieve-destination-path> [<archieve-type>]"
	echo "       <archieve-type> = 'gzip' or 'bzip2', default 'gzip'>"
	exit 1
fi

if [ $# -eq 3 ]
then
	ARJT=$3
else
	ARJT='gzip'
fi

for d in `ls -l $1 | grep ^d | awk '{print $9}'`
do
	tar -cf $2/$d".tar" $1/$d
	$ARJT $2/$d".tar"
done

