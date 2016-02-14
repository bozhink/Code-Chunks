#!/bin/bash
if [ $# -lt 1 ]
then
  exit
fi

for f in `ls $1`
do
  curl -XPUT "localhost:9200/mime/mediatype/$f" -d "{ \"name\": \"$f\", \"type\": \"`cat $1/$f`\" }" > /dev/null
done

