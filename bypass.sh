#!/bin/bash

RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m'

echo -e "${CYAN}*-------------------*---------------------*${NC}"
echo -e "${GREEN}*      BYPASS MDM - SONOMA / VENTURA      *${NC}"
echo -e "${RED}*                    by                   *${NC}"
echo -e "${PURPLE}*               reno MERLIN               *${NC}"
echo -e "${CYAN}*-------------------*---------------------*${NC}"
echo ""

PS3='Please enter your step: '
options=("Initiate System Disk & Data" "ByPass MDM Home" "Clear Notification on System" "Reboot" "Exit")

select opt in "${options[@]}"; do
	case $opt in
	"Initiate System Disk & Data")
		echo -e "\n\t${YELLOW}Initiating Your System Disk${NC}\n"
  		echo -e "${YELLOW}-----------------------------------------${NC}\n"
    
  		echo -e "${BLUE}Enter SYSTEM VOLUME Disk Name (Default: Macintosh HD)${NC}"
		read -rp "Type Your System Volume Disk Name: " diskName
  		echo -e "\n\t${BLUE}Initiating Your SYSTEM VOLUME Disk...${NC}\n"
		diskName="${diskName:=Macintosh HD}"

		echo -e "\n\t${GREEN}Initiating Your DATA Disk...${NC}\n"
		dataName=""$diskName" - Data"

  		echo -e "${CYAN}-----------------------------------------${NC}\n"
  		echo -e "\n\t${CYAN}Initiating SUCCESSFUL${NC}\n"
  		echo -e "${CYAN}-----------------------------------------${NC}\n"

		echo -e "\n\t${RED}Make Your Temporary User Account....${NC}\n"
  		echo -e "${RED}-----------------------------------------${NC}\n"
		#dscl -f "/Volumes/"$dataName"/private/var/db/dslocal/nodes/Default" localhost -passwd "/Local/Default/Users/root" "1234"

    		echo -e "\n\t${CYAN}Your Temporary User Account Is Ready${NC}\n"
  		echo -e "${CYAN}-----------------------------------------${NC}\n"

    		echo -e "\n\t${GREEN}IMPORTANT!!!${NC}\n"
      		echo -e "\n\t${GREEN}PLEASE SAVE YOUR TEMP USER ACCOUNT${NC}\n"
  		echo -e "${CYAN}-----------------------------------------${NC}\n"
    		echo -e "\n\t${GREEN}YOUR USER ACCOUNT : root${NC}\n"
      		echo -e "\n\t${GREEN}YOUR PASSWORD ACCOUNT : 1234${NC}\n"
  		echo -e "${CYAN}-----------------------------------------${NC}\n"

    		echo -e "\n\t${GREEN}Please Reboot Your System${NC}\n"
  		echo -e "\n\t${GREEN}Choose Reboot Menu${NC}\n"
    		echo -e "\n\t${GREEN}Or Type : '4' to reboot your system${NC}\n"
      		echo -e "${GREEN}Then Make Your Own User Account And Set As Administrator${NC}\n"
		echo -e "${GREEN}-----------------------------------------${NC}\n"
  
	;;

	"ByPass MDM Home")
 		echo -e "\n\t${YELLOW}BYPASS MDM HOME REQUIREMENT${NC}\n"
  		echo -e "${YELLOW}-----------------------------------------${NC}\n"

		echo -e "\n\t${GREEN}Bypass MDM...${NC}\n"
  		touch /Volumes/"$diskName"/private/var/db/.AppleSetupDone

    		echo -e "\n\t${CYAN}BYPASS HOME MDM REQUIREMENT SUCCESSFUL${NC}\n"
  		echo -e "${CYAN}-----------------------------------------${NC}\n"

		echo -e "\n\t${GREEN}Please Reboot Your System${NC}\n"
  		echo -e "\n\t${GREEN}Choose Reboot Menu${NC}\n"
    		echo -e "\n\t${GREEN}Or Type : '4' to reboot your system${NC}\n"
      		echo -e "${GREEN}Then Setting Your MacOS${NC}\n"
		echo -e "${GREEN}-----------------------------------------${NC}\n"
  
    		break
	;;

 	"Clear Notification on System")
  		echo -e "\n\t${YELLOW}CLEAR MDM NOTIFICATION SYSTEM${NC}\n"
  		echo -e "${YELLOW}-----------------------------------------${NC}\n"

		echo -e "\n\t${RED}Blocking MDM Host....${NC}\n"
  		echo -e "${RED}-----------------------------------------${NC}\n"

  		echo "0.0.0.0 deviceenrollment.apple.com" >>/Volumes/"$diskName"/etc/hosts
		echo "0.0.0.0 mdmenrollment.apple.com" >>/Volumes/"$diskName"/etc/hosts
		echo "0.0.0.0 iprofiles.apple.com" >>/Volumes/"$diskName"/etc/hosts

      		echo -e "\n\t${CYAN}BLOCKING MDM HOST SUCCESSFUL${NC}\n"
  		echo -e "${CYAN}-----------------------------------------${NC}\n"

		echo -e "\n\t${RED}Clearing MDM Notification on System MacOS....${NC}\n"
  		echo -e "${RED}-----------------------------------------${NC}\n"
    
    		rm -rf /Volumes/"$diskName"/var/db/ConfigurationProfiles/Settings/.cloudConfigHasActivationRecord
		rm -rf /Volumes/"$diskName"/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordFound
		touch /Volumes/"$diskName"/var/db/ConfigurationProfiles/Settings/.cloudConfigProfileInstalled
		touch /Volumes/"$diskName"/var/db/ConfigurationProfiles/Settings/.cloudConfigRecordNotFound

  		echo -e "\n\t${CYAN}CLEARING MDM NOTIFICATION SUCCESSFUL${NC}\n"
  		echo -e "${CYAN}-----------------------------------------${NC}\n"
    
		echo -e "\n\t${GREEN}Please Reboot Your System${NC}\n"
  		echo -e "\n\t${GREEN}Choose Reboot Menu${NC}\n"
    		echo -e "\n\t${GREEN}Or Type : '4' to reboot your system${NC}\n"
      		echo -e "${PURPLE}YOUR BYPASS SUCCESSFULL... ENJOY IT${NC}\n"
		echo -e "${GREEN}-----------------------------------------${NC}\n"
  
    		break
	;;

	"Reboot")
		echo -e "\n\t${YELLOW}Rebooting...${NC}\n"
		reboot
		;;

	"Exit")
		echo -e "\n\t${YELLOW}Exiting...${NC}\n"
		exit
		;;

	*)
		echo "Invalid option $REPLY"
		;;
	esac
done
 	
