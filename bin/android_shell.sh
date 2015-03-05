#!/usr/bin/env bash

git_pem="$HOME/.ssh/android.pem"

bash_prompt="android_shell"
my_bashrc_home="$HOME"
 
my_bash_script_file="$0"
my_bash_work_path=`pwd -P`
if [ -L "$my_bash_script_file" ]; then
	my_bash_script_path=$(dirname $my_bash_script_file)
	cd $my_bash_script_path
	echo `pwd -P`
	my_bash_script_symlink=$(readlink -f "$my_bash_script_file")
	if [ -n "$my_bash_script_symlink" ]; then
		echo "readlink -f $my_bash_script_file error! $my_bash_script_symlink"
		exit;
	fi
	my_bash_script_path=$(dirname $my_bash_script_symlink)
else
	my_bash_script_path=$(dirname $my_bash_script_file)
	cd $my_bash_script_path
	my_bash_script_path=`pwd -P`
fi
 
my_bashrc_file=`mktemp /tmp/tmp_bashrc.XXXXXXXXXX`
rm -f $my_bashrc_file
 
export my_bashrc_dir="$my_bashrc_file"
export my_bashrc_file="$my_bashrc_dir/.bash_login"
 
export GIT_SSH="$HOME/.git_android_ssh.sh"
 
echo "#!/bin/sh" > $GIT_SSH
echo "ssh -i \"$git_pem\" \"\$@\"" >> $GIT_SSH
chmod 755 $GIT_SSH
 
mkdir $my_bashrc_dir
echo "alias ls='ls'" > $my_bashrc_file
echo "alias ll='ls -alF'" >> $my_bashrc_file
echo "alias android_sign='$my_bash_script_path/sign.sh'" >> $my_bashrc_file
echo "alias android_clear='$my_bash_script_path/clear.sh'" >> $my_bashrc_file
echo "alias android_merge='$my_bash_script_path/merge.sh'" >> $my_bashrc_file
echo "alias android_upload='$my_bash_script_path/upload.sh'" >> $my_bashrc_file
echo "bind '\"\e[A\":history-search-backward'"  >> $my_bashrc_file
echo "bind '\"\e[B\":history-search-forward'" >> $my_bashrc_file
 
if [ $(whoami) != "root" ] ; then
        echo "PS1='[\e[1;30m\]\u\[\e[m\]@\[\e[1;30m\]\h\[\e[m\] \[\e[1;30m\]\w\[\e[m\]]\[\e[1;30m\] ${bash_prompt} $\[\e[m\] '" >> $my_bashrc_file
else
        echo "PS1='[\e[1;30m\]\u\[\e[m\]@\[\e[1;30m\]\h\[\e[m\] \[\e[1;30m\]\w\[\e[m\]]\[\e[1;30m\] ${bash_prompt} #\[\e[m\] '" >> $my_bashrc_file
fi
 
echo "export HOME=$my_bashrc_home" >> $my_bashrc_file
echo "export PATH=$my_bash_script_path/../sdk/platform-tools:$PATH" >> $my_bashrc_file
 
echo "rm -rf $my_bashrc_dir" >> $my_bashrc_file
echo "cd $my_bash_work_path" >> $my_bashrc_file

echo "git config --global alias.lg \"log --no-merges --pretty='%Cred%h%Creset - %Cblue%an%Creset - %Cgreen%ci%Creset - %s'\"" >> $my_bashrc_file
echo "git config --global alias.cp \"cherry-pick\"" >> $my_bashrc_file


export HOME="$my_bashrc_dir"
cd ~
bash --login
 
cd $my_bash_work_path
export HOME="$my_bashrc_home"
