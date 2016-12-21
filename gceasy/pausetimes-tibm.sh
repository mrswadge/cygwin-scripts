#! /bin/sh
API_URL=http://api.gceasy.io/analyzeGC?apiKey=<yourapikey>
PATH_BE01=//tibm-be01/d\$/OT/domains/benchmark
PATH_BE02=//tibm-be02/d\$/OT/domains/benchmark
PATH_FE01=//tibm-fe01/d\$/OT/domains/benchmark
PATH_FE02=//tibm-fe02/d\$/OT/domains/benchmark

declare -A activeNodes=( \
  ["be011"]="true" \
  ["be012"]="true" \
  ["be021"]="false" \
  ["be022"]="false" \
  ["fe011"]="true" \
  ["fe012"]="true" \
  ["fe021"]="false" \
  ["fe022"]="false" \
)

declare -A logpaths=( \
  ["be011"]="$PATH_BE01/log" \
  ["be012"]="$PATH_BE01/log" \
  ["be021"]="$PATH_BE02/log" \
  ["be022"]="$PATH_BE02/log" \
  ["fe011"]="$PATH_FE01/log" \
  ["fe012"]="$PATH_FE01/log" \
  ["fe021"]="$PATH_FE02/log" \
  ["fe022"]="$PATH_FE02/log" \
)
declare -A process=()

for node in "${!activeNodes[@]}"; do
  if [[ ${activeNodes[$node]} == "true" ]]; then
    process+=(["$node"]="$(ls -m ${logpaths["$node"]}/$node-gc.log* | tr -d ' \n')")
  fi
done

date +'%d/%m/%Y %H:%M:%S:%3N'
echo All times shown in milliseconds.

for node in "${!process[@]}"; do
  logs=(${process[$node]//,/ })
  catfiles=""
  for log in "${logs[@]}"; do
    catfiles+=" $log"
  done

  gclog=$node-gc.log
  cat $catfiles | tr -d '\0' > $gclog
  echo tibm:$node garbage collection pause times:
  ./pausetimes.sh $gclog
  graph=$(curl -s -X POST --data-binary @"$gclog" "$API_URL" --header "Content-Type:text" | jq ".graphURL" | sed 's/^"\(.*\)"$/\1/')
  echo [Graph] $graph
  rm $gclog
done
