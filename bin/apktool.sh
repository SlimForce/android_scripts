#!/bin/bash

my_bash_work_path=`pwd -P`
cd `dirname $0`
my_bash_script_path=`pwd -P`
cd $my_bash_work_path

jarpath="$my_bash_script_path/../jars/apktool.jar"

javaOpts="-Xmx512M"

while expr "x$1" : 'x-J' >/dev/null; do
    opt=`expr "$1" : '-J\(.*\)'`
    javaOpts="${javaOpts} -${opt}"
    shift
done

java $javaOpts -Djava.awt.headless=true -jar "$jarpath" "$@"
