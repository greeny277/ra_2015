# Execute via % gnuplot loops.plt -

# If you want to save graph in a png uncomment next two lines
# set term png
# set output "loops.png"
set xlabel "FILESIZE KiB"
set ylabel "MUPS"
set logscale x
plot "loops.dat" using 1:2 title 'MUPSV0' with linespoints, \
     "loops.dat" using 1:3 title 'MUPSV2' with linespoints, \
     "loops.dat" using 1:4 title 'MUPSV3' with linespoints, \
     "loops.dat" using 1:5 title 'MUPSV4' with linespoints, \
     "loops.dat" using 1:6 title 'MUPSV8' with linespoints, \
