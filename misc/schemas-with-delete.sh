#!/bin/sh

find ./OpenTWINS.Base/gen/ejb_gen/xml-schema -name '*.xsd' -type f -print0 | xargs -0 grep -Fal '<xs:element name="delete">' > Base-schemas.txt
find ./OpenTWINS.Codes/gen/ejb_gen/xml-schema -name '*.xsd' -type f -print0 | xargs -0 grep -Fal '<xs:element name="delete">' > Codes-schemas.txt
find ./OpenTWINS.Infrastructure/gen/ejb_gen/xml-schema -name '*.xsd' -type f -print0 | xargs -0 grep -Fal '<xs:element name="delete">' > Infrastructure-schemas.txt
find ./OpenTWINS.TradingPartner/gen/ejb_gen/xml-schema -name '*.xsd' -type f -print0 | xargs -0 grep -Fal '<xs:element name="delete">' > TradingPartner-schemas.txt
find ./OpenTWINS.Risk/gen/ejb_gen/xml-schema -name '*.xsd' -type f -print0 | xargs -0 grep -Fal '<xs:element name="delete">' > Risk-schemas.txt
find ./OpenTWINS.IBA/gen/ejb_gen/xml-schema -name '*.xsd' -type f -print0 | xargs -0 grep -Fal '<xs:element name="delete">' > IBA-schemas.txt
find ./OpenTWINS.Claims/gen/ejb_gen/xml-schema -name '*.xsd' -type f -print0 | xargs -0 grep -Fal '<xs:element name="delete">' > Claims-schemas.txt

echo Done.

