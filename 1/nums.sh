#!/bin/bash

for i in $(seq 68); do
	echo "(e((l(128*1024))/68)^$i + 0.5)" | bc -l | cut -d '.' -f 1
done | uniq
