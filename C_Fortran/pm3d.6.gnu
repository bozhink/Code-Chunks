set terminal png transparent nocrop enhanced font arial 8 size 420,320 
set output 'pm3d.6.png'
set border 4095 front linetype -1 linewidth 1.000
set view map
set size square
set isosamples 100, 100
unset surface
set style data pm3d
set style function pm3d
set ticslevel 0
set title "gray map" 
set xlabel "x" 
set xrange [ -15.0000 : 15.0000 ] noreverse nowriteback
set ylabel "y" 
set yrange [ -15.0000 : 15.0000 ] noreverse nowriteback
set zrange [ -0.250000 : 1.00000 ] noreverse nowriteback
set pm3d implicit at b
set palette positive nops_allcF maxcolors 0 gamma 1.5 gray
splot sin(sqrt(x**2+y**2))/sqrt(x**2+y**2)
