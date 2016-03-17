#!/usr/bin/env bash

git_pem="$HOME/.ssh/android.pem"

bash_prompt="cm_shell"
my_bashrc_home="$HOME"
 
my_bash_script_file="$0"
my_bash_work_path=`pwd -P`
if [ -L "$my_bash_script_file" ]; then
	my_bash_script_symlink=$(readlink "$my_bash_script_file")
	cd $(dirname "$0")
	if [ ! -f "$my_bash_script_symlink" ]; then
		echo "readlink -f $my_bash_script_file error! $my_bash_script_symlink"
		exit;
	fi
	sdir=$(dirname $my_bash_script_symlink)
else
	sdir=$(dirname $my_bash_script_file)
fi

cd $sdir
cd ..
sdir=`pwd -P`
 
my_bashrc_file=`mktemp /tmp/tmp_bashrc.XXXXXXXXXX`
rm -f $my_bashrc_file
 
my_bashrc_dir="$my_bashrc_file"
my_bashrc_file="$my_bashrc_dir/.bash_login"
export GIT_SSH="$HOME/.git_android_ssh.sh"
export NDK="$sdir/ndk"
export SDK="$sdir/sdk"
 
my_sbin="$sdir/sbin"
if [[ "$OSTYPE" == "darwin"* ]]; then
	my_sbin="$sdir/sbin/osx"
fi

echo "#!/bin/sh" > $GIT_SSH
echo "ssh -i \"$git_pem\" \"\$@\"" >> $GIT_SSH
chmod 755 $GIT_SSH
 
mkdir $my_bashrc_dir
echo "alias ls='ls'" > $my_bashrc_file
echo "alias ll='ls -alF'" >> $my_bashrc_file
echo "alias cm_sign='$sdir/bin/sign.sh'" >> $my_bashrc_file
echo "alias cm_clear='$sdir/bin/clear.sh'" >> $my_bashrc_file
echo "alias cm_merge='$sdir/bin/merge.sh'" >> $my_bashrc_file
echo "alias cm_gapps='$sdir/bin/gapps.sh'" >> $my_bashrc_file
#echo "alias cm_upload='$sdir/bin/upload.sh'" >> $my_bashrc_file
echo "alias cm_apktool='$sdir/bin/apktool.sh'" >> $my_bashrc_file
echo "alias cm_bootimg_repack='$sdir/bin/bootimg_repack.pl'" >> $my_bashrc_file
echo "alias cm_bootimg_unpack='$sdir/bin/bootimg_unpack.pl'" >> $my_bashrc_file
echo "bind '\"\e[A\":history-search-backward'"  >> $my_bashrc_file
echo "bind '\"\e[B\":history-search-forward'" >> $my_bashrc_file
 
if [ $(whoami) != "root" ] ; then
        echo "PS1='[\e[1;30m\]\u\[\e[m\]@\[\e[1;30m\]\h\[\e[m\] \[\e[1;30m\]\w\[\e[m\]]\[\e[1;30m\] ${bash_prompt} $\[\e[m\] '" >> $my_bashrc_file
else
        echo "PS1='[\e[1;30m\]\u\[\e[m\]@\[\e[1;30m\]\h\[\e[m\] \[\e[1;30m\]\w\[\e[m\]]\[\e[1;30m\] ${bash_prompt} #\[\e[m\] '" >> $my_bashrc_file
fi

echo "export HOME=$my_bashrc_home" >> $my_bashrc_file
echo "export PATH=$my_sbin:$SDK/platform-tools:$SDK/build-tools/22.0.0:$sdir/res/dex2jar:$sdir/res/gradle/bin:$PATH" >> $my_bashrc_file

echo "rm -rf $my_bashrc_dir" >> $my_bashrc_file
echo "cd $my_bash_work_path" >> $my_bashrc_file

echo "git config --global alias.lg \"log --no-merges --pretty='%Cred%h%Creset - %Cblue%an%Creset - %Cgreen%ci%Creset - %s'\"" >> $my_bashrc_file
echo "git config --global alias.cp \"cherry-pick\"" >> $my_bashrc_file

export HOME="$my_bashrc_dir"
cd ~
bash --login
