#!/bin/bash

datfile="loops.dat"
datfile_noext="loops"


# create new loops.dat
printf "# This file is called %s.dat\n" "$datfile_noext" > $datfile
printf "# Filesize(KiB)  Normal\n" >> $datfile
while read line
do

	# get mups
	length_quad=$(echo "sqrt($line*1024)" | bc -l)
	length_quad_kiB=$(echo "$length_quad" | bc | sed 's/\..*//g')
	echo "$length_quad_kiB"
	iters=$(./Jacobi "$length_quad_kiB" "$length_quad_kiB")
	printf "  %s         %s\n" "$line" "$iters" >> $datfile
done < "${1:-/dev/stdin}"
