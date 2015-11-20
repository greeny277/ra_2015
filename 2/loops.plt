# Execute via % gnuplot loops.plt -

# If you want to save graph in a esp file, uncomment next two lines
set terminal postscript eps enhanced color font 'Helvetica,10'
set output 'auswertung/images/float.eps'

set xlabel "FILESIZE KiB"
set ylabel "MUPS"
#set style line 2  lc rgb '#ff0000' lt 1 lw 1.5 #      .
set logscale x
plot "auswertung/data/float.dat" using 1:2 title 'Normal' with linespoints, \
     "auswertung/data/float.dat" using 1:3 title 'SSE' with linespoints ls 2 , \
     "auswertung/data/float.dat" using 1:4 title 'AVX' with linespoints
