#!/bin/tcsh
if ($# < 1) then
	echo "Usage:"
	echo "   $0 <integer to sum up>"
	exit 1
endif
set i=0
set s=0
while ($i<$1)
	@ i++
	@ s = $s + $i
end
echo $s
