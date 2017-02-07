#!/bin/bash
for filename in errors*.txt; do
        echo "--------------------------------------------------------------------------------"
	echo "Filename: $filename"
	echo "--------------------------------------------------------------------------------"
	grep -Eo 'id: (OT_)?j_id[0-9]+$' "$filename" | sort | uniq -cd | sort -nr | grep -Eo 'id: (OT_)?j_id[0-9]+$' | xargs -I {} grep -E -A5 -B5 '{}$' "$filename"
done
