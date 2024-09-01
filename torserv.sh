#!/bin/bash

# Title: Tor Serv for Kali Linux
# Version: 1.0
# Date: Sept. 1, 2024
# Contact: hwac121@ptorbox.onion

# GitHub: https://github.com/hwac121/TorServ.git

#-----------------------------------------------------------------

# Description:
# A simple script to manipulate Tor Services.

#==================================
#         CHECK IF ROOT           #
#==================================

if [ "$EUID" -ne 0 ]
  then 
	clear
	splash
	echo " "
	echo -e "\e[35mMust be run as root or sudo ./torserv.sh directly from the application folder\e[0m"
	echo -e "\e[35mor using the command torserv anywhere in a terminal.\e[0m"
	sleep 0.5
  exit
fi

#==================================
#            FUNCTIONS            #
#==================================

splash(){
	figlet "Tor Serv" | lolcat
	echo -e "\e[32mVersion 1.0\e[0m"
	echo -e "\e[32mby Majik Cat Security for Kali Linux\e[0m"
	echo -e "\e[30mIt is recommended to read the Help file (number 6) before using this script.\e[0m"
}
EnableT(){
	systemctl enable tor.service
}
DisableT(){
	systemctl disable tor.service
}
StatusT(){
	systemctl status tor.service
}
StartT(){
	systemctl start tor.service
}
StopT(){
	systemctl stop tor.service
}
HelpT(){
	xterm -hold -T 'Tor Serv Help' -geometry 100x40+500+400 -e cat torserv-help
}

#==================================
#              MENU               #
#==================================

options=( "Start Tor Service" "Stop Tor Service" "Check Status" "Enable Tor Service" "Disable Tor Service" "Help" "Quit")
PS3='Choose what action to take: '
while [ "$menu" != 1 ]; do
	clear
	splash
	echo " "
	sleep 0.25
	select opt in "${options[@]}"; do
    	case $opt in 
    	
#==================================
#           OPTIONS               #
#==================================

		"Start Tor Service")
			clear
			splash
			echo " "
			echo -e "\e[31mStarting Tor Service...\e[0m"
			StartT
			sleep 1
			echo -e "\e[31mNOTE:\e[0m \e[7mYou will return to the main menu in 2 seconds...\e[0m"
			sleep 2
		break
		;;
		"Stop Tor Service")
			clear
			splash
			echo " "
			echo -e "\e[31mStopping Tor Service...\e[0m"
			StopT
			sleep 1
			echo -e "\e[31mNOTE:\e[0m \e[7mYou will return to the main menu in 2 seconds...\e[0m"
			sleep 2
		break
		;;
		"Check Status")
			clear
			splash
			echo " "
			echo -e "\e[31mChecking Tor Service status...\e[0m"
			StatusT
			echo -e "\e[31mNOTE:\e[0m \e[7mYou will return to the main menu in 5 seconds...\e[0m"
			sleep 5
		break
		;;
		"Enable Tor Service")
			clear
			splash
			echo " "
			echo -e "\e[31mEnabling the Tor Service...\e[0m"
			EnableT
			echo -e "\e[31mNOTE:\e[0m \e[7mYou will return to the main menu in 2 seconds...\e[0m"
			sleep 2
		break
		;;
		"Disable Tor Service")
			clear
			splash
			echo " "
			echo -e "\e[31mDisabling the Tor Service...\e[0m"
			DisableT
			echo -e "\e[31mNOTE:\e[0m \e[7mYou will return to the main menu in 2 seconds...\e[0m"
			sleep 2
		break
		;;
		"Help")
			clear
			splash
			echo " "
			echo -e "\e[32mOnce you close the help window you will return to the main menu...\e[0m"
			HelpT
			sleep 2
		break
		;;
		"Quit")
			clear
			splash
			echo " "
			echo -e "\e[32mClosing Tor Serv v1.0\e[0m"
			sleep 1
			menu=1
			clear
		break
		;;
	* )		
			echo -e "\e[32m$REPLY is an invalid option\e[0m"
			sleep 3
		break
		;;
    	esac
	done
done

exit 0
