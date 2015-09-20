#!/bin/bash
if [ $# -lt 2 ]
then
	echo "Usage: $0 <DIR> <MARK>"
	echo "       where:"
	echo "       DIR - Directory to be cleaned"
	echo "       MARK - file with regular expressions"
	echo "              select files to be removed"
	exit 1
fi

DIR=$1
MARK=$2
EXPRESSIONS=`cat $MARK`

for d in `ls -l $1 | grep ^d | awk '{print $9}'`
do
	$0 $1/$d $2
	

	for e in $EXPRESSIONS
	do
		rm $1/$d/$e
	done

done

