#!/bin/bash
gclog=$1

echo "Server started on $(grep -F '[startti]' $gclog | grep -Pioa '[a-z]{3} [a-z]{3} [0-9]{1,2} [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2} [0-9]{4}')"

grep -E 'YC#[0-9]+' $gclog | grep -Eo 'sum of pauses [0-9]+\.[0-9]+' | grep -Eo '[0-9]+\.[0-9]+' | \
awk 'NR == 1 { max=$1; min=$1; sum=0 } \
{ if ($1>max) max=$1; if ($1<min) min=$1; sum+=$1;} \
END { printf "[YC] "; if(NR == 0) { printf "None reported.\n" } \
else { printf "Min: %-16f\tMax: %-16f\tAverage: %-16f\tTotal: %-16f\tCount: %-10d\n", min, max, sum/NR, sum, NR} }'

grep -E 'OC#[0-9]+' $gclog | grep -Eo 'sum of pauses [0-9]+\.[0-9]+' | grep -Eo '[0-9]+\.[0-9]+' | \
awk 'NR == 1 { max=$1; min=$1; sum=0 } \
{ if ($1>max) max=$1; if ($1<min) min=$1; sum+=$1;} \
END { printf "[OC] "; if(NR == 0) { printf "None reported.\n" } \
else { printf "Min: %-16f\tMax: %-16f\tAverage: %-16f\tTotal: %-16f\tCount: %-10d\n", min, max, sum/NR, sum, NR} }'
