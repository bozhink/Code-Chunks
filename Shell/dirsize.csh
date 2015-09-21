#!/bin/tcsh
set size=0
foreach s (`ls -la $1 | grep ^- | awk '{print $5}'`)
	@ size = $size + $s
end
echo $size
