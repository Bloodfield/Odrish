#!/bin/bash

od="$HOME/.odrive-agent/bin"

if [[ $# -gt 0 ]]; then

	##	UNISTALL
	if [[ $1 == "U" ]]; then
		echo "Uninstalling ..."
		if [[ $2 == "A" ]]; then
			rm -Rf $od
		fi
		rm -Rf $HOME/.Odrish
		rm -f $HOME/.local/bin/odr
		echo "Uninstalled"
		exit
		
	##	INSTALL
	elif [[ $1 == "I" ]]; then
		#	Odrive install
		
		mkdir --parents $od
		curl -L "https://dl.odrive.com/odriveagent-lnx-64" | tar -xvzf- -C "$od/" 
		if [[ $2 == "P" ]]; then
			curl -L "https://dl.odrive.com/odrive-py"  -o "$od/odrive.py" 
		elif [[ $2 == "B" ]]; then
			curl -L "https://dl.odrive.com/odrivecli-lnx-64" | tar -xvzf- -C "$od/"
		fi

        #	Odrish_log installer
		if [ ! -d "$HOME/.Odrish" ]; then
			mkdir $HOME/.Odrish
			echo "Installing..." > $HOME/.Odrish/Log
			date > $HOME/.Odrish/Log
		fi

		#   	Odrish_bin installer
		if [ ! -d "$HOME/.local/bin" ]; then
			mkdir $HOME/.local/bin
			echo created ${HOME}.local/bin >> $HOME/.Odrish/Log
		fi
        cp -f odr $HOME/.local/bin/
		
		

		#	Make clean config in install
		if [ ! -f "$HOME/.Odrish/config" ]; then
			echo "# Odrish configs" > $HOME/.Odrish/config
		fi

		#	Selecting agent
		sed -i '/^alias odrive=.*$/d' $HOME/.Odrish/config
		if [[ $2 == "B" ]]; then
			odrive="$HOME/.odrive-agent/bin/odrive"
		elif [[ $2 == "P" ]]; then
			odrive="python3 $HOME/.odrive-agent/bin/odrive.py"
		fi

		echo "alias odrive='$odrive'" >> $HOME/.Odrish/config
		sed -i '/^$/d' $HOME/.Odrish/config
		exit
	fi
fi



##	Error CASE

echo "Wrong Arguments. Use:"
echo "./Install U"
echo "./Install I [ P | B ]"
echo ""
echo "P = Use Python CLI"
echo "B = Use Bash CLI"


