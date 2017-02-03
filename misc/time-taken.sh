#! /bin/bash
if [ -z "$1" ] ; then 
  echo "No log file argument supplied."
  echo "Format: ./time-taken.sh /path/to/log/OpenTWINS_Backend.log 5"
  exit 1
fi
if [ -z "$2" ] ; then
  echo "No time taken number of digits argument supplied."
  echo "Format: ./time-taken.sh /path/to/log/OpenTWINS_Backend.log 5"
  exit 1
fi

log=$1
digits=$2

grep -P "TimeTaken=[0-9]{${digits},}" $log | grep -Eo 'BEA1-[0-9A-F]+' | tr '\n' '|' | sed -e '$ s/.$//' | xargs -I {} grep -E '({})' $log
