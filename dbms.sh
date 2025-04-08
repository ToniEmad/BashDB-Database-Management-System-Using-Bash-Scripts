#!/usr/bin/bash
source db_operations.sh
# GUI_path="/home/mibrahim/ITI_Projects/BashDB/BashDB-Database-Management-System-Using-Bash-Scripts/DBMS_GUI/./dbmsGui.sh"
export GuiPath=$PWD/DBMS_GUI

exhi

# Colors
export RED='\e[31m'
export GREEN='\e[32m'
export YELLOW='\e[33m'
export BLUE='\e[34m'
export RESET='\e[0m'
#database dirictory
export path=$PWD
export DB_DIR="/usr/lib/myDBMS_ITI"

if [[ ! -d "$DB_DIR" ]]; then
    echo "Creating DBMS directory at $DB_DIR..."
    sudo mkdir -p "$DB_DIR" || { echo "Error: Failed to create directory!"; exit 1; }
    sudo chown $(whoami):$(whoami) "$DB_DIR" || { echo "Error: Failed to set ownership!"; exit 1; }
    
    echo -e "${GREEN}DBMS Created Successfully....${RESET}"
else
    echo -e "${YELLOW}DBMS Directory Already Exists....${RESET}"
fi 




function header() {
    echo -e "\\n${BLUE}+--------------------------------------------------------------------+"
    echo        "|                      ITI DBMS Project Telecom 45                   |"
    echo -e    "+--------------------------------------------------------------------+${RESET}\\n"
}


function mainMenu() {
    PS3="
ITI-DBMS-CLI [Select the option] >> "
   
    header
    echo  -e "=========================== Database Operations ===========================\\n"

    select option in "Create Database" "List all Databases" "Connect to Database" "Drop Database" "Rename Database" "Refresh Menu" "Exit"; do
        case $option in 
            "Create Database") createDb ;;
            "List all Databases") listDb ;; 
            "Connect to Database") connectDb ;; 
            "Drop Database") dropDb ;;
            "Rename Database") renameDb ;;
            "Refresh Menu") clear; mainMenu;exit;;
            "Exit")
                echo -e "${GREEN}\\nGood Bye ^_^ .......${RESET}\\n"
                exit
                ;;
            *)
                echo -e "${RED}Invalid Input... Try Again.${RESET}"
                ;;
        esac
    done
}
function GuiOption(){
PS3="
ITI-DBMS-GUI [Select the option] >> "
select option in "Continue to CLI" "Open GIU";do 
    case $option in
    "Continue to CLI")mainMenu;;
    "Open GIU") $GuiPath/./dbmsGui.sh ;;
    *) echo -e "${RED}Invalid input..${RESET}"
    esac
done

}
GuiOption