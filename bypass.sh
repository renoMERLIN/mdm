RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
YELLOW='\033[1;33m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
NC='\033[0m'

echo -e "${CYAN}*-------------------*---------------------*${NC}"
echo -e "${GREEN}*     BYPASS MDM - SONOMA / VENTURA      *${NC}"
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
		read -rp "Full name: " fullName
			fullName="${fullName:=Apple}"
  		echo -e "\n\t${GREEN}Initiating Your Data Disk${NC}\n"
