#!/usr/bin/env bash


work_dir=`pwd`
remote_name=slimroms
owner_name=SlimRoms
branch_name=lp5.0

project=android_build
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name

project=packages_apps_Settings
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name

project=packages_services_Telephony
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name

project=frameworks_opt_telephony
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name

project=frameworks_base
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name

project=device_lge_hammerhead
cd $work_dir && echo "$project -> $remote_name" && cd $project && git fetch $remote_name && git merge $remote_name/$branch_name
