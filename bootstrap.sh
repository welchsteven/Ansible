# @Author: Steven Welch <steven>
# @Date:   2020-08-06T12:41:18-06:00
# @Email:  WelchSteven@gmail.com
# @Filename: bootstrap.sh
# @Last modified by:   steven
# @Last modified time: 2020-08-20T10:10:18-06:00

#!/usr/bin/env bash
# manually enable remote access

# /bin/bash Development.sh

# if [ -d "$HOME/.ssh/" ]; then
# 	echo "SSH Keys already installed"
# else
# 	echo "Installing SSH Keys"
# 	mkdir ~/.ssh
# 	cp SSH\ Defaults/* ~/.ssh/
# 	chmod 700 ~/.ssh
# 	chmod 600 ~/.ssh/*
# fi

# Check for Xcode Command Line Tools
xcode-select -p 1>/dev/null
if [[ $? != 0 ]] ; then
      # Install Homebrew
      echo "Install Xcode Command Line Tools"
      xcode-select --install
      until $(xcode-select --print-path &> /dev/null); do
	sleep 5;
      done	
else
	    echo "Xcode Command Line Tools Installed"
fi


# Check for homebrew 
echo "Checking for Homebrew" 
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo " Homebrew not found: Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/steven/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew found: Updating Homebrew"
    brew update
fi

# Check for ansible
which -s ansible
if [[ $? != 0 ]] ; then
	echo "Ansible not found: Installing Ansible"
	brew install ansible
else
	    echo "Ansible Installed"
fi

# # Check for ansible
# which -s ansible
# if [[ $? != 0 ]] ; then
# 	echo "Ansible not found: Installing Ansible"
# 	brew install ansible
# else
# 	    echo "Ansible Installed"
# fi

# ansible pull git@github.com:welchsteven/Ansible.git
mkdir ~/Development
git clone git@github.com:welchsteven/Ansible.git