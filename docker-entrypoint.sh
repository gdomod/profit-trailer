#!/bin/bash

BASE=/opt
APP=/app

PT="ProfitTrailer"
LATEST="https://github.com"$(wget --quiet -O - https://github.com/taniman/profit-trailer/releases | sed -n "/releases\/download/ s/.*href=['\"]\([^'\"]*\)['\"].*/\1/gp" | head -1)
FILENAME=$(basename $LATEST)

PT_DIR=$APP/$PT
#PT_ZIP=$BASE/${PT}-${PT_VERSION}.zip
PT_JAR=$PT_DIR/${PT}.jar
PT_START="java -jar $PT_JAR -XX:+UseConcMarkSweepGC -Xmx256m -Xms256m"

[ -d "$PT_DIR" ] || mkdir -p "$PT_DIR" || {
   echo "Error: no $PT_DIR found and could not make it. Exiting."; exit -1;
}
#IF JAR NOT EXSISTS
if [ ! -f $PT_JAR ]; then
   rm "/tmp/"$FILENAME
   wget $LATEST -O "/tmp/"$FILENAME
   
   unzip -joqd $PT_DIR "/tmp/"$(basename $LATEST) *.jar || {
     echo "Error: no $PT jar found. Exiting."; exit -1;
   }
fi
cd $PT_DIR || {
  echo "Error: problem with $PT_DIR. Exiting."; exit -1;
}

pcnt=$(/bin/ls -1 $PT_DIR/*.properties 2>/dev/null|/usr/bin/wc -l)
[[ $pcnt -gt 0 ]] || {
  echo "No properties found, extracting..."; unzip -jo $PT_ZIP -d $PT_DIR;
  echo "Done! Now, edit your configuration files and reload the container."
  exit -1;
} || {
  echo "Error: no properties found and could not properly unzip $PT_ZIP. Exiting.";
  exit -1;
}

# start it
$PT_START
