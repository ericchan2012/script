#!/bin/bash
sudo sed -i '$a\deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu precise main' /etc/apt/sources.list
sudo sed -i '$a\deb-src http://ppa.launchpad.net/openjdk-r/ppa/ubuntu precise main' /etc/apt/sources.list
sudo apt-get update
sudo apt-get install openjdk-8-jdk
sudo sed -i 's%^export JAVA_HOME.*%export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64%g' /etc/profile
source /etc/profile
touch javaversion.txt
#`java -version`>javaversion.txt 2>&1
JAVA_VERSION=`java -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`
#line1=`sed -n '1p' javaversion.txt`
JDK8='1.8.0'
result=$(echo ${JAVA_VERSION} | grep ${JDK8})
if [[ "$result" != "" ]]
then
    echo "update openjdk8 successfully!"
else
    echo "update failure!"
fi

