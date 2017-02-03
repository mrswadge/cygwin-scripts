#!/bin/bash

email=($1)
date=($2)

echo $email $date $files

grep -Fin ''"$email"'' ./fe01/access* ./fe02/access* | grep -F ''"$date"'' | grep -Eio 'jsessionid=[^ ?!]+' | sort -f | uniq | while read -r line ; do
	grep -F ''"$line"'' ./fe01/access* ./fe02/access* > $email-$line.txt
done
