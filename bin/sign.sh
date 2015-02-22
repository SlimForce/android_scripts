#!/usr/bin/env bash

my_bash_script_path=`pwd -P`
jar_file="$my_bash_script_path/jars/testsign.jar"
zip_file="$1"

if [ ! -e $zip_file ]; then
        if [[ "$zip_file" == *.zip ]]; then
                echo "zip -r $@"
                zip -r $@ && java -classpath $jar_file testsign $zip_file
        else
                echo "usage: $0 path/file.zip *"
        fi
        exit;
fi

java -classpath $jar_file testsign $zip_file

