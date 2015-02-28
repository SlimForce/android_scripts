#!/usr/bin/env bash


work_dir=`pwd`
remote_name=slimsaber
owner_name=SlimSaber
branch_name=lp5.0-caf

project=packages_apps_Settings
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name

project=packages_services_Telephony
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name

project=frameworks_base
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name

project=packages_apps_InCallUI
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name

project=packages_apps_Dialer
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name

branch_name=lp5.0
project=android_build
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name

project=vendor_slim
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name


exit;

project=frameworks_opt_telephony
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name

project=device_lge_hammerheadcaf
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name
