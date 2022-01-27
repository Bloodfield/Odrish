#!/bin/bash

od="~/.odrive-agent/bin"

if [[ $# -gt 0 ]]; then

	##	UNISTALL
	if [[ $1 == "U" ]]; then
		echo "Uninstalling ..."
		if [[ $2 == "A" ]]; then
			rm -Rf $od
		fi
		rm -Rf ~/.Odrish
		rm -f ~/.local/bin/odr
		echo "Uninstalled"
		exit
		
	##	INSTALL
	elif [[ $1 == "I" ]]; then
		#	Odrive install
		
# 		mkdir --parents $od
# 		curl -L "https://dl.odrive.com/odriveagent-lnx-64" | tar -xvzf- -C "$od/" 
# 		if [[ $2 == "P" ]]; then
# 			curl -L "https://dl.odrive.com/odrive-py"  -o "$od/odrive.py" 
# 		elif [[ $2 == "B" ]]; then
# 			curl -L "https://dl.odrive.com/odrivecli-lnx-64" | tar -xvzf- -C "$od/"
# 		fi

		
		#	Odrish installer
		cp -f odr ~/.local/bin/
		if [ ! -d ~/.Odrish ]; then
			mkdir ~/.Odrish
			echo "Installing..." > ~/.Odrish/Log
			date > ~/.Odrish/Log
		fi


		#	Make clean config in install
		if [ ! -f ~/.Odrish/config ]; then
			echo "# Odrish configs" > ~/.Odrish/config
		fi

		#	Selecting agent
		sed -i '/^alias odrive=.*$/d' ~/.Odrish/config
		if [[ $2 == "B" ]]; then
			odrive="$HOME/.odrive-agent/bin/odrive"
		elif [[ $2 == "P" ]]; then
			odrive="python3 $HOME/.odrive-agent/bin/odrive.py"
		fi

		echo "alias odrive='$odrive'" >> ~/.Odrish/config
		sed -i '/^$/d' ~/.Odrish/config
		exit
	fi
fi



##	Error CASE

echo "Wrong Arguments. Use:"
echo "./Install U"
echo "./Install I [ P | B ]"
echo "P = Use Python CLI"
echo "B = Use Bash CLI"


