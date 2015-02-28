#!/usr/bin/env bash

remote_user="root"
remote_host="127.0.0.1"
remote_port="22"
remote_dir="/opt/android/remote"
local_dir="/opt/android/local"

my_bash_work_path=`pwd -P`
cd `dirname $0`
my_bash_script_path=`pwd -P`
cd $my_bash_work_path

. "$my_bash_script_path/upload.bash"


project="frameworks_base"
project_dir="frameworks/base"
copy_file="core/res/res/values-zh-rCN/slim_strings.xml"
echo "==> $local_dir/$project/$copy_file -> $remote_dir/$project_dir/$copy_file"
scp -P$remote_port "$local_dir/$project/$copy_file" $remote_user@$remote_host:"$remote_dir/$project_dir/$copy_file"
copy_file="packages/SystemUI/res/values-zh-rCN/slim_strings.xml"
echo "==> $local_dir/$project/$copy_file -> $remote_dir/$project_dir/$copy_file"
scp -P$remote_port "$local_dir/$project/$copy_file" $remote_user@$remote_host:"$remote_dir/$project_dir/$copy_file"


project="packages_apps_Settings"
project_dir="packages/apps/Settings"
copy_file="res/values-zh-rCN/slim_strings.xml"
echo "==> $local_dir/$project/$copy_file -> $remote_dir/$project_dir/$copy_file"
scp -P$remote_port "$local_dir/$project/$copy_file" $remote_user@$remote_host:"$remote_dir/$project_dir/$copy_file"

