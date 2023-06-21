#!/bin/bash
#creat the variable one for kml and one for csv
kml_input=$1
csv_output=$2

echo "Timestamp,Latitude,Longitude,MinSeaLevelPressure,MaxIntensity" > $2
echo "Converting report.kml -> storm_info.csv..."

#extract the data
grep '<dtg>' $1 | sed -e 's/^[ \t]*//' | sed 's/<dtg>//g' | sed 's/<\/dtg>//g' > dtg.txt
grep '<tr><td> <B>' $1 | sed -e 's/^[ \t]*//' | sed 's/<tr><td> <B>//g' | sed 's/<\/B> <\/td><\/tr>//g' | sed 's/, /,/g' > latandlon.txt
grep '<minSeaLevelPres>' $1 | sed 's/[[:space:]]//g' | sed 's/<minSeaLevelPres>//g' | sed 's/<\/minSeaLevelPres>/ mb/g' > min.txt
grep '<intensity>' $1 | sed 's/[[:space:]]//g' | sed 's/<intensity>//g' | sed 's/<\/intensity>/ knots/g' > int.txt

#save in csv
paste -d "," dtg.txt latandlon.txt min.txt int.txt >> $2 
rm dtg.txt | rm latandlon.txt | rm min.txt | rm int.txt
echo "Done!"
