#!/usr/bin/env bash

work_dir=`pwd`
remote_origin=origin
remote_name=slimsaber
owner_name=SlimSaber
branch_name=lp5.0-caf

project=packages_apps_Settings
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status

project=packages_services_Telephony
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status

project=frameworks_base
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status

project=packages_apps_InCallUI
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status

project=packages_apps_Dialer
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status

branch_name=lp5.0
project=android_build
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status

project=vendor_slim
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status

remote_name=cm
branch_name=cm-12.0
owner_name=TheMuppets
project=proprietary_vendor_lge
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status

owner_name=CyanogenMod
project=android_packages_apps_Nfc
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status

remote_name=mk
branch_name=mkl
owner_name=MoKee
project=android_packages_apps_Calendar
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status

exit;

project=packages_apps_Browser
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status

project=frameworks_opt_telephony
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status

project=device_lge_hammerheadcaf
cd $work_dir && echo -e "\n===> $project: " && cd $project && git fetch $remote_origin && git fetch $remote_name && git merge $remote_name/$branch_name && git status
