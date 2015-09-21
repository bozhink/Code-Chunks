#!/bin/tcsh
if ($# < 1) then
	echo "Usage:"
	echo "   $0 <number>"
	exit 1
endif
set i=1
set p=1
while ($i<$1)
	@ i++
	@ p = $p * $i
end
echo $p
