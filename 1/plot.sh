#!/bin/bash

datfile="loops.dat"
datfile_noext="loops"


# create new loops.dat
printf "# This file is called %s.dat\n" "$datfile_noext" > $datfile
printf "# Filesize  MUPSV0 MUPSV2 MUPSV3 MUPSV4 MUPSV8\n" >> $datfile
while read line
do
	# get mups
	mups=$(./vec_sum "$line")
	printf "  %s         %s\n" "$line" "$mups" >> $datfile
done < "${1:-/dev/stdin}"
