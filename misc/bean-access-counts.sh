#! /bin/bash
if [ -z "$1" ] ; then 
  echo "No log file argument supplied."
  echo "Format: ./bean-access-counts.sh /path/to/log/OpenTWINS_Backend.log"
  exit 1
fi
log=$1
grep -Poh '(?<=Data=){.*}' $log | sed 's/U/B/2' | sed -E 's/([CRUDLB])/"\1"/g' | jq -n 'reduce (inputs | to_entries[]) as $i ({}; .[$i.key] += $i.value)'
