#!/bin/bash
if [ $# -lt 1 ]
then
   echo "Usage: $0 <directory> [-r]"
   echo "    -r -- recursive"
   exit 1
fi

for f in `ls -l $1 | grep ^- | awk '{print $9}'`
do
   chmod 644 $1'/'$f
done

if [ $# -ge 2 ]
then
   if [ $2 = '-r' ]
   then
      for d in `ls -l $1 | grep ^d |awk '{print $9}'`
      do
         $0 $1'/'$d -r
      done
   fi
fi

