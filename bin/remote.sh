#!/usr/bin/env bash

work_dir=`pwd`
remote_name=slimsaber
owner_name=SlimSaber

# branch lp5.0-caf

project=packages_apps_Settings
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

project=packages_services_Telephony
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

project=frameworks_base
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

project=packages_apps_InCallUI
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

project=packages_apps_Dialer
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

# branch lp5.0
project=android_build
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

project=vendor_slim
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

project=packages_apps_Browser
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

exit;


project=frameworks_opt_telephony
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

project=device_lge_hammerheadcaf
cd $work_dir && echo "$project -> $owner_name -> $remote_name" && cd $project && git remote add $remote_name git@github.com:$owner_name/$project.git && git fetch $remote_name

