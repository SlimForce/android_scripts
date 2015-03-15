#!/usr/bin/env bash

my_bash_work_path=`pwd -P`
cd `dirname $0`
my_bash_script_path=`pwd -P`
cd $my_bash_work_path

lib="$my_bash_script_path/../jars"

zip_file="$1"
file_name=$(basename "$zip_file")
file_name=${file_name%.zip}
file_dir=$(dirname "$zip_file")
file_signed="$file_dir/${file_name}_signed.zip"

if [ ! -e $zip_file ]; then
        if [[ "$zip_file" == *.zip ]]; then
                echo "zip -r $@"
                zip -r $@ && echo "sign $zip_file -> $file_signed" && java -jar "$lib/signapk.jar" "$lib/sign_cert.pem" "$lib/sign_key.pk8" $zip_file $file_signed
        else
                echo "usage: $0 path/file.zip *"
        fi
        exit;
fi

echo "sign $zip_file -> $file_signed"
java -jar "$lib/signapk.jar" "$lib/sign_cert.pem" "$lib/sign_key.pk8" $zip_file $file_signed
