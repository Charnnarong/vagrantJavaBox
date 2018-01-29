#!/usr/bin/env bash

javaExePath=`dirname $(readlink $(readlink $(which java)))`
# javaExePath = /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64/jre/bin

javaHome=${javaExePath%/jre/bin*}   # remove suffix starting with "/jre/bin"
# $javaHome = /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.161-0.b14.el7_4.x86_64

toAdd1="export JAVA_HOME=${javaHome}"
toAdd2='export PATH=$PATH:$JAVA_HOME/bin'
toAdd3='export CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar'
toDel1=`printf "%q" "${toAdd1}"`
toDel2=`printf "%q" "$toAdd2"`
toDel3=`printf "%q" "$toAdd3"`

removeLineIfExistOn(){

    isFound=`grep -R "${1}" "${2}"`
    if [ -n "$isFound" ]; then
        line=`grep -R "$1" "${2}" -n | cut -f1 -d:`
        if [ -n "$line" ]; then
            sed -i "$line"'d' "${2}"
        fi
    fi

}

removeLineIfExist(){
    removeLineIfExistOn "$1" '/etc/profile'
    removeLineIfExistOn "$1" '/etc/bashrc'
}

removeLineIfExist "$toDel1"
removeLineIfExist "$toDel2"
removeLineIfExist "$toDel3"

addLine(){
    echo "$1" >> /etc/profile
    echo "$1" >> /etc/bashrc
}

addLine "$toAdd1"
addLine "$toAdd2"
addLine "$toAdd3"
echo "Set JAVA_HOME done"