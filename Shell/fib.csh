#!/bin/tcsh
if ($# < 1) then
	echo "Usage:"
	echo "   $0 <order of Fibonacci number>"
	exit 1
endif
set a=1
set b=1
set c=1
set i=1
while ($i<$1)
	@ i++
	@ c = $a + $b
	@ a = $b
	@ b = $c
end
echo $c
