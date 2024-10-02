#!/bin/bash

# Title: Tor Serv
# Version: 1.0
# Date: Sept. 1, 2024
# Contact: hwac121@ptorbox.onion
# Author: RJ Levesque, Jr. - Majik Cat Security
# GitHub: https://github.com/hwac121

#-----------------------------------------------------------------

# Description:
# A simple script to manipulate Tor Services.

#=======================================================================
#                         FUNCTIONS
#=======================================================================

splash(){
	figlet "Tor Serv" | lolcat
	echo -e "\e[32mVersion 1.0 for Kali Linux\e[0m"
	echo -e "\e[32mby Majik Cat Security\e[0m"
}

#==================================
#         CHECK IF ROOT           #
#==================================

if [ "$EUID" -ne 0 ]
  then 
	clear
	splash
	echo " "
	echo -e "\e[35mMust be run as root or sudo ./torserv.sh directly from the application\e[0m"
	echo -e "\e[35mfolder or using the command torserv anywhere in a terminal.\e[0m"
	sleep 0.5
  exit
fi

#===================================================================#
#			 CHECK FOR DEPENDENCIES                     #
#===================================================================#
clear
splash
echo " "
echo -e "\e[35mINSTALLATION PROCESS...\e[0m"
echo " "
echo -e "\e[35mby Majik Cat Security\e[0m"
sleep 2

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' nala | grep "install ok installed")
echo Checking for nala: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo -e "\e[35mnala not installed. Attempting to install nala now...\e[0m"
  sleep 0.15
  apt-get install nala
fi

PKG_OK=$(dpkg-query -W --showformat='${Status}\n' tor | grep "install ok installed")
echo Checking for tor: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo -e "\e[35mtor not installed. Attempting to install tor now...\e[0m"
  sleep 0.15
  nala install tor
fi

#===================================================================
#			             MAIN INSTALLATION
#===================================================================

echo -e " "
echo -e "\e[35mMaking TorServ available globally...\e[0m"
rm /bin/torserv
cp torserv.sh /bin/torserv
cp torserv-help /bin/torserv-help
sleep 0.5
echo -e " "
echo -e "\e[35mSetting proper permissions...\e[0m"
chmod +x /bin/torserv
sleep 0.5
echo -e " "
echo -e "\e[35mJust type torserv anywhere in terminal to use this utility.\e[0m"
sleep 3
xterm -hold -T 'Tor Serv Help' -geometry 100x40+500+400 -e cat torserv-help
./torserv.sh
