#!/bin/bash

grep -Po '(?<=\<java\>).+(?=\</java>)' ./OpenTWINS.Configurations/gen/components/may/MayEAR/META-INF/application.xml | sort -u > mayear-java-modules.txt

declare -a modules=(
  #"./OpenTWINS.Base/gen/components/app/BaseApp/META-INF/MANIFEST.MF" 
  #"./OpenTWINS.Codes/gen/components/app/CodesApp/META-INF/MANIFEST.MF" 
  #"./OpenTWINS.Infrastructure/gen/components/app/InfraApp/META-INF/MANIFEST.MF" 
  #"./OpenTWINS.TradingPartner/gen/components/app/TpApp/META-INF/MANIFEST.MF"
  #"./OpenTWINS.Risk/gen/components/app/RiskApp/META-INF/MANIFEST.MF" 
  "./OpenTWINS.IBA/gen/components/app/IbaApp/META-INF/MANIFEST.MF" 
  "./OpenTWINS.Claims/gen/components/app/ClaimsApp/META-INF/MANIFEST.MF" 
);

jars=$(cat mayear-java-modules.txt)
for module in "${modules[@]}"
do
  manifest=$(cat $module)
  echo ---------------- "$module" ----------------
  echo "$jars" | while read -r line ; do
    hitcount=$(echo $manifest | grep -Po '(?<=Class-Path: ).*' | grep -Fc "$line")
    if [[ $hitcount -le 0 ]] ; then
      echo "<MISSING> $line"
    # else 
      # echo "<OK> $line"
    fi 
  done
done


