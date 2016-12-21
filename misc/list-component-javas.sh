#!/bin/bash

rm app-java.txt
unzip -l ./OpenTWINS.Base/gen/components/app/BaseApp/wls7/BaseApp.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-java.txt
unzip -l ./OpenTWINS.Codes/gen/components/app/CodesApp/wls7/CodesApp.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-java.txt
unzip -l ./OpenTWINS.Infrastructure/gen/components/app/InfraApp/wls7/InfraApp.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-java.txt
unzip -l ./OpenTWINS.TradingPartner/gen/components/app/TpApp/wls7/TpApp.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-java.txt
unzip -l ./OpenTWINS.Risk/gen/components/app/RiskApp/wls7/RiskApp.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-java.txt
unzip -l ./OpenTWINS.IBA/gen/components/app/IbaApp/wls7/IbaApp.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-java.txt
unzip -l ./OpenTWINS.Claims/gen/components/app/ClaimsApp/wls7/ClaimsApp.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-java.txt

rm app-stubs-java.txt
unzip -l ./OpenTWINS.Base/gen/components/app/BaseAppStubs/wls7/BaseAppStubs.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-stubs-java.txt
unzip -l ./OpenTWINS.Codes/gen/components/app/CodesAppStubs/wls7/CodesAppStubs.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-stubs-java.txt
unzip -l ./OpenTWINS.Infrastructure/gen/components/app/InfraAppStubs/wls7/InfraAppStubs.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-stubs-java.txt
unzip -l ./OpenTWINS.TradingPartner/gen/components/app/TpAppStubs/wls7/TpAppStubs.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-stubs-java.txt
unzip -l ./OpenTWINS.Risk/gen/components/app/RiskAppStubs/wls7/RiskAppStubs.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-stubs-java.txt
unzip -l ./OpenTWINS.IBA/gen/components/app/IbaAppStubs/wls7/IbaAppStubs.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-stubs-java.txt
unzip -l ./OpenTWINS.Claims/gen/components/app/ClaimsAppStubs/wls7/ClaimsAppStubs.jar | grep -Po '(?<=\/)([^/$]*?)\.class' | sed 's/.class/.java/g' >> app-stubs-java.txt
