#! /bin/bash

declare -a modules=("Base" "Messages" "Codes" "Infrastructure" "TradingPartner" "Risk" "IBA" "Claims");

for module in "${modules[@]}"
do
	find "./OpenTWINS.$module" -name '*Bean.java' -type f | grep -Po '[A-Za-z0-9]+(?=Bean\.java)' | while read -r line ; do
		echo "$module,$line"
	done
done

