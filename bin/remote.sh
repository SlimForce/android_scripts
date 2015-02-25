#!/usr/bin/env bash

work_dir=`pwd`
remote_name=slimroms
owner_name=SlimRoms

project=android_build
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

project=packages_apps_Settings
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

project=packages_services_Telephony
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

project=frameworks_opt_telephony
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

project=frameworks_base
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

project=device_lge_hammerhead
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

